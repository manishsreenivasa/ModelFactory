%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%
% Check 2 things
% 1. That all segment types are defined in the chosen scaling algorithm
% 2. That all joint types are defined in the model factory dictionay

function bConsistencyError = fnc_checkScalingConsistency (modelDescription, segmentTypeNames)
nSegments = length(modelDescription{1});
dict_definitions;
bConsistencyError = 0;

% Check that all defined segment and joint types exist in the dictionary
for i = 1:nSegments   
    segmentTypeMatch = strmatch (modelDescription{2}{i}, segmentTypeNames, 'exact');
    if isempty (segmentTypeMatch)
        disp (['Segment type "',modelDescription{2}{i}, '" not found in scaling algorithm']);
        bConsistencyError = 1;
    end
    jointTypeMatch = strmatch (modelDescription{3}{i}, {JointTypesDictionary(:).name}, 'exact');
    if isempty (jointTypeMatch)
        disp (['Joint type "',modelDescription{3}{i}, '" not found in dictionary']);
        bConsistencyError = 1;
    end
    clear segmentTypeMatch jointTypeMatch
end
