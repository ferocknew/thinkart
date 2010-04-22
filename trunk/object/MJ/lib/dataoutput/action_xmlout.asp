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
	data_temp_num=table_recordcount(conn,"news","id","class1id="&class_id&"")
	If Not data_temp_num=0 Then
	Call show_list_json("class1",0,"此分类下还有新闻内容，请先清空！")
	Response.End()
	End If
	data_temp_num=""

	data_temp=table_readdate(conn,"","class2","id","(upclassid in ("&class_id&"))","")
	data_temp_num=ArrayisEmpty(data_temp)

	If data_temp_num=-1 Then
	conn.execute("delete * from class1 where id in ("&class_id&")")
	Call show_list_json("class1",0,"")
	Else
	Call show_list_json("class1",0,"此分类还有子分类，不能删除！")
	End If

	Case "class2"
	data_temp_num=table_recordcount(conn,"news","id","class2id="&class_id&"")
	If Not data_temp_num=0 Then
	Call show_list_json("class2",upclassid,"此分类下还有新闻内容，请先清空！")
	Response.End()
	End If
	data_temp_num=""

	data_temp=table_readdate(conn,"","class3","id","(upclassid in ("&class_id&"))","")
	data_temp_num=ArrayisEmpty(data_temp)

	If data_temp_num=-1 Then
	conn.execute("delete * from class2 where id in ("&class_id&")")
	Call show_list_json("class2",upclassid,"")
	Else
	Call show_list_json("class2",upclassid,"此分类还有子分类，不能删除！")
	End If

	Case "class3"
	data_temp_num=table_recordcount(conn,"news","id","class3id="&class_id&"")
	If Not data_temp_num=0 Then
	Call show_list_json("class3",upclassid,"此分类下还有新闻内容，请先清空！")
	Response.End()
	End If
	data_temp_num=""

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

Case "show_class_all" '显示所有 clas 数据
	class_name=SafeRequest("classname",0)
	DBField="id,class_name,orderid,class_title,upclassid"
	show_json_arrayName="id,classname,orderid,classtitle,upclassid"
	Select Case class_name
	Case "class1"
	data_temp=table_readdate(conn,"","class1",DBField,"","")
	Case "class2"
	data_temp=table_readdate(conn,"","class2",DBField,"","")
	Case "class3"
	data_temp=table_readdate(conn,"","class3",DBField,"","")
	End Select
	data_temp_num=ArrayisEmpty(data_temp)

	Set json=new Aien_Json
	json.JsonType="object"
	If data_temp_num=-1 Then
		json.addData "err",data_temp_num 'err数据
	Else
		If IsEmpty(err_words) Then
		json.addData "class_list",show_json(show_json_arrayName,data_temp)
		Else
		json.addData "err",err_words
		json.addData "class_list",show_json(show_json_arrayName,data_temp)
		End If
	End If

	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	Set json=Nothing

Case "get_news" '显示新闻内容
	Dim news_id
	news_id=SafeRequest("newsid",0)
	DBField="id,title,edittime,content,abstract,class1id,class2id,class3id,tag"
	show_json_arrayName="id,title,edittime,content,abstract,class1id,class2id,class3id,tag"
	data_temp=table_readdate(conn,"","news",DBField,"(id="&news_id&")","")
	data_temp_num=ArrayisEmpty(data_temp)

	Set json=new Aien_Json
	json.JsonType="object"
	If data_temp_num=-1 Then
		json.addData "err",data_temp_num 'err数据
	Else
		json.addData "news",show_json(show_json_arrayName,data_temp)
	End If

	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	Set json=Nothing

Case "get_pro" '显示产品内容
	Dim pro_id
	pro_id=SafeRequest("proid",0)
	DBField="id,name,edittime,content,abstract,class1id,class2id,class3id,tag,img,upshow,Price,PriceVip,Season,prostyle,proyear,proURL"
	show_json_arrayName="id,name,edittime,content,abstract,class1id,class2id,class3id,tag,img,upshow,Price,PriceVip,Season,prostyle,proyear,proURL"
	data_temp=table_readdate(conn,"","products",DBField,"(id="&pro_id&")","")
	data_temp_num=ArrayisEmpty(data_temp)

	Set json=new Aien_Json
	json.JsonType="object"
	If data_temp_num=-1 Then
		json.addData "err",data_temp_num 'err数据
	Else
		json.addData "pro",show_json(show_json_arrayName,data_temp)
	End If

	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	Set json=Nothing

Case "del_news" '删除新闻
	news_id=SafeRequest("newsid",0)
	data_temp=table_recordcount(conn,"news","id","id="&news_id&"")
	If data_temp=0 Then Response.End()

	conn.execute("delete * from news where id in ("&news_id&")")
	Set json=new Aien_Json
	json.JsonType="object"
	Call jsonheadResponse()
	json.addData "err",0 'err数据
	json.addData "msg","删除成功。" 'msg 数据
	json.addData "del_id",news_id 'del_id 数据
	Response.Write(json.getJson(json))
	Set json=Nothing

Case "del_pros" '删除产品
	pro_id=SafeRequest("proid",0)
	data_temp=table_recordcount(conn,"products","id","id="&pro_id&"")
	If data_temp=0 Then Response.End()

	conn.execute("delete * from products where id in ("&pro_id&")")
	Set json=new Aien_Json
	json.JsonType="object"
	Call jsonheadResponse()
	json.addData "err",0 'err数据
	json.addData "msg","删除成功。" 'msg 数据
	json.addData "del_id",pro_id 'del_id 数据
	Response.Write(json.getJson(json))
	Set json=Nothing

End Select

Call CloseDB()
%>