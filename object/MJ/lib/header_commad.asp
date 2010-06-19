<script Language="JScript" runat="server" src="Jexs-lib.js"></script>
<script Language="JScript" runat="server" src="Jexs-json.js"></script>
<script Language="JScript" runat="server" src="Jasp/Jasp.js"></script>
<script Language="JScript" runat="server" src="Jasp/Jasp.date.js"></script>
<%
'读取网站设置信息
getInfo(1)
%>
<!--#include file="function_jonah.asp" -->
<!--#include file="easp.asp" -->
<!--#include file="xml_jonah.asp" -->
<!--#include file="md5.asp" -->
<!--#include file="json_jonah.asp" -->
<!--#include file="library_mrThink.asp" -->
<!--#include file="Template.asp" -->
<!--#include file="lib-ShowoPage.asp" -->
<!--#include file="cache_mrThink.asp" -->

<%
Dim userloginout '用户退出
userloginout=""
If Easp.GetCookie(CookieName&":index_userid")="" Then
	userloginout="#"
Else
	userloginout="lib/dataoutput/webservice.asp?act=userloginout&userid="&Easp.GetCookie(CookieName&":index_userid")
End If
%>
