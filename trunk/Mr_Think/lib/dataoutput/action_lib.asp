<%
Sub show_list_json(list_name,upclassid) '显示json数据
	Dim DBField,data_temp,data_temp_num
	Select Case list_name
	Case "class1" '显示class1 表
		Call show_class_list_insub("class1",upclassid)

	Case "class2" '显示 class2 表
		Call show_class_list_insub("class2",upclassid)

	Case "class3" '显示 class3 表
		Call show_class_list_insub("class3",upclassid)

	End Select
End Sub '显示json数据 【子过程】
Sub show_class_list_insub(classTabName,upclassid)
	Dim show_json_arrayName
	DBField="id,class_name,orderid,class_title,upclassid"
	show_json_arrayName="id,classname,orderid,classtitle,upclassid"
	data_temp=table_readdate(conn,"",classTabName,DBField,"(upclassid="&upclassid&")","order by orderid")
	data_temp_num=ArrayisEmpty(data_temp)

	Set json=new Aien_Json
	json.JsonType="object"
	If data_temp_num=-1 Then
		json.addData "err",data_temp 'err数据
	Else
		json.addData "class_list",show_json(show_json_arrayName,data_temp)
	End If

	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	Set json=Nothing
End sub
%>