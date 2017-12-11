%% ModelFactory
% Licensed under the zlib license. See LICENSE for more details.
%

function ui_readEnvironmentSetup (buttonHandle, ~, ~)
[filename,path] = uigetfile('./data/samples/*.env','Load Environment Setup');
if filename == 0
    return;
else
    if ~isempty(buttonHandle.Parent.UserData.EnvironmentSetup)
        buttonHandle.Parent = ui_initialize(buttonHandle.Parent);
        clc;
    end
end
% Read environment setup
buttonHandle.Parent.UserData.basePath = path;
disp (['Using Environment Setup in ',path,filename]);
EnvironmentSetup = fnc_readEnvironmentSetupFile ([path,filename]);

buttonHandle.Parent.UserData.EnvironmentSetup = EnvironmentSetup;
tag_EnvironmentSetupFileName = findobj('Tag','txt_EnvironmentSetupFileName');
set(tag_EnvironmentSetupFileName,'String',['Loaded ',filename]);

tag_EnvOptions = findobj('Tag','txt_EnvOptions');
set(tag_EnvOptions,'Enable','on');
tmp = strsplit(EnvironmentSetup.humanModel_DescriptionFile,'/');
humanModelDescription = fnc_readHumanModelDescriptionFile ([path,EnvironmentSetup.humanModel_DescriptionFile]);
buttonHandle.Parent.UserData.humanModelDescription = humanModelDescription;
tag_humanModelFile = findobj('Tag','txt_humanModelFileName');
set(tag_humanModelFile,'String',['Loaded ',tmp{end}],'Enable','on');

tag_popupHumanDescription = findobj('Tag','popup_humanModelDescription');
set(tag_popupHumanDescription,'Enable','on');

tag_scalingChoice = findobj('Tag','popup_menuScaling');
buttonHandle.Parent.UserData.scalingAlgorithmChosen = EnvironmentSetup.humanModel_ScalingAlgorithmChoice;
match = strcmp(buttonHandle.Parent.UserData.scalingAlgorithmChosen,buttonHandle.Parent.UserData.scalingAlgorithmOptions);
tag_scalingChoice.Value = find(match == 1,1,'first');
if isempty(tag_scalingChoice.Value)
    % This means that a custom scaling algorithm was used
    buttonHandle.Parent.UserData.scalingAlgorithmOptions{end+1} = ...
        EnvironmentSetup.humanModel_ScalingAlgorithmChoice;
    tag_scalingChoice.Value = ...
        length(buttonHandle.Parent.UserData.scalingAlgorithmOptions);
end
set(tag_scalingChoice,'Enable','on','String',buttonHandle.Parent.UserData.scalingAlgorithmOptions,'Value',tag_scalingChoice.Value);

%%%%%%%%% Anthropometry %%%%%%%%%%%%%%5
humanAnthropometry = fnc_readHumanAnthropometry...
    ([path,EnvironmentSetup.humanModel_AnthropometryFile]);
ageTag = findobj('Tag','input_personAge');
buttonHandle.Parent.UserData.humanAnthropometry.age = humanAnthropometry.age;
set(ageTag,'Enable','on','String',num2str(humanAnthropometry.age));

heightTag = findobj('Tag','input_personHeight');
buttonHandle.Parent.UserData.humanAnthropometry.height = humanAnthropometry.height;
set(heightTag,'Enable','on','String',num2str(humanAnthropometry.height));

weightTag = findobj('Tag','input_personWeight');
buttonHandle.Parent.UserData.humanAnthropometry.weight = humanAnthropometry.weight;
set(weightTag,'Enable','on','String',num2str(humanAnthropometry.weight));

pelvisTag = findobj('Tag','input_personPelvisWidth');
buttonHandle.Parent.UserData.humanAnthropometry.pelvisWidth = humanAnthropometry.pelvisWidth;
set(pelvisTag,'Enable','on','String',num2str(humanAnthropometry.pelvisWidth));

hipCenterWidthTag = findobj('Tag','input_personHipCenterWidth');
buttonHandle.Parent.UserData.humanAnthropometry.hipCenterWidth = humanAnthropometry.hipCenterWidth;
set(hipCenterWidthTag,'Enable','on','String',num2str(humanAnthropometry.hipCenterWidth));

shoulderCenterWidthTag = findobj('Tag','input_personShoulderCenterWidth');
buttonHandle.Parent.UserData.humanAnthropometry.shoulderCenterWidth = humanAnthropometry.shoulderCenterWidth;
set(shoulderCenterWidthTag,'Enable','on','String',num2str(humanAnthropometry.shoulderCenterWidth));

heelAnkleXOffsetTag = findobj('Tag','input_personHeelAnkleXOffset');
buttonHandle.Parent.UserData.humanAnthropometry.heelAnkleXOffset = humanAnthropometry.heelAnkleXOffset;
set(heelAnkleXOffsetTag,'Enable','on','String',num2str(humanAnthropometry.heelAnkleXOffset));

heelAnkleZOffsetTag = findobj('Tag','input_personHeelAnkleZOffset');
buttonHandle.Parent.UserData.humanAnthropometry.heelAnkleZOffset = humanAnthropometry.heelAnkleZOffset;
set(heelAnkleZOffsetTag,'Enable','on','String',num2str(humanAnthropometry.heelAnkleZOffset));

footWidthTag = findobj('Tag','input_personFootWidth');
buttonHandle.Parent.UserData.humanAnthropometry.footWidth =humanAnthropometry.footWidth;
set(footWidthTag,'Enable','on','String',num2str(humanAnthropometry.footWidth));

shoulderNeckZOffsetTag = findobj('Tag','input_personShoulderNeckZOffset');
buttonHandle.Parent.UserData.humanAnthropometry.shoulderNeckZOffset = humanAnthropometry.shoulderNeckZOffset;
set(shoulderNeckZOffsetTag,'Enable','on','String',num2str(humanAnthropometry.shoulderNeckZOffset));

buttonHandle.Parent.UserData.humanAnthropometry.gender = humanAnthropometry.gender;
maleTag = findobj('Tag','checkBox_genderMale');
set(maleTag,'Enable','on');
femaleTag = findobj('Tag','checkBox_genderFemale');
set(femaleTag,'Enable','on');
if humanAnthropometry.gender == 1
    ui_updateMaleGender (buttonHandle)
else
    ui_updateFemaleGender (buttonHandle)
end

tag_addMarkers = findobj('Tag','checkBox_addMarkers');
set(tag_addMarkers,'Enable','on','Value',...
    str2num(EnvironmentSetup.AddMarkers));

tag_meshTypeChoice = findobj('Tag','popup_meshTypeOptions');
buttonHandle.Parent.UserData.meshTypeChosen = ...
    EnvironmentSetup.humanModel_TypeMeshes;
match = strcmp(buttonHandle.Parent.UserData.meshTypeChosen,...
    buttonHandle.Parent.UserData.meshTypeOptions);
tag_meshTypeChoice.Value = find(match == 1,1,'first');
set(tag_meshTypeChoice,'Enable','on','Value',tag_meshTypeChoice.Value);

%%%%%%%%%%% Object Options %%%%%%%%%%%%%%
if EnvironmentSetup.nObjects > 0
    
  tag_EnvObjectOptions = findobj('Tag','txt_EnvObjectOptions');
  set(tag_EnvObjectOptions,'Enable','on');
  
  for objID = 1:EnvironmentSetup.nObjects
      objectList{objID} = ...
          EnvironmentSetup.objects(objID).modelSetupChoice;
  end
  tag_objectList = findobj('Tag','popup_menuObjectList');
  set(tag_objectList,'Enable','on','String',objectList,'Value',1);
  
  tag_EnvObjectModelFile = findobj('Tag','txt_objectModelFileName');
  tmp = strsplit(EnvironmentSetup.objects(1).modelDescriptionFile,'/');
  set(tag_EnvObjectModelFile,'String',['Loaded ',tmp{end}],'Enable','on');
  
  tag_EnvObjectSetup = findobj('Tag','txt_objectSetupChoice');  
  set(tag_EnvObjectSetup,'String',['Using setup ',...
      EnvironmentSetup.objects(1).modelSetupChoice],'Enable','on');

  tag_EnvObjectMassFile = findobj('Tag','txt_objectMassFile');
  if ~isempty(EnvironmentSetup.objects(1).modelMassProperties)
      tmp = strsplit(EnvironmentSetup.objects(1).modelMassProperties,'/');
      set(tag_EnvObjectMassFile,'String',['Loaded ',tmp{end}],'Enable','on');
  else
      set(tag_EnvObjectMassFile,'String','','Enable','off');
  end
else
    buttonHandle.Parent.UserData.EnvironmentSetup.objects = []; 
end

%%%%%%%%%%% Custom Segment Lengths %%%%%%%%%%%%%%
if ~isempty(EnvironmentSetup.humanModel_UseCustomLengths)    
    tag_txtCustomLengths = findobj('Tag','txt_CustomLengths');
    set(tag_txtCustomLengths,'Enable','on');

    tag_popupCustomLengths = findobj('Tag','popup_CustomLengths');
    set(tag_popupCustomLengths,'Enable','on');    
    
    tmp = strsplit(EnvironmentSetup.humanModel_UseCustomLengths,'/');
    customSegmentLengthsDescription = fnc_readCustomLengthsFile ([path,EnvironmentSetup.humanModel_UseCustomLengths]);
    buttonHandle.Parent.UserData.customSegmentLengthsDescription = customSegmentLengthsDescription;
    tag_txt_customSegmentLengthsFileName = findobj('Tag','txt_customSegmentLengthsFileName');
    set(tag_txt_customSegmentLengthsFileName,'String',['Loaded ',tmp{end}],'Enable','on');
else
    tag_txtCustomLengths = findobj('Tag','txt_CustomLengths');
    set(tag_txtCustomLengths,'Enable','off');

    tag_popupCustomLengths = findobj('Tag','popup_CustomLengths');
    set(tag_popupCustomLengths,'Enable','off');    
    
    buttonHandle.Parent.UserData.customSegmentLengthsDescription = [];
    tag_txt_customSegmentLengthsFileName = findobj('Tag','txt_customSegmentLengthsFileName');
    set(tag_txt_customSegmentLengthsFileName,'String','','Enable','off');
end

%%%%%%%%%%% Custom Constraints %%%%%%%%%%%%%%
if ~isempty(EnvironmentSetup.humanModel_UseCustomConstraints)    
    tag_txtCustomConstraints = findobj('Tag','txt_CustomConstraints');
    set(tag_txtCustomConstraints,'Enable','on');

    tag_popupCustomConstraints = findobj('Tag','popup_CustomConstraints');
    set(tag_popupCustomConstraints,'Enable','on');    
    
    tmp = strsplit(EnvironmentSetup.humanModel_UseCustomConstraints,'/');
    constraintsDescription = fnc_readCustomConstraintsFile ([path,EnvironmentSetup.humanModel_UseCustomConstraints]);
    buttonHandle.Parent.UserData.customConstraintsDescription = constraintsDescription;
    tag_txt_customConstraintsFileName = findobj('Tag','txt_customConstraintsFileName');
    set(tag_txt_customConstraintsFileName,'String',['Loaded ',tmp{end}],'Enable','on');
else
    tag_txtCustomConstraints = findobj('Tag','txt_CustomConstraints');
    set(tag_txtCustomConstraints,'Enable','off');

    tag_popupCustomConstraints = findobj('Tag','popup_CustomConstraints');
    set(tag_popupCustomConstraints,'Enable','off');    
    
    buttonHandle.Parent.UserData.customConstraintsDescription = [];
    tag_txt_customConstraintsFileName = findobj('Tag','txt_customConstraintsFileName');
    set(tag_txt_customConstraintsFileName,'String','','Enable','off');    
end

%%%%%%%%%%% Custom Markers %%%%%%%%%%%%%%
if ~isempty(EnvironmentSetup.UseCustomMarkers)    
    tag_txtCustomMarkers = findobj('Tag','txt_CustomMarkers');
    set(tag_txtCustomMarkers,'Enable','on');

    tag_popupCustomMarkers = findobj('Tag','popup_CustomMarkers');
    set(tag_popupCustomMarkers,'Enable','on');    
    
    tmp = strsplit(EnvironmentSetup.UseCustomMarkers,'/');
    MarkerDescription = fnc_readCustomMarkerFile ([path,EnvironmentSetup.UseCustomMarkers]);
    buttonHandle.Parent.UserData.customMarkerDescription = MarkerDescription;
    tag_txt_customMarkersFileName = findobj('Tag','txt_customMarkersFileName');
    set(tag_txt_customMarkersFileName,'String',['Loaded ',tmp{end}],'Enable','on');
else
    tag_txtCustomMarkers = findobj('Tag','txt_CustomMarkers');
    set(tag_txtCustomMarkers,'Enable','off');

    tag_popupCustomMarkers = findobj('Tag','popup_CustomMarkers');
    set(tag_popupCustomMarkers,'Enable','off');    
    
    buttonHandle.Parent.UserData.customMarkerDescription = [];
    tag_txt_customMarkersFileName = findobj('Tag','txt_customMarkersFileName');
    set(tag_txt_customMarkersFileName,'String','','Enable','off');
end