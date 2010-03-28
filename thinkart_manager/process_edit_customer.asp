<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->

<%
infoadder = trim(request("infoadder"))
subtype = trim(request("subtype"))
builder = trim(request("builder"))
cpyname = trim(request("cpyname"))
address = trim(request("address"))
contact = trim(request("contact"))
perlevel = trim(request("perlevel"))
phonenum = trim(request("phonenum"))
securityinfo = trim(request("securityinfo"))
memo = trim(request("memo"))
%>

<%
edit_id = request("edit_id")
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_customer where id = "&edit_id&""
rs.OPEN sql,Conn,1,3
rs("infoadder")= infoadder
rs("subtype")= subtype
rs("builder")= builder
rs("cpyname")= cpyname
rs("address")= address
rs("contact")= contact
rs("perlevel")= perlevel
rs("phonenum")= phonenum
rs("securityinfo")= securityinfo
rs("memo")= memo
rs.update
rs.close
set rs=nothing
response.redirect "editcustomer.asp?tag=ok&edit_id=" & edit_id
%>