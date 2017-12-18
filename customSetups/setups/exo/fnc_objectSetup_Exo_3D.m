%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function ExoSetup = fnc_objectSetup_Exo_3D (humanModel)

segment_type_names =  {
    'Exo_PelvisModule_3D',
    'Exo_TorsoBar_3D',
    'Exo_UpperTrunkModule_3D',
    'Exo_ThighBar_L_3D',
    'Exo_ThighBar_R_3D',
    'Exo_ThighModule_R_3D',
    'Exo_ThighModule_L_3D'};

%% Get info from human model
% Compute all global points to scale exoskeleton
nPoints = 1;
nSegments_Human = length(humanModel);
for i = 1:nSegments_Human
	parent_names{i} = humanModel{i}.parent;
	segment_names{i} = humanModel{i}.name;
end
rootSegmentID = strmatch ('ROOT', parent_names, 'exact');
global_axes(rootSegmentID).mat = [humanModel{rootSegmentID}.joint_E ...
    humanModel{rootSegmentID}.joint_r'; 0 0 0 1];
if ~isempty(humanModel{rootSegmentID}.points)
    [numPoints,~] = size(humanModel{rootSegmentID}.points);
    for pointNo = 1:numPoints
        points(nPoints,:) = global_axes(rootSegmentID).mat*...
            [humanModel{rootSegmentID}.points(pointNo,:) 1]';
        pointNames(nPoints) = humanModel{rootSegmentID}.pointNames(pointNo);
        nPoints = nPoints + 1;
    end
end

for segmentID = 1:length(humanModel)
    if isempty(humanModel{segmentID}.parentID)
        continue;
    end
    global_axes(segmentID).mat = ...
        global_axes(humanModel{segmentID}.parentID).mat*...
        [inv(humanModel{segmentID}.joint_E) ...
        humanModel{segmentID}.joint_r'; 0 0 0 1];
    if ~isempty(humanModel{segmentID}.points)
        [numPoints,~] = size(humanModel{segmentID}.points);
        for pointNo = 1:numPoints
            points(nPoints,:) = global_axes(segmentID).mat*...
                [humanModel{segmentID}.points(pointNo,:) 1]';
            pointNames(nPoints) = humanModel{segmentID}.pointNames(pointNo);
            nPoints = nPoints + 1;
        end
    end
end

pelvis_L_point_ID     = strmatch ('Pelvis_L', pointNames, 'exact');    
pelvis_R_point_ID     = strmatch ('Pelvis_R', pointNames, 'exact'); 
upperTrunk_B_point_ID = strmatch ('UpperTrunk_Back', pointNames, 'exact'); 
thigh_L_point_ID      = strmatch ('Thigh_L', pointNames, 'exact');
thigh_R_point_ID      = strmatch ('Thigh_R', pointNames, 'exact');

midPoint_pelvis_points = 0.5 .*(points(pelvis_L_point_ID,:) +...
    points(pelvis_R_point_ID,:));
upperTrunk_back_point  = points(upperTrunk_B_point_ID,:);
torso_bar_length = sqrt(sum((midPoint_pelvis_points(3) -...
    upperTrunk_back_point(3)).^2));
thigh_L_bar_length = sqrt(sum((points(pelvis_L_point_ID,:) -...
    points(thigh_L_point_ID,:)).^2));
thigh_R_bar_length = sqrt(sum((points(pelvis_R_point_ID,:) -...
    points(thigh_R_point_ID,:)).^2));

pelvis_SegmentID     = strmatch ('Pelvis', segment_names, 'exact');    
upperTrunk_SegmentID = strmatch ('UpperTrunk', segment_names, 'exact');
thigh_L_SegmentID    = strmatch ('Thigh_L', segment_names, 'exact');   
thigh_R_SegmentID    = strmatch ('Thigh_R', segment_names, 'exact');    

%% Setup exoskeleton meshes
ExoSetup.segmentTypeNames(1)  = segment_type_names(1);
ExoSetup.mesh_center(1,:)     = [0.0, 0.0, 0.0];
ExoSetup.mesh_dimension(1,:)  = ...
    [humanModel{pelvis_SegmentID}.mesh_dimension(1)...
    *1.2 humanModel{pelvis_SegmentID}.mesh_dimension(2)*1.2 ...
    0.5*humanModel{pelvis_SegmentID}.length];
ExoSetup.mesh_obj{1}          = 'exo_pelvisModule.obj';
ExoSetup.mesh_color(1,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(1,:,:)       = eye(3);
ExoSetup.joint_r(1,:)         = [0 0 0.7*humanModel{pelvis_SegmentID}.length];
ExoSetup.length(1)            = humanModel{pelvis_SegmentID}.length;      

ExoSetup.segmentTypeNames(2)  = segment_type_names(2);
ExoSetup.mesh_center(2,:)     = [-0.02 0.0 0.65*torso_bar_length];
ExoSetup.mesh_dimension(2,:)  = [0.02 0.04 1.3*torso_bar_length];
ExoSetup.mesh_obj{2}          = 'exo_bar.obj';
ExoSetup.mesh_color(2,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(2,:,:)       = eye(3);
ExoSetup.joint_r(2,:)         = [-0.5*humanModel{upperTrunk_SegmentID}.mesh_dimension(1) 0 0];
ExoSetup.length(2)            = torso_bar_length;

ExoSetup.segmentTypeNames(3)  = segment_type_names(3);
ExoSetup.mesh_center(3,:)     = [0.5*humanModel{upperTrunk_SegmentID}.mesh_dimension(1),...
    0.0, 0.2*humanModel{upperTrunk_SegmentID}.length];
ExoSetup.mesh_dimension(3,:)  = 1.1*[humanModel{upperTrunk_SegmentID}.mesh_dimension(1)...
    humanModel{upperTrunk_SegmentID}.mesh_dimension(2)...
    0.6*humanModel{upperTrunk_SegmentID}.length];
ExoSetup.mesh_obj{3}          = 'exo_upperTrunkModule.obj';
ExoSetup.mesh_color(3,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(3,:,:)       = eye(3);
ExoSetup.joint_r(3,:)         = [0 0.0 torso_bar_length]; 
ExoSetup.length(3)            = 0.6*humanModel{upperTrunk_SegmentID}.length;

ExoSetup.segmentTypeNames(4)  = segment_type_names(4);
ExoSetup.mesh_center(4,:)     = [0.03 0.00 -0.6*thigh_L_bar_length];
ExoSetup.mesh_dimension(4,:)  = [0.015 0.03 1.2*thigh_L_bar_length];
ExoSetup.mesh_obj{4}          = 'exo_bar.obj';
ExoSetup.mesh_color(4,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(4,:,:)       = eye(3);
ExoSetup.joint_r(4,:)         = [0.4*humanModel{thigh_L_SegmentID}.mesh_dimension(1)...
    humanModel{thigh_L_SegmentID}.joint_r(2) 0];
ExoSetup.length(4)            = thigh_L_bar_length;

ExoSetup.segmentTypeNames(5)  = segment_type_names(5);
ExoSetup.mesh_center(5,:)     = [0.03 0.00 -0.6*thigh_R_bar_length];
ExoSetup.mesh_dimension(5,:)  = [0.015 0.03 1.2*thigh_R_bar_length];
ExoSetup.mesh_obj{5}          = 'exo_bar.obj';
ExoSetup.mesh_color(5,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(5,:,:)       = eye(3);
ExoSetup.joint_r(5,:)         = [0.4*humanModel{thigh_R_SegmentID}.mesh_dimension(1)...
    humanModel{thigh_R_SegmentID}.joint_r(2) 0]; 
ExoSetup.length(5)            = thigh_L_bar_length;

ExoSetup.segmentTypeNames(6)  = segment_type_names(6);
ExoSetup.mesh_center(6,:)     = [-0.35*humanModel{thigh_L_SegmentID}.mesh_dimension(1),...
    0.02*humanModel{thigh_L_SegmentID}.mesh_dimension(1), 0.0];
ExoSetup.mesh_dimension(6,:)  = [humanModel{thigh_L_SegmentID}.mesh_dimension(1)*1.1...
    0.15 0.15*humanModel{thigh_L_SegmentID}.mesh_dimension(3)];
ExoSetup.mesh_obj{6}          = 'exo_thighModule.obj';
ExoSetup.mesh_color(6,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(6,:,:)       = eye(3);
ExoSetup.joint_r(6,:)         = [0.0 0.0 ...
    -0.75*humanModel{thigh_L_SegmentID}.length-ExoSetup.joint_r(1,3)];
ExoSetup.length(6)            = 0.15*humanModel{thigh_L_SegmentID}.mesh_dimension(3);

ExoSetup.segmentTypeNames(7)  = segment_type_names(7);
ExoSetup.mesh_center(7,:)     = [-0.35*humanModel{thigh_R_SegmentID}.mesh_dimension(1),...
    -0.02*humanModel{thigh_R_SegmentID}.mesh_dimension(1), 0.0];
ExoSetup.mesh_dimension(7,:)  = [humanModel{thigh_R_SegmentID}.mesh_dimension(1)*1.1...
    0.15 0.15*humanModel{thigh_R_SegmentID}.mesh_dimension(3)];
ExoSetup.mesh_obj{7}          = 'exo_thighModule.obj';
ExoSetup.mesh_color(7,:)      = [0, 104, 139]/255;
ExoSetup.joint_E(7,:,:)       = eye(3);
ExoSetup.joint_r(7,:)         = [0.0 0.0 ...
    -0.75*humanModel{thigh_R_SegmentID}.length-ExoSetup.joint_r(1,3)];
ExoSetup.length(7)            = 0.15*humanModel{thigh_R_SegmentID}.mesh_dimension(3);