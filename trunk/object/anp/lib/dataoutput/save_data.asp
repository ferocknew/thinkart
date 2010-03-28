<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<!--#include file="action_lib.asp" -->
<%
Dim data_xml,show_code,act,SQL,DBField
Dim title,classid,classtype,upclassid,Content,tag,classtype_name,data_temp,class1id,abstract
show_code=SafeRequest("code",0)
act=SafeRequest("act",0)

Select Case act
Case "add_news"
	title=CheckStr(Trim(Request.Form("title")))
	tag=CheckStr(Trim(Request.Form("tag")))
	classid=Request.Form("classid")
	classtype=Request.Form("classtype")
	upclassid=Request.Form("upclassid")
	Content=Request.Form("Content")
	abstract=CheckStr(Trim(Request.Form("abstract")))

	If title="" Then Response.End()

	Select Case classtype
	Case "treeLv1"
		classtype_name="class1"
		class1id=classid
		class2id=0
		class3id=0
	Case "treeLv2"
		classtype_name="class2"
		data_temp=conn.execute("select id from class1 where id="&upclassid&"")
		class1id=data_temp("id")
		class2id=classid
		class3id=0
		data_temp=""
	Case "treeLv3"
		classtype_name="class3"
		data_temp=conn.execute("select upclassid from class2 where id="&upclassid&"")
		class1id=data_temp("upclassid")
		class2id=upclassid
		class3id=classid
		data_temp=""
	End Select

	Set data_temp = Server.CreateObject("ADODB.RecordSet")
	DBField="title,addtime,content,class1id,class2id,class3id,tag,edittime,abstract"
	SQL="Select "&DBField&" From news"
	data_temp.open(SQL),conn,1,3
	data_temp.addnew
	data_temp("title")=title
	data_temp("addtime")=Now()
	data_temp("edittime")=Now()
	data_temp("content")=Content
	data_temp("abstract")=abstract
	data_temp("class1id")=class1id
	data_temp("class2id")=class2id
	data_temp("class3id")=class3id
	data_temp("tag")=tag
	data_temp.update
	data_temp.close:Set data_temp=Nothing

	Set json=new Aien_Json
	json.JsonType="object"
	json.addData "err",err 'err数据
	json.addData "msg","添加成功。" 'err数据
	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	Set json=Nothing

Case "edit_news"
	Dim news_id
	news_id=SafeRequest("newsid",0)

	title=CheckStr(Trim(Request.Form("title")))
	tag=CheckStr(Trim(Request.Form("tag")))
	classid=Request.Form("classid")
	classtype=Request.Form("classtype")
	upclassid=Request.Form("upclassid")
	Content=Request.Form("Content")
	abstract=CheckStr(Trim(Request.Form("abstract")))

	If title="" Then Response.End()

	Select Case classtype
	Case "treeLv1"
		classtype_name="class1"
		class1id=classid
		class2id=0
		class3id=0
	Case "treeLv2"
		classtype_name="class2"
		data_temp=conn.execute("select id from class1 where id="&upclassid&"")
		class1id=data_temp("id")
		class2id=classid
		class3id=0
		data_temp=""
	Case "treeLv3"
		classtype_name="class3"
		data_temp=conn.execute("select upclassid from class2 where id="&upclassid&"")
		class1id=data_temp("upclassid")
		class2id=upclassid
		class3id=classid
		data_temp=""
	End Select

	Set data_temp = Server.CreateObject("ADODB.RecordSet")
	DBField="title,content,class1id,class2id,class3id,tag,edittime,abstract"
	SQL="Select "&DBField&" From news where (id="&news_id&")"
	data_temp.open(SQL),conn,1,3
	data_temp("title")=title
	data_temp("edittime")=Now()
	data_temp("content")=Content
	data_temp("abstract")=abstract
	data_temp("class1id")=class1id
	data_temp("class2id")=class2id
	data_temp("class3id")=class3id
	data_temp("tag")=tag
	data_temp.update
	data_temp.close:Set data_temp=Nothing

	Set json=new Aien_Json
	json.JsonType="object"
	json.addData "err",err 'err数据
	json.addData "msg","修改成功。" 'err数据
	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	Set json=Nothing

End Select
Call CloseDB()
%>