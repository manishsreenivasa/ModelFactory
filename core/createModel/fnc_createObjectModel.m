%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function objectModel = fnc_createObjectModel (modelDescription, modelSetup, ...
    humanAnthropometry,...
    addMarkers,...
    customMarkerList)

% Read dictionary items
dict_definitions;

nSegments = length(modelDescription{1});
for segmentID = 1:nSegments
    objectModel{segmentID}= class_modelSegment;
    modelSegment_typeName = modelDescription{2}{segmentID};
    modelJoint_typeName   = modelDescription{3}{segmentID};
    segmentIDXMatch       = strmatch (modelSegment_typeName,...
        modelSetup.segmentTypeNames, 'exact');
    
    objectModel{segmentID}.name     = modelDescription{1}{segmentID};
    objectModel{segmentID}.parent   = modelDescription{4}{segmentID};
    model_segment_names{segmentID} = objectModel{segmentID}.name;
    objectModel{segmentID}.parentID = strmatch (objectModel{segmentID}.parent,...
        model_segment_names, 'exact');
    
    objectModel{segmentID}.length  = modelSetup.length(segmentIDXMatch);
    objectModel{segmentID}.joint_E = ...
        squeeze(modelSetup.joint_E(segmentIDXMatch,:,:));
    objectModel{segmentID}.joint_r = ...
        squeeze(modelSetup.joint_r(segmentIDXMatch,:,:));
    
    if isfield(modelSetup,'mass')
        objectModel{segmentID}.mass = modelSetup.mass(segmentIDXMatch);
        objectModel{segmentID}.com = modelSetup.com(segmentIDXMatch,:);
        objectModel{segmentID}.inertia = modelSetup.inertia(segmentIDXMatch,:,:);
    end
    
    objectModel{segmentID}.mesh_dimension = ...
        squeeze(modelSetup.mesh_dimension(segmentIDXMatch,:,:));
    objectModel{segmentID}.mesh_center = ...
        modelSetup.mesh_center(segmentIDXMatch,:);
    objectModel{segmentID}.mesh_color = modelSetup.mesh_color(segmentIDXMatch,:);
    objectModel{segmentID}.mesh_obj   = modelSetup.mesh_obj{segmentIDXMatch};
    
    % Add point information
    if ~isempty(modelDescription{5}{segmentID})
        if strmatch (modelDescription{5}{segmentID}, ...
                {PointsTypesDictionary(:).name}, 'exact')
            objectModel{segmentID} = fnc_getPoints ...
                (objectModel{segmentID}, modelDescription{5}{segmentID});
        else
            error ([' - Point type "', ...
                modelDescription{5}{segmentID},...
                '" not found in dictionary']);
        end
    end
    
    % Add constraint set information
    if ~isempty(modelDescription{6}{segmentID})
        disp ([' - Found constraint set, ', ...
            modelDescription{6}{segmentID},', in segment, ', ...
            modelDescription{1}{segmentID}]);
        if strmatch (modelDescription{6}{segmentID}, ...
                {ConstraintSetTypes(:).name}, 'exact')
            constraintSetIDX = strmatch ...
                (modelDescription{6}{segmentID}, ...
                {ConstraintSetTypes(:).name}, 'exact');
            objectModel{segmentID}.constraintSet =...
                ConstraintSetTypes(constraintSetIDX);
        else
            error ([' - Constraint set type "', ...
                modelDescription{6}{segmentID}, ...
                '" not found in dictionary']);
        end
    end
    jointIDXMatch = strmatch (modelJoint_typeName, ...
        {JointTypesDictionary(:).name}, 'exact');
    objectModel{segmentID}.joint = JointTypesDictionary(jointIDXMatch).axes;
    
    % Add marker information
    if addMarkers == 1 || addMarkers == '1' || ~isempty(customMarkerList)
		if segmentID == 1
            disp (' - Adding markers to object segments. ');
			if isempty(customMarkerList) 
			    disp (['  -- Using default marker configuration']);
			else
                disp (['  -- Using custom marker configuration from.']);
			end
		end
        [objectModel{segmentID}.marker_names, ...
            objectModel{segmentID}.marker_values] = ...
            fnc_addMarkersToSegments (objectModel, modelSegment_typeName,...
            humanAnthropometry, segmentID, customMarkerList);
    end
end
