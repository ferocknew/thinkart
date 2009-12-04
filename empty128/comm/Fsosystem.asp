<%
'修改版2009-12-04 by Jonah.Fu
Class FsoSystem
'类属性
Private FsoObject '对像
'公共属性
Public Path '路径
Public Errshow
Public PathType '路径方式:1绝对路径.2虚拟路径
Public ExtensionName '文件过滤
'//--------------------------成员函数-------------------------------
'//--------------------------初始函数-------------------------------
Private Sub Class_Initialize()
Path=""
PathType=""
ExtensionName="exe|dll|zip|bat|rar|svn"
Set FsoObject=server.CreateObject("scripting.filesystemobject")
On Error Resume Next
TestError()
End Sub
'//--------------------------析构函数-------------------------------
Private Sub Class_Terminate()
Path=""
PathType=""
Set FsoObject=Nothing
End Sub
'----------------------------处理目录-------------------------------
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
'----------------------------文件过滤-------------------------------
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
'------------------------取出指定目录下的文件夹---------------------
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
'-----------------------取出指定目录下的所有文件--------------------
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
'-----------------------取出指定制定路径下的文件夹信息--------------------
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

'-----------------------取出指定制定路径下的文件信息--------------------
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
'-----------------------------读取文件--------------------------------------
function readfile()
Set txt =FsoObject.OpenTextFile(Optiondir())
If Not txt.atEndOfStream Then '先确定还没有到达结尾的位置
    Content = txt.ReadAll '读取整个文件的数据
End If
set txt=nothing
readfile=Content
end function
'-----------------------------写入文件--------------------------------------
function writefile(Text)
set f=FsoObject.createTextFile(Optiondir(),True)
f.Write Text
f.Close
end function
'-----------------------------错误处理--------------------------------------
Private function TestError()
if Err.number>0 then
response.write("错误信息:<br>错误代码->"&err.Code&"<br>"&err.Category&"<br>"&err.Description)
end if
end function
Private function TestNum()
if Path="" or PathType="" then
response.write("错误信息:Path或PathType属性不能为空.")
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