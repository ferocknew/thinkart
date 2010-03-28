<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->

<%
edit_id = request("edit_id")
pj_people = trim(request("pj_people"))
pj_name = trim(request("pj_name"))
pj_desc = trim(request("pj_desc"))
pj_dline = trim(request("pj_dline"))
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_task where id = "&edit_id&""
rs.OPEN sql,Conn,1,3
rs("pj_people")= pj_people
rs("pj_name")= pj_name
rs("pj_desc")= pj_desc
rs("pj_dline")= pj_dline
rs.update
rs.close
set rs=nothing
response.redirect "listtask.asp"
%>