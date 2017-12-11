%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_readCustomLengthsFile (buttonHandle, ~, ~)
[filename,path] = uigetfile('./data/sampleDescriptions/*.*','Load Custom Segment Lengths File');
if filename == 0
    return;
end
% Read model description file
disp (['Using Custom Segment Lengths from ',path,filename]);
customSegmentLengthsDescription = fnc_readCustomLengthsFile ([path,filename]);
buttonHandle.Parent.UserData.customSegmentLengthsDescription = customSegmentLengthsDescription;
tag_customSegmentLengthsFile = findobj('Tag','txt_customSegmentLengthsFileName');
set(tag_customSegmentLengthsFile,'String',['Loaded ',filename]);