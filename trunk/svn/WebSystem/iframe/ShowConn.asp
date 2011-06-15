<!--#include file="../../lib/lib-const.asp"-->
<!--#include file="../../lib/lib-Head.asp"-->
<%
Dim conn : Set Conn=Jasp.adodb.connection(Jasp.parse("{""provider"":""access"",""dataSource"":""../../Data/DB.mdb""}").Get())
Dim Cache : Set Cache=New JaspCache:Cache.setRoot="../../":Cache.setReloadTime=2400
%>
<!--#include file="../../Action/Comm.asp"-->
<!--#include file="./Code/Tpl_Admin.asp"-->
<%
Dim v_at,v_as,DirPath

DirPath="./Code/"								'配置模板操作类地址
v_at=Easp.RQ("at",0)							'获取主API接口
v_as=Easp.RQ("as",0)							'获取次级API接口
If v_at="" Then Response.End()

Dim v_webObj : Set v_webObj=new Tpl_Admin
Select Case v_at
	Case "adminedit"							'管理员操作类
		Call v_webObj.AdminAction(v_as)
	Case "websiteset"
		Call v_webObj.WebSiteSetAction(v_as)
	Case "classMconn"
		Call v_webObj.classMConn(v_as)
	Case "content"
		Call v_webObj.contentAction(v_as)
End Select
Set v_webObj=Nothing
%>
<!--#include file="../../Action/clear.asp"-->