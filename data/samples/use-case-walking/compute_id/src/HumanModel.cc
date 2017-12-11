#include <sys/types.h>
#include <sys/wait.h>

#include <algorithm>
#include <iomanip>
#include <numeric>
#include <string>
#include <stdexcept>

#include <rbdl/addons/luamodel/luamodel.h>
#include <rbdl/addons/luamodel/luatables.h>
#include "HumanModelLuaTypes.h"
#include "HumanModel.h"
#include "csvtools.h"

using namespace std;
using namespace RigidBodyDynamics;
using namespace RigidBodyDynamics::Math;

HumanModel::HumanModel() :
  activeConstraintSet (-1),
  nDof (-1) {

  // Create invalid values for point infos
  for (unsigned int i = 0; i < PointNameLast; i++) {
    pointInfos[i] = Point();
  }

  // Create invalid values for constraint set infos
  for (unsigned int i = 0; i < ConstraintSetNameLast; i++) {
    cs_infos[i] = ConstraintSetInfo();
  }
}

Vector3d HumanModel::getPointPosition (const PointId &point_name) {
  unsigned int body_id = pointInfos[point_name].body_id;
  Vector3d point_local = pointInfos[point_name].point_local;
  return CalcBodyToBaseCoordinates (model, q, body_id, point_local, false);
}

Matrix3d HumanModel::getBodyWorldOrientation (const PointId &point_name) {
  unsigned int body_id = pointInfos[point_name].body_id;
  return CalcBodyWorldOrientation(model, q, body_id, false);
}

Vector3d HumanModel::getPointVelocity (const PointId &point_name) {
  unsigned int body_id = pointInfos[point_name].body_id;
  Vector3d point_local = pointInfos[point_name].point_local;
  return CalcPointVelocity (model, q, qdot, body_id, point_local, false);
}

SpatialVector HumanModel::getPointVelocity6D (const PointId &point_name) {
  unsigned int body_id = pointInfos[point_name].body_id;
  Vector3d point_local = pointInfos[point_name].point_local;
  return CalcPointVelocity6D (model, q, qdot, body_id, point_local, false);
}

bool HumanModel::loadFromFile (string modelfilename, bool verbose) {

  if (!Addons::LuaModelReadFromFile(modelfilename.c_str(), &model, verbose)) {
    cerr << "Error loading LuaModel: " << modelfilename << endl;
    abort();
  }

  nDof  = model.dof_count;
  q           = VectorNd::Zero (nDof);
  qdot        = VectorNd::Zero (nDof);

  return true;
}

bool HumanModel::loadMetaData (string filename, bool verbose) {

  LuaTable lua_table = LuaTable::fromFile (filename.c_str());
  int subject_count = lua_table["metadata"].length();

  if(subject_count != 1){
    cerr << "The lua file contains meta data for "
	 << subject_count
	 << " it should contain data for 1 subject"
	 << endl;
  }

  subjectMetaData = lua_table["metadata"][1];
  return true;
}

bool HumanModel::loadPoints (string filename, bool verbose) {
  LuaTable lua_table = LuaTable::fromFile (filename.c_str());
  int point_count = lua_table["points"].length();

  for (int pi = 1; pi <= point_count; pi++) {

    Point point = lua_table["points"][pi];
    PointId point_name = getPointIdFromString (point.name.c_str());

    if (point_name == PointNameLast) {
      continue;
    }
    point.body_id = model.GetBodyId (point.body_name.c_str());
    pointInfos[point_name] = point;

    if (verbose) {
      cout << "Point '"           << point.name
	   << "' (PointName = "   << point_name << ")"    << endl;
      cout << "  body        = "  << point.body_name
	   << " (id = "           << point.body_id << ")" << endl;
      cout << "  point_local = '" << point.point_local.transpose() << endl;
    }
  }

  // Check whether we missed some points
  Point default_point;
  for (unsigned int i = 0; i < PointNameLast - 1; i++) {
    if (pointInfos[i].name == default_point.name) {
      cerr  << "Error: could not find point info for point '"
	    << PointMap[i].name_str
	    << "' in file "
	    << filename << "." << endl;
      abort();
    }
  }

  return true;
}

// ===========================================================================
bool HumanModel::loadConstraintSets (string filename, bool verbose) {
  LuaTable     lua_table = LuaTable::fromFile (filename.c_str());
  LuaTableNode ln_css    = lua_table["constraint_sets"];

  constraint_sets.resize(ConstraintSetNameLast);

  for (unsigned i = 0; i < ln_css.keys().size(); i++) {
    if (ln_css.keys()[i].type == LuaKey::String) {
      string cs_name = ln_css.keys()[i].string_value;
      CSId cs_id     = getConstraintSetIdFromString (cs_name.c_str());
      if (verbose) {
	cout << endl;
	cout << "Constraint " <<  cs_name << " with ID "
	     << cs_id << " :" << endl;
	cout << endl;
      }
      if (cs_id < ConstraintSetNameLast) {
	LuaTableNode ln_cs = ln_css[cs_name.c_str()];
	cs_infos[cs_id].name = cs_name;
	for (unsigned j = 0; j < ln_cs.length(); j++) {
	  ConstraintInfo ci = ln_cs[j + 1];
	  switch (ci.type) {
	  case ConstraintSet::ContactConstraint:
	    ci.point_id = getPointIdFromString (ci.point_name.c_str());
	    constraint_sets[cs_id].AddContactConstraint
	      (pointInfos[ci.point_id].body_id,
	       pointInfos[ci.point_id].point_local,
	       ci.normal);
	    cs_infos[cs_id].constraints.push_back(ci);
	    if (verbose) {
	      cout << setw(16) << cs_name << " " << setw(3) << j << endl;
	      cout << "Type             = Point" << endl
		   << "Point ID         = " << ci.point_id << endl
		   << "Normal Transpose = " << ci.normal.transpose() << endl
		   << "CI Name          = " << ci.name << endl;
	    }
	    break;
	  case ConstraintSet::LoopConstraint:
	    // Check if multiple axes have been set,
	    // in which case setup one constraint at a time for each axis
	    for (unsigned int k = 0; k < 6; k++) {
	      if (ci.axis[k] == 1.0) {
		if (verbose) {
		  cout << "Axis " << k << " found in loop constraint, "
		       << ci.name.c_str() << endl;
		}
		SpatialVector axis(0.0,0.0,0.0,0.0,0.0,0.0);
		axis[k] = 1.0;
		ConstraintInfo ci_axis = ci;
		ci_axis.axis = axis;
		constraint_sets[cs_id].AddLoopConstraint
		  (model.GetBodyId(ci_axis.predecessor_body.c_str()),
		   model.GetBodyId(ci_axis.successor_body.c_str()),
		   ci_axis.predecessor_transform,
		   ci_axis.successor_transform,
		   ci_axis.axis,
		   ci_axis.baumgarte_enabled,
		   ci_axis.stabilization_coefficient,
		   ci_axis.name.c_str());
		cs_infos[cs_id].constraints.push_back(ci_axis);
	      }
	    }
	    if (verbose) {
	      cout << setw(16) << cs_name << " " << setw(3) << j << endl;
	      cout << "Type               = Loop" << endl
		   << "Point ID           = " << ci.point_id << endl
		   << "CI Name            = " << ci.name << endl
		   << "Predecessor Body   = " << ci.predecessor_body << endl
		   << "Successor Body     = " << ci.successor_body << endl
		   << "Axis               = " << ci.axis << endl
		   << "Stabil. Coeff      = " << ci.stabilization_coefficient
		   << endl
		   << "Predecessor Trans. = " << ci.predecessor_transform
		   << endl
		   << "Successor Trans.   = " << ci.successor_transform
		   << endl;
	    }
	    break;
	  case ConstraintSet::ConstraintTypeLast:
	    break;
	  }  
	}
	constraint_sets[cs_id].Bind (model);
      } else {
	cerr << "Ignoring constraint set " << cs_id << " with name "
	     << cs_name << " : not specified in enum CSId." << endl;
      }
    } else {
      cerr << "Ignoring constraint set " << i
	   << " with invalid name, string expected." << endl;
    }
  }
	
  // check whether we missed some sets
  ConstraintSetInfo default_constraint_set;
  for (unsigned int i = 0; i < ConstraintSetNameLast; i++) {
    if (cs_infos[i].name != ConstraintSetMap[i].name_str) {
      cerr  << "Error: could not find ConstraintSet info for set '"
	    << ConstraintSetMap[i].name_str << "' in file "
	    << filename << "." << endl;
      abort();
    }
  }
  return true;
}
