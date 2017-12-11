%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_exportCombinedLuaFile (buttonHandle, ~, ~)
[filename,pathToFile] = uiputfile(['./data/samples/',buttonHandle.Parent.UserData.EnvironmentSetup.combinedModel_Save],'Export Combined Lua file');
if filename == 0
    return;
end   

metadata.scaling_used           = buttonHandle.Parent.UserData.scalingAlgorithmChosen;
metadata.subject_age            = buttonHandle.Parent.UserData.humanAnthropometry.age;
metadata.subject_height         = buttonHandle.Parent.UserData.humanAnthropometry.height;
metadata.subject_weight         = buttonHandle.Parent.UserData.humanAnthropometry.weight;
metadata.subject_gender         = buttonHandle.Parent.UserData.humanAnthropometry.gender;
metadata.subject_pelvisWidth    = buttonHandle.Parent.UserData.humanAnthropometry.pelvisWidth;
metadata.subject_hipCenterWidth = buttonHandle.Parent.UserData.humanAnthropometry.hipCenterWidth;
metadata.subject_shoulderCenterWidth = buttonHandle.Parent.UserData.humanAnthropometry.shoulderCenterWidth;
metadata.subject_heelAnkleXOffset = buttonHandle.Parent.UserData.humanAnthropometry.heelAnkleXOffset;
metadata.subject_heelAnkleZOffset = buttonHandle.Parent.UserData.humanAnthropometry.heelAnkleZOffset;
metadata.subject_shoulderNeckZOffset = buttonHandle.Parent.UserData.humanAnthropometry.shoulderNeckZOffset;
metadata.subject_footWidth = buttonHandle.Parent.UserData.humanAnthropometry.footWidth;
metadata.objectsInfo = buttonHandle.Parent.UserData.EnvironmentSetup.objects;


humanModel        = buttonHandle.Parent.UserData.humanModel;
objects           = buttonHandle.Parent.UserData.objects;  
customConstraints = buttonHandle.Parent.UserData.customConstraints;

fnc_writeCombinedLuaFile ([pathToFile,filename], metadata, humanModel, objects, customConstraints);