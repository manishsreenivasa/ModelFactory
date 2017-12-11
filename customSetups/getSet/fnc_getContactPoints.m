%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function segment = fnc_getContactPoints (segment, contactType, humanAnthropometry, customContacts)

if nargin < 4
    % Load model dictionary
    dict_definitions;
    contactsIDXMatch = strmatch (contactType, {ContactsTypesDictionary(:).name}, 'exact');
    rel_points = ContactsTypesDictionary(contactsIDXMatch).points.rel_position_to_joint_center;    
    segment.contactPointNames = ContactsTypesDictionary(contactsIDXMatch).points.name;
    [nPoints,~] = size(rel_points);
    if ContactsTypesDictionary(contactsIDXMatch).customOffsetFoot
        % This is strange segment. e.g. foot, and we should use a custom
        % offset as described in the corresponding dictionary input
        % This is quite messy. Process should be cleaned up. 
        %  - Manish, 24.05.2017
        fnc_points = ContactsTypesDictionary(contactsIDXMatch).points.rel_functional_distance;    
        for p = 1:nPoints
            segment.contactPoints(p,:) = [fnc_points(p,1)*segment.length-humanAnthropometry.heelAnkleXOffset...
                fnc_points(p,2)*humanAnthropometry.footWidth...
                -humanAnthropometry.heelAnkleZOffset];
        end
    else
        segment.contactPoints = rel_points.*segment.length;
    end
else
    error ('Custom contact points functionality not yet added.. come back later');
end