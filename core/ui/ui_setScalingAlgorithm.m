%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_setScalingAlgorithm (buttonHandle, ~, ~)
scalingChoice = findobj('Tag','popup_menuScaling');
scalingAlgorithmChosen = buttonHandle.Parent.UserData.scalingAlgorithmOptions{scalingChoice.Value};
buttonHandle.Parent.UserData.scalingAlgorithmChosen = scalingAlgorithmChosen;