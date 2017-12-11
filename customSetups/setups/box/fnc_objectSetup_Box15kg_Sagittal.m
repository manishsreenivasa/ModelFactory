%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function BoxSetup = fnc_objectSetup_Box15kg_Sagittal ()

segment_type_names = {'Box15kg_Sagittal'};    

%% Setup Box 
BoxSetup.segmentTypeNames(1)  = segment_type_names(1);
BoxSetup.mesh_obj{1}          = 'meshes/unit_cube.obj';
BoxSetup.mesh_color(1,:)      = [0.25, 0.25, 0.25];
BoxSetup.joint_E(1,:,:)       = eye(3);
BoxSetup.joint_r(1,:)         = [0.0 0.0 0.0];
BoxSetup.mesh_center(1,:)     = [0 0 0];
BoxSetup.mesh_dimension(1,:)  = [0.25, 0.02, 0.12];
BoxSetup.length(1)            = 0.12;
BoxSetup.mass(1,:)            = 15.0;
BoxSetup.com(1,:)             = [0.0 0.0 0.0];
BoxSetup.inertia(1,:,:)       = [diag(BoxSetup.mesh_dimension(1,:)/2).^2]*BoxSetup.mass(1,:);