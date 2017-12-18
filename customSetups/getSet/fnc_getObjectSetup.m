%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function  [objectSetup, bConsistencyError] = fnc_getObjectSetup (humanModel,...
    objectSetupChosen)
bConsistencyError = 0;
objectSetup = [];
objectSetup_functionFilename = ['fnc_objectSetup_',objectSetupChosen];
try
    setup_command = ['objectSetup = ',...
        objectSetup_functionFilename,'(humanModel);'];
    eval(setup_command);
catch
    try
        setup_command = ['objectSetup = ',...
            objectSetup_functionFilename,'();'];
        eval(setup_command);
    catch
        disp ([' - Object setup, ', objectSetup_functionFilename,', not found']);
        disp (' - if this is a custom object setup then make sure the corresponding function is available and follows the naming convention above');
        error (' - Unknown object setup.')
    end
end