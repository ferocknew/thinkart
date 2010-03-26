<%Session.CodePage=65001%>
<!--#include file="conn.asp"-->

<%
username = trim(request("username"))
iscome = trim(request("iscome"))
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM needform where (id is null)"
rs.OPEN sql,Conn,1,3
rs.addnew
rs("username")= username
rs("iscome")= iscome
rs.update
rs.close
set rs=nothing
%>