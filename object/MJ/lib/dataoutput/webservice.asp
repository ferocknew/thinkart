<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<!--#include file="action_lib.asp" -->
<%
Dim act,VBjson,DBField,DataTemp,SQL,DataTempNum,TabName,JsonDBField
act=Easp.RQ("act",0) ' 操作选择

Select Case act
	'------------------- 用户操作 -------------------
	Case "userlogin" '前台用户登录
		Dim username,password,UserCon
		username=Easp.RF("username",0) '用户名
		password=Easp.RF("password",0) '密码
		jsonmsg=""

		DataTempNum=table_recordcount(conn,"[user]","id","username='"&username&"'")
		If DataTempNum=1 Then
			DataTempNum=table_recordcount(conn,"[user]","id","(username='"&username&"') and (password='"&password&"')")
			If DataTempNum=1 Then
				SQL="Select id,username from [user] where (username='"&username&"')"
				Set UserCon=Jexs.ADO2Obj(SQL,Conn,1)  '新闻数据库操作
				Response.Cookies(CookieName)("index_username") = username
				Response.Cookies(CookieName)("index_userid") = UserCon.[0].id
				Response.Cookies(CookieName)("index_usernameHashKey") = "1"
				Response.Cookies(CookieName).expires=(now()+1/24)
				conn.execute("update [user] set logintime='"&Now()&"' where (username='"&username&"')")
				errnum=0
				jsonmsg="登录成功！"
			Else
				errnum=-1
				jsonmsg="密码错误！"
			End If
		Else
			errnum=-1
			jsonmsg="用户名错误！"
		End If
		DataTempNum=0

		Set VBjson=new Aien_Json
		VBjson.JsonType="object"
		Call VBjson.addData("err",errnum)
		Call VBjson.addData("msg",jsonmsg)
		Call jsonheadResponse()
		Response.Write(VBjson.getJson(VBjson))

	Case "userloginout" '用户退出
		userid=Easp.RQ("userid",1)
		Call userloginout_ws(userid)

	Case "eidtuser" '用户信息修改
	Dim userid
	userid=Easp.RQ("userid",0) '用户ID
	Call eidtuser(userid)
	'------------------- End -------------------

	Case "newslist" '新闻列表
	Call newslist()

	Case "prolist" '产品列表
	proFilter=Easp.RQ("profilter",0)
	proFilterid=Easp.RQ("profilterid",0)

	Call prolist()


	Case "savemsg" '保存留言
	Call savemsg()

	Case Else

End Select
Call CloseDB()
%>