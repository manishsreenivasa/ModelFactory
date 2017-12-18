%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function fnc_plotting_plotSegmentMesh (segment, transMat, global_axes, fAlpha)
if nargin < 3
    global_axes = eye(4);
end

path = [pwd,'/data/meshes/'];
% Read mesh file
[v_orig, faces] = fnc_plotting_readMeshOBJ([path, segment.mesh_obj]);
rotated_dimensions = transMat*[segment.mesh_dimension 1]';

% Compute mesh range and mesh center 
min_mesh = [min(v_orig(:,1)) min(v_orig(:,2)) min(v_orig(:,3))];
max_mesh = [max(v_orig(:,1)) max(v_orig(:,2)) max(v_orig(:,3))];
range = abs(max_mesh - min_mesh);
mesh_axis_pos = min_mesh + 0.5*range;

% Compute translation vector and scale factor with respect to the largest components
scale = abs(rotated_dimensions(1:3)'./range);
translate = -[(mesh_axis_pos.*scale) 1] + (transMat*[segment.mesh_center 1]')';

% Apply transformations
v_scaled = v_orig.*repmat(scale(1:3), length(v_orig),1);
v_translated = v_scaled + repmat(translate(1:3), length(v_orig),1);
v_final = (global_axes*transMat'*[v_translated , ones(length(v_orig), 1)]')';

if is_octave
  trisurf(faces, v_final(:,1), v_final(:,2), v_final(:,3), 'EdgeColor','k', 'FaceColor', segment.mesh_color, 'FaceAlpha', fAlpha);
else
  trisurf(faces, v_final(:,1), v_final(:,2), v_final(:,3), 'EdgeColor','none', 'FaceColor', segment.mesh_color, 'FaceAlpha', fAlpha);
end