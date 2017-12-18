%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function humanAnthropometry = fnc_readHumanAnthropometry(humanModel_AnthropometryFile)

fid = fopen(humanModel_AnthropometryFile);
fileTxt = textscan(fid, '%s%f','Delimiter',',','CommentStyle','#');
fclose(fid);

humanAnthropometry.age = fnc_findFieldValue ('age', fileTxt);
humanAnthropometry.height = fnc_findFieldValue ('height', fileTxt);
humanAnthropometry.weight = fnc_findFieldValue ('weight', fileTxt);
humanAnthropometry.gender = fnc_findFieldValue ('gender', fileTxt);
humanAnthropometry.pelvisWidth = fnc_findFieldValue ('pelvisWidth', fileTxt);
humanAnthropometry.hipCenterWidth = fnc_findFieldValue ('hipCenterWidth', fileTxt);
humanAnthropometry.shoulderCenterWidth = fnc_findFieldValue ('shoulderCenterWidth', fileTxt);
humanAnthropometry.heelAnkleXOffset = fnc_findFieldValue ('heelAnkleXOffset', fileTxt);
humanAnthropometry.heelAnkleZOffset = fnc_findFieldValue ('heelAnkleZOffset', fileTxt);
humanAnthropometry.shoulderNeckZOffset = fnc_findFieldValue ('shoulderNeckZOffset', fileTxt);
humanAnthropometry.footWidth = fnc_findFieldValue ('footWidth', fileTxt);

function fieldValue = fnc_findFieldValue (str_to_search, fileTxt)
idx_b = strcmp(str_to_search,fileTxt{:,1});
idx = find (idx_b == 1);
if isempty(idx)
    fieldValue = [];
elseif length(idx) > 1
    error (['Field ',str_to_search,' defined multiple times in environment setup file']);
else
    fieldValue = fileTxt{2}(idx);
end