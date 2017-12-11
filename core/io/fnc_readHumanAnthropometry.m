%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function humanAnthropometry = fnc_readHumanAnthropometry(humanModel_AnthropometryFile)

fid = fopen(humanModel_AnthropometryFile);
fileTxt = textscan(fid, '%s%f','Delimiter',',','CommentStyle','#');
fclose(fid);

searchArrayFile = fileTxt{:,1};

humanAnthropometry.age = fileTxt{2}(fnc_findFieldValue ('age',searchArrayFile));
humanAnthropometry.height = fileTxt{2}(fnc_findFieldValue ('height',searchArrayFile));
humanAnthropometry.weight = fileTxt{2}(fnc_findFieldValue ('weight',searchArrayFile));
humanAnthropometry.gender = fileTxt{2}(fnc_findFieldValue ('gender',searchArrayFile));
humanAnthropometry.pelvisWidth = fileTxt{2}(fnc_findFieldValue ('pelvisWidth',searchArrayFile));
humanAnthropometry.hipCenterWidth = fileTxt{2}(fnc_findFieldValue ('hipCenterWidth',searchArrayFile));
humanAnthropometry.shoulderCenterWidth = fileTxt{2}(fnc_findFieldValue ('shoulderCenterWidth',searchArrayFile));
humanAnthropometry.heelAnkleXOffset = fileTxt{2}(fnc_findFieldValue ('heelAnkleXOffset',searchArrayFile));
humanAnthropometry.heelAnkleZOffset = fileTxt{2}(fnc_findFieldValue ('heelAnkleZOffset',searchArrayFile));
humanAnthropometry.shoulderNeckZOffset = fileTxt{2}(fnc_findFieldValue ('shoulderNeckZOffset',searchArrayFile));
humanAnthropometry.footWidth = fileTxt{2}(fnc_findFieldValue ('footWidth',searchArrayFile));

function idx = fnc_findFieldValue (str_to_search, searchArray)
idx_b = strcmp(str_to_search,searchArray);
idx = find (idx_b == 1);
if isempty(idx)
    error (['Anthropometric field ',str_to_search,' not found in environment setup file']);
elseif length(idx) > 1
    error (['Field ',str_to_search,' defined multiple times in environment setup file']);
end