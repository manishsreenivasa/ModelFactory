%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
% This code is based on the simple OBJ reader from Alec Jacobson with some
% updates to match the meshes shipped with ModelFactory. 
% The original OBJ reader is available at http://www.alecjacobson.com/weblog/?p=917
function [vertices,faces] = fnc_plotting_readMeshOBJ (meshFile)

  vertices = zeros(0,3);
  faces = zeros(0,3);
  v_idx = 1;
  f_idx = 1;
   
  fid = fopen (meshFile,'r');
  if fid == -1
      error(['Could not open mesh file - ',meshFile]);
  end  
  parseTxt = fgets(fid);
  while ischar(parseTxt)
    v = sscanf(parseTxt,'v %f %f %f');
    f = sscanf(parseTxt,'f %d//%d %d//%d %d//%d',6);

    if (size(v,1) > 0)
      vertices(v_idx,:) = v;
      v_idx = v_idx + 1;
    elseif (size(f,1) == 6)
      f = f(1:2:end);
      faces(f_idx,:) = f;
      f_idx = f_idx+1;
    end
    parseTxt = fgets(fid);
  end
  fclose(fid);
end