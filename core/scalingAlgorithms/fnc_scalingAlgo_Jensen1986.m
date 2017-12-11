%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%
% Values from Jensen 1986
% Robert K. Jensen (1986) "Body segment mass, radius and radius of gyration
% proportions of children", Journal of Biomechanics, 19 (5), pp. 359-368

function out_ScalingAlgorithm = fnc_scalingAlgo_Jensen1986 (...
    humanModelDescription, inParam_PersonInfo, ...
    customLengthsDescription, meshOption)

nSegments = 14;

JensenScaling.segment_type_names =  {
    'Segment_Torso',
    'Segment_Thigh_R',
    'Segment_Thigh_L',
    'Segment_Shank_R',
    'Segment_Shank_L',
    'Segment_Foot_R',
    'Segment_Foot_L',
    'Segment_Head',
    'Segment_UpperArm_R',
    'Segment_UpperArm_L',
    'Segment_LowerArm_R',
    'Segment_LowerArm_L',
    'Segment_Hand_R',
    'Segment_Hand_L'};

JensenScaling.mass_ratios = [
   -0.0006  0.4246;             % Torso
    0.00364 0.06634;            % Thigh
    0.00364 0.06634;            % Thigh
    0.00122 0.03809;            % Shank
    0.00122 0.03809;            % Shank
    0.00015 0.0187;             % Foot
    0.00015 0.0187;             % Foot
    -0.0114  0.2376;            % Head
    0.00084 0.022;              % Upperarm
    0.00084 0.022;              % Upperarm
    0.00018 0.01469;            % Lowerarm
    0.00018 0.01469;            % Lowerarm
    -0.00003 0.00898;           % Hand
    -0.00003 0.00898];          % Hand

JensenScaling.com_ratios = [
     0.0018  0.5087;     % Torso
    -0.00115 0.4758;     % Thigh
    -0.00115 0.4758;     % Thigh
    -0.003   0.4526;     % Shank
    -0.003   0.4526;     % Shank
    -0.00186 0.4351;     % Foot
    -0.00186 0.4351;     % Foot
    0.0025  0.4833;     % Head
    -0.00028 0.557;      % Upperarm
    -0.00028 0.557;      % Upperarm
    0.0019  0.561;      % Lowerarm
    0.0019  0.561;      % Lowerarm
    0.00019 0.6005;     % Hand
    0.00019 0.6005];    % Hand

JensenScaling.rGyration_ratios = [
    0.00136 0.5872;     % Torso
    -0.00133 0.5536;     % Thigh
    -0.00133 0.5536;     % Thigh
    -0.00224 0.5307;     % Shank
    -0.00224 0.5307;     % Shank
    -0.00203 0.5022;     % Foot
    -0.00203 0.5022;     % Foot
    0.0021  0.5748;     % Head
    -0.00098 0.64;       % Upperarm
    -0.00098 0.64;       % Upperarm
    0.00135 0.633;      % Lowerarm
    0.00135 0.633;      % Lowerarm
    0.00011 0.6461;     % Hand
    0.00011 0.6461];    % Hand

% For Mesomorph Body Shape (see Jensen 1986 for details)
JensenScaling.inertia_ratios = [
    1.0000    0.5508    0.9864; % Torso
    0.9750    1.0000    0.2021; % Thigh
    0.9750    1.0000    0.2021; % Thigh
    0.9996    1.0000    0.0865; % Shank
    0.9996    1.0000    0.0865; % Shank
    0.8621    1.0000    0.3534; % Foot
    0.8621    1.0000    0.3534; % Foot
    0.8834    1.0000    0.7771; % Head
    0.9683    1.0000    0.1177; % Upperarm
    0.9683    1.0000    0.1177; % Upperarm
    1.0000    0.9947    0.0963; % Lowerarm
    1.0000    0.9947    0.0963; % Lowerarm
    1.0000    0.8571    0.2000; % Hand
    1.0000    0.8571    0.2000];% Hand

for seg = 1:nSegments
    segmentNameInModelDescription = find(strcmp(customLengthsDescription{2}{seg},humanModelDescription{1}) == 1);
    if isempty (segmentNameInModelDescription)
        error(['Unable to find segment named ', customLengthsDescription{2}{seg}, ' in human model description']);
    end
    segmentNameInScalingAlgo =  find(strcmp (humanModelDescription{2}{segmentNameInModelDescription},JensenScaling.segment_type_names) == 1);
    if isempty (segmentNameInScalingAlgo)
        error(['Unable to find segment type ', humanModelDescription{2}{segmentNameInModelDescription}...
            , ', corresponding to segment named ', customLengthsDescription{2}{seg}, ', in scaling algorithm']);
    end
    segmentTypeLength(segmentNameInScalingAlgo) = customLengthsDescription{1}(seg);
end

out_ScalingAlgorithm.segmentTypeNames       = JensenScaling.segment_type_names;
out_ScalingAlgorithm.segmentTypeLength      = segmentTypeLength;
out_ScalingAlgorithm.segmentTypeMass        = (JensenScaling.mass_ratios(:,1)*inParam_PersonInfo.age + JensenScaling.mass_ratios(:,2))*inParam_PersonInfo.weight;
for segmentID = 1:nSegments
    out_ScalingAlgorithm.segmentTypeCom(segmentID,:)        = [0.0 0.0 (JensenScaling.com_ratios(segmentID,1)*inParam_PersonInfo.age + JensenScaling.com_ratios(segmentID,2)).*out_ScalingAlgorithm.segmentTypeLength(segmentID)];
    out_ScalingAlgorithm.segmentTypeInertia(segmentID,:,:)  = calc_inertia_moments (JensenScaling.rGyration_ratios(segmentID,:), ...
        JensenScaling.inertia_ratios(segmentID,:), ...
        out_ScalingAlgorithm.segmentTypeCom(segmentID,:), ...
        out_ScalingAlgorithm.segmentTypeLength(segmentID), ...
        out_ScalingAlgorithm.segmentTypeMass(segmentID), inParam_PersonInfo);
end
out_ScalingAlgorithm = fnc_getSegmentTypeMeshes (out_ScalingAlgorithm, inParam_PersonInfo, meshOption);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function inertia = calc_inertia_moments (radii_ratio, inertia_ratio, com, length, mass, info)
    r_gyr = radii_ratio(1)*info.age + radii_ratio(2)*length;
    tmp = mass*(r_gyr.^2 - com(3).^2).*inertia_ratio;
    inertia = [tmp(1) 0.0 0.0; 0.0 tmp(2) 0.0; 0.0 0.0 tmp(3)];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ScalingAlgorithm = fnc_getSegmentTypeMeshes (ScalingAlgorithm, inParam_PersonInfo, meshOption)

if strcmp(meshOption,'default') 
    meshString = '';
elseif strcmp(meshOption,'human') 
    meshString = 'MK_';
else
    error ('Only default or human meshes available for now');
end

% Segment_Torso
ScalingAlgorithm.mesh_dimension(1,:)  = [0.5*inParam_PersonInfo.pelvisWidth, 1.0*inParam_PersonInfo.pelvisWidth, ScalingAlgorithm.segmentTypeLength(1)];
ScalingAlgorithm.mesh_center(1,:)     = [0, 0, ScalingAlgorithm.segmentTypeLength(1)*0.5];
ScalingAlgorithm.mesh_obj{1}          = [meshString,'torso.obj'];
ScalingAlgorithm.mesh_color(1,:)      = [0.2, 0.7, 0.3];

% Segment_Thigh_R
ScalingAlgorithm.mesh_dimension(2,:)  = [0.3, 0.3, 1.0]*ScalingAlgorithm.segmentTypeLength(2);
ScalingAlgorithm.mesh_center(2,:)     = [0, 0, -0.5]*ScalingAlgorithm.segmentTypeLength(2);
ScalingAlgorithm.mesh_obj{2}          = [meshString,'thighR.obj'];
ScalingAlgorithm.mesh_color(2,:)      = [0.2, 0.7, 0.3];

% Segment_Thigh_L
ScalingAlgorithm.mesh_dimension(3,:)  = [0.3, 0.3, 1.0]*ScalingAlgorithm.segmentTypeLength(3);
ScalingAlgorithm.mesh_center(3,:)     = [0, 0, -0.5]*ScalingAlgorithm.segmentTypeLength(3);
ScalingAlgorithm.mesh_obj{3}          = [meshString,'thighL.obj'];
ScalingAlgorithm.mesh_color(3,:)      = [0.2, 0.7, 0.3];

% Segment_Shank_R
ScalingAlgorithm.mesh_dimension(4,:)  = [0.25, 0.25, 1.0]*ScalingAlgorithm.segmentTypeLength(4);
ScalingAlgorithm.mesh_center(4,:)     = [0, 0, -0.5]*ScalingAlgorithm.segmentTypeLength(4);
ScalingAlgorithm.mesh_obj{4}          = [meshString,'shankR.obj'];
ScalingAlgorithm.mesh_color(4,:)      = [0.2, 0.7, 0.3];

% Segment_Shank_L
ScalingAlgorithm.mesh_dimension(5,:)  = [0.25, 0.25, 1.0]*ScalingAlgorithm.segmentTypeLength(5);
ScalingAlgorithm.mesh_center(5,:)     = [0, 0, -0.5]*ScalingAlgorithm.segmentTypeLength(5);
ScalingAlgorithm.mesh_obj{5}          = [meshString,'shankL.obj'];
ScalingAlgorithm.mesh_color(5,:)      = [0.2, 0.7, 0.3];

% Segment_Foot_R
ScalingAlgorithm.mesh_dimension(6,:)  = [1.0, 0.4, 0.3]*ScalingAlgorithm.segmentTypeLength(6);
ScalingAlgorithm.mesh_center(6,:)     = [0.3, 0, -0.15]*ScalingAlgorithm.segmentTypeLength(6);
ScalingAlgorithm.mesh_obj{6}          = [meshString,'footR.obj'];
ScalingAlgorithm.mesh_color(6,:)      = [0.2, 0.7, 0.3];

% Segment_Foot_L
ScalingAlgorithm.mesh_dimension(7,:)  = [1.0, 0.4, 0.3]*ScalingAlgorithm.segmentTypeLength(7);
ScalingAlgorithm.mesh_center(7,:)     = [0.3, 0, -0.15]*ScalingAlgorithm.segmentTypeLength(7);
ScalingAlgorithm.mesh_obj{7}          = [meshString,'footL.obj'];
ScalingAlgorithm.mesh_color(7,:)      = [0.2, 0.7, 0.3];

% Segment_Head
ScalingAlgorithm.mesh_dimension(8,:)  = [0.65, 0.77, 1.0]*ScalingAlgorithm.segmentTypeLength(8);
ScalingAlgorithm.mesh_center(8,:)     = [0.0, 0.0, 0.5]*ScalingAlgorithm.segmentTypeLength(8);
ScalingAlgorithm.mesh_obj{8}          = [meshString,'head.obj'];
ScalingAlgorithm.mesh_color(8,:)      = [0.2, 0.7, 0.3];

% Segment_UpperArm_R
ScalingAlgorithm.mesh_dimension(9,:)  = [0.3, 0.3, 1.0]*ScalingAlgorithm.segmentTypeLength(9);
ScalingAlgorithm.mesh_center(9,:)     = [0.0, 0.0, -0.5]*ScalingAlgorithm.segmentTypeLength(9);
ScalingAlgorithm.mesh_obj{9}          = [meshString,'upperArmR.obj'];
ScalingAlgorithm.mesh_color(9,:)      = [0.2, 0.7, 0.3];

% Segment_UpperArm_L
ScalingAlgorithm.mesh_dimension(10,:)  = [0.3, 0.3, 1.0]*ScalingAlgorithm.segmentTypeLength(10);
ScalingAlgorithm.mesh_center(10,:)     = [0.0, 0.0, -0.5]*ScalingAlgorithm.segmentTypeLength(10);
ScalingAlgorithm.mesh_obj{10}          = [meshString,'upperArmL.obj'];
ScalingAlgorithm.mesh_color(10,:)      = [0.2, 0.7, 0.3];

% Segment_LowerArm_R
ScalingAlgorithm.mesh_dimension(11,:)  = [0.3, 0.3, 1.0]*ScalingAlgorithm.segmentTypeLength(11);
ScalingAlgorithm.mesh_center(11,:)     = [0.0, 0.0, -0.5]*ScalingAlgorithm.segmentTypeLength(11);
ScalingAlgorithm.mesh_obj{11}          = [meshString,'lowerArmR.obj'];
ScalingAlgorithm.mesh_color(11,:)      = [0.2, 0.7, 0.3];

% Segment_LowerArm_L
ScalingAlgorithm.mesh_dimension(12,:)  = [0.3, 0.3, 1.0]*ScalingAlgorithm.segmentTypeLength(12);
ScalingAlgorithm.mesh_center(12,:)     = [0.0, 0.0, -0.5]*ScalingAlgorithm.segmentTypeLength(12);
ScalingAlgorithm.mesh_obj{12}          = [meshString,'lowerArmL.obj'];
ScalingAlgorithm.mesh_color(12,:)      = [0.2, 0.7, 0.3];

% Segment_Hand_R
ScalingAlgorithm.mesh_dimension(13,:)  = [0.75, 0.4, 0.8]*ScalingAlgorithm.segmentTypeLength(13);
ScalingAlgorithm.mesh_center(13,:)     = [0.0, 0.0, -0.4]*ScalingAlgorithm.segmentTypeLength(13);
ScalingAlgorithm.mesh_obj{13}          = [meshString,'handR.obj'];
ScalingAlgorithm.mesh_color(13,:)      = [0.2, 0.7, 0.3];

% Segment_Hand_L
ScalingAlgorithm.mesh_dimension(14,:)  = [0.75, 0.4, 0.8]*ScalingAlgorithm.segmentTypeLength(14);
ScalingAlgorithm.mesh_center(14,:)     = [0.0, 0.0, -0.4]*ScalingAlgorithm.segmentTypeLength(14);
ScalingAlgorithm.mesh_obj{14}          = [meshString,'handL.obj'];
ScalingAlgorithm.mesh_color(14,:)      = [0.2, 0.7, 0.3];
end