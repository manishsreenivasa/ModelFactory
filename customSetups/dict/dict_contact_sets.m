%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
% dict_contact_sets

if exist('ContactsTypesDictionary','var')
    offsetID = length(ContactsTypesDictionary);
else
    offsetID = 0;
end
ContactsTypesDictionary(offsetID+1).name = 'Contacts_Pelvis_Sagittal';
ContactsTypesDictionary(offsetID+1).points.name = {'Pelvis_Sagittal'};
ContactsTypesDictionary(offsetID+1).points.rel_position_to_joint_center = [-0.25 0.0 0.5];

ContactsTypesDictionary(offsetID+2).name = 'Contacts_Thigh_Sagittal';
ContactsTypesDictionary(offsetID+2).points.name = {'Thigh_Sagittal'};
ContactsTypesDictionary(offsetID+2).points.rel_position_to_joint_center = [0.125 0.0 -0.85];

ContactsTypesDictionary(offsetID+3).name = 'Contacts_UpperTrunk_Sagittal';
ContactsTypesDictionary(offsetID+3).points.name = {'UpperTrunk_Sagittal'};
ContactsTypesDictionary(offsetID+3).points.rel_position_to_joint_center = [-0.1 0.0 0.4];

ContactsTypesDictionary(offsetID+4).name = 'Contacts_Foot_Sagittal';
ContactsTypesDictionary(offsetID+4).customOffsetFoot = 1;
ContactsTypesDictionary(offsetID+4).points.name = {'Heel_Sagittal','Toe_Sagittal'};
ContactsTypesDictionary(offsetID+4).points.rel_position_to_joint_center = [0.0 0.0 -1.0; 1.0 0.0 -1.0];
ContactsTypesDictionary(offsetID+4).points.rel_functional_distance = [0.0 0.0 -1.0; 0.75 0.0 -1.0];

ContactsTypesDictionary(offsetID+5).name = 'Contacts_Hand_Sagittal';
ContactsTypesDictionary(offsetID+5).points.name = {'ProximalMetacarpal_Sagittal','DistalMetacarpal_Sagittal'};
ContactsTypesDictionary(offsetID+5).points.rel_position_to_joint_center = [0.0 0.0 -0.2; 0.0 0.0 -0.7];

ContactsTypesDictionary(offsetID+6).name = 'Contacts_Exo_PelvisModule_Sagittal';
ContactsTypesDictionary(offsetID+6).points.name = {'Exo_Pelvis_Sagittal'};
ContactsTypesDictionary(offsetID+6).points.rel_position_to_joint_center = [-0.5 0.0 0.0];

ContactsTypesDictionary(offsetID+7).name = 'Contacts_Exo_ThighModule_Sagittal';
ContactsTypesDictionary(offsetID+7).points.name = {'Exo_Thigh_Sagittal'};
ContactsTypesDictionary(offsetID+7).points.rel_position_to_joint_center = [0.5 0.0 0.0];

ContactsTypesDictionary(offsetID+8).name = 'Contacts_Exo_UpperTrunkModule_Sagittal';
ContactsTypesDictionary(offsetID+8).points.name = {'Exo_UpperTrunk_Sagittal'};
ContactsTypesDictionary(offsetID+8).points.rel_position_to_joint_center = [0.0 0.0 0.0];

ContactsTypesDictionary(offsetID+9).name = 'Contacts_Box_Sagittal';
ContactsTypesDictionary(offsetID+9).points.name = {'BoxAttach_Sagittal','BoxBottom_Sagittal'};
ContactsTypesDictionary(offsetID+9).points.rel_position_to_joint_center = [0.0 0.0 0.25; 0.0 0.0 -0.5];

ContactsTypesDictionary(offsetID+10).name = 'Contacts_Pelvis_3D';
ContactsTypesDictionary(offsetID+10).points.name = {'Pelvis_L','Pelvis_R','Pelvis_Back','Pelvis_Front'};
ContactsTypesDictionary(offsetID+10).points.rel_position_to_joint_center = [0.0 1.0 0.7; 0.0 -1.0 0.7; -0.75 0.0 0.7; 0.75 0.0 0.7];

ContactsTypesDictionary(offsetID+11).name = 'Contacts_Thigh_L_3D';
ContactsTypesDictionary(offsetID+11).points.name = {'Thigh_L'};
ContactsTypesDictionary(offsetID+11).points.rel_position_to_joint_center = [0.2 0. -0.75];

ContactsTypesDictionary(offsetID+12).name = 'Contacts_Thigh_R_3D';
ContactsTypesDictionary(offsetID+12).points.name = {'Thigh_R'};
ContactsTypesDictionary(offsetID+12).points.rel_position_to_joint_center = [0.2 -0. -0.75];

ContactsTypesDictionary(offsetID+13).name = 'Contacts_UpperTrunk_3D';
ContactsTypesDictionary(offsetID+13).points.name = {'UpperTrunk_Front', 'UpperTrunk_Back'};
ContactsTypesDictionary(offsetID+13).points.rel_position_to_joint_center = [0.4 0.0 0.3; -0.45 0.0 0.4];

ContactsTypesDictionary(offsetID+14).name = 'Contacts_Foot_R_3D';
ContactsTypesDictionary(offsetID+14).customOffsetFoot = 1;
ContactsTypesDictionary(offsetID+14).points.name = {'Heel_Medial_R','Heel_Lateral_R','Toe_R'};
ContactsTypesDictionary(offsetID+14).points.rel_position_to_joint_center = [0.0 0.5 -1.0; 0.0 -0.5 -1.0; 1.0 0.0 -1.0];
ContactsTypesDictionary(offsetID+14).points.rel_functional_distance = [0.0 0.5 -1.0; 0.0 -0.5 -1.0; 0.75 0.0 -1.0];

ContactsTypesDictionary(offsetID+15).name = 'Contacts_Foot_L_3D';
ContactsTypesDictionary(offsetID+15).customOffsetFoot = 1;
ContactsTypesDictionary(offsetID+15).points.name = {'Heel_Medial_L','Heel_Lateral_L','Toe_L'};
ContactsTypesDictionary(offsetID+15).points.rel_position_to_joint_center = [0.0 -0.5 -1.0; 0.0 0.5 -1.0; 1.0 0.0 -1.0];
ContactsTypesDictionary(offsetID+15).points.rel_functional_distance = [0.0 -0.5 -1.0; 0.0 0.5 -1.0; 0.75 0.0 -1.0];

ContactsTypesDictionary(offsetID+16).name = 'Contacts_Hand_R_3D';
ContactsTypesDictionary(offsetID+16).points.name = {'ProximalMetacarpal_Medial_R','ProximalMetacarpal_Lateral_R','DistalMetacarpal_Medial_R','DistalMetacarpal_Lateral_R'};
ContactsTypesDictionary(offsetID+16).points.rel_position_to_joint_center = [-0.2 0.15 -0.2; 0.2 0.15 -0.2; -0.2 0.15 -0.6; 0.2 0.15 -0.6];

ContactsTypesDictionary(offsetID+17).name = 'Contacts_Hand_L_3D';
ContactsTypesDictionary(offsetID+17).points.name = {'ProximalMetacarpal_Medial_L','ProximalMetacarpal_Lateral_L','DistalMetacarpal_Medial_L','DistalMetacarpal_Lateral_L'};
ContactsTypesDictionary(offsetID+17).points.rel_position_to_joint_center = [-0.2 -0.15 -0.2; 0.2 -0.15 -0.2; -0.2 -0.15 -0.6; 0.2 -0.15 -0.6];

ContactsTypesDictionary(offsetID+18).name = 'Contacts_Exo_PelvisModule_3D';
ContactsTypesDictionary(offsetID+18).points.name = {'ExoPelvis_L','ExoPelvis_R','ExoPelvis_Back'};
ContactsTypesDictionary(offsetID+18).points.rel_position_to_joint_center = [0.0 1.0 0.0; 0.0 -1.0 0.0; -0.75 0.0 0.0];

ContactsTypesDictionary(offsetID+19).name = 'Contacts_Exo_ThighModule_L_3D';
ContactsTypesDictionary(offsetID+19).points.name = {'ExoThigh_L'};
ContactsTypesDictionary(offsetID+19).points.rel_position_to_joint_center = [0. 0. 0.];

ContactsTypesDictionary(offsetID+20).name = 'Contacts_Exo_ThighModule_R_3D';
ContactsTypesDictionary(offsetID+20).points.name = {'ExoThigh_R'};
ContactsTypesDictionary(offsetID+20).points.rel_position_to_joint_center = [0. -0. 0.];

ContactsTypesDictionary(offsetID+21).name = 'Contacts_Exo_UpperTrunkModule_3D';
ContactsTypesDictionary(offsetID+21).points.name = {'ExoUpperTrunk_Front', 'ExoUpperTrunk_Back'};
ContactsTypesDictionary(offsetID+21).points.rel_position_to_joint_center = [1.35 0.0 -0.165; -0.05 0.0 0.0];

ContactsTypesDictionary(offsetID+22).name = 'Contacts_Box_3D';
ContactsTypesDictionary(offsetID+22).points.name = {'BoxAttach_L','BoxAttach_R',...
    'BoxBottom','BoxBottomLeftBack'};
ContactsTypesDictionary(offsetID+22).points.rel_position_to_joint_center = ...
    [0.0  1.75  0.5; ...
     0.0 -1.75  0.5; ...
     0.0  0.0 -0.5; ...
     -1.0 1.15 -0.5];