#include <algorithm>
#include <array>
#include <fstream>
#include <sstream>
#include <iostream>
#include <numeric>
#include <sstream>

#include "csvtools.h"

#include <rbdl/rbdl.h>
#include <rbdl/rbdl_utils.h>
#include <rbdl/Dynamics.h>
#include <rbdl/addons/luamodel/luamodel.h>
#include <rbdl/addons/luamodel/luatables.h>

#include "HumanModelEnums.h"
#include "HumanModelEnumMap.h"
#include "HumanModel.h"

#include <tclap/CmdLine.h>

using namespace std;
using namespace RigidBodyDynamics;
using namespace RigidBodyDynamics::Math;

const string version = string("0.1 alpha");

//==============================================================================
void calcCentralDifference(vector< double >& x,
                           vector< vector < double > >& y,
                           vector< vector < double > >& dydx)
{
    vector< double > dydxV;
    dydxV.resize(y[0].size());

    for(unsigned int i = 1; i < x.size()-1; ++i){
        for(unsigned int j = 0; j < y[i].size(); ++j){
            dydxV[j] = (y[i+1][j]-y[i-1][j])
                    /(x[i+1]-x[i-1]);
        }
        if(i==1){
            dydx.push_back(dydxV);
        }

        dydx.push_back(dydxV);
    }
    dydx.push_back(dydxV);

    //The first and last elements get 2 copies so that
    //the size of dydx is the same as y.
}

void splitOutTimeVector(vector< double >& time,
                        vector< vector< double > >& q)
{
    time.resize(q.size());
    unsigned int ncols = q.at(0).size();

    for(unsigned int rows = 0; rows < q.size(); ++rows){
        time.at(rows) = q.at(rows).at(0);
        for(unsigned int cols = 0; cols < ncols-1; ++cols){
            q.at(rows).at(cols) = q.at(rows).at(cols+1);
        }
        q.at(rows).resize(ncols-1);
    }
}

//==============================================================================
int main (int argc, char *argv[]){

    rbdl_check_api_version (RBDL_API_VERSION);

    string inModelFile;
    string inQFile;
    string inCSVFPFile;
    string result_path;

    // Setup vectors
    vector<vector<double>> q_file;
    vector<double> time, timeFP;

    vector<vector<double>> tau, timeMatrix;
    vector<vector<double>> qdot_numdiff, qddot_numdiff;
    VectorNd tauV;

    try{
        // setting up command line parser
        TCLAP::CmdLine CmdID("Inverse Dynamics Computations",
                             ' ', version );

        // create command line options
        TCLAP::ValueArg<string> model_file (
                    "m",
                    "modelFile",
                    "lua-file containing the model",
                    true, "", "string");

        TCLAP::ValueArg<string> q_filestr (
                    "q",
                    "kinematicQFile",
                    "csv-file containing joint angles of kinematic fit",
                    true, "", "string");

        TCLAP::ValueArg<string> csvFP_file (
                    "f",
                    "csvFPFile",
                    "csv-file containing forces data",
                    true, "", "string");

        TCLAP::ValueArg<string> output_folder (
                    "p",
                    "outputPath",
                    "path to output folder", true, "", "string");

        // Add options to command line parser
        CmdID.add( model_file );
        CmdID.add( q_filestr );
        CmdID.add( csvFP_file );
        CmdID.add( output_folder);

        // Parse command line
        CmdID.parse(argc, argv);
        inModelFile  = model_file.getValue();
        inQFile = q_filestr.getValue();
        inCSVFPFile = csvFP_file.getValue();
        result_path = output_folder.getValue();
    } catch ( TCLAP::ArgException &e ) {
        std::cerr << "error: " << e.error() << " for argument " <<
                     e.argId() << endl;
        abort();
    }

    string outTimeFile (result_path + "IDres_time.csv");
    string outTauFileName (result_path + "IDres_tau.csv");

    // Get the model
    HumanModel human;
    bool flagModel, flagPoints;
    flagModel  = human.loadFromFile (inModelFile,false);
    flagPoints = human.loadPoints (inModelFile, false);

    if( (flagModel || flagPoints) == false ){
        cerr << "Error loading model files" << endl;
        abort();
    }

    int NumT = readMatrixFromFile(inQFile,  0, q_file);
    splitOutTimeVector(time,q_file);
    assert(q_file.at(0).size() == human.nDof);

    // Numerically compute qdot and qddot.
    vector < double > oneCol;
    oneCol.resize(1);
    for(unsigned int i=0; i<time.size();++i){
        oneCol[0] = time[i];
        timeMatrix.push_back(oneCol);
    }
    calcCentralDifference(time, q_file, qdot_numdiff);
    calcCentralDifference(time, qdot_numdiff, qddot_numdiff);

    vector<vector<double>> forcesCSV;
    int NumFP = readMatrixFromFile(inCSVFPFile, 0, forcesCSV);
    splitOutTimeVector(timeFP,forcesCSV);
    int numberFPFrames = forcesCSV.size();

    // Do an inverse dynamics analysis to get tau. Write tau to file.
    vector<vector<double>> tauMatrix;
    vector<double> tauRow;
    VectorNd q_inuse, qdot_inuse, qddot_inuse, fp_inuse;
    q_inuse.resize(human.nDof);
    qdot_inuse.resize(human.nDof);
    qddot_inuse.resize(human.nDof);
    fp_inuse.resize(12);

    tauV.resize(human.nDof);
    tauRow.resize(human.nDof);
    vector<SpatialVector> fext;
    fext.resize(human.model.mBodies.size());

    unsigned int bodyIdxFootR = human.model.GetBodyId("FootR_Sagittal");
    unsigned int bodyIdxFootL = human.model.GetBodyId("FootL_Sagittal");

    // Iterate through each frame
    for (unsigned int i = 0; i < q_file.size(); ++i) {

        // Copy the q, qdot, and qdotdot for the current time.
        for(unsigned int j = 0; j < human.nDof; ++j) {
            q_inuse(j) = q_file[i][j];
            qdot_inuse(j)  = qdot_numdiff[i][j];
            qddot_inuse(j) = qddot_numdiff[i][j];
        }

        // Forces at feet
        SpatialVector RAnkle, LAnkle;
        for (unsigned int k = 0; k < 6; k++) {
            RAnkle[k] = 0.0; LAnkle[k] = 0.0;
        }
        for (unsigned int k = 0; k < human.model.mBodies.size(); k++) {
            fext[k] = RAnkle;
        }

        //RAnkle[0] = forcesCSV[i][0]; RAnkle[1] = forcesCSV[i][1]; RAnkle[2] = forcesCSV[i][2];
        //LAnkle[0] = forcesCSV[i][6]; LAnkle[1] = forcesCSV[i][7]; LAnkle[2] = forcesCSV[i][8];

        RAnkle[3] = forcesCSV[i][3]; RAnkle[4] = forcesCSV[i][4]; RAnkle[5] = forcesCSV[i][5];
        LAnkle[3] = forcesCSV[i][9]; LAnkle[4] = forcesCSV[i][10]; LAnkle[5] = forcesCSV[i][11];

        fext[bodyIdxFootR] = RAnkle;
        fext[bodyIdxFootL] = LAnkle;

        InverseDynamics(human.model,
                        q_inuse,
                        qdot_inuse,
                        qddot_inuse,
                        tauV,
                        &fext);

        for(unsigned int z = 0; z < tauV.size(); ++z) {
            tauRow[z] = tauV(z);
        }
        tauMatrix.push_back(tauRow);
    }

    string header("");
    printMatrixToFile(timeMatrix,header,outTimeFile);
    printMatrixToFile(tauMatrix,header,outTauFileName);
    return 0;
}
