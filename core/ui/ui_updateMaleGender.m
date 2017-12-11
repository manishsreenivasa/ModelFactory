%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_updateMaleGender (buttonHandle, ~, ~)
isFemale = findobj('Tag','checkBox_genderFemale');
buttonHandle.Parent.UserData.humanAnthropometry.gender = 1;
isFemale.Value = 0;