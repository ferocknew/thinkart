<%
Sub show_list_json(list_name) '显示json数据
	Select Case list_name
	Case "class1" '显示class1 表
		DBField="id,class_name,orderid,class_title"
		data_temp=table_readdate(conn,"","class1",DBField,"","order by orderid")
		data_temp_num=ArrayisEmpty(data_temp)

		Set json=new Aien_Json
		json.JsonType="object"
		If data_temp_num=-1 Then
			json.addData "err",data_temp 'err数据
		Else
			json.addData "class_list",show_json("id,classname,orderid,classtitle",data_temp)
		End If
		
		Call jsonheadResponse()
		Response.Write(json.getJson(json))
		Set json=Nothing
	End Select
End Sub
%>