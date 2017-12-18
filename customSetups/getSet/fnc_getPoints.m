%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function segment = fnc_getPoints (segment, pointType, humanAnthropometry)

% Load model dictionary
dict_definitions;
pointsIDXMatch = strmatch (pointType, {PointsTypesDictionary(:).name}, 'exact');
segment.pointNames = PointsTypesDictionary(pointsIDXMatch).points.name;
[~, nPoints] = size(segment.pointNames);
if PointsTypesDictionary(pointsIDXMatch).customOffsetFoot
    % This is strange segment. e.g. foot, and we should use a custom
    % offset as described in the corresponding dictionary input
    fnc_points = PointsTypesDictionary(pointsIDXMatch).points.rel_functional_distance;
    for p = 1:nPoints
        if isempty(humanAnthropometry.footWidth) || isnan(humanAnthropometry.footWidth)
            segment.points(p,:) = [fnc_points(p,1)*segment.length-humanAnthropometry.heelAnkleXOffset...
                0.0...
                -humanAnthropometry.heelAnkleZOffset];
        else
            segment.points(p,:) = [fnc_points(p,1)*segment.length-humanAnthropometry.heelAnkleXOffset...
                fnc_points(p,2)*humanAnthropometry.footWidth...
                -humanAnthropometry.heelAnkleZOffset];
        end
    end
else
    rel_points = PointsTypesDictionary(pointsIDXMatch).points.rel_position_to_joint_center;
    segment.points = rel_points.*segment.length;
end