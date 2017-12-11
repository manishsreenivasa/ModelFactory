%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function modelDescription = fnc_readObjectModelDescriptionFile (file)
fid = fopen(file);
modelDescription = textscan(fid, '%s%s%s%s%s%s','Delimiter',',','CommentStyle','#');
fclose(fid);
