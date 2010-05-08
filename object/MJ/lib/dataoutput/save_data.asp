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
'添加产品
Case "add_pro"
    Dim pro_name,pro_tag,pro_name_e,pro_Content
    pro_name=CheckStr(Trim(Request.Form("pro_name")))
    pro_tag=CheckStr(Trim(Request.Form("pro_tag")))
    pro_name_e=CheckStr(Trim(Request.Form("pro_name_e")))
    pro_Content=Request.Form("Content")
    classid=Request.Form("classid")
    classtype=Request.Form("classtype")
    upclassid=Request.Form("upclassid")
	imgshowtop=Trim(Request.Form("imgshowtop"))
	ProPrice=Trim(Easp.RF("ProPrice",0)) 				'价格
	ProvipPrice=Trim(Easp.RF("ProvipPrice",0)) 			'vip价格
	Season=Trim(Easp.RF("Season",0)) 					'季节
	prostyle=Trim(Easp.RF("prostyle",0)) 				'功能
	proyear=Trim(Easp.RF("proyear",0)) 					'年份
	proURL=Trim(Easp.RF("proURL",0)) 				'url

	If Not imgshowtop="" Then
	upshow=1
	Else
	upshow=0
	End If

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


    SQL="select * from [products]"
    Set data_temp = Server.CreateObject("ADODB.RecordSet")
    data_temp.open(SQL),conn,1,3
    data_temp.addnew
    data_temp("name")=pro_name
    data_temp("abstract")=pro_name_e
    data_temp("tag")=pro_tag
    data_temp("content")=pro_Content
    data_temp("addtime")=Now()
    data_temp("edittime")=Now()
    data_temp("class1id")=class1id
    data_temp("class2id")=class2id
    data_temp("class3id")=class3id
	data_temp("img")=imgshowtop
	data_temp("upshow")=upshow
	data_temp("Price")=ProPrice
	data_temp("PriceVip")=ProvipPrice
	data_temp("Season")=Season
	data_temp("prostyle")=prostyle
	data_temp("proyear")=proyear
	data_temp("proURL")=proURL
    data_temp.update
    data_temp.close:Set data_temp=Nothing

    Set json=new Aien_Json
    json.JsonType="object"
    json.addData "err",err 'err数据
    json.addData "msg","添加成功。" 'err数据
    Call jsonheadResponse()
    Response.Write(json.getJson(json))
    Set json=Nothing

'产品信息编辑
Case "edit_pro"
	Dim pro_id
	pro_id=SafeRequest("proid",0)

	pro_name=CheckStr(Trim(Request.Form("pro_name")))
    pro_tag=CheckStr(Trim(Request.Form("pro_tag")))
    pro_name_e=CheckStr(Trim(Request.Form("pro_name_e")))
	classid=Request.Form("classid")
	classtype=Request.Form("classtype")
	upclassid=Request.Form("upclassid")
	Content=Request.Form("Content")
	abstract=CheckStr(Trim(Request.Form("abstract")))
	imgshowtop=Trim(Request.Form("imgshowtop"))
	ProPrice=Trim(Easp.RF("ProPrice",0)) 				'价格
	ProvipPrice=Trim(Easp.RF("ProvipPrice",0)) 			'vip价格
	Season=Trim(Easp.RF("Season",0)) 					'季节
	prostyle=Trim(Easp.RF("prostyle",0)) 				'功能
	proyear=Trim(Easp.RF("proyear",0)) 					'年份
	proURL=Trim(Easp.RF("proURL",0)) 				'url

	If Not imgshowtop="" Then
	upshow=1
	Else
	upshow=0
	End If

    If pro_name="" Then Response.End()

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
	DBField="name,content,class1id,class2id,class3id,tag,edittime,abstract,img,upshow,Price,PriceVip,Season,prostyle,proyear,proURL"
	SQL="Select "&DBField&" From products where (id="&pro_id&")"
	data_temp.open(SQL),conn,1,3
	data_temp("name")=pro_name
	data_temp("edittime")=Now()
	data_temp("content")=Content
	data_temp("abstract")=abstract
	data_temp("class1id")=class1id
	data_temp("class2id")=class2id
	data_temp("class3id")=class3id
	data_temp("tag")=tag
	data_temp("img")=imgshowtop
	data_temp("upshow")=upshow
	data_temp("Price")=ProPrice
	data_temp("PriceVip")=ProvipPrice
	data_temp("Season")=Season
	data_temp("prostyle")=prostyle
	data_temp("proyear")=proyear
	data_temp("proURL")=proURL
	data_temp.update
	data_temp.close:Set data_temp=Nothing

	Set json=new Aien_Json
	json.JsonType="object"
	json.addData "err",err 'err数据
	json.addData "msg","修改成功。" 'err数据
	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	Set json=Nothing

'添加留言
Case "addmsg"
	userName=CheckStr(Trim(Easp.RF("user-name",0))) '姓名
	telNum=CheckStr(Trim(Easp.RF("tel-num",0))) '电话
	eMail=CheckStr(Trim(Easp.RF("e-mail",0))) '邮箱
	comName=CheckStr(Trim(Easp.RF("com-name",0))) '公司
	comAdr=CheckStr(Trim(Easp.RF("com-adr",0))) '地址
	CustomModel=CheckStr(Trim(Easp.RF("Custom-Model",0))) '定制型号
	DeliveryCycle=CheckStr(Trim(Easp.RF("Delivery-cycle",0))) '交货周期
	msgContent=CheckStr(Trim(Easp.RF("content",0))) '您的要求

	DBField="title,name,addtime,content,upid,email,others"
	SQL="Select "&DBField&" From message"
	Set data_temp = Server.CreateObject("ADODB.RecordSet")
	data_temp.Open(SQL),conn,1,3
	data_temp.Addnew
	data_temp("title")=comName
	data_temp("name")=userName
	data_temp("addtime")=Now()
	data_temp("upid")=0
	data_temp("content")=msgContent
	data_temp("email")=eMail
	data_temp("others")="tel<[&&&**&&&]>"&telNu&"<[&&&**&&&]>adress<[&&&**&&&]>"&comAdr&"<[&&&**&&&]>CustomModel<[&&&**&&&]>"&CustomModel&"<[&&&**&&&]>DeliveryCycle<[&&&**&&&]>"&DeliveryCycle
	data_temp.Update
	data_temp.Close:Set data_temp=Nothing

    Easp.JS("alert('留言已经保存！谢谢');window.location.href='../../contact.asp'")

End Select
Call CloseDB()
%>