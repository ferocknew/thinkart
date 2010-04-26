<%
Sub show_list_json(list_name,upclassid,err_words) 'class显示json数据
	Dim DBField,data_temp,data_temp_num
	Select Case list_name
	Case "class1" '显示class1 表
		Call show_class_list_insub("class1",upclassid,err_words)

	Case "class2" '显示 class2 表
		Call show_class_list_insub("class2",upclassid,err_words)

	Case "class3" '显示 class3 表
		Call show_class_list_insub("class3",upclassid,err_words)

	End Select
End Sub
Sub show_class_list_insub(classTabName,upclassid,err_words) '显示json数据 【子过程】
	Dim show_json_arrayName
	DBField="id,class_name,orderid,class_title,upclassid"
	show_json_arrayName="id,classname,orderid,classtitle,upclassid"
	data_temp=table_readdate(conn,"",classTabName,DBField,"(upclassid="&upclassid&")","order by orderid")
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
End Sub

Sub add_class(class_tab) '添加class的过程
	Select Case class_tab
	Case "class1"
		list_num=table_recordcount(conn,"class1","id","")
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

		Call show_list_json("class1",0,"")
	Case "class2"
		list_num=table_recordcount(conn,"class2","id","")
		If list_num=0 Then
			order_num=0
		Else
			order_num=conn.Execute("select max(orderid) from class2")(0)+1
		End If

		Set conn_info = Server.CreateObject("ADODB.RecordSet")
		DBField="id,class_name,orderid,class_title,upclassid"
		SQL="SELECT "&DBField&" FROM class2"
		conn_info.open(SQL),conn,1,3
		conn_info.addNew
		conn_info("class_name")=class_name
		conn_info("orderid")=order_num
		conn_info("class_title")=class_name
		conn_info("upclassid")=upclassid
		conn_info.update
		conn_info.close:Set conn_info=Nothing

		Call show_list_json("class2",upclassid,"")
	Case "class3"
		list_num=table_recordcount(conn,"class3","id","")
		If list_num=0 Then
			order_num=0
		Else
			order_num=conn.Execute("select max(orderid) from class3")(0)+1
		End If

		Set conn_info = Server.CreateObject("ADODB.RecordSet")
		DBField="id,class_name,orderid,class_title,upclassid"
		SQL="SELECT "&DBField&" FROM class3"
		conn_info.open(SQL),conn,1,3
		conn_info.addNew
		conn_info("class_name")=class_name
		conn_info("orderid")=order_num
		conn_info("class_title")=class_name
		conn_info("upclassid")=upclassid
		conn_info.update
		conn_info.close:Set conn_info=Nothing

		Call show_list_json("class3",upclassid,"")
	End Select
End Sub

Sub newslist() '新闻列表
	DBField="id,title,abstract,addtime,edittime"
	TabName="news"
	DataTemp=table_readdate(conn,"",TabName,DBField,"","order by edittime")
	DataTempNum=ArrayisEmpty(DataTemp)

	JsonDBField=Split(DBField,",")
	Call jsonheadResponse()
	Response.Write("{err:0,datalist:")
	Response.Write(JSON.stringify(Jexs.VBRows2Obj(DataTemp,JsonDBField,5,1)))
	Response.Write("}")
End Sub

Sub eidtuser(userid) '用户信息修改
	Username=Easp.GetCookie(CookieName&":index_username") '用户Cookies

	If Username="" Then
		Response.Write("{err:1,msg:""请登录！""}")
		Response.End()
	End If

	Dim email,regcity,RegOperators,telNum,address,userArea,datatemp,DBField,SQL
	email=Trim(Easp.RF("email",0))
	regcity=Trim(Easp.RF("regcity",0))
	RegOperators=Trim(Easp.RF("RegOperators",0))
	telNum=Trim(Easp.RF("telNum",0))
	address=Trim(Easp.RF("address",0))
	userArea=Trim(Easp.RF("userArea",0))

	Set datatemp = Server.CreateObject("ADODB.RecordSet")
	DBField="email,regcity,RegOperators,telNum,address,userArea,edittime"
	SQL="SELECT "&DBField&" FROM [user] where (id="&userid&")"
	Call datatemp.Open(SQL,conn,1,3)
	datatemp("email")=email
	datatemp("regcity")=regcity
	datatemp("RegOperators")=RegOperators
	datatemp("telNum")=telNum
	datatemp("address")=address
	datatemp("userArea")=userArea
	datatemp("edittime")=Now()
	datatemp.update
	datatemp.close:Set datatemp=Nothing

	Easp.JS("alert('您的资料更新成功！');window.location.href='../../mumber_edit.asp';")
End Sub
%>