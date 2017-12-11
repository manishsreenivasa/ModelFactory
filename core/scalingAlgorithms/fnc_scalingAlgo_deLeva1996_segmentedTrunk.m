%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%
% Values from De Leva 1996 paper
% Paolo de Leva (1996) "Adjustments to Zatsiorsky-Seluyanov's segment inertia
% parameters", Journal of Biomechanics, 29 (9), pp. 1223-1230

function out_ScalingAlgorithm = fnc_scalingAlgo_deLeva1996_segmentedTrunk (...
    humanModelDescription, inParam_PersonInfo, customLengthsDescription, meshOption)

nSegments = 16;

fnc_scalingAlgo_deLeva1996_segmentedTrunk.female.segment_type_names =  {
    'Segment_Pelvis',   % OMPH - MIDH
    'Segment_Thigh_R',  % HJC - KJC
    'Segment_Thigh_L',  % HJC - KJC
    'Segment_Shank_R',  % KJC - AJC
    'Segment_Shank_L',  % KJC - AJC
    'Segment_Foot_R',   % Heel - TTIP
    'Segment_Foot_L',   % Heel - TTIP
    'Segment_MiddleTrunk', % XYPH - OMPH
    'Segment_UpperTrunk',  % CERV - XYPH
    'Segment_UpperArm_R',  % SJC - EJC
    'Segment_UpperArm_L',  % SJC - EJC
    'Segment_LowerArm_R',  % EJC -WJC
    'Segment_LowerArm_L',  % EJC - WJC
    'Segment_Hand_R',      % WJC - DAC3
    'Segment_Hand_L',      % WJC - DAC3
    'Segment_Head'};       % VERT - CERV
fnc_scalingAlgo_deLeva1996_segmentedTrunk.male.segment_type_names =...
    fnc_scalingAlgo_deLeva1996_segmentedTrunk.female.segment_type_names;

fnc_scalingAlgo_deLeva1996_segmentedTrunk.female.length_ratios = [
    0.1815 / 1.735  % Pelvis
    0.3685 / 1.735  % Thigh
    0.3685 / 1.735  % Thigh
    0.4386 / 1.735  % Shank
    0.4386 / 1.735  % Shank
    0.2283 / 1.735  % Foot
    0.2283 / 1.735  % Foot
    0.2053 / 1.735  % Middle Trunk
    0.2280 / 1.735  % Upper Trunk
    0.2751 / 1.735  % Upper Arm
    0.2751 / 1.735  % Upper Arm
    0.2643 / 1.735  % Lower Arm
    0.2643 / 1.735  % Lower Arm
    0.1701 / 1.735  % Hand
    0.1701 / 1.735  % Hand
    0.2437 / 1.735  % Head
    ];

fnc_scalingAlgo_deLeva1996_segmentedTrunk.male.length_ratios = [
    0.1457 / 1.741  % Pelvis
    0.4222 / 1.741  % Thigh
    0.4222 / 1.741  % Thigh
    0.4403 / 1.741  % Shank
    0.4403 / 1.741  % Shank
    0.2581 / 1.741  % Foot
    0.2581 / 1.741  % Foot
    0.2155 / 1.741  % Middle Trunk
    0.2421 / 1.741  % Upper Trunk
    0.2817 / 1.741  % Upper Arm
    0.2817 / 1.741  % Upper Arm
    0.2689 / 1.741  % Lower Arm
    0.2689 / 1.741  % Lower Arm
    0.1879 / 1.741  % Hand
    0.1879 / 1.741  % Hand
    0.2429 / 1.741  % Head
    ];

fnc_scalingAlgo_deLeva1996_segmentedTrunk.female.mass_ratios = [
    0.1247  % Pelvis
    0.1478  % Thigh
    0.1478  % Thigh
    0.0481  % Shank
    0.0481  % Shank
    0.0129  % Foot
    0.0129  % Foot
    0.1465  % Middle Trunk
    0.1545  % Upper Trunk
    0.0255  % Upper Arm
    0.0255  % Upper Arm
    0.0138  % Lower Arm
    0.0138  % Lower Arm
    0.0056  % Hand
    0.0056  % Hand
    0.0668  % Head
    ];

fnc_scalingAlgo_deLeva1996_segmentedTrunk.male.mass_ratios = [
    0.1117  % Pelvis
    0.1416  % Thigh
    0.1416  % Thigh
    0.0433  % Shank
    0.0433  % Shank
    0.0137  % Foot
    0.0137  % Foot
    0.1633  % Middle Trunk
    0.1596  % Upper Trunk
    0.0271  % Upper Arm
    0.0271  % Upper Arm
    0.0162  % Lower Arm
    0.0162  % Lower Arm
    0.0061  % Hand
    0.0061  % Hand
    0.0694  % Head
    ];

fnc_scalingAlgo_deLeva1996_segmentedTrunk.female.com_ratios = [
    0., 0.,  1-0.4920;  % Pelvis, 1-deLeva value, as pelvis joint center is differently described
    0., 0., -0.3612;    % Thigh, -1*deLeva value, as hip joint center is at top of segment
    0., 0., -0.3612;    % Thigh, -1*deLeva value, as hip joint center is at top of segment
    0., 0., -0.4352;    % Shank, -1*deLeva value, as knee joint center is at top of segment
    0., 0., -0.4352;    % Shank, -1*deLeva value, as knee joint center is at top of segment
    0.4014,  0., 0.;    % Foot, positive x direction wrt heel center
    0.4014,  0., 0.;    % Foot, positive x direction wrt heel center
    0., 0.,  1-0.4512;  % Middle Trunk, 1-deLeva value, as middle trunk joint center is differently described
    0., 0.,  1-0.5050;  % Upper Trunk, 1-deLeva value, as upper trunk joint center is differently described
    0., 0., -0.5754;    % Upper Arm, -1*deLeva value, as shoulder joint center is at top of segment
    0., 0., -0.5754;    % Upper Arm, -1*deLeva value, as shoulder joint center is at top of segment
    0., 0., -0.4559;    % Lower Arm, -1*deLeva value, as elbow joint center is at top of segment
    0., 0., -0.4559;    % Lower Arm, -1*deLeva value, as elbow joint center is at top of segment
    0., 0., -0.3427;    % Hand, -1*deLeva value, as wrist joint center is at top of segment
    0., 0., -0.3427;    % Hand, -1*deLeva value, as wrist joint center is at top of segment
    0., 0.,  1-0.4841;  % Head, 1-deLeva value, as head/neck joint center is differently described
    ];

fnc_scalingAlgo_deLeva1996_segmentedTrunk.male.com_ratios = [
    0., 0.,  1-0.6115;  % Pelvis, 1-deLeva value, as pelvis joint center is differently described
    0., 0., -0.4095;    % Thigh, -1*deLeva value, as hip joint center is at top of segment
    0., 0., -0.4095;    % Thigh, -1*deLeva value, as hip joint center is at top of segment
    0., 0., -0.4395;    % Shank, -1*deLeva value, as knee joint center is at top of segment
    0., 0., -0.4395;    % Shank, -1*deLeva value, as knee joint center is at top of segment
    0.4415,  0., 0.;    % Foot, positive x direction wrt heel center
    0.4415,  0., 0.;    % Foot, positive x direction wrt heel center
    0., 0.,  1-0.4502;  % Middle Trunk, 1-deLeva value, as middle trunk joint center is differently described
    0., 0.,  1-0.5066;  % Upper Trunk, 1-deLeva value, as upper trunk joint center is differently described
    0., 0., -0.5772;    % Upper Arm, -1*deLeva value, as shoulder joint center is at top of segment
    0., 0., -0.5772;    % Upper Arm, -1*deLeva value, as shoulder joint center is at top of segment
    0., 0., -0.4574;    % Lower Arm, -1*deLeva value, as elbow joint center is at top of segment
    0., 0., -0.4574;    % Lower Arm, -1*deLeva value, as elbow joint center is at top of segment
    0., 0., -0.3624;    % Hand, -1*deLeva value, as wrist joint center is at top of segment
    0., 0., -0.3624;    % Hand, -1*deLeva value, as wrist joint center is at top of segment
    0., 0.,  1-0.5002;  % Head, 1-deLeva value, as head/neck joint center is differently described
    ];

fnc_scalingAlgo_deLeva1996_segmentedTrunk.female.rGyration_ratios = [
    0.433, 0.402, 0.444; % Pelvis
    0.369, 0.364, 0.162; % Thigh
    0.369, 0.364, 0.162; % Thigh
    0.267, 0.263, 0.092; % Shank
    0.267, 0.263, 0.092; % Shank
    0.299, 0.279, 0.139; % Foot
    0.299, 0.279, 0.139; % Foot
    0.433, 0.354, 0.415; % Middle Trunk
    0.466, 0.314, 0.449; % Upper Trunk
    0.278, 0.260, 0.148; % Upper Arm
    0.278, 0.260, 0.148; % Upper Arm
    0.261, 0.257, 0.094; % Lower Arm
    0.261, 0.257, 0.094; % Lower Arm
    0.244, 0.208, 0.154; % Hand
    0.244, 0.208, 0.154; % Hand
    0.271, 0.295, 0.261; % Head
    ];

fnc_scalingAlgo_deLeva1996_segmentedTrunk.male.rGyration_ratios = [
    0.615, 0.551, 0.587; % Pelvis
    0.329, 0.329, 0.149; % Thigh
    0.329, 0.329, 0.149; % Thigh
    0.251, 0.246, 0.102; % Shank
    0.251, 0.246, 0.102; % Shank
    0.257, 0.245, 0.124; % Foot
    0.257, 0.245, 0.124; % Foot
    0.482, 0.383, 0.468; % Middle Trunk
    0.505, 0.320, 0.465; % Upper Trunk
    0.285, 0.269, 0.158; % Upper Arm
    0.285, 0.269, 0.158; % Upper Arm
    0.276, 0.265, 0.121; % Lower Arm
    0.276, 0.265, 0.121; % Lower Arm
    0.288, 0.235, 0.184; % Hand
    0.288, 0.235, 0.184; % Hand
    0.303, 0.315, 0.261; % Head
    ];

if inParam_PersonInfo.gender == 0
    scaling_in_use = fnc_scalingAlgo_deLeva1996_segmentedTrunk.female;
else
    scaling_in_use = fnc_scalingAlgo_deLeva1996_segmentedTrunk.male;
end

default_segmentTypeLength = scaling_in_use.length_ratios.*inParam_PersonInfo.height;
default_segmentTypeMass   = scaling_in_use.mass_ratios.*inParam_PersonInfo.weight;

if isempty(customLengthsDescription)
    out_ScalingAlgorithm.segmentTypeLength = default_segmentTypeLength;
    out_ScalingAlgorithm.segmentTypeMass = default_segmentTypeMass;
else
    if length (customLengthsDescription{1}) ~= length(humanModelDescription{1})
        disp (['Wrong number of custom segment lengths, ', int2str(length (customLengthsDescription{1})), ' provided, ', int2str(length(humanModelDescription{1})), ' required.']);
        disp ('Hint: All custom segment lengths are used to adjust model masses and inertias.');
        error ('Correct the custom segment length file, or use default lengths');
    end
    custom_segmentTypeLength = default_segmentTypeLength;
    for seg = 1:length(humanModelDescription{1})
        segmentNameInModelDescription = find(strcmp (customLengthsDescription{2}{seg},humanModelDescription{1}) == 1);
        if isempty (segmentNameInModelDescription)
            error(['Unable to find segment named ', customLengthsDescription{2}{seg}, ' in human model description']);
        end
        segmentNameInScalingAlgo =  find(strcmp (humanModelDescription{2}{segmentNameInModelDescription},scaling_in_use.segment_type_names) == 1);
        if isempty (segmentNameInScalingAlgo)
            error(['Unable to find segment type ', humanModelDescription{2}{segmentNameInModelDescription}...
                , ', corresponding to segment named ', customLengthsDescription{2}{seg}, ', in scaling algorithm']);
        end
        custom_segmentTypeLength(segmentNameInScalingAlgo) = customLengthsDescription{1}(seg);
    end
    disp (' - Using custom segment length ratios.');
    disp ('  -- Note that segment masses and inertia will also be linearly adjusted.');
    
    unadjustedTotalMass = sum(default_segmentTypeMass.*(custom_segmentTypeLength./default_segmentTypeLength));
    factor_adjustToTotalMass = sum(default_segmentTypeMass)/unadjustedTotalMass;
    custom_segmentTypeLength_totalMassAdjusted = custom_segmentTypeLength*factor_adjustToTotalMass;    
    out_ScalingAlgorithm.segmentTypeMass   = default_segmentTypeMass.*(custom_segmentTypeLength_totalMassAdjusted./default_segmentTypeLength);
    out_ScalingAlgorithm.segmentTypeLength = custom_segmentTypeLength;
end

out_ScalingAlgorithm.segmentTypeNames = scaling_in_use.segment_type_names;
out_ScalingAlgorithm = fnc_getSegmentTypeMeshes (out_ScalingAlgorithm, inParam_PersonInfo, meshOption);

for segmentID = 1:nSegments
    if strcmp(scaling_in_use.segment_type_names(segmentID) , 'Segment_Foot_R' ) ...
            || strcmp(scaling_in_use.segment_type_names(segmentID) , 'Segment_Foot_L' )
        % Two things are done differently for the foot
        % 1) We update foot CoM tranverse plane position (X axis) by subtracting
        %    the heel to ankle offset that was entered by the user
        % 2) We update the foot CoM frontal plane position (Z axis) by
        %    using the vertical center of the foot (deLeva does not provide
        %    foot CoM frontal plane values)
        out_ScalingAlgorithm.segmentTypeCom(segmentID,:) = ...
            scaling_in_use.com_ratios(segmentID,:).*out_ScalingAlgorithm.segmentTypeLength(segmentID) ...
            - [inParam_PersonInfo.heelAnkleXOffset 0 inParam_PersonInfo.heelAnkleZOffset/2];
    else
        out_ScalingAlgorithm.segmentTypeCom(segmentID,:)        = ...
            scaling_in_use.com_ratios(segmentID,:).*out_ScalingAlgorithm.segmentTypeLength(segmentID);
    end
    out_ScalingAlgorithm.segmentTypeInertia(segmentID,:,:)  = ...
        calc_inertia_moments (scaling_in_use.rGyration_ratios(segmentID,:), ...
        out_ScalingAlgorithm.segmentTypeLength(segmentID), ...
        out_ScalingAlgorithm.segmentTypeMass(segmentID));
end
end

function inertia = calc_inertia_moments (radii, length, mass)
inertia = [ (radii(1)*length)^2*mass,   0.,                       0.;
    0.,                       (radii(2)*length)^2*mass,   0.;
    0.,                       0.,                       (radii(3)*length)^2*mass];
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

% Segment_Pelvis
ScalingAlgorithm.mesh_dimension(1,:)  = [1.0*inParam_PersonInfo.pelvisWidth, 1.25*inParam_PersonInfo.pelvisWidth, 1.5*ScalingAlgorithm.segmentTypeLength(1)];
ScalingAlgorithm.mesh_center(1,:)     = [0, 0, ScalingAlgorithm.segmentTypeLength(1)*0.25];
ScalingAlgorithm.mesh_obj{1}          = [meshString,'pelvis.obj'];
ScalingAlgorithm.mesh_color(1,:)      = [0.2, 0.7, 0.3];

% Segment_Thigh_R
ScalingAlgorithm.mesh_dimension(2,:)  = [0.5, 0.4, 1.2]*ScalingAlgorithm.segmentTypeLength(2);
ScalingAlgorithm.mesh_center(2,:)     = [0, 0, -0.5]*ScalingAlgorithm.segmentTypeLength(2);
ScalingAlgorithm.mesh_obj{2}          = [meshString,'thighR.obj'];
ScalingAlgorithm.mesh_color(2,:)      = [0.2, 0.7, 0.3];

% Segment_Thigh_L
ScalingAlgorithm.mesh_dimension(3,:)  = [0.5, 0.4, 1.2]*ScalingAlgorithm.segmentTypeLength(3);
ScalingAlgorithm.mesh_center(3,:)     = [0, 0, -0.5]*ScalingAlgorithm.segmentTypeLength(3);
ScalingAlgorithm.mesh_obj{3}          = [meshString,'thighL.obj'];
ScalingAlgorithm.mesh_color(3,:)      = [0.2, 0.7, 0.3];

% Segment_Shank_R
ScalingAlgorithm.mesh_dimension(4,:)  = [0.3, 0.3, 1.2]*ScalingAlgorithm.segmentTypeLength(4);
ScalingAlgorithm.mesh_center(4,:)     = [0, 0, -0.5]*ScalingAlgorithm.segmentTypeLength(4);
ScalingAlgorithm.mesh_obj{4}          = [meshString,'shankR.obj'];
ScalingAlgorithm.mesh_color(4,:)      = [0.2, 0.7, 0.3];

% Segment_Shank_L
ScalingAlgorithm.mesh_dimension(5,:)  = [0.3, 0.3, 1.2]*ScalingAlgorithm.segmentTypeLength(5);
ScalingAlgorithm.mesh_center(5,:)     = [0, 0, -0.5]*ScalingAlgorithm.segmentTypeLength(5);
ScalingAlgorithm.mesh_obj{5}          = [meshString,'shankL.obj'];
ScalingAlgorithm.mesh_color(5,:)      = [0.2, 0.7, 0.3];

if strcmp(meshOption,'default')
    meshCenterOffset = 0.0;
else
    meshCenterOffset = 0.1;
end

% Segment_Foot_R
ScalingAlgorithm.mesh_dimension(6,:)  = [ScalingAlgorithm.segmentTypeLength(6),
    inParam_PersonInfo.footWidth,
    inParam_PersonInfo.heelAnkleZOffset];
ScalingAlgorithm.mesh_center(6,:)     = [ScalingAlgorithm.segmentTypeLength(6)/2-inParam_PersonInfo.heelAnkleXOffset+meshCenterOffset*ScalingAlgorithm.segmentTypeLength(6),
    0,
    -inParam_PersonInfo.heelAnkleZOffset/2];
ScalingAlgorithm.mesh_obj{6}          = [meshString,'footR.obj'];
ScalingAlgorithm.mesh_color(6,:)      = [0.2, 0.7, 0.3];

% Segment_Foot_L
ScalingAlgorithm.mesh_dimension(7,:)  = [ScalingAlgorithm.segmentTypeLength(7),
    inParam_PersonInfo.footWidth,
    inParam_PersonInfo.heelAnkleZOffset];
ScalingAlgorithm.mesh_center(7,:)     = [ScalingAlgorithm.segmentTypeLength(7)/2-inParam_PersonInfo.heelAnkleXOffset+meshCenterOffset*ScalingAlgorithm.segmentTypeLength(7),
    0,
    -inParam_PersonInfo.heelAnkleZOffset/2];
ScalingAlgorithm.mesh_obj{7}          = [meshString,'footL.obj'];
ScalingAlgorithm.mesh_color(7,:)      = [0.2, 0.7, 0.3];

% Segment_MiddleTrunk
ScalingAlgorithm.mesh_dimension(8,:)  = [0.9*inParam_PersonInfo.pelvisWidth, 1.1*inParam_PersonInfo.pelvisWidth, 1.5*ScalingAlgorithm.segmentTypeLength(8)];
ScalingAlgorithm.mesh_center(8,:)     = [0.0, 0, 0.25]*ScalingAlgorithm.segmentTypeLength(8);
ScalingAlgorithm.mesh_obj{8}          = [meshString,'middleTrunk.obj'];
ScalingAlgorithm.mesh_color(8,:)      = [0.2, 0.7, 0.3];

% Segment_UpperTrunk
if strcmp(meshOption,'default')
    scalemesh = 1.05;
else
    scalemesh = 1.3;
end
ScalingAlgorithm.mesh_dimension(9,:)  = [scalemesh*0.5*inParam_PersonInfo.shoulderCenterWidth,
    1.0*inParam_PersonInfo.shoulderCenterWidth,
    scalemesh*ScalingAlgorithm.segmentTypeLength(9)];
ScalingAlgorithm.mesh_center(9,:)     = [0.0, 0, 0.4]*ScalingAlgorithm.segmentTypeLength(9);
ScalingAlgorithm.mesh_obj{9}          = [meshString,'upperTrunk.obj'];
ScalingAlgorithm.mesh_color(9,:)      = [0.2, 0.7, 0.3];

% Segment_UpperArmR
if strcmp(meshOption,'default')
    meshCenter = -0.5;
    meshScale = 0.5;
    meshCenterY = 0.0;
    meshCenterX = 0.0;
elseif strcmp(meshOption,'human')
    meshCenter = -0.6;
    meshCenterY = 0.05;
    meshScale = 0.5;
    meshCenterX = 0.25;
else
    error('Unknown mesh type option');
end

% Segment_UpperArm_R
ScalingAlgorithm.mesh_dimension(10,:)  = [meshScale, 0.4, 1.1]*ScalingAlgorithm.segmentTypeLength(10);
ScalingAlgorithm.mesh_center(10,:)     = [0.0, meshCenterY, meshCenter]*ScalingAlgorithm.segmentTypeLength(10);
ScalingAlgorithm.mesh_obj{10}          = [meshString,'upperArmR.obj'];
ScalingAlgorithm.mesh_color(10,:)      = [0.2, 0.7, 0.3];

% Segment_UpperArm_L
ScalingAlgorithm.mesh_dimension(11,:)  = [meshScale, 0.4, 1.1]*ScalingAlgorithm.segmentTypeLength(11);
ScalingAlgorithm.mesh_center(11,:)     = [0.0, -meshCenterY, meshCenter]*ScalingAlgorithm.segmentTypeLength(11);
ScalingAlgorithm.mesh_obj{11}          = [meshString,'upperArmL.obj'];
ScalingAlgorithm.mesh_color(11,:)      = [0.2, 0.7, 0.3];

% Segment_LowerArm_R
ScalingAlgorithm.mesh_dimension(12,:)  = [0.4, 0.3, 1.1]*ScalingAlgorithm.segmentTypeLength(12);
ScalingAlgorithm.mesh_center(12,:)     = [0.0, 0.0, meshCenter]*ScalingAlgorithm.segmentTypeLength(12);
ScalingAlgorithm.mesh_obj{12}          = [meshString,'lowerArmR.obj'];
ScalingAlgorithm.mesh_color(12,:)      = [0.2, 0.7, 0.3];

% Segment_LowerArm_L
ScalingAlgorithm.mesh_dimension(13,:)  = [0.4, 0.3, 1.1]*ScalingAlgorithm.segmentTypeLength(13);
ScalingAlgorithm.mesh_center(13,:)     = [0.0, 0.0, meshCenter]*ScalingAlgorithm.segmentTypeLength(13);
ScalingAlgorithm.mesh_obj{13}          = [meshString,'lowerArmL.obj'];
ScalingAlgorithm.mesh_color(13,:)      = [0.2, 0.7, 0.3];

% Segment_Hand_R
ScalingAlgorithm.mesh_dimension(14,:)  = [0.7, 0.3, 1.0]*ScalingAlgorithm.segmentTypeLength(14);
ScalingAlgorithm.mesh_center(14,:)     = [meshCenterX, 0.0, meshCenter]*ScalingAlgorithm.segmentTypeLength(14);
ScalingAlgorithm.mesh_obj{14}          = [meshString,'handR.obj'];
ScalingAlgorithm.mesh_color(14,:)      = [0.2, 0.7, 0.3];

% Segment_Hand_L
ScalingAlgorithm.mesh_dimension(15,:)  = [0.7, 0.3, 1.0]*ScalingAlgorithm.segmentTypeLength(15);
ScalingAlgorithm.mesh_center(15,:)     = [meshCenterX, 0.0, meshCenter]*ScalingAlgorithm.segmentTypeLength(15);
ScalingAlgorithm.mesh_obj{15}          = [meshString,'handL.obj'];
ScalingAlgorithm.mesh_color(15,:)      = [0.2, 0.7, 0.3];

% Segment_Head
if strcmp(meshOption,'default')
    scalemesh = 1.05;
    meshCenter = 0.0;
else
    scalemesh = 1.3;
    meshCenter = 0.05;
end
ScalingAlgorithm.mesh_dimension(16,:)  = [0.8, 0.8, scalemesh]*ScalingAlgorithm.segmentTypeLength(16);
ScalingAlgorithm.mesh_center(16,:)     = [meshCenter, 0.0, 0.4]*ScalingAlgorithm.segmentTypeLength(16);
ScalingAlgorithm.mesh_obj{16}          = [meshString,'head.obj'];
ScalingAlgorithm.mesh_color(16,:)      = [0.2, 0.7, 0.3];
end