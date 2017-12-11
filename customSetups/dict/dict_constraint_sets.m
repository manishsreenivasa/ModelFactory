%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
% dict_constraint_sets

if exist('ConstraintSetTypes','var')
    offsetID = length(ConstraintSetTypes);
else
    offsetID = 0;
end

ConstraintSetTypes(offsetID+1).name = 'ConstraintSet_Foot_Sagittal';
ConstraintSetTypes(offsetID+1).set(1).name = 'FootFlat_Sagittal';
ConstraintSetTypes(offsetID+1).set(1).pointNames = {'Heel_Sagittal','Heel_Sagittal','Toe_Sagittal'};
ConstraintSetTypes(offsetID+1).set(1).pointConstraints = [1 0 0; 0 0 1; 0 0 1];
ConstraintSetTypes(offsetID+1).set(2).name = 'Heel_Sagittal';
ConstraintSetTypes(offsetID+1).set(2).pointNames = {'Heel_Sagittal','Heel_Sagittal'};
ConstraintSetTypes(offsetID+1).set(2).pointConstraints = [1 0 0; 0 0 1];
ConstraintSetTypes(offsetID+1).set(3).name = 'Toe_Sagittal';
ConstraintSetTypes(offsetID+1).set(3).pointNames = {'Toe_Sagittal','Toe_Sagittal'};
ConstraintSetTypes(offsetID+1).set(3).pointConstraints = [1 0 0; 0 0 1];

ConstraintSetTypes(offsetID+2).name = 'ConstraintSet_Hand_Sagittal';
ConstraintSetTypes(offsetID+2).set(1).name = 'HandFlat_Sagittal';
ConstraintSetTypes(offsetID+2).set(1).pointNames = {'ProximalMetacarpal_Sagittal','ProximalMetacarpal_Sagittal','DistalMetacarpal_Sagittal'};
ConstraintSetTypes(offsetID+2).set(1).pointConstraints = [1 0 0; 0 0 1; 0 0 1];
ConstraintSetTypes(offsetID+2).set(2).name = 'ProximalMetacarpal_Sagittal';
ConstraintSetTypes(offsetID+2).set(2).pointNames = {'ProximalMetacarpal_Sagittal','ProximalMetacarpal_Sagittal'};
ConstraintSetTypes(offsetID+2).set(2).pointConstraints = [1 0 0; 0 0 1];
ConstraintSetTypes(offsetID+2).set(3).name = 'DistalMetacarpal_Sagittal';
ConstraintSetTypes(offsetID+2).set(3).pointNames = {'DistalMetacarpal_Sagittal','DistalMetacarpal_Sagittal'};
ConstraintSetTypes(offsetID+2).set(3).pointConstraints = [1 0 0; 0 0 1];

ConstraintSetTypes(offsetID+3).name = 'ConstraintSet_Foot_R_3D';
ConstraintSetTypes(offsetID+3).set(1).name = 'FootRightFlat';
ConstraintSetTypes(offsetID+3).set(1).pointNames = {'Heel_Medial_R','Heel_Medial_R','Heel_Medial_R','Heel_Lateral_R','Heel_Lateral_R','Heel_Lateral_R','Toe_R','Toe_R'};
ConstraintSetTypes(offsetID+3).set(1).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 0 1 0; 0 0 1];
ConstraintSetTypes(offsetID+3).set(2).name = 'RightToe';
ConstraintSetTypes(offsetID+3).set(2).pointNames = {'Toe_R','Toe_R','Toe_R'};
ConstraintSetTypes(offsetID+3).set(2).pointConstraints = [1 0 0; 0 1 0; 0 0 1];
ConstraintSetTypes(offsetID+3).set(3).name = 'RightToeLeftHeel';
ConstraintSetTypes(offsetID+3).set(3).pointNames = {'Toe_R','Toe_R','Toe_R','Heel_Medial_L','Heel_Medial_L','Heel_Medial_L','Heel_Lateral_L','Heel_Lateral_L','Heel_Lateral_L'};
ConstraintSetTypes(offsetID+3).set(3).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1];
ConstraintSetTypes(offsetID+3).set(4).name = 'RightToeLeftFlat';
ConstraintSetTypes(offsetID+3).set(4).pointNames = {'Toe_R','Toe_R','Toe_R','Heel_Medial_L','Heel_Medial_L','Heel_Medial_L','Heel_Lateral_L','Heel_Lateral_L','Heel_Lateral_L','Toe_L','Toe_L'};
ConstraintSetTypes(offsetID+3).set(4).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 0 1 0; 0 0 1];

ConstraintSetTypes(offsetID+4).name = 'ConstraintSet_Foot_L_3D';
ConstraintSetTypes(offsetID+4).set(1).name = 'FootLeftFlat';
ConstraintSetTypes(offsetID+4).set(1).pointNames = {'Heel_Medial_L','Heel_Medial_L','Heel_Medial_L','Heel_Lateral_L','Heel_Lateral_L','Heel_Lateral_L','Toe_L','Toe_L'};
ConstraintSetTypes(offsetID+4).set(1).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 0 1 0; 0 0 1];
ConstraintSetTypes(offsetID+4).set(2).name = 'LeftToe';
ConstraintSetTypes(offsetID+4).set(2).pointNames = {'Toe_L','Toe_L','Toe_L'};
ConstraintSetTypes(offsetID+4).set(2).pointConstraints = [1 0 0; 0 1 0; 0 0 1];
ConstraintSetTypes(offsetID+4).set(3).name = 'LeftToeRightHeel';
ConstraintSetTypes(offsetID+4).set(3).pointNames = {'Toe_L','Toe_L','Toe_L','Heel_Medial_R','Heel_Medial_R','Heel_Medial_R','Heel_Lateral_R','Heel_Lateral_R','Heel_Lateral_R'};
ConstraintSetTypes(offsetID+4).set(3).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1];
ConstraintSetTypes(offsetID+4).set(4).name = 'LeftToeRightFlat';
ConstraintSetTypes(offsetID+4).set(4).pointNames = {'Toe_L','Toe_L','Toe_L','Heel_Medial_R','Heel_Medial_R','Heel_Medial_R','Heel_Lateral_R','Heel_Lateral_R','Heel_Lateral_R','Toe_R','Toe_R'};
ConstraintSetTypes(offsetID+4).set(4).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1; 0 1 0; 0 0 1];

ConstraintSetTypes(offsetID+5).name = 'ConstraintSet_Hand_R_3D';
ConstraintSetTypes(offsetID+5).set(1).name = 'HandRightFlat';
ConstraintSetTypes(offsetID+5).set(1).pointNames = {'ProximalMetacarpal_Medial_R','ProximalMetacarpal_Medial_R','ProximalMetacarpal_Medial_R','DistalMetacarpal_Lateral_R','DistalMetacarpal_Lateral_R', 'DistalMetacarpal_Lateral_R'};
ConstraintSetTypes(offsetID+5).set(1).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1];

ConstraintSetTypes(offsetID+6).name = 'ConstraintSet_Hand_L_3D';
ConstraintSetTypes(offsetID+6).set(1).name = 'HandLeftFlat';
ConstraintSetTypes(offsetID+6).set(1).pointNames = {'ProximalMetacarpal_Medial_L','ProximalMetacarpal_Medial_L','ProximalMetacarpal_Medial_L','DistalMetacarpal_Lateral_L','DistalMetacarpal_Lateral_L', 'DistalMetacarpal_Lateral_L'};
ConstraintSetTypes(offsetID+6).set(1).pointConstraints = [1 0 0; 0 1 0; 0 0 1; 1 0 0; 0 1 0; 0 0 1];