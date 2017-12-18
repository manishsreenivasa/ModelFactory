%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function fnc_writeLUAFile (model, LUAFileName, metadata)

[fid] = fopen (LUAFileName,'wt');
fprintf(fid,'return {\n');

% Write meta information
if ~isempty(metadata)
    fprintf(fid,'metadata = {');
    fprintf(fid,'\n\t {scaling_used = {"%s"},', metadata.scaling_used);
    fprintf(fid,'\n\t subject_age = {%.1f},', metadata.subject_age);
    fprintf(fid,'\n\t subject_height = {%.2f},', metadata.subject_height);
    fprintf(fid,'\n\t subject_weight = {%.2f},', metadata.subject_weight);
    if metadata.subject_gender == 1
        fprintf(fid,'\n\t subject_gender = {"male"},');
    else
        fprintf(fid,'\n\t subject_gender = {"female"},');
    end
    fprintf(fid,'\n\t subject_pelvisWidth = {%.4f},', metadata.subject_pelvisWidth);
    fprintf(fid,'\n\t subject_hipCenterWidth = {%.4f},', metadata.subject_hipCenterWidth);
    fprintf(fid,'\n\t subject_shoulderCenterWidth = {%.4f},', metadata.subject_shoulderCenterWidth);
    fprintf(fid,'\n\t subject_heelAnkleXOffset = {%.4f},', metadata.subject_heelAnkleXOffset);
    fprintf(fid,'\n\t subject_heelAnkleZOffset = {%.4f},', metadata.subject_heelAnkleZOffset);
    fprintf(fid,'\n\t subject_shoulderNeckZOffset = {%.4f},', metadata.subject_shoulderNeckZOffset);
    fprintf(fid,'\n\t subject_footWidth = {%.4f},},\n', metadata.subject_footWidth);    
    fprintf(fid,'},\n');
end

% Write global frame information
fprintf(fid,'gravity = { 0, 0, -9.81,},\n');
fprintf(fid,'configuration = {\n\taxis_front = { 1, 0, 0,},');
fprintf(fid,'\n\taxis_right = { 0, -1, 0,},');
fprintf(fid,'\n\taxis_up = { 0, 0, 1,},\n},');

% Write points
fprintf (fid,'\npoints = {');
for i = 1:length(model)
    if ~isempty(model{i}.points)
        [nPoints,~] = size(model{i}.points);
        for l = 1:nPoints
            fprintf(fid,'\n\t{name = "%s", ', char(model{i}.pointNames(l)));
            fprintf(fid,'body = "%s", ', char(model{i}.name));
            fprintf(fid,'point = {%6f, %6f, %6f,},},', ...
                model{i}.points(l,1), model{i}.points(l,2), model{i}.points(l,3));
        end
    end
end
fprintf(fid,'\n},');

% Write constraint sets
fprintf (fid,'\nconstraint_sets = {');
for i = 1:length(model)
    if ~isempty(model{i}.constraintSet)
        [~,nSets] = size(model{i}.constraintSet.set);
        for j = 1:nSets
             fprintf (fid,'\n\t %s = {', model{i}.constraintSet.set(j).name);
             [nConstraints,~] = size(model{i}.constraintSet.set(j).pointConstraints);
             for k = 1:nConstraints
                 fprintf(fid,'\n\t{point = "%s", ', ...
                     char(model{i}.constraintSet.set(j).pointNames(k)));
                 fprintf(fid,'normal = {%d, %d, %d,},},', ...
                     model{i}.constraintSet.set(j).pointConstraints(k,1), ...
                     model{i}.constraintSet.set(j).pointConstraints(k,2), ...
                    model{i}.constraintSet.set(j).pointConstraints(k,3));
             end             
             fprintf(fid,'\n\t},');
        end         
    end
end
fprintf(fid,'\n},');

% Write model information
fprintf(fid,'\nframes = {');
for i = 1:length(model)
    fprintf(fid,'\n\t{name   = "%s",', model{i}.name);
    fprintf(fid,'\n\tparent = "%s",', model{i}.parent);
    
    % Write joint frame
    fprintf(fid,'\n\tjoint_frame = {');
    fprintf(fid,'\n\t\tr = ');
    fnc_writeLUAMatrix (fid, model{i}.joint_r, 1);
    fprintf(fid,'\n\t\tE = \n');
    fnc_writeLUAMatrix (fid, model{i}.joint_E, 3); fprintf(fid,'\n\t},');
    
    % Write body info
    fprintf(fid,'\n\tbody = {');
    fprintf(fid,'\n\t\tmass   = %f,', model{i}.mass);
    fprintf(fid,'\n\t\tcom = ');                        
    fnc_writeLUAMatrix (fid, model{i}.com, 1);
    fprintf(fid,'\n\t\tinertia = \n');                  
    fnc_writeLUAMatrix (fid, model{i}.inertia, 3); fprintf(fid,'\n\t},');
    
    % Write joint info
    fprintf(fid,'\n\tjoint= \n');
    [n1,~] = size(model{i}.joint);
    if n1 == 1
        fprintf(fid,'{');                               
        fnc_writeLUAMatrix (fid, model{i}.joint,2);       
        fprintf(fid,'},');
    else
        fnc_writeLUAMatrix(fid, model{i}.joint, 2);
    end
    
    % Write markers
    fprintf (fid,'\n\tmarkers = {');
    [nMarkers,~] = size(model{i}.marker_names);
    if size(nMarkers) > 0
        for l = 1:nMarkers
            fprintf(fid,'\n\t\t%s = ',model{i}.marker_names(l,:));
            fnc_writeLUAMatrix(fid, model{i}.marker_values(l,:), 1)
        end
    end
    fprintf(fid,'},');
    
    % Write mesh visuals
    fprintf(fid,'\n\tvisuals = {{');
    fprintf(fid,'\n\t\tsrc         = "%s",', model{i}.mesh_obj);
    fprintf(fid,'\n\t\tdimensions  = '); 
    fnc_writeLUAMatrix (fid, model{i}.mesh_dimension, 1);
    fprintf(fid,'\n\t\tmesh_center = '); 
    fnc_writeLUAMatrix (fid, model{i}.mesh_center, 1);
    fprintf(fid,'\n\t\tcolor       = '); 
    fnc_writeLUAMatrix (fid, model{i}.mesh_color, 1);
    fprintf(fid,'\n\t\t},},\n\t},');
end

fprintf(fid,'\n\t},\n}');
fclose(fid);
end

function fnc_writeLUAMatrix(file, matrix, tabnumber)
[N, M] = size(matrix);
if N > 0
    for k = 1:N
        for n=1:tabnumber
            fprintf(file,'\t');
        end
        if k==1 && N>1
            fprintf(file,'{');
        end
        fprintf(file,'{');
        for j=1:M
            fprintf(file,' %f,',matrix(k,j));
        end
        if k==N
            if N>1
                fprintf(file,'},},');
            else
                fprintf(file,'},');
            end
        else
            fprintf(file,'},\n');
        end
    end
else
    for n=1:tabnumber
        fprintf(file,'\t');
    end
    fprintf(file,'{},');
end
end