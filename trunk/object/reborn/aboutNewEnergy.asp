<%Session.CodePage=65001%>
<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>睿邦新能源</title>
<script language="javascript" src="files/js/jquery-1.4.2.min.js"></script>
<script language="javascript" src="files/js/common.js"></script>
<link href="files/css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM news where class1id = 2"
rs.OPEN sql,Conn,1,1
%>
<body onLoad="loadContent('<%=rs("id")%>');changeTitle('起源与发展');">
<div id="container">
    <!--#include file="inc_header.asp" -->
  <div id="content">
    <div id="contentLeft">
      <h3>关于地源热泵</h3>
      <ul>
		<%
		i = 1
		while not rs.eof%>
        <li><a href="javascript:loadContent('<%=rs("id")%>');changeTitle('<%=rs("title")%>');"><span class="fontGreen">0<%=i%>/</span><%=rs("title")%></a></li>
        <%
		i = i + 1
		rs.movenext
		wend
		rs.close
		set rs = nothing
		%>
      </ul>
    </div>
    <div id="contentRight">
      <h2 id="textTitle">起源与发展</h2>
      <div id="innerBanner"><img src="files/images/banner_01.jpg" width="730" height="117" /></div>
      <div id="contentInner">
        <h1>&nbsp;</h1>
</div>
    </div>
  </div>
    <!--#include file="inc_footer.asp" -->
</div>
</body>
</html>
