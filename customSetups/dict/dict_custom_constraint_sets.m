%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
% dict_custom_constraint_sets

if exist('CustomConstraintSetTypes','var')
    offsetID = length(CustomConstraintSetTypes);
else
    offsetID = 0;
end

%% Human Sagittal + Exo Sagittal + Box Sagittal %%
CustomConstraintSetTypes(offsetID+1).name  = 'FootFlat_ExoOn_BoxOnGround_Sagittal';
CustomConstraintSetTypes(offsetID+1).set(1).name = '';
CustomConstraintSetTypes(offsetID+1).set(1).type = 'point';
CustomConstraintSetTypes(offsetID+1).set(1).pointNames = {'Heel_Sagittal','Heel_Sagittal','Toe_Sagittal'};
CustomConstraintSetTypes(offsetID+1).set(1).pointConstraints = [1 0 0; 0 0 1; 0 0 1];

CustomConstraintSetTypes(offsetID+1).set(2).name = '';
CustomConstraintSetTypes(offsetID+1).set(2).type = 'point';
CustomConstraintSetTypes(offsetID+1).set(2).pointNames = {'BoxAttach_Sagittal','BoxAttach_Sagittal','BoxBottom_Sagittal'};
CustomConstraintSetTypes(offsetID+1).set(2).pointConstraints = [1 0 0; 0 0 1; 1 0 0];

CustomConstraintSetTypes(offsetID+1).set(3).name = 'ExoThigh_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+1).set(3).type = 'loop';
CustomConstraintSetTypes(offsetID+1).set(3).predecessor_body = 'Thigh_Sagittal';
CustomConstraintSetTypes(offsetID+1).set(3).successor_body = 'Exo_ThighModule_Sagittal';
CustomConstraintSetTypes(offsetID+1).set(3).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+1).set(3).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+1).set(3).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+1).set(3).predecessor_transform_contact = {'Thigh_Sagittal'};
CustomConstraintSetTypes(offsetID+1).set(3).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+1).set(3).successor_transform_contact = {'Exo_Thigh_Sagittal'};
CustomConstraintSetTypes(offsetID+1).set(3).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+1).set(4).name = 'ExoPelvis_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+1).set(4).type = 'loop';
CustomConstraintSetTypes(offsetID+1).set(4).predecessor_body = 'Pelvis_Sagittal';
CustomConstraintSetTypes(offsetID+1).set(4).successor_body = 'Exo_PelvisModule_Sagittal';
CustomConstraintSetTypes(offsetID+1).set(4).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+1).set(4).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+1).set(4).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+1).set(4).predecessor_transform_contact = {'Pelvis_Sagittal'};
CustomConstraintSetTypes(offsetID+1).set(4).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+1).set(4).successor_transform_contact = {'Exo_Pelvis_Sagittal'};
CustomConstraintSetTypes(offsetID+1).set(4).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+1).set(5).name = 'ExoUpperTrunk_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+1).set(5).type = 'loop';
CustomConstraintSetTypes(offsetID+1).set(5).predecessor_body = 'UpperTrunk_Sagittal';
CustomConstraintSetTypes(offsetID+1).set(5).successor_body = 'Exo_UpperTrunkModule_Sagittal';
CustomConstraintSetTypes(offsetID+1).set(5).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+1).set(5).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+1).set(5).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+1).set(5).predecessor_transform_contact = {'UpperTrunk_Sagittal'};
CustomConstraintSetTypes(offsetID+1).set(5).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+1).set(5).successor_transform_contact = {'Exo_UpperTrunk_Sagittal'};
CustomConstraintSetTypes(offsetID+1).set(5).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+2).name  = 'FootFlat_ExoOn_HandOnBox_Sagittal';
CustomConstraintSetTypes(offsetID+2).set(1).name = '';
CustomConstraintSetTypes(offsetID+2).set(1).type = 'point';
CustomConstraintSetTypes(offsetID+2).set(1).pointNames = {'Heel_Sagittal','Heel_Sagittal','Toe_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(1).pointConstraints = [1 0 0; 0 0 1; 0 0 1];

CustomConstraintSetTypes(offsetID+2).set(2).name = '';
CustomConstraintSetTypes(offsetID+2).set(2).type = 'point';
CustomConstraintSetTypes(offsetID+2).set(2).pointNames = {'BoxAttach_Sagittal','BoxAttach_Sagittal','BoxBottom_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(2).pointConstraints = [1 0 0; 0 0 1; 1 0 0];

CustomConstraintSetTypes(offsetID+2).set(3).name = '';
CustomConstraintSetTypes(offsetID+2).set(3).type = 'point';
CustomConstraintSetTypes(offsetID+2).set(3).pointNames = {'DistalMetacarpal_Sagittal','DistalMetacarpal_Sagittal','ProximalMetacarpal_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(3).pointConstraints = [1 0 0; 0 0 1; 1 0 0];

CustomConstraintSetTypes(offsetID+2).set(4).name = 'ExoThigh_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+2).set(4).type = 'loop';
CustomConstraintSetTypes(offsetID+2).set(4).predecessor_body = 'Thigh_Sagittal';
CustomConstraintSetTypes(offsetID+2).set(4).successor_body = 'Exo_ThighModule_Sagittal';
CustomConstraintSetTypes(offsetID+2).set(4).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+2).set(4).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+2).set(4).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+2).set(4).predecessor_transform_contact = {'Thigh_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(4).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+2).set(4).successor_transform_contact = {'Exo_Thigh_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(4).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+2).set(5).name = 'ExoPelvis_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+2).set(5).type = 'loop';
CustomConstraintSetTypes(offsetID+2).set(5).predecessor_body = 'Pelvis_Sagittal';
CustomConstraintSetTypes(offsetID+2).set(5).successor_body = 'Exo_PelvisModule_Sagittal';
CustomConstraintSetTypes(offsetID+2).set(5).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+2).set(5).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+2).set(5).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+2).set(5).predecessor_transform_contact = {'Pelvis_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(5).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+2).set(5).successor_transform_contact = {'Exo_Pelvis_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(5).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+2).set(6).name = 'ExoUpperTrunk_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+2).set(6).type = 'loop';
CustomConstraintSetTypes(offsetID+2).set(6).predecessor_body = 'UpperTrunk_Sagittal';
CustomConstraintSetTypes(offsetID+2).set(6).successor_body = 'Exo_UpperTrunkModule_Sagittal';
CustomConstraintSetTypes(offsetID+2).set(6).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+2).set(6).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+2).set(6).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+2).set(6).predecessor_transform_contact = {'UpperTrunk_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(6).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+2).set(6).successor_transform_contact = {'Exo_UpperTrunk_Sagittal'};
CustomConstraintSetTypes(offsetID+2).set(6).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+3).name  = 'FootFlat_ExoOn_HandBoxAttach_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(1).name = '';
CustomConstraintSetTypes(offsetID+3).set(1).type = 'point';
CustomConstraintSetTypes(offsetID+3).set(1).pointNames = {'Heel_Sagittal','Heel_Sagittal','Toe_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(1).pointConstraints = [1 0 0; 0 0 1; 0 0 1];

CustomConstraintSetTypes(offsetID+3).set(2).name = 'ExoThigh_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+3).set(2).type = 'loop';
CustomConstraintSetTypes(offsetID+3).set(2).predecessor_body = 'Thigh_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(2).successor_body = 'Exo_ThighModule_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(2).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+3).set(2).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+3).set(2).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+3).set(2).predecessor_transform_contact = {'Thigh_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(2).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+3).set(2).successor_transform_contact = {'Exo_Thigh_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(2).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+3).set(3).name = 'ExoPelvis_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+3).set(3).type = 'loop';
CustomConstraintSetTypes(offsetID+3).set(3).predecessor_body = 'Pelvis_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(3).successor_body = 'Exo_PelvisModule_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(3).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+3).set(3).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+3).set(3).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+3).set(3).predecessor_transform_contact = {'Pelvis_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(3).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+3).set(3).successor_transform_contact = {'Exo_Pelvis_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(3).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+3).set(4).name = 'ExoUpperTrunk_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+3).set(4).type = 'loop';
CustomConstraintSetTypes(offsetID+3).set(4).predecessor_body = 'UpperTrunk_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(4).successor_body = 'Exo_UpperTrunkModule_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(4).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+3).set(4).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+3).set(4).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+3).set(4).predecessor_transform_contact = {'UpperTrunk_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(4).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+3).set(4).successor_transform_contact = {'Exo_UpperTrunk_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(4).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+3).set(5).name = 'HandBox_posX_posZ_rotY';
CustomConstraintSetTypes(offsetID+3).set(5).type = 'loop';
CustomConstraintSetTypes(offsetID+3).set(5).predecessor_body = 'Box_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(5).successor_body = 'Hand_Sagittal';
CustomConstraintSetTypes(offsetID+3).set(5).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+3).set(5).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+3).set(5).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+3).set(5).predecessor_transform_contact = {'BoxAttach_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(5).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+3).set(5).successor_transform_contact = {'DistalMetacarpal_Sagittal'};
CustomConstraintSetTypes(offsetID+3).set(5).successor_transform_custom = [];

%% Human 3D + Exo 3D + Box 3D %%
CustomConstraintSetTypes(offsetID+4).name  = 'FootFlat_ExoOn_BoxOnGround_3D';
CustomConstraintSetTypes(offsetID+4).set(1).name = 'FootFlat_R';
CustomConstraintSetTypes(offsetID+4).set(1).type = 'point';
CustomConstraintSetTypes(offsetID+4).set(1).pointNames = {'Heel_Lateral_R', 'Heel_Lateral_R','Heel_Lateral_R',...
                                                'Heel_Medial_R','Heel_Medial_R',...
                                                'Toe_R'};
CustomConstraintSetTypes(offsetID+4).set(1).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 
                                                        1 0 0;  0 0 1; 
                                                        0 0 1];

CustomConstraintSetTypes(offsetID+4).set(2).name = 'FootFlat_L';
CustomConstraintSetTypes(offsetID+4).set(2).type = 'point';
CustomConstraintSetTypes(offsetID+4).set(2).pointNames = {'Heel_Lateral_L','Heel_Lateral_L','Heel_Lateral_L',...
                                                'Heel_Medial_L','Heel_Medial_L',...
                                                'Toe_R'};
CustomConstraintSetTypes(offsetID+4).set(2).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 
                                                    1 0 0; 0 0 1; 
                                                    0 0 1];

CustomConstraintSetTypes(offsetID+4).set(3).name = 'BoxOnGround';
CustomConstraintSetTypes(offsetID+4).set(3).type = 'point';
CustomConstraintSetTypes(offsetID+4).set(3).pointNames = {'BoxBottom','BoxBottom', 'BoxBottom',...
                                                 'BoxBottomLeftBack','BoxBottomLeftBack','BoxBottomLeftBack'};
CustomConstraintSetTypes(offsetID+4).set(3).pointConstraints = [1 0 0; 0 1 0; 0 0 1;
                                                        1 0 0; 0 1 0; 0 0 1];

CustomConstraintSetTypes(offsetID+4).set(4).name = 'ExoThigh_R_fixed';
CustomConstraintSetTypes(offsetID+4).set(4).type = 'loop';
CustomConstraintSetTypes(offsetID+4).set(4).predecessor_body = 'Thigh_R';
CustomConstraintSetTypes(offsetID+4).set(4).successor_body = 'Exo_ThighModule_R';
CustomConstraintSetTypes(offsetID+4).set(4).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+4).set(4).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+4).set(4).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+4).set(4).predecessor_transform_contact = {'Thigh_R'};
CustomConstraintSetTypes(offsetID+4).set(4).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+4).set(4).successor_transform_contact = {'ExoThigh_R'}; 
CustomConstraintSetTypes(offsetID+4).set(4).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+4).set(5).name = 'ExoThigh_L_fixed';
CustomConstraintSetTypes(offsetID+4).set(5).type = 'loop';
CustomConstraintSetTypes(offsetID+4).set(5).predecessor_body = 'Thigh_L';
CustomConstraintSetTypes(offsetID+4).set(5).successor_body = 'Exo_ThighModule_L';
CustomConstraintSetTypes(offsetID+4).set(5).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+4).set(5).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+4).set(5).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+4).set(5).predecessor_transform_contact = {'Thigh_L'};
CustomConstraintSetTypes(offsetID+4).set(5).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+4).set(5).successor_transform_contact = {'ExoThigh_L'}; 
CustomConstraintSetTypes(offsetID+4).set(5).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+4).set(6).name = 'ExoPelvis_Back_fixed';
CustomConstraintSetTypes(offsetID+4).set(6).type = 'loop';
CustomConstraintSetTypes(offsetID+4).set(6).predecessor_body = 'Pelvis';
CustomConstraintSetTypes(offsetID+4).set(6).successor_body = 'Exo_PelvisModule';
CustomConstraintSetTypes(offsetID+4).set(6).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+4).set(6).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+4).set(6).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+4).set(6).predecessor_transform_contact = {'Pelvis_Back'};
CustomConstraintSetTypes(offsetID+4).set(6).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+4).set(6).successor_transform_contact = {'ExoPelvis_Back'};
CustomConstraintSetTypes(offsetID+4).set(6).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+4).set(7).name = 'ExoUpperTrunk_Back_fixed';
CustomConstraintSetTypes(offsetID+4).set(7).type = 'loop';
CustomConstraintSetTypes(offsetID+4).set(7).predecessor_body = 'UpperTrunk';
CustomConstraintSetTypes(offsetID+4).set(7).successor_body = 'Exo_UpperTrunkModule';
CustomConstraintSetTypes(offsetID+4).set(7).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+4).set(7).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+4).set(7).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+4).set(7).predecessor_transform_contact = {'UpperTrunk_Back'};
CustomConstraintSetTypes(offsetID+4).set(7).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+4).set(7).successor_transform_contact = {'ExoUpperTrunk_Back'};
CustomConstraintSetTypes(offsetID+4).set(7).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+5).name  = 'FootFlat_ExoOn_HandOnBox_3D';
CustomConstraintSetTypes(offsetID+5).set(1).name = 'FootFlat_R';
CustomConstraintSetTypes(offsetID+5).set(1).type = 'point';
CustomConstraintSetTypes(offsetID+5).set(1).pointNames = {'Heel_Lateral_R', 'Heel_Lateral_R','Heel_Lateral_R',...
                                                'Heel_Medial_R','Heel_Medial_R',...
                                                'Toe_R'};
CustomConstraintSetTypes(offsetID+5).set(1).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 
                                                        1 0 0;  0 0 1; 
                                                        0 0 1];

CustomConstraintSetTypes(offsetID+5).set(2).name = 'FootFlat_L';
CustomConstraintSetTypes(offsetID+5).set(2).type = 'point';
CustomConstraintSetTypes(offsetID+5).set(2).pointNames = {'Heel_Lateral_L','Heel_Lateral_L','Heel_Lateral_L',...
                                                'Heel_Medial_L','Heel_Medial_L',...
                                                'Toe_R'};
CustomConstraintSetTypes(offsetID+5).set(2).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 
                                                    1 0 0; 0 0 1; 
                                                    0 0 1];

CustomConstraintSetTypes(offsetID+5).set(3).name = 'BoxOnGround';
CustomConstraintSetTypes(offsetID+5).set(3).type = 'point';
CustomConstraintSetTypes(offsetID+5).set(3).pointNames = {'BoxBottom','BoxBottom', 'BoxBottom',...
                                                 'BoxBottomLeftBack','BoxBottomLeftBack','BoxBottomLeftBack'};
CustomConstraintSetTypes(offsetID+5).set(3).pointConstraints = [1 0 0; 0 1 0; 0 0 1;
                                                        1 0 0; 0 1 0; 0 0 1];

CustomConstraintSetTypes(offsetID+5).set(4).name = 'HandRightFlat';
CustomConstraintSetTypes(offsetID+5).set(4).type = 'point';
CustomConstraintSetTypes(offsetID+5).set(4).pointNames = {'ProximalMetacarpal_Medial_R','ProximalMetacarpal_Medial_R','ProximalMetacarpal_Medial_R',...
    'DistalMetacarpal_Lateral_R','DistalMetacarpal_Lateral_R', 'DistalMetacarpal_Lateral_R'};
CustomConstraintSetTypes(offsetID+5).set(4).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 
                                                    1 0 0; 0 1 0; 0 0 1];

CustomConstraintSetTypes(offsetID+5).set(5).name = 'HandLeftFlat';
CustomConstraintSetTypes(offsetID+5).set(5).type = 'point';
CustomConstraintSetTypes(offsetID+5).set(5).pointNames = {'ProximalMetacarpal_Medial_L','ProximalMetacarpal_Medial_L','ProximalMetacarpal_Medial_L',...
    'DistalMetacarpal_Lateral_L','DistalMetacarpal_Lateral_L', 'DistalMetacarpal_Lateral_L'};
CustomConstraintSetTypes(offsetID+5).set(5).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 
                                                    1 0 0; 0 1 0; 0 0 1];

CustomConstraintSetTypes(offsetID+5).set(6).name = 'ExoThigh_R_fixed';
CustomConstraintSetTypes(offsetID+5).set(6).type = 'loop';
CustomConstraintSetTypes(offsetID+5).set(6).predecessor_body = 'Thigh_R';
CustomConstraintSetTypes(offsetID+5).set(6).successor_body = 'Exo_ThighModule_R';
CustomConstraintSetTypes(offsetID+5).set(6).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+5).set(6).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+5).set(6).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+5).set(6).predecessor_transform_contact = {'Thigh_R'};
CustomConstraintSetTypes(offsetID+5).set(6).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+5).set(6).successor_transform_contact = {'ExoThigh_R'}; 
CustomConstraintSetTypes(offsetID+5).set(6).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+5).set(7).name = 'ExoThigh_L_fixed';
CustomConstraintSetTypes(offsetID+5).set(7).type = 'loop';
CustomConstraintSetTypes(offsetID+5).set(7).predecessor_body = 'Thigh_L';
CustomConstraintSetTypes(offsetID+5).set(7).successor_body = 'Exo_ThighModule_L';
CustomConstraintSetTypes(offsetID+5).set(7).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+5).set(7).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+5).set(7).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+5).set(7).predecessor_transform_contact = {'Thigh_L'};
CustomConstraintSetTypes(offsetID+5).set(7).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+5).set(7).successor_transform_contact = {'ExoThigh_L'}; 
CustomConstraintSetTypes(offsetID+5).set(7).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+5).set(8).name = 'ExoPelvis_Back_fixed';
CustomConstraintSetTypes(offsetID+5).set(8).type = 'loop';
CustomConstraintSetTypes(offsetID+5).set(8).predecessor_body = 'Pelvis';
CustomConstraintSetTypes(offsetID+5).set(8).successor_body = 'Exo_PelvisModule';
CustomConstraintSetTypes(offsetID+5).set(8).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+5).set(8).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+5).set(8).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+5).set(8).predecessor_transform_contact = {'Pelvis_Back'};
CustomConstraintSetTypes(offsetID+5).set(8).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+5).set(8).successor_transform_contact = {'ExoPelvis_Back'};
CustomConstraintSetTypes(offsetID+5).set(8).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+5).set(9).name = 'ExoUpperTrunk_Back_fixed';
CustomConstraintSetTypes(offsetID+5).set(9).type = 'loop';
CustomConstraintSetTypes(offsetID+5).set(9).predecessor_body = 'UpperTrunk';
CustomConstraintSetTypes(offsetID+5).set(9).successor_body = 'Exo_UpperTrunkModule';
CustomConstraintSetTypes(offsetID+5).set(9).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+5).set(9).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+5).set(9).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+5).set(9).predecessor_transform_contact = {'UpperTrunk_Back'};
CustomConstraintSetTypes(offsetID+5).set(9).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+5).set(9).successor_transform_contact = {'ExoUpperTrunk_Back'};
CustomConstraintSetTypes(offsetID+5).set(9).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+6).name  = 'FootFlat_ExoOn_HandBoxAttach_3D';
CustomConstraintSetTypes(offsetID+6).set(1).name = 'FootFlat_R';
CustomConstraintSetTypes(offsetID+6).set(1).type = 'point';
CustomConstraintSetTypes(offsetID+6).set(1).pointNames = {'Heel_Lateral_R', 'Heel_Lateral_R','Heel_Lateral_R',...
                                                'Heel_Medial_R','Heel_Medial_R',...
                                                'Toe_R'};
CustomConstraintSetTypes(offsetID+6).set(1).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 
                                                        1 0 0;  0 0 1; 
                                                        0 0 1];

CustomConstraintSetTypes(offsetID+6).set(2).name = 'FootFlat_L';
CustomConstraintSetTypes(offsetID+6).set(2).type = 'point';
CustomConstraintSetTypes(offsetID+6).set(2).pointNames = {'Heel_Lateral_L','Heel_Lateral_L','Heel_Lateral_L',...
                                                'Heel_Medial_L','Heel_Medial_L',...
                                                'Toe_R'};
CustomConstraintSetTypes(offsetID+6).set(2).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 
                                                    1 0 0; 0 0 1; 
                                                    0 0 1];

CustomConstraintSetTypes(offsetID+6).set(3).name = 'ExoThigh_R_fixed';
CustomConstraintSetTypes(offsetID+6).set(3).type = 'loop';
CustomConstraintSetTypes(offsetID+6).set(3).predecessor_body = 'Thigh_R';
CustomConstraintSetTypes(offsetID+6).set(3).successor_body = 'Exo_ThighModule_R';
CustomConstraintSetTypes(offsetID+6).set(3).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+6).set(3).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+6).set(3).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+6).set(3).predecessor_transform_contact = {'Thigh_R'};
CustomConstraintSetTypes(offsetID+6).set(3).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+6).set(3).successor_transform_contact = {'ExoThigh_R'}; 
CustomConstraintSetTypes(offsetID+6).set(3).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+6).set(4).name = 'ExoThigh_L_fixed';
CustomConstraintSetTypes(offsetID+6).set(4).type = 'loop';
CustomConstraintSetTypes(offsetID+6).set(4).predecessor_body = 'Thigh_L';
CustomConstraintSetTypes(offsetID+6).set(4).successor_body = 'Exo_ThighModule_L';
CustomConstraintSetTypes(offsetID+6).set(4).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+6).set(4).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+6).set(4).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+6).set(4).predecessor_transform_contact = {'Thigh_L'};
CustomConstraintSetTypes(offsetID+6).set(4).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+6).set(4).successor_transform_contact = {'ExoThigh_L'}; 
CustomConstraintSetTypes(offsetID+6).set(4).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+6).set(5).name = 'ExoPelvis_Back_fixed';
CustomConstraintSetTypes(offsetID+6).set(5).type = 'loop';
CustomConstraintSetTypes(offsetID+6).set(5).predecessor_body = 'Pelvis';
CustomConstraintSetTypes(offsetID+6).set(5).successor_body = 'Exo_PelvisModule';
CustomConstraintSetTypes(offsetID+6).set(5).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+6).set(5).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+6).set(5).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+6).set(5).predecessor_transform_contact = {'Pelvis_Back'};
CustomConstraintSetTypes(offsetID+6).set(5).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+6).set(5).successor_transform_contact = {'ExoPelvis_Back'};
CustomConstraintSetTypes(offsetID+6).set(5).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+6).set(6).name = 'ExoUpperTrunk_Back_fixed';
CustomConstraintSetTypes(offsetID+6).set(6).type = 'loop';
CustomConstraintSetTypes(offsetID+6).set(6).predecessor_body = 'UpperTrunk';
CustomConstraintSetTypes(offsetID+6).set(6).successor_body = 'Exo_UpperTrunkModule';
CustomConstraintSetTypes(offsetID+6).set(6).axis = [0 1 0 1 0 1];
CustomConstraintSetTypes(offsetID+6).set(6).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+6).set(6).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+6).set(6).predecessor_transform_contact = {'UpperTrunk_Back'};
CustomConstraintSetTypes(offsetID+6).set(6).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+6).set(6).successor_transform_contact = {'ExoUpperTrunk_Back'};
CustomConstraintSetTypes(offsetID+6).set(6).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+6).set(7).name = 'HandBox_R_fixed';
CustomConstraintSetTypes(offsetID+6).set(7).type = 'loop';
CustomConstraintSetTypes(offsetID+6).set(7).predecessor_body = 'Box';
CustomConstraintSetTypes(offsetID+6).set(7).successor_body = 'Hand_R';
CustomConstraintSetTypes(offsetID+6).set(7).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+6).set(7).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+6).set(7).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+6).set(7).predecessor_transform_contact = {'BoxAttach_R'};
CustomConstraintSetTypes(offsetID+6).set(7).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+6).set(7).successor_transform_contact = {'DistalMetacarpal_Lateral_R'};
CustomConstraintSetTypes(offsetID+6).set(7).successor_transform_custom = [];

CustomConstraintSetTypes(offsetID+6).set(8).name = 'HandBox_L_fixed';
CustomConstraintSetTypes(offsetID+6).set(8).type = 'loop';
CustomConstraintSetTypes(offsetID+6).set(8).predecessor_body = 'Box';
CustomConstraintSetTypes(offsetID+6).set(8).successor_body = 'Hand_L';
CustomConstraintSetTypes(offsetID+6).set(8).axis = [1 1 1 1 1 1];
CustomConstraintSetTypes(offsetID+6).set(8).stabilization_coefficient = 1.0;
CustomConstraintSetTypes(offsetID+6).set(8).baumgarte_enabled = 'false';
CustomConstraintSetTypes(offsetID+6).set(8).predecessor_transform_contact = {'BoxAttach_L'};
CustomConstraintSetTypes(offsetID+6).set(8).predecessor_transform_custom = [];
CustomConstraintSetTypes(offsetID+6).set(8).successor_transform_contact = {'DistalMetacarpal_Lateral_L'};
CustomConstraintSetTypes(offsetID+6).set(8).successor_transform_custom = [];