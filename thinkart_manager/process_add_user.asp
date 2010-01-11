<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->

<%
username = trim(request("username"))
password = trim(request("password"))
tname = trim(request("tname"))
power = trim(request("power"))
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_user where (id is null)"
rs.OPEN sql,Conn,1,3
rs.addnew
rs("username")= username
rs("password")= password
rs("tname")= tname
rs("power")= power
rs.update
rs.close
set rs=nothing
response.redirect "listuser.asp"
%>