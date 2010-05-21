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

Sub newslist(newskind) '新闻列表
	DBField="id,title,abstract,addtime,edittime"
	TabName="news"
	DataTemp=table_readdate(conn,"",TabName,DBField,"(class2id="&CInt(newskind)&")","order by edittime")
	DataTempNum=ArrayisEmpty(DataTemp)

	JsonDBField=Split(DBField,",")
	Call jsonheadResponse()
	Response.Write("{err:0,datalist:")
	Response.Write(JSON.stringify(Jexs.VBRows2Obj(DataTemp,JsonDBField,5,1)))
	Response.Write("}")
End Sub

Sub prolist(proFilter) '产品列表
	PageNum=Easp.RQ("page",1) '当前页码
	If PageNum="" Then PageNum=1
	class3id=Easp.RQ("class3id",0)
	DBField="id,name,img,Price,PriceVip"
	TabName="products"
	pageSize=8

	'DataTemp=table_readdate(conn,"",TabName,DBField,"class3id="&class3id&"","order by edittime")
	'DataTempNum=ArrayisEmpty(DataTemp)

	Dim ors
	Set ors=new Cls_ShowoPage '创建对象
	With ors
		.PageNum=PageNum	'页码
		.Conn=conn			'得到数据库连接对象
		.DbType="AC"		'数据库类型,AC为access,MSSQL为sqlserver2000,MSSQL_SP为存储过程版,MYSQL为mysql,PGSQL为PostGreSql
		.RecType=0			'取记录总数方法(0执行count,1自写sql语句取,2固定值)
		.RecSql=0			'如果RecType＝1则=取记录sql语句，如果是2=数值，等于0=""
		.RecTerm=0			'取从记录条件是否有变化(0无变化,1有变化,2不设置cookies也就是及时统计，适用于搜索时候)
		.CookieName="recac"	'如果RecTerm＝2,cookiesname="",否则写cookiesname
		.Order=0			'排序(0顺序1降序),注意要和下面sql里面主键ID的排序对应
		.PageSize=pageSize	'每页记录条数
		.JsUrl=""			'showo_page.js的路径
		.Sql=DBField&"$><$"&TabName&"$><$(class3id="&class3id&")$><$edittime$><$id"
		'字段,表,条件(不需要where),排序(不需要需要ORDER BY),主键ID
	End With

	DataTempNum=ors.RecCount()		'记录总数
	DataTemp=ors.ResultSet()		'返回ResultSet

	JsonDBField=Split(DBField,",")
	Call jsonheadResponse()
	Response.Write("{err:0,pageMAX:"&Int(DataTempNum/pageSize+1)&",datalist:")
	Response.Write(JSON.stringify(Jexs.VBRows2Obj(DataTemp,JsonDBField,5,1)))
	Response.Write("}")
End Sub

'------------------- 用户操作 ----------------
Sub eidtuser(userid) '用户信息修改
	Username=Easp.GetCookie(CookieName&":index_username") '用户Cookies

	If Username="" Then
		Easp.JS("alert('请先登录！');window.location.href='../../index.asp';")
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

	Easp.JS("alert('您的资料更新成功！');window.location.href='../../member.asp';")
End Sub

Sub userloginout_ws(userid) '用户退出
	If conn.execute("select count(id) From [user] where (id="&userid&")")(0)=1 Then
		Response.Cookies(CookieName)("index_username") = "Guest"
		Response.Cookies(CookieName)("index_userid") = ""
		Response.Cookies(CookieName)("index_usernameHashKey") = "-1"
		Response.Cookies(CookieName).expires=(now()+1)
		Easp.JS("alert('您已经退出登录');window.location.href='../../index.asp';")
	End If
End Sub

Sub reguser() '用户注册
	regcord=Trim(Easp.RF("code",0))
	email=Trim(Easp.RF("email",0)) 'email
	username=Trim(Easp.RF("name",0))
	password=Trim(Easp.RF("password",0))
	RegOperators=Trim(Easp.RF("repass2",0)) '经营者
	telNum=Trim(Easp.RF("repass3",0)) '联系电话
	regcity=Trim(Easp.RF("repass4",0)) '所在城市
	address=Trim(Easp.RF("repass5",0)) '商铺地址
	userArea=Trim(Easp.RF("repass6",0)) '营业面积

	If Not conn.execute("select count(id) from [License] where (License='"&regcord&"') and (Status=0)")(0)=1 Then
		Easp.js("alert('注册码出错！');history.go(-1);")
		Response.End()
	End If

	If Not conn.execute("select count(id) from [user] where (username='"&username&"')")(0)=1 Then
		Easp.js("alert('用户名已被占用！');history.go(-1);")
		Response.End()
	End If

	'DBField="email,useranme,regcity,RegOperators,telNum,address,userArea,edittime"
	SQL="SELECT * FROM [user]"
	Set rs = Server.CreateObject("ADODB.RecordSet")
	Call rs.open(SQL,conn,1,3)
	rs.addnew
	rs("username")=username
	rs("password")=password
	rs("addtime")=Now()
	rs("edittime")=Now()
	rs("email")=email
	rs("address")=address
	rs("regcord")=regcord
	rs("telNum")=telNum
	rs("regcity")=telNum
	rs("userArea")=userArea
	rs("RegOperators")=RegOperators
	rs.update
	userid=rs("id")
	rs.close:Set rs=Nothing

	conn.execute("UPDATE License SET Status = 1, userid = '"&userid&"' where (License='"&regcord&"')")
	Easp.js("alert('注册成功！');window.location.href='../../index.asp';")
End Sub
'------------------- End -------------------

Sub savemsg() '保存留言
	inputname=Trim(Easp.RF("inputname",0))
	telnum=Trim(Easp.RF("telnum",0))
	email=Trim(Easp.RF("email",0))
	company=Trim(Easp.RF("company",0))
	If company="" Then company="未知公司"
	message=Trim(Easp.RF("message",0))
	messagetype=Trim(Easp.RF("messagetype",1))

	If message="" Then
		Easp.JS("alert('"&message&"');history.go(-1);")
		Response.End()
	End If

	SQL="select title,name,addtime,content,email,telnum from [message]"
	Set datatemp = Server.CreateObject("ADODB.RecordSet")
	Call datatemp.Open(SQL,conn,1,3)
	datatemp.addnew
	datatemp("title")=company
	datatemp("name")=inputname
	datatemp("telnum")=telnum
	datatemp("email")=email
	datatemp("content")=message
	datatemp("addtime")=Now()
	datatemp.update
	datatemp.close:Set datatemp=Nothing

	If messagetype="" Then
	Easp.JS("alert('您的留言已经成功提交！');window.location.href='../../contact.asp';")
	Else
	Easp.JS("alert('您的留言已经成功提交！');window.location.href='../../member.asp';")
	End If
End Sub
%>
