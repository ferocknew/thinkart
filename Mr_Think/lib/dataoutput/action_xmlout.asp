<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<!--#include file="action_lib.asp" -->
<%
Dim data_xml,show_code,act,SQL,DBField,data_temp,data_err,data_temp_num
Dim class_name,order_num,notes,class_title,list_num,upclassid,class_tab
show_code=SafeRequest("code",0)
act=SafeRequest("act",0)

Select Case act
Case "add_class" '添加 class
	class_name=CheckStr(Trim(Request.Form("classname")))
	class_tab=CheckStr(Trim(Request.Form("class")))
	upclassid=Request.Form("upclassid")
	If Not IsNumeric(upclassid) Then upclassid=0
	If class_name="" Then Response.End()
	Call add_class(class_tab)


Case "del_class" '删除 class1
	Dim class_id
	class_id=CheckStr(Trim(Request.Form("classid")))
	class_tab=CheckStr(Trim(Request.Form("class")))
	upclassid=Request.Form("upclassid")
	If Not IsNumeric(upclassid) Then upclassid=0
	If class_id="" Then Response.End()

	Select Case class_tab
	Case "class1"
	data_temp=table_readdate(conn,"","class2","id","(upclassid in ("&class_id&"))","")
	data_temp_num=ArrayisEmpty(data_temp)

	If data_temp_num=-1 Then
	conn.execute("delete * from class1 where id in ("&class_id&")")
	Call show_list_json("class1",0,"")
	Else
	Call show_list_json("class1",0,"此分类还有子分类，不能删除！")
	End If

	Case "class2"
	data_temp=table_readdate(conn,"","class3","id","(upclassid in ("&class_id&"))","")
	data_temp_num=ArrayisEmpty(data_temp)

	If data_temp_num=-1 Then
	conn.execute("delete * from class2 where id in ("&class_id&")")
	Call show_list_json("class2",upclassid,"")
	Else
	Call show_list_json("class2",upclassid,"此分类还有子分类，不能删除！")
	End If

	Case "class3"
	conn.execute("delete * from class3 where id in ("&class_id&")")
	Call show_list_json("class3",upclassid,"")
	End Select


Case "show_class" '显示class
	class_name=SafeRequest("classname",0)
	upclassid=SafeRequest("upclassid",0)
	If class_name="class1" Or Not IsNumeric(upclassid) Then upclassid=0
	Select Case class_name
	Case "class1"
		Call show_list_json("class1",upclassid,"")
	Case "class2"
		Call show_list_json("class2",upclassid,"")
	Case "class3"
		Call show_list_json("class3",upclassid,"")
	End Select
End Select

Call CloseDB()
%>