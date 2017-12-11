%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function MarkerDescription = fnc_readCustomMarkerFile (file)
fid = fopen(file);
MarkerDescription = textscan(fid, '%s%s%f%s%s%s%s%s%s%f%f%f%f%f%f','Delimiter',',','CommentStyle','#');
fclose(fid);