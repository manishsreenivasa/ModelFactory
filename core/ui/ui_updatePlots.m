%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%
% Do a sanity check
% 1. Check that human humanModel exists
% 2. Check that exo humanModel exists

function ui_updatePlots (buttonHandle, ~, ~)

humanModel = buttonHandle.Parent.UserData.humanModel;
objects = buttonHandle.Parent.UserData.objects;
if isempty(humanModel) & isempty(objects)
    disp (' - Nothing to plot. Run ''Create Model'' first');
    return;
end

subplot('position',[0.15 0.2 0.6 0.55]); cla; hold on;

% Update visualization settings
markerSize = buttonHandle.Parent.UserData.visualizationSettings.markerSize;
viewAngle    = buttonHandle.Parent.UserData.visualizationSettings.viewAngle;
plotJointsTag = findobj('Tag','checkBox_plotJoints');
buttonHandle.Parent.UserData.visualizationSettings.plotJoints = plotJointsTag.Value;
plotPointsTag = findobj('Tag','checkBox_plotPoints');
buttonHandle.Parent.UserData.visualizationSettings.plotPoints = plotPointsTag.Value;
plotComsTag = findobj('Tag','checkBox_plotCom');
buttonHandle.Parent.UserData.visualizationSettings.plotComs = plotComsTag.Value;
plotMarkersTag = findobj('Tag','checkBox_plotMarkers');
buttonHandle.Parent.UserData.visualizationSettings.plotMarkers = plotMarkersTag.Value;
printLabelsTag = findobj('Tag','checkBox_printLabels');
buttonHandle.Parent.UserData.visualizationSettings.printLabels = printLabelsTag.Value;
enableTranspTag = findobj('Tag','checkBox_transparency');
buttonHandle.Parent.UserData.visualizationSettings.enableTransp = enableTranspTag.Value;
if enableTranspTag.Value == 1
    alphaTranspTag = findobj('Tag','slider_alpha');
    fAlpha = alphaTranspTag.Value;
    buttonHandle.Parent.UserData.visualizationSettings.alphaTransp = alphaTranspTag.Value;
else
    fAlpha = 1.0;
end

% Plot human model
if ~isempty (humanModel)
    fnc_plotting_plotModel (humanModel, plotJointsTag.Value, plotPointsTag.Value, plotComsTag.Value, plotMarkersTag.Value, printLabelsTag.Value, fAlpha, markerSize);
end
% Plot object models
for objID = 1:buttonHandle.Parent.UserData.EnvironmentSetup.nObjects
    fnc_plotting_plotModel (objects(objID).objectModel, 0, 0, 0, 0, 0, 1.0, 10, [objID*0.5 objID*0.5 0.0]);
end

light('Position',[5.0,-1.0,10.0],'Style','infinite');
lighting phong;
view(viewAngle);
axis equal;
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');