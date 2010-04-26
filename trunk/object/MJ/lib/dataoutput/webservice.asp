<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<!--#include file="action_lib.asp" -->
<%
Dim act,json
act=Easp.RQ("act",0) ' 操作选择

Select Case act
	Case "userlogin" '前台用户登录
	Dim username,password
	username=Easp.RF("username",0) '用户名
	password=Easp.RF("password",0) '密码
	jsonmsg=""

	datatemp=table_recordcount(conn,"[user]","id","username='"&username&"'")
	If datatemp=1 Then
		datatemp=table_recordcount(conn,"[user]","id","(username='"&username&"') and (password='"&password&"')")
		If datatemp=1 Then
			Response.Cookies(CookieName)("index-username") = username
			Response.Cookies(CookieName)("index-usernameHashKey") = "1"
			Response.Cookies(CookieName).expires=(now()+1/24)
			conn.execute("update [user] set logintime='"&Now()&"' where (username='"&username&"')")
			jsonmsg="登录成功！"
		Else
			jsonmsg="密码错误！"
		End If
	Else
		jsonmsg="用户名错误！"
	End If
	datatemp=0

	Set json=new Aien_Json
	json.JsonType="object"
	Call json.addData("err",datatemp)
	Call json.addData("msg",jsonmsg)
	Call jsonheadResponse()
	Response.Write(json.getJson(json))
End Select
%>