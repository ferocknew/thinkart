<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="comm\Fsosystem.asp"-->
<!--#include file="comm\function_jonah(1.0.0.12).asp"-->
<!--#include file="comm\XML(1.0.0.14).asp"-->
<%
'=================================================
' Function For NewS by Jonah.Fu in UTF-8
' Ver: 0.0.2.2
' UpdateDate: 2009-11-28 14:00
'=================================================
Set fso=new FsoSystem
fso.PathType=2
'Folder参数必须为utf-8，/=%2F

Dim FolderList
file_code=SafeRequest("filecode",0) '文件类型，如果有此参数则只显示指定文件
get_file=SafeRequest("getfile",0) '是否读取文件，只支持文本类文件
path=request("Folder")
If request("Folder")="" Then
	fso.Path=GetLocationURLdriMap(0)
	path=GetLocationURLdriMap(0)
Else
	fso.Path=GetLocationURLdriMap(0)&request("Folder")
	path=GetLocationURLdriMap(0)&request("Folder")
End If


Call xmlheadResponse("utf-8")
Set xml_data=new PXML
	Call xml_data.Create("root")
	If fso.Errshow="err" Then
		Else
	
	If get_file="1" Then '获取文本类文档内容（未完成）
		
	Else
		'dir xml
		FolderList=fso.SunGetFolder()
		If FolderList(0)<>"False" Then
		For i=0 To UBound(FolderList)
		dir_path=path&"/"&FolderList(i)
			Set item_xml=xml_data.XMLRoot()
			Call xml_data.AddNode("Path_dir",item_xml)
			Set item_xml=xml_data.SelectXmlNode("Path_dir",i)
			Call xml_data.AddAttribute("name",FolderList(i),item_xml) '添加属性 name
			Call xml_data.AddAttribute("Path_type","dir",item_xml) '添加属性 Path_type
			Call xml_data.AddAttribute("Path",dir_path,item_xml) '添加属性 Path
			Call xml_data.AddAttribute("DateCreated",fso.getFolderInfo(dir_path)(0),item_xml) '添加属性 DateCreated
			Call xml_data.AddAttribute("DateLastAccessed",fso.getFolderInfo(dir_path)(1),item_xml) '添加属性 DateLastAccessed
			Call xml_data.AddAttribute("DateLastModified",fso.getFolderInfo(dir_path)(2),item_xml) '添加属性 DateLastModified
			Call xml_data.AddAttribute("size",FormatNumber(fso.getFolderInfo(dir_path)(3)/1024,2,-1),item_xml) '添加属性 size
			Call xml_data.AddAttribute("P_attr",fso.getFolderInfo(dir_path)(4),item_xml) '添加属性 P_attr
		Next
		End If

		'files xml
		FolderFiles=fso.GetFolderFiles()
		If FolderFiles(0)<>"False" Then
		For i=0 To ubound(FolderFiles)
		file_path=path&"/"&FolderFiles(i)
			Set item_xml=xml_data.XMLRoot()
			Call xml_data.AddNode("Path_file",item_xml)
			Set item_xml=xml_data.SelectXmlNode("Path_file",i)
			Call xml_data.AddAttribute("name",FolderFiles(i),item_xml) '添加属性 id
			Call xml_data.AddAttribute("Path_type","file",item_xml) '添加属性 Path_type
			file_type=Split(FolderFiles(i),".") '文件扩展名
			Call xml_data.AddAttribute("file_name",file_type(0),item_xml) '添加属性 file_name
			Call xml_data.AddAttribute("type",file_type(UBound(file_type)),item_xml) '添加属性 Path_type
			Call xml_data.AddAttribute("Path",file_path,item_xml) '添加属性 Path_type
			Call xml_data.AddAttribute("DateCreated",fso.getFileInfo(file_path)(0),item_xml) '添加属性 DateCreated
			Call xml_data.AddAttribute("DateLastAccessed",fso.getFileInfo(file_path)(1),item_xml) '添加属性 DateLastAccessed
			Call xml_data.AddAttribute("DateLastModified",fso.getFileInfo(file_path)(2),item_xml) '添加属性 DateLastModified
			Call xml_data.AddAttribute("size",FormatNumber(fso.getFileInfo(file_path)(3)/1024,2,-1),item_xml) '添加属性 size
			Call xml_data.AddAttribute("P_attr",fso.getFileInfo(file_path)(4),item_xml) '添加属性 P_attr
		Next
		End If
	End If
End If


xml_data.RespXml()
Set item_xml=nothing
Set xml_data=Nothing
Set fso=Nothing


Function GetLocationURLdriMap(dir_num) 'dir_num=0为同级目录
If Not IsNumeric(dir_num) Then dir_num=0
Dim URLadr,URLadr_new,URLadr_xml
URLadr=GetLocationURL()
URLadr=Split(URLadr,"/")
For i=3 To UBound(URLadr,1)-1-dir_num
	URLadr_new=URLadr_new&"/"&URLadr(i)
Next
GetLocationURLdriMap=URLadr_new
End Function
%>