%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function [scalingAlgorithm, bConsistencyError] = fnc_setHumanScalingAlgorithm...
    (humanModelDescription, scalingAlgorithmChosen, humanAnthropometry,...
    customLengthsDescription, meshOption)

scalingAlgorithm = [];
scalingAlgorithm_functionFilename = ['fnc_scalingAlgo_',scalingAlgorithmChosen];
if exist(scalingAlgorithm_functionFilename,'file')
    scaling_command = ['scalingAlgorithm = ',...
    scalingAlgorithm_functionFilename,...
    '(humanModelDescription, humanAnthropometry, customLengthsDescription, meshOption);'];
    eval(scaling_command);
    bConsistencyError = fnc_checkScalingConsistency (humanModelDescription,...
        scalingAlgorithm.segmentTypeNames);
else
    disp ([' - Scaling algorithm, ', scalingAlgorithm_functionFilename,', not found']);
    disp (' - if this is a custom scaling algorithm then make sure the corresponding function is available and follows the naming convention above');
    error (' - Unknown Scaling algorithm');
end