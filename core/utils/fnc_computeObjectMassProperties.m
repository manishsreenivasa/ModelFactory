%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function model = fnc_computeObjectMassProperties (model, massPropertyFile)

addpath([pwd,'/externalDependencies/RigidBodyParams']);

fid = fopen(massPropertyFile);
fileTxt = textscan(fid, '%s%s%f%f%f%f%f%f%f%f%f%f%f%f%f','Delimiter',',','CommentStyle','#');
fclose(fid);

nSegments = length(model);
for segmentID = 1:nSegments
    parent_names{segmentID} = model{segmentID}.parent;
    segment_names{segmentID} = model{segmentID}.name;
end

if length(fileTxt{1}) ~= nSegments
    error (['  -- Mismatch between number of object segments, ', ...
        int2str(length(fileTxt{1})), ', and provided mass properties, ', ...
        int2str(nSegments)]);
end

% This has to be done due to issues with matlab indexing multi level cells
for segmentID = 1:nSegments
    modelSegmentNames{segmentID} = model{segmentID}.name;
end

% Read choice of computing from mesh volume and mean density or user
% supplied values
for segmentID = 1:nSegments
    correspondingSegmentInModel = find(strcmp(fileTxt{1}{segmentID}, ...
        modelSegmentNames) == 1);
    if isempty (correspondingSegmentInModel)
        error (['  -- Could not find segment with name, ',...
            fileTxt{1}{segmentID},' in object mass properties file']);
    end
    if strcmp(fileTxt{2}{segmentID},'UseMeanDensity')
        useMeanDensityFlag(correspondingSegmentInModel) = 1;
        segmentMassProperties(correspondingSegmentInModel).meanDensity...
            = fileTxt{3}(segmentID);
    elseif strcmp(fileTxt{2}{segmentID},'UseUserValues')
        useMeanDensityFlag(correspondingSegmentInModel) = 0;
        segmentMassProperties(correspondingSegmentInModel).mass...
            = fileTxt{3}(segmentID);
        segmentMassProperties(correspondingSegmentInModel).com...
            = [fileTxt{4}(segmentID) ...
            fileTxt{5}(segmentID) ...
            fileTxt{6}(segmentID)];        
        segmentMassProperties(correspondingSegmentInModel).inertia...
            = [fileTxt{7}(segmentID) ...
            fileTxt{8}(segmentID) ...
            fileTxt{9}(segmentID);
            fileTxt{10}(segmentID) ...
            fileTxt{11}(segmentID) ...
            fileTxt{12}(segmentID);
            fileTxt{13}(segmentID) ...
            fileTxt{14}(segmentID) ...
            fileTxt{15}(segmentID)];        
    else
        error (['Unknown method, ',fileTxt{2}{segmentID},...
            ' , specified to compute object segment mass and', ...
            'inertia. Only ''UseMeanDensity'' or ''UseUserValues''',...
            'permitted.']);
    end
end

% Compute segment mass properties based on input choices
rootSegmentID = strmatch ('ROOT', parent_names, 'exact');
global_axes(rootSegmentID).mat = [model{rootSegmentID}.joint_E ...
    model{rootSegmentID}.joint_r'; 0 0 0 1];
for segmentID = 1:nSegments
    if isempty(model{segmentID}.parentID)
        continue;
    end
    global_axes(segmentID).mat = ...
        global_axes(model{segmentID}.parentID).mat...
        *[inv(model{segmentID}.joint_E) model{segmentID}.joint_r';...
        0 0 0 1];
end

pathToMeshes = [pwd,'/data/meshes/'];
for segmentID = 1:nSegments
    
    if useMeanDensityFlag(segmentID) == 1
        % Read mesh file
        [v_orig, faces] = fnc_plotting_readMeshOBJ([pathToMeshes, ...
            model{segmentID}.mesh_obj]);
        rotated_dimensions = abs([model{segmentID}.mesh_dimension 1]');
        
        % Normalize vertices with respect to the largest components
        range = abs([max(v_orig(:,1))-min(v_orig(:,1))... 
            max(v_orig(:,2))-min(v_orig(:,2))...
            max(v_orig(:,3))-min(v_orig(:,3))]);
        v_norm = v_orig./repmat(range, length(v_orig),1);
        v_scale = v_norm.*repmat(rotated_dimensions(1:3)',...
            length(v_orig),1);
        mesh_axis_pos = [mean(v_scale(:,1))... 
            mean(v_scale(:,2))...
            mean(v_scale(:,3))];
        v_scale = v_scale - repmat(mesh_axis_pos,length(v_scale),1);
        
        % Rotate to segment global and root pose
        for i = 1:length(v_scale)
            tmp = global_axes(segmentID).mat*[v_scale(i,:) 1]';
            v_rot(i,1:3) = tmp(1:3)';
        end
        v_rot = v_rot + repmat(model{segmentID}.mesh_center,...
            length(v_rot),1);
        
        scaledMesh.faces = faces;
        scaledMesh.vertices = v_rot;
        
        warning off;
        RBP = RigidBodyParams(scaledMesh);
        model{segmentID}.mass = RBP.volume *...
            segmentMassProperties(segmentID).meanDensity;
        model{segmentID}.inertia = RBP.inertia_tensor *...
            segmentMassProperties(segmentID).meanDensity;
        tmp = inv(global_axes(segmentID).mat)*[RBP.centroid 1]';
        model{segmentID}.com  = tmp(1:3,:)';
        
        clear RBP scaledMesh tmp v_rot v_scale v_norm range
        clear rotated_dimensions v_orig faces mesh_axis_pos
    else
        model{segmentID}.mass = segmentMassProperties(segmentID).mass;
        model{segmentID}.inertia = ...
            segmentMassProperties(segmentID).inertia;
        model{segmentID}.com  = segmentMassProperties(segmentID).com;
    end
end
