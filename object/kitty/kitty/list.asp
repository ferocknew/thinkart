<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<%
delid = request("delid")
sql = "delete from needform where id = "&delid&""
conn.execute(sql)
%>
<style type="text/css">
body{
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#000000;}
	
.bbd{
	border-bottom:1px dotted #666666;
	height:25px;
	line-height:25px;}
</style>
<body>
<%
sql = "select * from needform order by id desc"
set rs = conn.execute(sql)
%>
<br />
<br />
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" align="center">Name List</td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="200" height="30" align="center" bgcolor="#CCCCCC">Name</td>
    <td align="center" bgcolor="#CCCCCC">wedding attendance</td>
    <td align="center" bgcolor="#CCCCCC">del</td>
  </tr>
  <%while not rs.eof%>
  <tr>
    <td align="center" class="bbd"><%=rs("username")%></td>
    <td align="center" class="bbd"><%=rs("iscome")%></td>
    <td align="center" class="bbd"><a href="list.asp?delid=<%=rs("id")%>">X</a></td>
  </tr>
  <%rs.movenext
  wend
  rs.close
  set rs = nothing%>
</table>
</body>
</html>
