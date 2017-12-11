function ui_setCurrentObject(buttonHandle, ~, ~)

tag_objectList = findobj('Tag','popup_menuObjectList');
objID = tag_objectList.Value;

EnvironmentSetup = buttonHandle.Parent.UserData.EnvironmentSetup;

tag_EnvObjectModelFile = findobj('Tag','txt_objectModelFileName');
tmp = strsplit(EnvironmentSetup.objects(objID).modelDescriptionFile,'/');
set(tag_EnvObjectModelFile,'String',['Loaded ',tmp{end}],'Enable','on');

tag_EnvObjectSetup = findobj('Tag','txt_objectSetupChoice');
set(tag_EnvObjectSetup,'String',['Using setup ',...
    EnvironmentSetup.objects(objID).modelSetupChoice],'Enable','on');

tag_EnvObjectMassFile = findobj('Tag','txt_objectMassFile');
if ~isempty(EnvironmentSetup.objects(objID).modelMassProperties)
    tmp = strsplit(EnvironmentSetup.objects(objID).modelMassProperties,'/');
    set(tag_EnvObjectMassFile,'String',['Loaded ',tmp{end}],'Enable','on');
else
    set(tag_EnvObjectMassFile,'String','','Enable','off');
end