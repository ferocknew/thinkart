<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<!--#include file="action_lib.asp" -->
<%
Dim data_temp_num,show_code,act,SQL,DBField,show_json_arrayName,data_temp,do_type,classTabName
show_code=SafeRequest("code",0)
act=SafeRequest("act",0)
do_type=SafeRequest("do_type",0)

Select Case act
Case "news_list"
	If do_type="all" Then
	DBField="id,title,abstract,content,addtime,edittime,class1id,class2id,class3id,tag"
	show_json_arrayName="id,title,abstract,content,addtime,edittime,class1id,class2id,class3id,tag"
	classTabName="news"
	data_temp=table_readdate(conn,"",classTabName,DBField,"","order by edittime")
	End If
	data_temp_num=ArrayisEmpty(data_temp)

	Set json=new Aien_Json
	json.JsonType="object"
	If data_temp_num=-1 Then
		json.addData "err",data_temp_num 'err数据
	Else
		If IsEmpty(err_words) Then
		json.addData "news_list",show_json(show_json_arrayName,data_temp)
		Else
		json.addData "err",err_words
		json.addData "news_list",show_json(show_json_arrayName,data_temp)
		End If
	End If

	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	data_temp=""
	Set json=Nothing

End Select
Call CloseDB()
%>