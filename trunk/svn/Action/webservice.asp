<!--#include file="../lib/lib-const.asp"-->
<!--#include file="../lib/lib-Head.asp"-->
<%
Dim conn : Set Conn=Jasp.adodb.connection(Jasp.parse("{""provider"":""access"",""dataSource"":""../Data/DB.mdb""}").Get())
Dim Cache:Set Cache=New JaspCache:Cache.setRoot="../":Cache.setReloadTime=2400
%>
<!--#include file="./Comm.asp"-->
<!--#include file="./Code/WS_admin.Class"-->
<%
'连接数据库
Dim v_at,v_as,DirPath

DirPath="./Code/"								'配置模板操作类地址
v_at=Easp.RQ("at",0)							'获取主API接口
v_as=Easp.RQ("as",0)							'获取次级API接口
If v_at="" Then Response.End()

Set v_AdminObj=new WS_admin
Select Case v_at
	Case "admin"								'管理员操作类
		Call v_AdminObj.action(v_as)
	Case "classcon"
		Call v_AdminObj.ClassCon(v_as)
End Select
Set v_AdminObj=Nothing
%>
<!--#include file="./clear.asp"-->