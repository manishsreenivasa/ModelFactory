%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function customConstraints = fnc_readCustomConstraints(customConstraintsDescription)

% Read dictionary items
dict_definitions;

disp (' - Reading custom constraints...');
nCustomConstraints = length(customConstraintsDescription{:});
for constraintID = 1:nCustomConstraints
    % Add constraint set information
    if strmatch (customConstraintsDescription{1}{constraintID}, {CustomConstraintSetTypes.name}, 'exact')
        disp (['  -- Found custom constraint set, ', customConstraintsDescription{1}{constraintID}]);
        customConstraintSetIDX = strmatch (customConstraintsDescription{1}{constraintID}, {CustomConstraintSetTypes.name}, 'exact');
        customConstraints(constraintID) = CustomConstraintSetTypes(customConstraintSetIDX);
    else
        error (['  -- Constraint set type "', customConstraintsDescription{1}{constraintID}, '" not found in dictionary']);
    end
end