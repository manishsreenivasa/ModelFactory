%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function [scalingAlgorithm,bConsistencyError] = fnc_setHumanScalingAlgorithm (humanModelDescription,scalingAlgorithmChosen,humanAnthropometry,customLengthsDescription,meshOption)
switch scalingAlgorithmChosen
    case {'deLeva1996_segmentedTrunk'}
        disp (' - Using de Leva 1996 Scaling for Segmented Trunk')
        scalingAlgorithm = fnc_scalingAlgo_deLeva1996_segmentedTrunk (humanModelDescription, humanAnthropometry, customLengthsDescription,meshOption);
        bConsistencyError = fnc_checkScalingConsistency (humanModelDescription, scalingAlgorithm.segmentTypeNames);
    case {'deLeva1996_fusedTorso'}
        disp (' - Using de Leva 1996 Scaling for Fused Torso')
        scalingAlgorithm = fnc_scalingAlgo_deLeva1996_fusedTorso (humanModelDescription, humanAnthropometry, customLengthsDescription,meshOption);
        bConsistencyError = fnc_checkScalingConsistency (humanModelDescription, scalingAlgorithm.segmentTypeNames);
    case {'deLeva1996_segmentedTrunk_sagittal'}
        disp (' - Using de Leva 1996 Scaling for Segmented Trunk Sagittal Model')
        scalingAlgorithm = fnc_scalingAlgo_deLeva1996_segmentedTrunk_sagittal (humanModelDescription, humanAnthropometry, customLengthsDescription,meshOption);
        bConsistencyError = fnc_checkScalingConsistency (humanModelDescription, scalingAlgorithm.segmentTypeNames);
    case {'Jensen1986'}
        disp (' - Using Jensen 1986 Scaling')
        if isempty (customLengthsDescription)
            error('Jensen1986 scaling only works when all segment lengths are provided.');
        end
        scalingAlgorithm = fnc_scalingAlgo_Jensen1986 (humanModelDescription, humanAnthropometry, customLengthsDescription,meshOption);
        bConsistencyError = fnc_checkScalingConsistency (humanModelDescription, scalingAlgorithm.segmentTypeNames);
    otherwise
        customScalingAlgorithm_functionFilename = ['fnc_scalingAlgo_',scalingAlgorithmChosen];
        try 
            customScaling_command = ['scalingAlgorithm = ',...
                customScalingAlgorithm_functionFilename,...
                '(humanModelDescription, humanAnthropometry, customLengthsDescription,meshOption);'];
            eval(customScaling_command);           
            bConsistencyError = fnc_checkScalingConsistency (humanModelDescription, scalingAlgorithm.segmentTypeNames);
        catch
            disp ([' - Scaling algorithm, ', customScalingAlgorithm_functionFilename,', not found']);
            disp (' - if this is a custom scaling algorithm then make sure the corresponding function is available and follows the naming convention above');
            error (' - Unknown Scaling algorithm');
        end
end