%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function humanModelDescription = fnc_readHumanModelDescriptionFile (file)
fid = fopen(file);
humanModelDescription = textscan(fid, '%s%s%s%s%s%s','Delimiter',',','CommentStyle','#');
fclose(fid);