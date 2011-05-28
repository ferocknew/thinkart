<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<!--#include file="checkLogin.asp"-->
<!--#include file="../Scripts/PowerControl.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>THINKART网站管理系统</title>
</head>
<frameset rows="83,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="header.asp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="header" />
  <frameset cols="195,8,*" frameborder="no" border="0" framespacing="0" id="contentFrame">
    <frame src="menu.asp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="menu" />
    <frame src="fold.asp" name="foldFrame" id="foldFrame" title="flod" />
    <frame src="content_mng.asp" name="mainFrame" id="mainFrame" title="content" />
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>
