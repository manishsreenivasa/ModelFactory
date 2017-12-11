%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_exportLuaFile (buttonHandle, ~, ~)

humanModel  = buttonHandle.Parent.UserData.humanModel;
objects    = buttonHandle.Parent.UserData.objects;
basePath = buttonHandle.Parent.UserData.basePath;

% Populate human metadata
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
metadata.subject_footWidth        = buttonHandle.Parent.UserData.humanAnthropometry.footWidth;
metadata.subject_shoulderNeckZOffset = buttonHandle.Parent.UserData.humanAnthropometry.shoulderNeckZOffset;

if ~isempty(humanModel)
    [filename,path] = uiputfile(['./data/samples/',...
        buttonHandle.Parent.UserData.EnvironmentSetup.humanModel_Save],...
        'Export Human Lua file');
    if filename ~= 0
        fnc_writeLUAFile (humanModel, [path,filename], metadata);
        disp (['Wrote human LUA file :: ', [path,filename]]);
    end
end

for objID = 1:length(objects)
    if ~isempty(objects(objID).modelSave)

        [filename,path] = uiputfile(['./data/samples/',...
            objects(objID).modelSave],...
            ['Export Object', int2str(objID),' Lua file']);

        metadata.scaling_used = objects(objID).modelSetupChoice;
        if filename ~= 0
            fnc_writeLUAFile (objects(objID).objectModel, ...
                [path,filename], ...
                metadata);
            
            disp (['Wrote object LUA file :: ', ...
                objects(objID).modelSave]);
        end
    end
end