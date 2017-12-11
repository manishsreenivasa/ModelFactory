%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function fnc_writeCombinedLuaFile (filename, metadata, humanModel, ...
    objects, customConstraints)

[fid] = fopen (filename,'wt');

fprintf(fid,'return {\n');
% Write meta information
if ~isempty(metadata)
    fprintf(fid,'metadata = {');
    fprintf(fid,'\n\t {scaling_used = "%s",', metadata.scaling_used);
    fprintf(fid,'\n\t subject_age = %.1f,', metadata.subject_age);
    fprintf(fid,'\n\t subject_height = %.2f,', metadata.subject_height);
    fprintf(fid,'\n\t subject_weight = %.2f,', metadata.subject_weight);
    if metadata.subject_gender == 1
        fprintf(fid,'\n\t subject_gender = "male",');
    else
        fprintf(fid,'\n\t subject_gender = "female",');
    end
    fprintf(fid,'\n\t subject_pelvisWidth = %.4f,', metadata.subject_pelvisWidth);
    fprintf(fid,'\n\t subject_hipCenterWidth = %.4f,', metadata.subject_hipCenterWidth);
    fprintf(fid,'\n\t subject_shoulderCenterWidth = %.4f,', metadata.subject_shoulderCenterWidth);
    fprintf(fid,'\n\t subject_heelAnkleXOffset = %.4f,', metadata.subject_heelAnkleXOffset);
    fprintf(fid,'\n\t subject_heelAnkleZOffset = %.4f,', metadata.subject_heelAnkleZOffset);
    fprintf(fid,'\n\t subject_shoulderNeckZOffset = %.4f,', metadata.subject_shoulderNeckZOffset);
    fprintf(fid,'\n\t subject_footWidth = %.4f,', metadata.subject_footWidth);
    for i = 1:length(objects)
        fprintf(fid,'\n\t objectModel%d = "%s",', i, metadata.objectsInfo(i).modelSetupChoice);
    end
    fprintf(fid,'},\n},\n');
end

% Write global frame information
fprintf(fid,'gravity = { 0, 0, -9.81,},\n');
fprintf(fid,'configuration = {\n\taxis_front = { 1, 0, 0,},');
fprintf(fid,'\n\taxis_right = { 0, -1, 0,},');
fprintf(fid,'\n\taxis_up = { 0, 0, 1,},\n},');

% Write contact point information
fprintf (fid,'\npoints = {');
if ~isempty(humanModel)
    write_contactPointsLua (humanModel, fid);
end
for i = 1:length(objects)
    write_contactPointsLua (objects(i).objectModel, fid);
end
fprintf(fid,'\n},');

% Write constraint set information
fprintf (fid,'\nconstraint_sets = {');
if ~isempty(humanModel)
    write_constraintSetsLua (humanModel, fid);
end
for i = 1:length(objects)
    write_constraintSetsLua (objects(i).objectModel, fid);
end
% Write custom constraint set information
if ~isempty(customConstraints)
    write_customConstraintsLua (customConstraints, humanModel,  objects, fid);
end
fprintf(fid,'\n},');  % End of constraint set

% Write model information
fprintf(fid,'\nframes = {');
for i = 1:length(objects)
fnc_writeModelFramesLua (fid, objects(i).objectModel);
end
fnc_writeModelFramesLua (fid, humanModel);
fprintf(fid,'\n},'); % End of frames
fprintf(fid,'\n}'); % End of return
fclose(fid);

disp (['Wrote combined LUA file ',filename]);
end

function fnc_writeModelFramesLua (file, model)

for i = 1:length(model)
    fprintf(file,'\n\t{name   = "%s",', model{i}.name);
    fprintf(file,'\n\tparent = "%s",', model{i}.parent);
    
    % Write joint frame
    fprintf(file,'\n\tjoint_frame = {');
    fprintf(file,'\n\t\tr = ');
    fnc_writeLUAMatrix (file, model{i}.joint_r, 1);
    fprintf(file,'\n\t\tE = \n');
    fnc_writeLUAMatrix (file, model{i}.joint_E, 3);
    fprintf(file,'\n\t},');
    
    % Write body info
    fprintf(file,'\n\tbody = {');
    fprintf(file,'\n\t\tmass   = %f,', model{i}.mass);
    fprintf(file,'\n\t\tcom = ');
    fnc_writeLUAMatrix (file, model{i}.com, 1);
    fprintf(file,'\n\t\tinertia = \n');
    fnc_writeLUAMatrix (file, model{i}.inertia, 3);
    fprintf(file,'\n\t},');
    
    % Write joint info
    fprintf(file,'\n\tjoint= \n');
    [n1,~] = size(model{i}.joint);
    if n1 == 1
        fprintf(file,'\n\t\t{');
        fnc_writeLUAMatrix (file, model{i}.joint, 2);
        fprintf(file,'},');
    else
        fnc_writeLUAMatrix (file, model{i}.joint, 2);
    end
    
    % Write markers
    fprintf (file,'\n\tmarkers = {');
    [nMarkers,~] = size(model{i}.marker_names);
    if size(nMarkers) > 0
        for l = 1:nMarkers
            fprintf(file,'\n\t\t%s = ',model{i}.marker_names(l,:));
            fnc_writeLUAMatrix(file, model{i}.marker_values(l,:), 1)
        end
    end
    fprintf(file,'},');
    
    % Write mesh visuals
    fprintf(file,'\n\tvisuals = {{');
    fprintf(file,'\n\t\tsrc         = "%s",', model{i}.mesh_obj);
    fprintf(file,'\n\t\tdimensions  = ');
    fnc_writeLUAMatrix (file, model{i}.mesh_dimension, 1);
    fprintf(file,'\n\t\tmesh_center = ');
    fnc_writeLUAMatrix (file, model{i}.mesh_center, 1);
    fprintf(file,'\n\t\tcolor       = ');
    fnc_writeLUAMatrix (file, model{i}.mesh_color, 1);
    fprintf(file,'\n\t\t},},');
    fprintf(file,'\n\t},');
end
end

function write_customConstraintsLua (constraints, humanModel, objects, fid)

n_customConstraints = length(constraints);
n_modelSegment = length(humanModel);

nObjects = length(objects);


for i = 1:n_modelSegment
    modelSegment_names{i} = humanModel{i}.name;
end
count = 1;
for i = 1:nObjects
    n_objectSegment = length(objects(i).objectModel);
    for j = 1:n_objectSegment
        objectAllSegment_names{count,1} = objects(i).objectModel{j}.name;
        objectAllSegment_names{count,2} = i;
        count = count + 1;
    end
end

for constID = 1:n_customConstraints
    fprintf (fid,'\n\t %s = {', constraints(constID).name);
    [~,nSets] = size(constraints(constID).set);
    for j = 1:nSets
        if strmatch(constraints(constID).set(j).type,'point')
            [nConstraints,~] = size(constraints(constID).set(j).pointConstraints);
            for k = 1:nConstraints
                fprintf(fid,'\n\t{point = "%s", ', char(constraints(constID).set(j).pointNames(k)));
                fprintf(fid,'normal = {%d, %d, %d,},},', constraints(constID).set(j).pointConstraints(k,1), ...
                    constraints(constID).set(j).pointConstraints(k,2), ...
                    constraints(constID).set(j).pointConstraints(k,3));
            end
        elseif strmatch(constraints(constID).set(j).type,'loop')
            
            fprintf (fid,'\n\t{ctype = "loop", name = "%s",', constraints(constID).set(j).name);
            fprintf (fid,'\n\t predecessor_body = "%s",', constraints(constID).set(j).predecessor_body);
            fprintf (fid,'\n\t successor_body = "%s",', constraints(constID).set(j).successor_body);
            
            % Write predecessor transform field
            fprintf (fid,'\n\t predecessor_transform = {');
            contactBody = []; r = []; E = [];
            if ~isempty (constraints(constID).set(j).predecessor_transform_contact)
                % Search for contact body among human and object models
                if ~isempty(objects)
                    if strmatch (constraints(constID).set(j).predecessor_body, {objectAllSegment_names{:,1}}, 'exact')
                        segmentMatchIdx = strmatch (constraints(constID).set(j).predecessor_body, {objectAllSegment_names{:,1}});
                        objectMatchIdx = objectAllSegment_names{segmentMatchIdx,2};
                        for k = 1:length(objects(objectMatchIdx).objectModel)
                            objectSegment_names{k} = objects(objectMatchIdx).objectModel{k}.name;
                        end
                        segmentInObjectIdx = strmatch (constraints(constID).set(j).predecessor_body,...
                            objectSegment_names, 'exact');
                        contactBody = objects(objectMatchIdx).objectModel{segmentInObjectIdx};
                    end
                end
                if ~isempty(humanModel)
                    if strmatch (constraints(constID).set(j).predecessor_body, modelSegment_names, 'exact')
                        humanObjectIdx = strmatch (constraints(constID).set(j).predecessor_body, modelSegment_names, 'exact');
                        contactBody = humanModel{humanObjectIdx};
                    end
                else
                    disp ([' - In custom constraint, ', constraints(constID).set(j).name,...
                        ' could not find predecessor body,', constraints(constID).set(j).predecessor_body]);
                end
                % Search for contact point in contact body
                if strmatch (constraints(constID).set(j).predecessor_transform_contact{1}, contactBody.contactPointNames, 'exact')
                    contactPointIdx = strmatch (constraints(constID).set(j).predecessor_transform_contact{1}, contactBody.contactPointNames, 'exact');
                    r = contactBody.contactPoints(contactPointIdx,:);
                    E = eye(3);
                else
                    disp ([' - In custom constraint, ', constraints(constID).set(j).name,...
                        ' could not find predecessor contact point,', constraints(constID).set(j).predecessor_transform_contact]);
                end
            else
                % Use custom predessor contact information
                r = constraints(constID).set(j).predecessor_transform_custom.r;
                E = constraints(constID).set(j).predecessor_transform_custom.E;
            end
            fprintf (fid,'\n\t\tE = \n');
            fnc_writeLUAMatrix (fid, E, 3);
            fprintf(fid,'\n\t\tr = ');
            fnc_writeLUAMatrix (fid, r, 1);
            fprintf (fid,'\n\t },');
            
            % Write successor transform field
            fprintf (fid,'\n\t successor_transform = {');
            contactBody = []; r = []; E = [];
            if ~isempty (constraints(constID).set(j).successor_transform_contact)
                if ~isempty(objects)
                    if strmatch (constraints(constID).set(j).successor_body, {objectAllSegment_names{:,1}}, 'exact')
                        segmentMatchIdx = strmatch ...
                            (constraints(constID).set(j).successor_body, ...
                            {objectAllSegment_names{:,1}});
                        objectMatchIdx = objectAllSegment_names{segmentMatchIdx,2};
                        for k = 1:length(objects(objectMatchIdx).objectModel)
                            objectSegment_names{k} = objects(objectMatchIdx).objectModel{k}.name;
                        end
                        segmentInObjectIdx = strmatch (constraints(constID).set(j).successor_body,...
                            objectSegment_names, 'exact');
                        contactBody = objects(objectMatchIdx).objectModel{segmentInObjectIdx};
                    end
                end
                
                if ~isempty(humanModel)
                    if strmatch (constraints(constID).set(j).successor_body, modelSegment_names, 'exact')
                        humanObjectIdx = strmatch ...
                            (constraints(constID).set(j).successor_body, ...
                            modelSegment_names, 'exact');
                        contactBody = humanModel{humanObjectIdx};
                    end
                else
                    disp ([' - In custom constraint, ', constraints(constID).set(j).name,...
                        ' could not find successor body,', constraints(constID).set(j).successor_body]);
                end
                
                % Search for contact point in contact body
                if strmatch (constraints(constID).set(j).successor_transform_contact{1}, ...
                        contactBody.contactPointNames, 'exact')
                    contactPointIdx = strmatch ...
                        (constraints(constID).set(j).successor_transform_contact{1}, ...
                        contactBody.contactPointNames, 'exact');
                    r = contactBody.contactPoints(contactPointIdx,:);
                    E = eye(3);
                else
                    disp ([' - In custom constraint, ', ...
                        constraints(constID).set(j).name,...
                        ' could not find successor contact point,', ...
                        constraints(constID).set(j).successor_transform_contact]);
                end
            else
                % Use custom predessor contact information
                r = constraints(constID).set(j).successor_transform_custom.r;
                E = constraints(constID).set(j).successor_transform_custom.E;
            end
            fprintf (fid,'\n\t\tE = \n');
            fnc_writeLUAMatrix (fid, E, 3);
            fprintf(fid,'\n\t\tr = ');
            fnc_writeLUAMatrix (fid, r, 1);
            fprintf (fid,'\n\t },');
            
            fprintf (fid,'\n\t axis = ');
            fnc_writeLUAMatrix (fid, constraints(constID).set(j).axis, 1);
            fprintf (fid,'\n\t stabilization_coefficient = %2f,', ...
                constraints(constID).set(j).stabilization_coefficient);
            fprintf (fid,'\n\t baumgarte_enabled = %s,', ...
                constraints(constID).set(j).baumgarte_enabled);
            fprintf (fid,'\n\t },');
        else
            error (['Unknown custom constraints type: ', ...
                constraints(constID).set(j).type]);
        end
    end
    fprintf (fid,'\n\t },'); % End of Set
end
end

function write_contactPointsLua (model, fid)
for segID = 1:length(model)
    if ~isempty(model{segID}.contactPoints)
        [nPoints,~] = size(model{segID}.contactPoints);
        for l = 1:nPoints
            fprintf(fid,'\n\t{name = "%s", ', char(model{segID}.contactPointNames(l)));
            fprintf(fid,'body = "%s", ', char(model{segID}.name));
            fprintf(fid,'point = {%6f, %6f, %6f,},},', ...
                model{segID}.contactPoints(l,1), ...
                model{segID}.contactPoints(l,2), ...
                model{segID}.contactPoints(l,3));
        end
    end
end
end

function write_constraintSetsLua (model, fid)
for segID = 1:length(model)
    if ~isempty(model{segID}.constraintSet)
        [~,nSets] = size(model{segID}.constraintSet.set);
        for j = 1:nSets
            fprintf (fid,'\n\t %s = {', model{segID}.constraintSet.set(j).name);
            [nConstraints,~] = size(model{segID}.constraintSet.set(j).pointConstraints);
            for k = 1:nConstraints
                fprintf(fid,'\n\t{point = "%s", ', char(model{segID}.constraintSet.set(j).pointNames(k)));
                fprintf(fid,'normal = {%d, %d, %d,},},', ...
                    model{segID}.constraintSet.set(j).pointConstraints(k,1), ...
                    model{segID}.constraintSet.set(j).pointConstraints(k,2), ...
                    model{segID}.constraintSet.set(j).pointConstraints(k,3));
            end
            fprintf(fid,'\n\t},');
        end
    end
end
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