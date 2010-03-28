<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->

<%
budarea = trim(request("budarea"))
budname = trim(request("budname"))
budaddress = trim(request("budaddress"))
budlv = trim(request("budlv"))
budinfo = trim(request("budinfo"))
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_building where (id is null)"
rs.OPEN sql,Conn,1,3
rs.addnew
rs("budarea")= budarea
rs("budname")= budname
rs("budaddress")= budaddress
rs("budlv")= budlv
rs("budinfo")= budinfo
rs.update
rs.close
set rs=nothing
response.redirect "listbuilding.asp"
%>