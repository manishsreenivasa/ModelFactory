%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_readCustomMarkerFile (buttonHandle, ~, ~)
[filename,path] = uigetfile('./data/sampleDescriptions/*.*','Load Custom Marker File');
% Read custom constraints description file
disp (['Using Custom Marker Description in ',path,filename]);
MarkerDescription = fnc_readCustomMarkerFile ([path,filename]);
buttonHandle.Parent.UserData.customMarkerFile = [path,filename];
buttonHandle.Parent.UserData.customMarkerDescription = MarkerDescription;
tag_customMarkerFile = findobj('Tag','txt_customMarkerFileName');
set(tag_customMarkerFile,'String',['Loaded ',filename]);