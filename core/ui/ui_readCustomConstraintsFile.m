%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_readCustomConstraintsFile (buttonHandle, ~, ~)
[filename,path] = uigetfile('./data/sampleDescriptions/*.*','Load Custom Constraints File');
if filename == 0
    return;
end   
% Read custom constraints description file
disp (['Using Custom Constraints Description in ',path,filename]);
constraintsDescription = fnc_readCustomConstraintsFile ([path,filename]);
buttonHandle.Parent.UserData.customConstraintsDescription = constraintsDescription;
tag_customConstraintsFile = findobj('Tag','txt_customConstraintFileName');
set(tag_customConstraintsFile,'String',['Loaded ',filename]);