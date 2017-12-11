%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function ExoSetup = fnc_exoSetup_Exo_Sagittal (humanModel)

segment_type_names =  {
    'Exo_PelvisModule_Sagittal',
    'Exo_TorsoBar_Sagittal',
    'Exo_UpperTrunkModule_Sagittal',
    'Exo_ThighBar_Sagittal',
    'Exo_ThighModule_Sagittal'};

%% Get info from human model
% Compute all global contact points to scale exoskeleton
nContacts = 1;
nSegments_Human = length(humanModel);
for i = 1:nSegments_Human
	parent_names{i} = humanModel{i}.parent;
	segment_names{i} = humanModel{i}.name;
end
rootSegmentID = strmatch ('ROOT', parent_names, 'exact');
global_axes(rootSegmentID).mat = [humanModel{rootSegmentID}.joint_E humanModel{rootSegmentID}.joint_r'; 0 0 0 1];
if ~isempty(humanModel{rootSegmentID}.contactPoints)
    [numPoints,~] = size(humanModel{rootSegmentID}.contactPoints);
    for pointNo = 1:numPoints
        contact_points(nContacts,:) = global_axes(rootSegmentID).mat*[humanModel{rootSegmentID}.contactPoints(pointNo,:) 1]';
        contact_names(nContacts) = humanModel{rootSegmentID}.contactPointNames(pointNo);
        nContacts = nContacts + 1;
    end
end

for segmentID = 1:length(humanModel)
    if isempty(humanModel{segmentID}.parentID)
        continue;
    end
    global_axes(segmentID).mat = global_axes(humanModel{segmentID}.parentID).mat*[inv(humanModel{segmentID}.joint_E) humanModel{segmentID}.joint_r'; 0 0 0 1];
    if ~isempty(humanModel{segmentID}.contactPoints)
        [numPoints,~] = size(humanModel{segmentID}.contactPoints);
        for pointNo = 1:numPoints
            contact_points(nContacts,:) = global_axes(segmentID).mat*[humanModel{segmentID}.contactPoints(pointNo,:) 1]';
            contact_names(nContacts) = humanModel{segmentID}.contactPointNames(pointNo);
            nContacts = nContacts + 1;
        end
    end
end

pelvis_contactPoint_ID        = strmatch ('Pelvis_Sagittal', contact_names, 'exact');    
upperTrunk_contactPoint_ID    = strmatch ('UpperTrunk_Sagittal', contact_names, 'exact');    
thigh_contactPoint_ID         = strmatch ('Thigh_Sagittal', contact_names, 'exact');

midPoint_pelvis_contacts      = contact_points(pelvis_contactPoint_ID,:);
midPoint_upperTrunk_contacts  = contact_points(upperTrunk_contactPoint_ID,:);
torso_bar_length = sqrt(sum((midPoint_pelvis_contacts-midPoint_upperTrunk_contacts).^2));
thigh_bar_length = sqrt(sum((contact_points(pelvis_contactPoint_ID,:)-contact_points(thigh_contactPoint_ID,:)).^2));

pelvis_SegmentID     = strmatch ('Pelvis_Sagittal', segment_names, 'exact');    
upperTrunk_SegmentID = strmatch ('UpperTrunk_Sagittal', segment_names, 'exact');    
Thigh_SegmentID      = strmatch ('Thigh_Sagittal', segment_names, 'exact');

%% Setup exoskeleton meshes
ExoSetup.segmentTypeNames(1)  = segment_type_names(1);
ExoSetup.mesh_center(1,:)     = [0.0, 0.0, 0.0];
ExoSetup.mesh_dimension(1,:)  = [humanModel{pelvis_SegmentID}.mesh_dimension(1)*1.2 0.02 0.5*humanModel{pelvis_SegmentID}.mesh_dimension(3)];
ExoSetup.mesh_obj{1}          = 'meshes/exo_pelvisModule.obj';
ExoSetup.mesh_color(1,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(1,:,:)       = eye(3);
ExoSetup.joint_r(1,:)         = [0 0 0.5*humanModel{pelvis_SegmentID}.mesh_dimension(3)];
ExoSetup.length(1)            = 0.5*humanModel{pelvis_SegmentID}.length;  
    
ExoSetup.segmentTypeNames(2)  = segment_type_names(2);
ExoSetup.mesh_center(2,:)     = [0.0 0.0 0.75*torso_bar_length];
ExoSetup.mesh_dimension(2,:)  = [0.02 0.015 1.5*torso_bar_length];
ExoSetup.mesh_obj{2}          = 'meshes/exo_bar.obj';
ExoSetup.mesh_color(2,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(2,:,:)       = eye(3);
ExoSetup.joint_r(2,:)         = [-0.6*humanModel{pelvis_SegmentID}.mesh_dimension(1) 0.0 0.0];
ExoSetup.length(2)            = torso_bar_length;

ExoSetup.segmentTypeNames(3)  = segment_type_names(3);
ExoSetup.mesh_center(3,:)     = [0.5*humanModel{upperTrunk_SegmentID}.mesh_dimension(1), 0.0, 0.3*humanModel{upperTrunk_SegmentID}.mesh_dimension(3)];
ExoSetup.mesh_dimension(3,:)  = [humanModel{upperTrunk_SegmentID}.mesh_dimension(1)*1.1 0.02 0.9*humanModel{upperTrunk_SegmentID}.mesh_dimension(3)];
ExoSetup.mesh_obj{3}          = 'meshes/exo_upperTrunkModule.obj';
ExoSetup.mesh_color(3,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(3,:,:)       = eye(3);
ExoSetup.joint_r(3,:)         = [ExoSetup.mesh_dimension(2,1)*0.5 0.0 torso_bar_length];
ExoSetup.length(3)            = ExoSetup.mesh_dimension(3,1);

ExoSetup.segmentTypeNames(4)  = segment_type_names(4);
ExoSetup.mesh_center(4,:)     = [0.00 0.00 -0.75*thigh_bar_length];
ExoSetup.mesh_dimension(4,:)  = [0.02 0.015 1.5*thigh_bar_length];
ExoSetup.mesh_obj{4}          = 'meshes/exo_bar.obj';
ExoSetup.mesh_color(4,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(4,:,:)       = eye(3);
ExoSetup.joint_r(4,:)         = [0.5*humanModel{pelvis_SegmentID}.mesh_dimension(1) 0.0 0];
ExoSetup.length(4)            = thigh_bar_length;

ExoSetup.segmentTypeNames(5)  = segment_type_names(5);
ExoSetup.mesh_center(5,:)     = [-0.5*humanModel{pelvis_SegmentID}.mesh_dimension(1) 0.0, 0.0];
ExoSetup.mesh_dimension(5,:)  = [humanModel{Thigh_SegmentID}.mesh_dimension(1)*1.1 0.02 0.15*humanModel{Thigh_SegmentID}.mesh_dimension(3)];
ExoSetup.mesh_obj{5}          = 'meshes/exo_thighModule.obj';
ExoSetup.mesh_color(5,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(5,:,:)       = eye(3);
ExoSetup.joint_r(5,:)         = [0.0 0.0 -thigh_bar_length];
ExoSetup.length(5)            = 0.15*humanModel{Thigh_SegmentID}.mesh_dimension(3);
