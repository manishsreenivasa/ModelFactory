%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_updateFemaleGender (buttonHandle, ~, ~)
isMale = findobj('Tag','checkBox_genderMale');
buttonHandle.Parent.UserData.humanAnthropometry.gender = 0;
isMale.Value = 0;