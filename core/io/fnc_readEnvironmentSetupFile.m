%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function EnvironmentSetup = fnc_readEnvironmentSetupFile (EnvironmentSetupFile)

fid = fopen(EnvironmentSetupFile);
fileTxt = textscan(fid, '%s','CommentStyle','#');
fclose(fid);

fileCellArray = {fileTxt{1,1}{:,1}};

% Read mandatory fields first
fieldIsMandatory = 1;
EnvironmentSetup.humanModel_DescriptionFile = ...
    fnc_findFieldValue ('humanModel_DescriptionFile',fileCellArray,fieldIsMandatory);
EnvironmentSetup.humanModel_ScalingAlgorithmChoice = ...
    fnc_findFieldValue ('humanModel_ScalingAlgorithmChoice',fileCellArray,fieldIsMandatory);
EnvironmentSetup.humanModel_AnthropometryFile = ...
    fnc_findFieldValue ('humanModel_AnthropometryFile',fileCellArray,fieldIsMandatory);

% Optional values Human
EnvironmentSetup.humanModel_Save = ...
    fnc_findFieldValue ('humanModel_Save',fileCellArray);
EnvironmentSetup.humanModel_TypeMeshes = ...
    fnc_findFieldValue ('humanModel_TypeMeshes',fileCellArray);
if isempty(EnvironmentSetup.humanModel_TypeMeshes)
    EnvironmentSetup.humanModel_TypeMeshes = 'default';
end

% Optional values customization
EnvironmentSetup.humanModel_UseCustomLengths = ...
    fnc_findFieldValue ('humanModel_UseCustomLengths',fileCellArray);
EnvironmentSetup.humanModel_UseCustomConstraints = ...
    fnc_findFieldValue ('humanModel_UseCustomConstraints',fileCellArray);

% Miscellaneous options
EnvironmentSetup.AddMarkers = ...
    fnc_findFieldValue ('AddMarkers',fileCellArray);
EnvironmentSetup.UseCustomMarkers = ...
    fnc_findFieldValue ('UseCustomMarkers',fileCellArray);
EnvironmentSetup.combinedModel_Save = ...
    fnc_findFieldValue ('combinedModel_Save',fileCellArray);

% Read all object fields
IsObjectIdx = regexp(fileCellArray,'object\w*DescriptionFile');
EnvironmentSetup.nObjects = 0;
obj = 1;
for i = 1:length(fileCellArray)
   if ~isempty(IsObjectIdx{i})
       
       EnvironmentSetup.objects(obj).modelDescriptionFile = ...
           fileCellArray{i+1};       
       
       % Find corresponding object setup
       EnvironmentSetup.objects(obj).modelSetupChoice = ...
           fnc_findFieldValue (['objectModel',int2str(obj),'_SetupChoice'],...
           fileCellArray, fieldIsMandatory);
       
       % Find corresponding object mass properties file (if any)
       EnvironmentSetup.objects(obj).modelMassProperties = ...
           fnc_findFieldValue (['objectModel',int2str(obj),'_MassProperties'],...
           fileCellArray);
       
       % Find corresponding object model save option (if any)
       EnvironmentSetup.objects(obj).modelSave = ...
           fnc_findFieldValue (['objectModel',int2str(obj),'_Save'],...
           fileCellArray);
       
       EnvironmentSetup.nObjects = EnvironmentSetup.nObjects + 1;
       obj = obj + 1;
   end
end
disp (['Found ', int2str(EnvironmentSetup.nObjects), ...
    ' objects in environment file']);
end

function fieldValue = fnc_findFieldValue (str_to_search, searchArray, isMandatory)
if nargin < 3
    isMandatory = 0;
end
idx_b = strcmp(str_to_search,searchArray);
idx = find (idx_b == 1);
if isempty(idx)
    if isMandatory
        error (['Mandatory field ',str_to_search,' not found in environment setup file']);
    else
        fieldValue = [];
    end
elseif length(idx) > 1
    error (['Field ',str_to_search,' defined multiple times in environment setup file']);
else
    fieldValue = searchArray{idx+1};
end
end