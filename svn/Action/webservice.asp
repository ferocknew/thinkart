<!--#include file="../lib/lib-const.asp"-->
<!--#include file="../lib/lib-Head.asp"-->
<!--#include file="./Comm.asp"-->
<!--#include file="./Code/WS_admin.Class"-->
<%
'连接数据库
Dim v_at,v_as,DirPath


DirPath="./Code/"								'配置模板操作类地址
v_at=Easp.RQ("at",0)							'获取主API接口
v_as=Easp.RQ("as",0)							'获取次级API接口
If v_at="" Then Response.End()

Select Case v_at
	Case "admin"								'管理员操作类
		Set v_AdminObj=new WS_admin
		Call v_AdminObj.action(v_as):Set v_AdminObj=Nothing
End Select
%>
<!--#include file="./clear.asp"-->