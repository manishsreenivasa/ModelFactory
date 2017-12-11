%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.

function [marker_names, marker_values] = fnc_addMarkersToSegments (model, modelSegment_typeName, inParam_PersonInfo, segmentID, customMarkerList)

comp_rotMatrix =  @(n, alpha)  ...
    [n(1)^2*(1 - cos(alpha) ) + cos(alpha)			, n(1)*n(2)*(1 - cos(alpha)) - n(3)*sin(alpha)	, n(1)*n(3)*(1 - cos(alpha)) + n(2)*sin(alpha); ...
    n(2)*n(1)^2*(1 - cos(alpha) ) + n(3)*sin(alpha), n(2)^2*(1 - cos(alpha)) + cos(alpha)			, n(2)*n(3)*(1 - cos(alpha)) - n(1)*sin(alpha); ...
    n(3)*n(1)*(1 - cos(alpha) ) - n(2)*sin(alpha)	, n(3)*n(2)*(1 - cos(alpha)) + n(1)*sin(alpha)	, n(3)^2*(1 - cos(alpha)) + cos(alpha)];

if isempty(customMarkerList)
    switch modelSegment_typeName
        case 'Segment_Pelvis'
            marker_names = char('LASI','RASI','LPSI','RPSI');
            marker_values(1,:) = [0.75*model{segmentID}.length,  0.5*model{segmentID}.length, 0.6*model{segmentID}.length]; % LASI
            marker_values(2,:) = [0.75*model{segmentID}.length, -0.5*model{segmentID}.length, 0.6*model{segmentID}.length]; % RASI
            marker_values(3,:) = [-0.7*model{segmentID}.length,  0.7*model{segmentID}.length, 0.7*model{segmentID}.length]; % LPSI
            marker_values(4,:) = [-0.7*model{segmentID}.length, -0.7*model{segmentID}.length, 0.7*model{segmentID}.length]; % RPSI
        case {'Segment_MiddleTrunk','Segment_MiddleTrunk_Sagittal'}
            marker_names = char('STRN','T10');
            marker_values(1,:) = [0.5*model{segmentID}.length, 0.0 , 0.5*model{segmentID}.length]; % STRN
            marker_values(2,:) = [-0.55*model{segmentID}.length, 0.0 , 0.7*model{segmentID}.length]; % T10
        case 'Segment_UpperTrunk'
            marker_names = char('C7','CLAV','RBAK');
            marker_values(1,:) = [-0.4*model{segmentID}.length, 0.0 , 0.8*model{segmentID}.length]; % C7
            marker_values(2,:) = [0.42*model{segmentID}.length, 0.0 , 0.6*model{segmentID}.length]; % CLAV
            marker_values(3,:) = [-0.4*model{segmentID}.length, -0.4*model{segmentID}.length, 0.6*model{segmentID}.length]; % RBAK
        case 'Segment_Head'
            marker_names = char('LBHD','RBHD','LFHD','RFHD');
            marker_values(1,:) = [-0.3*model{segmentID}.length, 0.3*model{segmentID}.length, 0.6*model{segmentID}.length]; % LBHD
            marker_values(2,:) = [-0.3*model{segmentID}.length, -0.3*model{segmentID}.length, 0.6*model{segmentID}.length]; % RBHD
            marker_values(3,:) = [0.3*model{segmentID}.length,  0.3*model{segmentID}.length, 0.6*model{segmentID}.length]; % LFHD
            marker_values(4,:) = [0.3*model{segmentID}.length, -0.3*model{segmentID}.length, 0.6*model{segmentID}.length]; % RFHD
        case 'Segment_Thigh_R'
            marker_names = char('RTHI','RKNE','RKNE_md');
            marker_values(1,:) = [0.0 , -0.2*model{segmentID}.length, -0.33*model{segmentID}.length]; % RTHI
            marker_values(2,:) = [0.0 , -0.15*model{segmentID}.length, -model{segmentID}.length]; % RKNE
            marker_values(3,:) = [0.0 , 0.15*model{segmentID}.length, -model{segmentID}.length]; % RKNE_md
        case 'Segment_Thigh_L'
            marker_names = char('LTHI','LKNE','LKNE_md');
            marker_values(1,:) = [0.0, 0.2*model{segmentID}.length, -0.67*model{segmentID}.length]; % LTHI
            marker_values(2,:) = [0.0, 0.15*model{segmentID}.length, -model{segmentID}.length]; % LKNE
            marker_values(3,:) = [0.0, -0.15*model{segmentID}.length, -model{segmentID}.length]; % LKNE_md
        case 'Segment_Shank_R'
            parentID = model{segmentID}.parentID;
            marker_names = char('RTIB','RKNE','RANK');
            marker_values(1,:) = [0.0 , -0.2*model{segmentID}.length, -0.33*model{segmentID}.length]; % RTIB
            marker_values(2,:) = [0.0 , -0.15*model{parentID}.length, 0.0]; % RKNE
            marker_values(3,:) = [0.0 , -0.15*model{segmentID}.length, -model{segmentID}.length]; % RANK
        case 'Segment_Shank_L'
            parentID = model{segmentID}.parentID;
            marker_names = char('LTIB' ,'LKNE','LANK');
            marker_values(1,:) = [0.0 , 0.2*model{segmentID}.length, -0.67*model{segmentID}.length]; % LTIB
            marker_values(2,:) = [0.0 , 0.15*model{parentID}.length, 0.0]; % LKNE
            marker_values(3,:) = [0.0 , 0.15*model{segmentID}.length, -model{segmentID}.length]; % LANK
        case 'Segment_Foot_R'
            parentID = model{segmentID}.parentID;
            marker_names = char('RANK','RTOE','RHEE');
            marker_values(1,:) = [0.0, -0.15*model{parentID}.length, 0.0]; % RANK
            marker_values(2,:) = [0.7*model{segmentID}.length, 0.0, -0.1*model{parentID}.length]; % RTOE
            marker_values(3,:) = [-0.3*model{segmentID}.length, 0.0, -0.1*model{parentID}.length]; % RHEE
        case 'Segment_Foot_L'
            parentID = model{segmentID}.parentID;
            marker_names = char('LANK','LTOE','LHEE');
            marker_values(1,:) = [0.0, 0.15*model{parentID}.length, 0.0]; % LANK
            marker_values(2,:) = [0.7*model{segmentID}.length, 0.0, -0.1*model{parentID}.length]; % LTOE
            marker_values(3,:) = [-0.3*model{segmentID}.length, 0.0, -0.1*model{parentID}.length]; % LHEE
        case 'Segment_UpperArm_R'
            marker_names = char('RSHO','RUPA','RELB');
            marker_values(1,:) = [0.0, 0.0, 0.1*model{segmentID}.length]; % RSHO
            marker_values(2,:) = [0.0, -0.15*model{segmentID}.length, -0.67*model{segmentID}.length]; % RUPA
            marker_values(3,:) = [0.0, -0.15*model{segmentID}.length, -model{segmentID}.length]; % RELB
        case 'Segment_UpperArm_L'
            marker_names = char('LSHO','LUPA','LELB');
            marker_values(1,:) = [0.0, 0.0, 0.1*model{segmentID}.length]; % LSHO
            marker_values(2,:) = [0.0, 0.15*model{segmentID}.length, -0.5*model{segmentID}.length]; % LUPA
            marker_values(3,:) = [0.0, 0.15*model{segmentID}.length, -model{segmentID}.length]; % LELB
        case 'Segment_LowerArm_R'
            parentID = model{segmentID}.parentID;
            marker_names = char('RELB','RWRB','RWRA');
            marker_values(1,:) = [0.0, -0.15*model{parentID}.length, 0.0]; % RELB
            marker_values(2,:) = [0.2*model{segmentID}.length, 0.0, -model{segmentID}.length]; % RWRB
            marker_values(3,:) = [-0.2*model{segmentID}.length, 0.0, -model{segmentID}.length]; % RWRA
        case 'Segment_LowerArm_L'
            parentID = model{segmentID}.parentID;
            marker_names = char('LELB','LWRB','LWRA');
            marker_values(1,:) = [0.0,  0.15*model{parentID}.length, 0.0]; % LELB
            marker_values(2,:) = [-0.2*model{segmentID}.length, 0.0, -model{segmentID}.length]; % LWRB
            marker_values(3,:) = [0.2*model{segmentID}.length, 0.0, -model{segmentID}.length]; % LWRA
        case 'Segment_Hand_R'
            parentID = model{segmentID}.parentID;
            marker_names = char('RFIN','RWRB','RWRA');
            marker_values(1,:) = [0.0, 0.0, -0.8*model{segmentID}.length]; % RFIN
            marker_values(2,:) = [0.2*model{parentID}.length, 0.0, 0.0]; % RWRB
            marker_values(3,:) = [-0.2*model{parentID}.length, 0.0, 0.0]; % RWRA
        case 'Segment_Hand_L'
            parentID = model{segmentID}.parentID;
            marker_names = char('LFIN','LWRB','LWRA');
            marker_values(1,:) = [0.0, 0.0, -0.8*model{segmentID}.length]; % LFIN
            marker_values(2,:) = [-0.2*model{parentID}.length, 0.0, 0.0]; % LWRB
            marker_values(3,:) = [0.2*model{parentID}.length, 0.0, 0.0]; % LWRA
        case 'Segment_Torso'
            marker_names = char('LASI','RASI','LPSI','RPSI','C7');
            marker_values(1,:) = [0.175*model{segmentID}.length,  0.2*model{segmentID}.length, 0.2*model{segmentID}.length]; % LASI
            marker_values(2,:) = [0.175*model{segmentID}.length, -0.2*model{segmentID}.length, 0.2*model{segmentID}.length]; % RASI
            marker_values(3,:) = [-0.15*model{segmentID}.length,  0.12*model{segmentID}.length, 0.25*model{segmentID}.length]; % LPSI
            marker_values(4,:) = [-0.15*model{segmentID}.length, -0.12*model{segmentID}.length, 0.25*model{segmentID}.length]; % RPSI
            marker_values(5,:) = [-0.15*model{segmentID}.length, 0.0 , 0.95*model{segmentID}.length]; % C7
        case 'Segment_Pelvis_Sagittal'
            marker_names = char('ASI','PSI');
            marker_values(1,:) = [0.75*model{segmentID}.length,  0.0, 0.6*model{segmentID}.length]; % ASI
            marker_values(2,:) = [-0.7*model{segmentID}.length, 0.0, 0.7*model{segmentID}.length]; % PSI
        case 'Segment_UpperTrunk_Sagittal'
            marker_names = char('C7','CLAV');
            marker_values(1,:) = [-0.4*model{segmentID}.length, 0.0 , 0.8*model{segmentID}.length]; % C7
            marker_values(2,:) = [0.42*model{segmentID}.length, 0.0 , 0.6*model{segmentID}.length]; % CLAV
        case 'Segment_Head_Sagittal'
            marker_names = char('BHD','FHD');
            marker_values(1,:) = [-0.3*model{segmentID}.length, 0.0, 0.6*model{segmentID}.length]; % BHD
            marker_values(2,:) = [0.3*model{segmentID}.length,  0.0, 0.6*model{segmentID}.length]; % FHD
        case 'Segment_Thigh_Sagittal'
            marker_names = char('THI','KNE');
            marker_values(1,:) = [0.0 , 0.0, -0.33*model{segmentID}.length]; % THI
            marker_values(2,:) = [0.0 , 0.0, -model{segmentID}.length]; % KNE
        case 'Segment_Shank_Sagittal'
            marker_names = char('TIB','ANK');
            marker_values(1,:) = [0.0 , 0.0, -0.33*model{segmentID}.length]; % TIB
            marker_values(2,:) = [0.0 , 0.0, -model{segmentID}.length]; % ANK
        case 'Segment_Foot_Sagittal'
            parentID = model{segmentID}.parentID;
            marker_names = char('TOE','HEE');
            marker_values(1,:) = [0.7*model{segmentID}.length, 0.0, -0.1*model{parentID}.length]; % TOE
            marker_values(2,:) = [-0.3*model{segmentID}.length, 0.0, -0.1*model{parentID}.length]; % HEE
        case 'Segment_UpperArm_Sagittal'
            marker_names = char('UPA','ELB');
            marker_values(1,:) = [0.0, 0.0, -0.67*model{segmentID}.length]; % UPA
            marker_values(2,:) = [0.0, 0.0, -model{segmentID}.length]; % ELB
        case 'Segment_LowerArm_Sagittal'
            marker_names = char('ELB','WRB');
            marker_values(1,:) = [0.0, 0.0, 0.0]; % ELB
            marker_values(2,:) = [0.0, 0.0, -model{segmentID}.length]; % WRB
        case 'Segment_Hand_Sagittal'
            marker_names = char('FIN','WRB');
            marker_values(1,:) = [0.0, 0.0, -model{segmentID}.length]; % FIN
            marker_values(2,:) = [0.0, 0.0, 0.0]; % WRB
        otherwise
            marker_names = char('');
            marker_values = [];
    end
else
    marker_names = [];
    MC = 1;
    MarkerSegInd = strmatch (modelSegment_typeName, customMarkerList{1}(:), 'exact');
    if ~isempty(MarkerSegInd)
        for i = 1:length(MarkerSegInd)
            MarkerType = customMarkerList{2}(MarkerSegInd(i));
            if strcmp(MarkerType{1}, 'Marker')
                marker_names = [marker_names, char(customMarkerList{4}(MarkerSegInd(i)))];
                marker_values(MC,:) = [customMarkerList{10}(MarkerSegInd(i))*model{segmentID}.length, ...
                    customMarkerList{11}(MarkerSegInd(i))*model{segmentID}.length, ...
                    customMarkerList{12}(MarkerSegInd(i))*model{segmentID}.length];
                MC = MC + 1;
            elseif strcmp(MarkerType{1}, 'Cluster') || strcmp(MarkerType{1}, 'DoubleCluster')
                angleX = customMarkerList{13}(MarkerSegInd(i))*pi/180;
                angleY = customMarkerList{14}(MarkerSegInd(i))*pi/180;
                angleZ = customMarkerList{15}(MarkerSegInd(i))*pi/180;
                size = customMarkerList{3}(MarkerSegInd(i));
                
                point2 = [0; 0; size];
                point3 = [ sin(-1/3*pi)*size; 0; cos(-1/3*pi)*size ];
                midPoint = (point2 + point3)./3;
                
                rotationMatrixX = comp_rotMatrix( [1;0;0], angleX);
                y_hat = rotationMatrixX'*[0; 1; 0];
                rotationMatrixY = comp_rotMatrix( y_hat, angleY);
                z_hat = rotationMatrixY'*rotationMatrixX'*[0; 0; 1];
                rotationMatrix = rotationMatrixX * rotationMatrixY * comp_rotMatrix( z_hat, angleZ);
                
                names(1) = customMarkerList{4}(MarkerSegInd(i));
                names(2) = customMarkerList{5}(MarkerSegInd(i));
                names(3) = customMarkerList{6}(MarkerSegInd(i));
                
                point1 = [0; 0; 0];
                point2 = [0; 0; size];
                point3 = [ sin(-1/3*pi)*size; 0; cos(-1/3*pi)*size ];
                midPoint = (point1 + point2 + point3)./3;
                
                if strcmp(MarkerType{1}, 'DoubleCluster')
                    names(4) = customMarkerList{7}(MarkerSegInd(i));
                    names(5) = customMarkerList{8}(MarkerSegInd(i));
                    names(6) = customMarkerList{9}(MarkerSegInd(i));
                    
                    point1 = [0; -0.01; 0];
                    point2 = [0; -0.01; size];
                    point3 = [ sin(-1/3*pi)*size; -0.01; cos(-1/3*pi)*size ];
                    midPoint = (point1 + point2 + point3)./3;
                end
                marker_names = [char(marker_names); char(names(:))];
                
                if strcmp(model{segmentID}.name, 'Pelvis')
                    center = [customMarkerList{10}(MarkerSegInd(i))*model{segmentID}.length; ...
                        customMarkerList{11}(MarkerSegInd(i))*inParam_PersonInfo.pelvisWidth; ...
                        customMarkerList{12}(MarkerSegInd(i))*model{segmentID}.length];
                elseif strncmpi(model{segmentID}.name, 'Foot', 4) || strncmpi(model{segmentID}.name, 'Foot', 4)
                    center = [customMarkerList{10}(MarkerSegInd(i))*model{segmentID}.length; ...
                        customMarkerList{11}(MarkerSegInd(i))*inParam_PersonInfo.footWidth; ...
                        customMarkerList{12}(MarkerSegInd(i))*inParam_PersonInfo.heelAnkleZOffset];
                else
                    center = [customMarkerList{10}(MarkerSegInd(i))*model{segmentID}.length; ...
                        customMarkerList{11}(MarkerSegInd(i))*model{segmentID}.length; ...
                        customMarkerList{12}(MarkerSegInd(i))*model{segmentID}.length];
                end
                marker_values(MC,:)   = center - rotationMatrix*(midPoint - point1);
                marker_values(MC+1,:) = center - rotationMatrix*(midPoint - point2);
                marker_values(MC+2,:) = center - rotationMatrix*(midPoint - point3);
                
                if strcmp(MarkerType{1}, 'DoubleCluster')
                    marker_values(MC+3,:) = marker_values(MC,:) + [0, 0.02, 0];
                    marker_values(MC+4,:) = marker_values(MC+1,:) + [0, 0.02, 0];
                    marker_values(MC+5,:) = marker_values(MC+2,:) + [0, 0.02, 0];
                    MC = MC + 3;
                end
                MC = MC + 3;
            else
                error (['marker type not implemented, ', customMarkerList{2}(MarkerSegInd(i))]);
            end
        end
    else
        % Segments without markers should be possible - is there a better way to do this?
        marker_names = char('');
        marker_values = [];
    end
end