%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function customLengthsDescription = fnc_readCustomLengthsFile (file)
fid = fopen(file);
customLengthsDescription = textscan(fid, '%f%s','Delimiter',',','CommentStyle','#');
fclose(fid);