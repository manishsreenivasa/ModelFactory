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

mainFig.UserData.objectList = {''};
tag_objectList = findobj('Tag','popup_menuObjectList');
set(tag_objectList,'Enable','off','String',mainFig.UserData.objectList,'Value',1);
tag_EnvObjectModelFile = findobj('Tag','txt_objectModelFileName');
set(tag_EnvObjectModelFile,'String','','Enable','off');
tag_EnvObjectSetup = findobj('Tag','txt_objectSetupChoice');  
set(tag_EnvObjectSetup,'String','','Enable','off');
tag_EnvObjectMassFile = findobj('Tag','txt_objectMassFile');
set(tag_EnvObjectMassFile,'String','','Enable','off');
 
mainFig.UserData.customSegmentLengthsDescription = [];
mainFig.UserData.customConstraintsDescription    = [];
mainFig.UserData.customMarkerFile                = [];
mainFig.UserData.customMarkerDescription         = [];
mainFig.UserData.customConstraints               = [];

mainFig.UserData.humanAnthropometry.age                 = [];
mainFig.UserData.humanAnthropometry.gender              = [];
mainFig.UserData.humanAnthropometry.weight              = [];
mainFig.UserData.humanAnthropometry.height              = [];
mainFig.UserData.humanAnthropometry.pelvisWidth         = [];
mainFig.UserData.humanAnthropometry.hipCenterWidth      = [];
mainFig.UserData.humanAnthropometry.shoulderCenterWidth = [];
mainFig.UserData.humanAnthropometry.heelAnkleXOffset    = [];
mainFig.UserData.humanAnthropometry.heelAnkleZOffset    = [];
mainFig.UserData.humanAnthropometry.footWidth           = [];
mainFig.UserData.humanAnthropometry.shoulderNeckZOffset = [];

mainFig.UserData.visualizationSettings.markerSize   = 10;
mainFig.UserData.visualizationSettings.plotComs     = 0;
mainFig.UserData.visualizationSettings.plotJoints   = 0;
mainFig.UserData.visualizationSettings.plotPoints   = 1;
mainFig.UserData.visualizationSettings.plotMarkers  = 0;
mainFig.UserData.visualizationSettings.printLabels  = 0;
mainFig.UserData.visualizationSettings.enableTransp = 0;
mainFig.UserData.visualizationSettings.alphaTransp  = 1.0;
mainFig.UserData.visualizationSettings.viewAngle    = [40 20];