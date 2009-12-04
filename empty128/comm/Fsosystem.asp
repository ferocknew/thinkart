<%
'�޸İ�2009-12-04 by Jonah.Fu
Class FsoSystem
'������
Private FsoObject '����
'��������
Public Path '·��
Public Errshow
Public PathType '·����ʽ:1����·��.2����·��
Public ExtensionName '�ļ�����
'//--------------------------��Ա����-------------------------------
'//--------------------------��ʼ����-------------------------------
Private Sub Class_Initialize()
Path=""
PathType=""
ExtensionName="exe|dll|zip|bat|rar|svn"
Set FsoObject=server.CreateObject("scripting.filesystemobject")
On Error Resume Next
TestError()
End Sub
'//--------------------------��������-------------------------------
Private Sub Class_Terminate()
Path=""
PathType=""
Set FsoObject=Nothing
End Sub
'----------------------------����Ŀ¼-------------------------------
Private function Optiondir()
		TestNum()
		if PathType="1" then
		OptionPath=Path
		else
		OptionPath=server.mappath(Path)
		end if
		if FsoObject.FolderExists(OptionPath) or FsoObject.FileExists(OptionPath) then
		Optiondir=OptionPath
		else
		response.write("1111"&Path&"11111")
		response.End()
		end if
end function
'----------------------------�ļ�����-------------------------------
Private function CheakFileExt(filename)
	dim Ext
	extname=ExtensionName
	extname=split(extname,"|")
	for i=0 to Ubound(extname)
		if FsoObject.GetExtensionName(filename)=extname(i) then
			Ext=0
			exit for
		else
			Ext=1
		end if
	next
	if Ext=1 then
		CheakFileExt=True
	else
		CheakFileExt=False
	end if
end function
'------------------------ȡ��ָ��Ŀ¼�µ��ļ���---------------------
Public function SunGetFolder()
set sundir=FsoObject.GetFolder(Optiondir())
dim FolderList()
dim i
redim Preserve FolderList(0)
FolderList(0)=False
i=0
'response.write(sundir.ParentFolder)
set fc=sundir.SubFolders
for Each f1 in fc
If CheakFileExt(f1.name)=True Then
redim Preserve FolderList(i)
FolderList(i)=f1.name
i=i+1
End if
Next
SunGetFolder=FolderList
end function
'-----------------------ȡ��ָ��Ŀ¼�µ������ļ�--------------------
Public Function GetFolderFiles()
	Dim FolderFiles()
	Dim objFolder
	Dim objFiles
	Dim objFile
	Dim OptionPath
	Dim rno
	Dim i
	ReDim Preserve FolderFiles(0)
	FolderFiles(0)=False
	i=0
	Set objFolder=FsoObject.GetFolder(Optiondir())
	On Error Resume Next
	Set objFiles=objFolder.Files
	For Each objFile In objFiles
	If CheakFileExt(objFile.name)=True Then
	redim Preserve FolderFiles(i)
	FolderFiles(i)=objFile.name
	i=i+1
	end if
	next
	GetFolderFiles=FolderFiles
end Function
'-----------------------ȡ��ָ���ƶ�·���µ��ļ�����Ϣ--------------------
Public Function getFolderInfo(Path)
OptionPath=server.mappath(Path)
		If Not FsoObject.FolderExists(OptionPath) Then
		response.write("2222"&Path&"2222")
		response.End()
		End If

Set file=FsoObject.GetFolder(OptionPath)
dim File_info(9)
File_info(0)=file.DateCreated
File_info(1)=file.DateLastAccessed
File_info(2)=file.DateLastModified
File_info(3)=file.size
File_info(4)=file.Attributes
getFolderInfo=File_info
Set file=Nothing
End Function

'-----------------------ȡ��ָ���ƶ�·���µ��ļ���Ϣ--------------------
Public Function getFileInfo(Path)
OptionPath=server.mappath(Path)
		If Not FsoObject.FileExists(OptionPath) then
		response.write("333"&Path&"33333")
		response.End()
		end if

Set file=FsoObject.GetFile(OptionPath)
dim File_info(9)
File_info(0)=file.DateCreated
File_info(1)=file.DateLastAccessed
File_info(2)=file.DateLastModified
File_info(3)=file.size
File_info(4)=file.Attributes
getFileInfo=File_info
Set file=Nothing
End Function
'-----------------------------��ȡ�ļ�--------------------------------------
function readfile()
Set txt =FsoObject.OpenTextFile(Optiondir())
If Not txt.atEndOfStream Then '��ȷ����û�е����β��λ��
    Content = txt.ReadAll '��ȡ�����ļ�������
End If
set txt=nothing
readfile=Content
end function
'-----------------------------д���ļ�--------------------------------------
function writefile(Text)
set f=FsoObject.createTextFile(Optiondir(),True)
f.Write Text
f.Close
end function
'-----------------------------������--------------------------------------
Private function TestError()
if Err.number>0 then
response.write("������Ϣ:<br>�������->"&err.Code&"<br>"&err.Category&"<br>"&err.Description)
end if
end function
Private function TestNum()
if Path="" or PathType="" then
response.write("������Ϣ:Path��PathType���Բ���Ϊ��.")
response.end
end if
end Function


Private Function ShowFileAttr(File)
FileAttrNormal  = 0
FileAttrReadOnly = 1
FileAttrHidden = 2
FileAttrSystem = 4
FileAttrVolume = 8
FileAttrDirectory = 16
FileAttrArchive = 32
FileAttrAlias = 64
FileAttrCompressed = 128

Dim S
Dim Attr
Attr = File.Attributes
If Attr = 0 Then
  ShowFileAttr = "Normal"
  Exit Function
End If
If Attr And FileAttrDirectory  Then S = S & "Directory "
If Attr And FileAttrReadOnly   Then S = S & "Read-Only "
If Attr And FileAttrHidden     Then S = S & "Hidden "
If Attr And FileAttrSystem     Then S = S & "System "
If Attr And FileAttrVolume     Then S = S & "Volume "
If Attr And FileAttrArchive    Then S = S & "Archive "
If Attr And FileAttrAlias      Then S = S & "Alias "
If Attr And FileAttrCompressed Then S = S & "Compressed "
ShowFileAttr = S
End Function
end Class

%>