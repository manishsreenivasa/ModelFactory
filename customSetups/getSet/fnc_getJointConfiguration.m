%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function [joint, joint_r, joint_E] = fnc_getJointConfiguration (model,...
    modelJoint_typeName, modelSegment_typeName, inParam_PersonInfo, ...
    segmentID)

% Load model dictionary
dict_definitions;

jointIDXMatch = strmatch (modelJoint_typeName, {JointTypesDictionary(:).name}, 'exact');
joint = JointTypesDictionary(jointIDXMatch).axes;

parentID = model{segmentID}.parentID;

switch modelSegment_typeName
    case {'Segment_Pelvis','Segment_Pelvis_Sagittal','Segment_Thigh_Sagittal'}
        joint_r = [0 0 0];
    case 'Segment_Trunk'
        joint_r = [0 0 model{parentID}.length];
    case 'Segment_Torso'
        joint_r = [0 0 0];
    case 'Segment_Thigh_R'
        joint_r = [0 -inParam_PersonInfo.hipCenterWidth/2 0];
    case 'Segment_Thigh_L'
        joint_r = [0 inParam_PersonInfo.hipCenterWidth/2 0];
    case 'Segment_UpperArm_R'
        joint_r = [0 -0.5*inParam_PersonInfo.shoulderCenterWidth model{parentID}.length-inParam_PersonInfo.shoulderNeckZOffset];
    case 'Segment_UpperArm_Sagittal'
        joint_r = [0 0 model{parentID}.length-inParam_PersonInfo.shoulderNeckZOffset];
    case 'Segment_UpperArm_L'
        joint_r = [0  0.5*inParam_PersonInfo.shoulderCenterWidth model{parentID}.length-inParam_PersonInfo.shoulderNeckZOffset];
    case {'Segment_Head','Segment_MiddleTrunk','Segment_UpperTrunk',...
            'Segment_Head_Sagittal','Segment_MiddleTrunk_Sagittal','Segment_UpperTrunk_Sagittal'}
        joint_r = [0 0 model{parentID}.length];
    case {'Segment_LowerArm_R','Segment_LowerArm_L',...
            'Segment_Hand_R','Segment_Hand_L',...
            'Segment_Shank_R','Segment_Shank_L',...
            'Segment_Shank_Sagittal',...
            'Segment_LowerArm_Sagittal','Segment_Hand_Sagittal'}
        joint_r = [0 0 -model{parentID}.length];
    case {'Segment_Foot_R','Segment_Foot_L','Segment_Foot_Sagittal'}
        joint_r = [0 0 -model{parentID}.length];
    otherwise
        error (['Missing joint configuration for segment type, ', modelSegment_typeName]);
end
joint_E = eye(3);