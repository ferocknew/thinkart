<%Session.CodePage=65001%>
<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
<%
yourname = trim(request("yourname"))
telephone = trim(request("telephone"))
email = trim(request("email"))
company = trim(request("company"))
message = trim(request("message"))
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM newmsg where (id is null)"
rs.OPEN sql,Conn,1,3
rs.addnew
rs("yourname")= yourname
rs("telephone")= telephone
rs("email")= email
rs("company")= company
rs("message")= message
rs.update
rs.close
set rs=nothing
%>
</body>
</html>
