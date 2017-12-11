%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%
% Do a sanity check
% 1. Check that human anthropometry makes sense
% 2. Check that model description has been loaded

function ui_createModel (buttonHandle, ~, ~)

% Read dictionary items
dict_definitions;

% Update and check human anthropometry information
ageTag = findobj('Tag','input_personAge');
humanAnthropometry.age = str2double(ageTag.String);
heightTag = findobj('Tag','input_personHeight');
humanAnthropometry.height = str2double(heightTag.String);
weightTag = findobj('Tag','input_personWeight');
humanAnthropometry.weight = str2double(weightTag.String);
pelvisWidthTag = findobj('Tag','input_personPelvisWidth');
humanAnthropometry.pelvisWidth = str2double(pelvisWidthTag.String);
hipCenterWidthTag = findobj('Tag','input_personHipCenterWidth');
humanAnthropometry.hipCenterWidth = str2double(hipCenterWidthTag.String);
shoulderCenterWidthTag = findobj('Tag','input_personShoulderCenterWidth');
humanAnthropometry.shoulderCenterWidth = str2double(shoulderCenterWidthTag.String);
heelAnkleXOffsetTag = findobj('Tag','input_personHeelAnkleXOffset');
humanAnthropometry.heelAnkleXOffset = str2double(heelAnkleXOffsetTag.String);
heelAnkleZOffsetTag = findobj('Tag','input_personHeelAnkleZOffset');
humanAnthropometry.heelAnkleZOffset = str2double(heelAnkleZOffsetTag.String);
footWidthTag = findobj('Tag','input_personFootWidth');
humanAnthropometry.footWidth = str2double(footWidthTag.String);
shoulderNeckZOffsetTag = findobj('Tag','input_personShoulderNeckZOffset');
humanAnthropometry.shoulderNeckZOffset = str2double(shoulderNeckZOffsetTag.String);
humanAnthropometry.gender = buttonHandle.Parent.UserData.humanAnthropometry.gender;
if isnan(humanAnthropometry.age) | isnan(humanAnthropometry.height) ...
        | isnan(humanAnthropometry.weight) | isnan(humanAnthropometry.pelvisWidth) ...
        | isnan(humanAnthropometry.hipCenterWidth) | isnan(humanAnthropometry.shoulderNeckZOffset) ...
        | isnan(humanAnthropometry.heelAnkleXOffset) | isnan(humanAnthropometry.shoulderCenterWidth) ...
        | isnan(humanAnthropometry.heelAnkleZOffset) | isnan(humanAnthropometry.footWidth)
    disp (' - Check inputs for human anthropometry information')
    return;
end

customSegmentLengthsDescription = buttonHandle.Parent.UserData.customSegmentLengthsDescription;
customConstraintsDescription    = buttonHandle.Parent.UserData.customConstraintsDescription;
humanModelDescription  	= buttonHandle.Parent.UserData.humanModelDescription;
objects 	= buttonHandle.Parent.UserData.EnvironmentSetup.objects;
customMarkerDescription = buttonHandle.Parent.UserData.customMarkerDescription;

if ~isempty (humanModelDescription)
    disp ('Creating human model...');
    scalingAlgoTag          = findobj('Tag','popup_menuScaling');
    scalingAlgorithmChosen  = buttonHandle.Parent.UserData.scalingAlgorithmOptions{scalingAlgoTag.Value};
    addMarkers              = findobj('Tag','checkBox_addMarkers');
    meshOptionTag           = findobj('Tag','popup_meshTypeOptions');
    meshOption              = buttonHandle.Parent.UserData.meshTypeOptions{meshOptionTag.Value};
    scalingAlgorithm        = [];
    bConsistencyError       = 1;
    
    % Compute segment properties from chosen scaling algorithm and subject info
    [scalingAlgorithm,bConsistencyError] = fnc_setHumanScalingAlgorithm (humanModelDescription,scalingAlgorithmChosen,humanAnthropometry,customSegmentLengthsDescription,meshOption);
    if bConsistencyError
        disp (' - Mismatch between model description and chosen scaling algorithm');
        return;
    end
    
    % Scroll through model description and create corresponding human model object    
    humanModel = fnc_createHumanModel (humanModelDescription,scalingAlgorithm,humanAnthropometry, addMarkers.Value, customMarkerDescription);
    
    % Copy everything into user data
    buttonHandle.Parent.UserData.scalingAlgorithm = scalingAlgorithm;
    buttonHandle.Parent.UserData.humanModel       = humanModel;
else
    disp (' - Human description file not loaded!')
    return;
end % End of creating human model

basePath = buttonHandle.Parent.UserData.basePath;
for objID = 1:length(objects)

    % Load object description
    objects(objID).modelDescription = ...
        fnc_readObjectModelDescriptionFile...
        ([basePath,objects(objID).modelDescriptionFile]);
    
    % Compute object properties from chosen setup
    [objects(objID).modelSetup, bConsistencyError] = fnc_getObjectSetup ...
        (humanModel, objects(objID).modelSetupChoice);

    % Iterate through object components
    if isempty (buttonHandle.Parent.UserData.EnvironmentSetup.UseCustomMarkers)
        objects(objID).objectModel = fnc_createObjectModel (...
            objects(objID).modelDescription, ...
            objects(objID).modelSetup, ...
            humanAnthropometry, ...
            buttonHandle.Parent.UserData.EnvironmentSetup.AddMarkers, ...
            []);
    else
        customMarkerDescription = fnc_readCustomMarkerFile([basePath,...
            buttonHandle.Parent.UserData.EnvironmentSetup.UseCustomMarkers]);
        objects(objID).objectModel = fnc_createObjectModel (...
            objects(objID).modelDescription, ...
            objects(objID).modelSetup, ...
            humanAnthropometry, ...
            buttonHandle.Parent.UserData.EnvironmentSetup.AddMarkers, ...
            customMarkerDescription);
    end

    if ~isempty(objects(objID).modelMassProperties)
        % Compute mass properties based on mass property file
        objects(objID).objectModel = fnc_computeObjectMassProperties (...
            objects(objID).objectModel,...
            [basePath,objects(objID).modelMassProperties]);
    end    
end
buttonHandle.Parent.UserData.objects = objects;

if ~isempty(customConstraintsDescription)
    customConstraints = fnc_readCustomConstraints(customConstraintsDescription);
    buttonHandle.Parent.UserData.customConstraints  = customConstraints;
end % End of creating custom constraints

% Update plots
ui_updatePlots (buttonHandle);

% Update save model option
saveLuaTag = findobj('Tag','popup_saveLua');
set(saveLuaTag, 'Enable','on');

% Update save combined model option
saveCombinedLuaTag = findobj('Tag','popup_saveCombinedLua');
saveCombinedLuaTag.Enable = 'on';