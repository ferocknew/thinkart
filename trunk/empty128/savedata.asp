<%Session.CodePage=65001%>
<!--#include file="conn.asp"-->

<%
userName = trim(request("userName"))
emailAdd = trim(request("emailAdd"))
telephone = trim(request("telephone"))
company = trim(request("company"))
siteAddress = trim(request("siteAddress"))
item1 = request("item1")
item2 = request("item2")
item3 = request("item3")
item4 = request("item4")
item5 = request("item5")
item6 = request("item6")
description = trim(request("description"))
progress = request("progress")
budget = request("budget")
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM needform where (id is null)"
rs.OPEN sql,Conn,1,3
rs.addnew
rs("userName")= userName
rs("emailAdd")= emailAdd
rs("telephone")= telephone
rs("company")= company
rs("siteAddress")= siteAddress
rs("item1")= item1
rs("item2")= item2
rs("item3")= item3
rs("item4")= item4
rs("item5")= item5
rs("item6")= item6
rs("description")= description
rs("progress")= progress
rs("budget")= budget
rs.update
rs.close
set rs=nothing
%>