<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<%
Dim data_xml,show_code,act,SQL,DBField,data_temp,data_err,data_temp_num
show_code=SafeRequest("code",0)
act=SafeRequest("act",0)

Select Case act
Case "add_admin" '添加管理员
	Dim username,password
	username=CheckStr(Trim(Request.Form("username")))
	password=md5(Trim(Request.Form("password")))
	Set conn_info = Server.CreateObject("ADODB.RecordSet")
	DBField="username,password,addtime,order"
	SQL="SELECT "&DBField&" FROM admin"
	conn_info.Open SQL, Conn, 1, 3
	conn_info.addNew
	conn_info("username")=username
	conn_info("password")=password
	conn_info("addtime")=Now()
	conn_info("order")=0
	conn_info.update
	conn_info.close:Set conn_info=Nothing

End Select

Select Case show_code
Case "json" 'json 部分
	DBField="username,password,addtime,order"
	data_temp=table_readdate(conn,"","admin",DBField,"","")

	'验证是否为空
	Err.clear
	If IsEmpty(data_temp) Then
	data_temp_num=-1
	Else
	data_temp_num=UBound(data_temp,2)
	End If

	set json=new Aien_Json
	json.JsonType="array"
	For i=0 To data_temp_num
		set json_temp=new Aien_Json
		json_temp.JsonType="object"
		json_temp.addData "admin",data_temp(0,i)
		json_temp.addData "password",data_temp(1,i)
		json_temp.addData "addtime",data_temp(2,i)
		json_temp.addData "order",data_temp(3,i)
		json.addData i,json_temp
		Set json_temp=Nothing
	Next	
	
	Response.Write(json.getJson(json))
	Set json=Nothing
End Select

Call CloseDB()
%>