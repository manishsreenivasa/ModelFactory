%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function constraintsDescription = fnc_readCustomConstraintsFile (file)
fid = fopen(file);
constraintsDescription = textscan(fid, '%s','Delimiter',',','CommentStyle','#');
fclose(fid);