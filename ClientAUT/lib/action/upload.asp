<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../lib-UpLoadClass.asp" -->
<%
Set upfile_obj=new UpLoadClass
upfile_obj.FileType=""
upfile_obj.MaxSize=3000000
upfile_obj.SavePath="../../upload/"
upfile_obj.Charset="UTF-8"
upfile_obj.AutoSave=2


upfile_obj.Open()
file_=upfile_obj.FileItem(1)
Call upfile_obj.Save(file_,0)
file_name=upfile_obj.Form(file_)
If upfile_obj.Form(file_&"_Err")=0 Then
	'Response.write "{""err"":"""",""msg"":'"&GetLocationURLdri(0)&upfile_obj.SavePath&file_name&"'}"
	Response.write "{""err"":"""",""msg"":'"&"upload/"&file_name&"'}"
Else
	Response.write "{""err"":'"&upfile_obj.Form(file_&"_Err")&"',""msg"":''}"
End If
Set upfile_obj=Nothing



'*************************************
'获取本页地址栏目录 GetLocationURLdri(dir_num) dir_num=0为同级目录，dir_num=1为上级目录，此函数可能使For循环失效
'*************************************
Function GetLocationURLdri(dir_num)
If Not IsNumeric(dir_num) Then dir_num=0
Dim URLadr,URLadr_new,URLadr_xml
URLadr=GetLocationURL()
URLadr=Split(URLadr,"/")
For i=0 To UBound(URLadr,1)-1-dir_num
	URLadr_new=URLadr_new&URLadr(i)&"/"
Next
GetLocationURLdri=URLadr_new
End Function

'*************************************
'获取本页地址栏
'*************************************
Function GetLocationURL()
Dim Url
Dim ServerPort,ServerName,ScriptName,QueryString
ServerName=Request.ServerVariables("SERVER_NAME")
ServerPort=Request.ServerVariables("SERVER_PORT")
ScriptName=Request.ServerVariables("SCRIPT_NAME")
QueryString=Request.ServerVariables("QUERY_STRING")
Url="http://"&ServerName
If ServerPort <> "80" Then Url = Url & ":" & ServerPort
Url=Url&ScriptName
If QueryString <>"" Then Url=Url&"?"& QueryString
GetLocationURL=Url
End Function
%>