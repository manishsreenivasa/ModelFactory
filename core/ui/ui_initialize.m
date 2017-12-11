%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function mainFig = ui_initialize(mainFig)

mainFig.CloseRequestFcn 			     = @ui_close_gui;
mainFig.Name                             = 'Spexor - ModelFactory';
mainFig.NumberTitle                      = 'off';

mainFig.UserData.EnvironmentSetup        = [];
mainFig.UserData.basePath = [];

mainFig.UserData.humanModelDescription   = [];
mainFig.UserData.scalingAlgorithmChosen  = '';
mainFig.UserData.scalingAlgorithmOptions = {'',...
    'deLeva1996_segmentedTrunk',...
    'deLeva1996_segmentedTrunk_sagittal',...
    'deLeva1996_fusedTorso',...
    'Jensen1986'};
mainFig.UserData.scalingAlgorithm        = [];
mainFig.UserData.humanModel              = [];
mainFig.UserData.meshTypeOptions = {'',...
    'default',...
    'human'};
mainFig.UserData.meshOption = '';

mainFig.UserData.objectList               = {''};

mainFig.UserData.customSegmentLengthsDescription = [];
mainFig.UserData.customConstraintsDescription    = [];
mainFig.UserData.customMarkerFile                = [];
mainFig.UserData.customMarkerDescription         = [];
mainFig.UserData.customConstraints               = [];

mainFig.UserData.humanAnthropometry.age                 = 36;
mainFig.UserData.humanAnthropometry.gender              = 1;
mainFig.UserData.humanAnthropometry.weight              = 78.0;
mainFig.UserData.humanAnthropometry.height              = 1.72;
mainFig.UserData.humanAnthropometry.pelvisWidth         = 0.3;
mainFig.UserData.humanAnthropometry.hipCenterWidth      = 0.19;
mainFig.UserData.humanAnthropometry.shoulderCenterWidth = 0.33;
mainFig.UserData.humanAnthropometry.heelAnkleXOffset    = 0.065;
mainFig.UserData.humanAnthropometry.heelAnkleZOffset    = 0.1;
mainFig.UserData.humanAnthropometry.footWidth           = 0.09;
mainFig.UserData.humanAnthropometry.shoulderNeckZOffset = 0.09;

mainFig.UserData.visualizationSettings.markerSize   = 10;
mainFig.UserData.visualizationSettings.plotComs     = 0;
mainFig.UserData.visualizationSettings.plotJoints   = 0;
mainFig.UserData.visualizationSettings.plotPoints   = 1;
mainFig.UserData.visualizationSettings.plotMarkers  = 0;
mainFig.UserData.visualizationSettings.printLabels  = 0;
mainFig.UserData.visualizationSettings.enableTransp = 0;
mainFig.UserData.visualizationSettings.alphaTransp  = 1.0;
mainFig.UserData.visualizationSettings.viewAngle    = [40 20];