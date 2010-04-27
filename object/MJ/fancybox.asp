<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<%
Dim proId,ProCon
proId=Easp.RQ("id",1)
SQL="Select content From [products] where (id="&proId&")"
Set ProCon=Jexs.ADO2Obj(SQL,Conn,1)  '新闻数据库操作
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	color: #CCC;
	line-height:26px;
	padding: 0 10px;
}



body { 
	background: #1f1e1a url(files/images/fancybox_bg.jpg) no-repeat right top;
	margin:0;
	padding:10px;
}
-->
</style>
<%=ProCon.[0].content%>
