%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_readHumanModelDescriptionFile (buttonHandle, ~, ~)
[filename,path] = uigetfile('./data/sampleDescriptions/*.*','Load Human Model Description File');
if filename == 0
    return;
end
% Read model description file
disp (['Using Human Model Description in ',path,filename]);
humanModelDescription = fnc_readHumanModelDescriptionFile ([path,filename]);
buttonHandle.Parent.UserData.humanModelDescription = humanModelDescription;
tag_humanModelFile = findobj('Tag','txt_humanModelFileName');
set(tag_humanModelFile,'String',['Loaded ',filename]);