<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->

<%
cont_type = trim(request("cont_type"))
cont_num = trim(request("cont_num"))
cont_name = trim(request("cont_name"))
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_contract where (id is null)"
rs.OPEN sql,Conn,1,3
rs.addnew
rs("cont_type")= cont_type
rs("cont_num")= cont_num
rs("cont_name")= cont_name
rs.update
rs.close
set rs=nothing
response.redirect "listcontract.asp"
%>