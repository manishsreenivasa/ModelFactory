%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function fnc_plotting_plotModel (model, plotJoints, plotPoints, plotComs,...
    plotMarkers, printLabels, fAlpha, markerSize, rootDisplacement)

if nargin < 9
    rootDisplacement = [0 0 0];
end
nSegments = length(model);
for i = 1:nSegments
	parent_names{i} = model{i}.parent;
	segment_names{i} = model{i}.name;
end
% Plot root segment first
rootSegmentID = strmatch ('ROOT', parent_names, 'exact');
global_axes(rootSegmentID).mat = [model{rootSegmentID}.joint_E ...
    model{rootSegmentID}.joint_r'+rootDisplacement'; 0 0 0 1];

% Plot points, if any exist
if plotPoints == 1
    if ~isempty(model{rootSegmentID}.points)
        [numPoints,~] = size(model{rootSegmentID}.points);
        for pointNo = 1:numPoints
            global_position = global_axes(rootSegmentID).mat*...
                [model{rootSegmentID}.points(pointNo,:) 1]';
            plot3(global_position(1), global_position(2),...
                global_position(3), 'or', 'markersize', markerSize,...
                'markerfacecolor', 'r');
            if printLabels == 1
                text(global_position(1), global_position(2),...
                    global_position(3),...
                    char(model{rootSegmentID}.pointNames(pointNo)),...
                    'interpreter','none');
            end
        end
    end
end

% Plot pelvis COM
if plotComs == 1
    global_COM_position = global_axes(1).mat*[model{1}.com 1]';
    plot3(global_COM_position(1), global_COM_position(2), global_COM_position(3), 'oc','markerfacecolor','c','markersize', markerSize);
end

if plotMarkers == 1
    [numMarkers,~] = size(model{rootSegmentID}.marker_names);
    for markerNo = 1:numMarkers
        global_marker_position = global_axes(rootSegmentID).mat*[model{rootSegmentID}.marker_values(markerNo,:) 1]';
        plot3(global_marker_position(1), global_marker_position(2), global_marker_position(3), 'ob', 'markersize', markerSize, 'markerfacecolor', 'b');
        if printLabels == 1
            text(global_marker_position(1), global_marker_position(2), global_marker_position(3), model{rootSegmentID}.marker_names(markerNo,:),'interpreter','none');
        end
    end
end
if plotJoints == 1
    fnc_plotting_plotJointAxis (global_axes(rootSegmentID).mat, 'k', 5, 0.05);
end

% Plot all other segments
for segmentID = 1:nSegments
    if isempty(model{segmentID}.parentID)
        continue;
    end
    global_axes(segmentID).mat = global_axes(model{segmentID}.parentID).mat*[inv(model{segmentID}.joint_E) model{segmentID}.joint_r'; 0 0 0 1];
    
    % Plot markers, if any exist
    if plotMarkers == 1
        [numMarkers,~] = size(model{segmentID}.marker_names);
        for markerNo = 1:numMarkers
            global_marker_position = global_axes(segmentID).mat*[model{segmentID}.marker_values(markerNo,:) 1]';
            plot3(global_marker_position(1), global_marker_position(2), global_marker_position(3), 'ob', 'markersize', markerSize, 'markerfacecolor', 'b');
            if printLabels == 1
                text(global_marker_position(1), global_marker_position(2), global_marker_position(3), model{segmentID}.marker_names(markerNo,:),'interpreter','none');
            end
        end
    end
    if plotJoints == 1
        fnc_plotting_plotJointAxis(global_axes(segmentID).mat, 'k', 5, 0.05);
    end
    
    % Plot points, if any exist
    if plotPoints == 1
        if ~isempty(model{segmentID}.points)
            [numPoints,~] = size(model{segmentID}.points);
            for pointNo = 1:numPoints
                global_position = global_axes(segmentID).mat*[model{segmentID}.points(pointNo,:) 1]';
                plot3(global_position(1), global_position(2), global_position(3), 'or', 'markersize', markerSize, 'markerfacecolor', 'r');
                if printLabels == 1
                    text(global_position(1), global_position(2), global_position(3), char(model{segmentID}.pointNames(pointNo)),'interpreter','none');
                end
            end
        end
    end
    
    if plotComs == 1
        global_COM_position = global_axes(segmentID).mat*[model{segmentID}.com 1]';
        plot3(global_COM_position(1), global_COM_position(2), global_COM_position(3), 'oc','markerfacecolor','c','markersize', markerSize);
    end
end

mesh_to_root = [[1 0 0; 0 cos(pi/2) sin(pi/2); 0 -sin(pi/2) cos(pi/2)] [0 0 0]'; 0 0 0 1];
for i = 1:nSegments
    fnc_plotting_plotSegmentMesh (model{i}, mesh_to_root, global_axes(i).mat, fAlpha);
end