%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
% dict_point_sets

if exist('PointsTypesDictionary','var')
    offsetID = length(PointsTypesDictionary);
else
    offsetID = 0;
end
PointsTypesDictionary(offsetID+1).name = 'Points_Pelvis_Sagittal';
PointsTypesDictionary(offsetID+1).points.name = {'Pelvis_Sagittal'};
PointsTypesDictionary(offsetID+1).points.rel_position_to_joint_center = [-0.25 0.0 0.5];

PointsTypesDictionary(offsetID+2).name = 'Points_Thigh_Sagittal';
PointsTypesDictionary(offsetID+2).points.name = {'Thigh_Sagittal'};
PointsTypesDictionary(offsetID+2).points.rel_position_to_joint_center = [0.125 0.0 -0.85];

PointsTypesDictionary(offsetID+3).name = 'Points_UpperTrunk_Sagittal';
PointsTypesDictionary(offsetID+3).points.name = {'UpperTrunk_Sagittal'};
PointsTypesDictionary(offsetID+3).points.rel_position_to_joint_center = [-0.1 0.0 0.4];

PointsTypesDictionary(offsetID+4).name = 'Points_Foot_Sagittal';
PointsTypesDictionary(offsetID+4).customOffsetFoot = 1;
PointsTypesDictionary(offsetID+4).points.name = {'Heel_Sagittal','Toe_Sagittal'};
PointsTypesDictionary(offsetID+4).points.rel_functional_distance = [0.0 0.0 -1.0; 0.75 0.0 -1.0];

PointsTypesDictionary(offsetID+5).name = 'Points_Hand_Sagittal';
PointsTypesDictionary(offsetID+5).points.name = {'ProximalMetacarpal_Sagittal','DistalMetacarpal_Sagittal'};
PointsTypesDictionary(offsetID+5).points.rel_position_to_joint_center = [0.0 0.0 -0.2; 0.0 0.0 -0.7];

PointsTypesDictionary(offsetID+6).name = 'Points_Exo_PelvisModule_Sagittal';
PointsTypesDictionary(offsetID+6).points.name = {'Exo_Pelvis_Sagittal'};
PointsTypesDictionary(offsetID+6).points.rel_position_to_joint_center = [-0.5 0.0 0.0];

PointsTypesDictionary(offsetID+7).name = 'Points_Exo_ThighModule_Sagittal';
PointsTypesDictionary(offsetID+7).points.name = {'Exo_Thigh_Sagittal'};
PointsTypesDictionary(offsetID+7).points.rel_position_to_joint_center = [0.5 0.0 0.0];

PointsTypesDictionary(offsetID+8).name = 'Points_Exo_UpperTrunkModule_Sagittal';
PointsTypesDictionary(offsetID+8).points.name = {'Exo_UpperTrunk_Sagittal'};
PointsTypesDictionary(offsetID+8).points.rel_position_to_joint_center = [0.0 0.0 0.0];

PointsTypesDictionary(offsetID+9).name = 'Points_Box_Sagittal';
PointsTypesDictionary(offsetID+9).points.name = {'BoxAttach_Sagittal','BoxBottom_Sagittal'};
PointsTypesDictionary(offsetID+9).points.rel_position_to_joint_center = [0.0 0.0 0.25; 0.0 0.0 -0.5];

PointsTypesDictionary(offsetID+10).name = 'Points_Pelvis_3D';
PointsTypesDictionary(offsetID+10).points.name = {'Pelvis_L','Pelvis_R','Pelvis_Back','Pelvis_Front'};
PointsTypesDictionary(offsetID+10).points.rel_position_to_joint_center = [0.0 1.0 0.7; 0.0 -1.0 0.7; -0.75 0.0 0.7; 0.75 0.0 0.7];

PointsTypesDictionary(offsetID+11).name = 'Points_Thigh_L_3D';
PointsTypesDictionary(offsetID+11).points.name = {'Thigh_L'};
PointsTypesDictionary(offsetID+11).points.rel_position_to_joint_center = [0.2 0. -0.75];

PointsTypesDictionary(offsetID+12).name = 'Points_Thigh_R_3D';
PointsTypesDictionary(offsetID+12).points.name = {'Thigh_R'};
PointsTypesDictionary(offsetID+12).points.rel_position_to_joint_center = [0.2 -0. -0.75];

PointsTypesDictionary(offsetID+13).name = 'Points_UpperTrunk_3D';
PointsTypesDictionary(offsetID+13).points.name = {'UpperTrunk_Front', 'UpperTrunk_Back'};
PointsTypesDictionary(offsetID+13).points.rel_position_to_joint_center = [0.4 0.0 0.3; -0.45 0.0 0.4];

PointsTypesDictionary(offsetID+14).name = 'Points_Foot_R_3D';
PointsTypesDictionary(offsetID+14).customOffsetFoot = 1;
PointsTypesDictionary(offsetID+14).points.name = {'Heel_Medial_R','Heel_Lateral_R','Toe_R'};
PointsTypesDictionary(offsetID+14).points.rel_functional_distance = [0.0 0.5 -1.0; 0.0 -0.5 -1.0; 0.75 0.0 -1.0];

PointsTypesDictionary(offsetID+15).name = 'Points_Foot_L_3D';
PointsTypesDictionary(offsetID+15).customOffsetFoot = 1;
PointsTypesDictionary(offsetID+15).points.name = {'Heel_Medial_L','Heel_Lateral_L','Toe_L'};
PointsTypesDictionary(offsetID+15).points.rel_functional_distance = [0.0 -0.5 -1.0; 0.0 0.5 -1.0; 0.75 0.0 -1.0];

PointsTypesDictionary(offsetID+16).name = 'Points_Hand_R_3D';
PointsTypesDictionary(offsetID+16).points.name = {'ProximalMetacarpal_Medial_R','ProximalMetacarpal_Lateral_R','DistalMetacarpal_Medial_R','DistalMetacarpal_Lateral_R'};
PointsTypesDictionary(offsetID+16).points.rel_position_to_joint_center = [-0.2 0.15 -0.2; 0.2 0.15 -0.2; -0.2 0.15 -0.6; 0.2 0.15 -0.6];

PointsTypesDictionary(offsetID+17).name = 'Points_Hand_L_3D';
PointsTypesDictionary(offsetID+17).points.name = {'ProximalMetacarpal_Medial_L','ProximalMetacarpal_Lateral_L','DistalMetacarpal_Medial_L','DistalMetacarpal_Lateral_L'};
PointsTypesDictionary(offsetID+17).points.rel_position_to_joint_center = [-0.2 -0.15 -0.2; 0.2 -0.15 -0.2; -0.2 -0.15 -0.6; 0.2 -0.15 -0.6];

PointsTypesDictionary(offsetID+18).name = 'Points_Exo_PelvisModule_3D';
PointsTypesDictionary(offsetID+18).points.name = {'ExoPelvis_L','ExoPelvis_R','ExoPelvis_Back'};
PointsTypesDictionary(offsetID+18).points.rel_position_to_joint_center = [0.0 1.0 0.0; 0.0 -1.0 0.0; -0.75 0.0 0.0];

PointsTypesDictionary(offsetID+19).name = 'Points_Exo_ThighModule_L_3D';
PointsTypesDictionary(offsetID+19).points.name = {'ExoThigh_L'};
PointsTypesDictionary(offsetID+19).points.rel_position_to_joint_center = [0. 0. 0.];

PointsTypesDictionary(offsetID+20).name = 'Points_Exo_ThighModule_R_3D';
PointsTypesDictionary(offsetID+20).points.name = {'ExoThigh_R'};
PointsTypesDictionary(offsetID+20).points.rel_position_to_joint_center = [0. -0. 0.];

PointsTypesDictionary(offsetID+21).name = 'Points_Exo_UpperTrunkModule_3D';
PointsTypesDictionary(offsetID+21).points.name = {'ExoUpperTrunk_Front', 'ExoUpperTrunk_Back'};
PointsTypesDictionary(offsetID+21).points.rel_position_to_joint_center = [1.35 0.0 -0.165; -0.05 0.0 0.0];

PointsTypesDictionary(offsetID+22).name = 'Points_Box_3D';
PointsTypesDictionary(offsetID+22).points.name = {'BoxAttach_L','BoxAttach_R',...
    'BoxBottom','BoxBottomLeftBack'};
PointsTypesDictionary(offsetID+22).points.rel_position_to_joint_center = ...
    [0.0  1.75  0.5; ...
     0.0 -1.75  0.5; ...
     0.0  0.0 -0.5; ...
     -1.0 1.15 -0.5];