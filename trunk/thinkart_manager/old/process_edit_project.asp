<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->

<%
pj_type = trim(request("pj_type"))
pj_start = trim(request("pj_start"))
pj_end = trim(request("pj_end"))
pj_name = trim(request("pj_name"))
pj_desc = trim(request("pj_desc"))
pj_price = request("pj_price")
pj_pay = request("pj_pay")
pj_memo = request("pj_memo")
%>

<%
edit_id = request("edit_id")
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_project where id = "&edit_id&""
rs.OPEN sql,Conn,1,3
rs("pj_type")= pj_type
rs("pj_start")= pj_start
rs("pj_end")= pj_end
rs("pj_name")= pj_name
rs("pj_desc")= pj_desc
rs("pj_price")= pj_price
rs("pj_pay")= pj_pay
rs("pj_memo")= pj_memo
rs.update
rs.close
set rs=nothing
response.redirect "editproject.asp?tag=ok&edit_id=" & edit_id
%>