<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<!--#include file="action_lib.asp" -->
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

Case "add_class1" '添加 class1
	Dim class_name,order_num,notes,class_title,list_num
	class_name=CheckStr(Trim(Request.Form("classname")))
	If class_name="" Then Response.End()

	list_num=table_recordcount(conn,"class1","id")
	If list_num=0 Then
		order_num=0
	Else
		order_num=conn.Execute("select max(orderid) from class1")(0)+1
	End If

	Set conn_info = Server.CreateObject("ADODB.RecordSet")
	DBField="id,class_name,orderid,class_title"
	SQL="SELECT "&DBField&" FROM class1"
	conn_info.open(SQL),conn,1,3
	conn_info.addNew
	conn_info("class_name")=class_name
	conn_info("orderid")=order_num
	conn_info("class_title")=class_name
	conn_info.update
	conn_info.close:Set conn_info=Nothing

	Call show_list_json("class1",0)

Case "del_class1" '删除 class1
	Dim class_id
	class_id=CheckStr(Trim(Request.Form("classid")))
	If class_id="" Then Response.End()
	conn.execute("delete * from class1 where id in ("&class_id&")")
	Call show_list_json("class1",0)

Case "show_class" '显示class
	Dim upclassid
	class_name=SafeRequest("classname",0)
	upclassid=SafeRequest("upclassid",0)
	If class_name="class1" Or Not IsNumeric(upclassid) Then upclassid=0
	Select Case class_name
	Case "class1"
		Call show_list_json("class1",upclassid)
	Case "class2"
		Call show_list_json("class2",upclassid)
	Case "class3"
		Call show_list_json("class3",upclassid)
	End Select
End Select

Call CloseDB()
%>