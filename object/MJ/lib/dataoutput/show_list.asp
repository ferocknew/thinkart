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
	Select Case do_type
	Case "all"
	DBField="id,title,abstract,addtime,edittime,class1id,class2id,class3id,tag"
	show_json_arrayName="id,title,abstract,addtime,edittime,class1id,class2id,class3id,tag"
	classTabName="news"
	data_temp=table_readdate(conn,"",classTabName,DBField,"","order by edittime")
	data_temp_num=ArrayisEmpty(data_temp)

	Set json=new Aien_Json
	json.JsonType="object"
	If data_temp_num=-1 Then
		json.addData "err",data_temp_num 'err数据
	Else
		json_name=Split(DBField,",")
		If UBound(data_temp)>UBound(json_name) Then
			for_num=UBound(json_name)
		Else
			for_num=UBound(data_temp)
		End If


		Set json_temp2=new Aien_Json
		json_temp2.JsonType="array"

		For j=0 To UBound(data_temp,2)
		Set json_temp1=new Aien_Json
		json_temp1.JsonType="object"
		For i=0 To for_num
			Select Case i
			Case 5
				class1name=conn.execute("select class_name from class1 where (id="&data_temp(i,j)&")")
				class_name=class1name("class_name")
				json_temp1.addData json_name(i),class_name
				class_name=""
			Case 6
				If data_temp(i,j)=0 Then
				json_temp1.addData json_name(i),"-"
				Else
				class1name=conn.execute("select class_name from class2 where (id="&data_temp(i,j)&")")
				class_name=class1name("class_name")
				json_temp1.addData json_name(i),class_name
				End If
				class_name=""
			Case 7
				If data_temp(i,j)=0 Then
				json_temp1.addData json_name(i),"-"
				Else
				class1name=conn.execute("select class_name from class3 where (id="&data_temp(i,j)&")")
				class_name=class1name("class_name")
				json_temp1.addData json_name(i),class_name
				End If
				class_name=""
			Case Else
				json_temp1.addData json_name(i),data_temp(i,j)
			End Select
		Next
		json_temp2.addData j,json_temp1
		Next

		json.addData "news_list",json_temp2
	End If

	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	data_temp=""
	Set json=Nothing
	Set json_temp2=Nothing
	Set json_temp1=Nothing

	Case "class_news"
		classname=SafeRequest("classname",0)
		classid=SafeRequest("classid",0)

		DBField="id,title,edittime"
		classTabName="news"
		data_temp=table_readdate(conn,"",classTabName,DBField,"("&classname&"="&classid&")","order by edittime")
		data_temp_num=ArrayisEmpty(data_temp)

		Set json=new Aien_Json
		json.JsonType="object"
		If data_temp_num=-1 Then
			json.addData "err",data_temp_num 'err数据
		Else
			json.addData "err",data_temp_num 'err数据
			json.addData "news_list",show_json(DBField,data_temp)
		End If

		Response.Write(json.getJson(json))
		data_temp=""
		Set json=Nothing
	End Select

Case "pro_list"
	Select Case do_type
	Case "all"
    DBField="id,name,abstract,addtime,edittime,class1id,class2id,class3id,tag"
    classTabName="products"
	data_temp=table_readdate(conn,"",classTabName,DBField,"","order by id")
	data_temp_num=ArrayisEmpty(data_temp)

    Set json=new Aien_Json
    json.JsonType="object"
    If data_temp_num=-1 Then
        json.addData "err",data_temp_num 'err数据
    Else
        Call json.addData("num",data_temp_num) 'err数据
        'json.addData "pros_list",show_json(DBField,data_temp)
		Set jsonCode=new Aien_Json
		jsonCode.JsonType="array"

		For i=0 To data_temp_num

			Set jsonTemp=new Aien_Json
			jsonTemp.JsonType="object"
			Call jsonTemp.addData("id",data_temp(0,i))
			Call jsonTemp.addData("name",data_temp(1,i))
			Call jsonTemp.addData("abstract",data_temp(2,i))
			Call jsonTemp.addData("addtime",data_temp(3,i))
			Call jsonTemp.addData("edittime",data_temp(4,i))
			Call jsonTemp.addData("tag",data_temp(8,i))
			Call jsonTemp.addData("class1id",""&conn.execute("select [class_name] from [class1] where id="&data_temp(5,i)&"")(0))
			Call jsonTemp.addData("class2id",""&conn.execute("select [class_name] from [class2] where id="&data_temp(6,i)&"")(0))
			If Not conn.execute("select count(id) from [class3] where id="&data_temp(7,i)&"")(0)=0 Then
				Call jsonTemp.addData("class3id",""&conn.execute("select [class_name] from [class3] where id="&data_temp(7,i)&"")(0))
			Else
				Call jsonTemp.addData("class3id","-")
			End If

			Call jsonCode.addData(i,jsonTemp)
			Set jsonTemp=Nothing
		Next

		Call json.addData("pros_list",jsonCode)
    End If

    Call jsonheadResponse()
    Response.Write(json.getJson(json))
    data_temp=""
    Set json=Nothing


    End Select

End Select
Call CloseDB()
%>