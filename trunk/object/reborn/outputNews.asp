<%@codepage=65001%>
<!--#include file="conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
newsid = request("newsid")
    
	set rs_content=server.CreateObject("adodb.recordset")
    sql_content ="select * from news where id = "&newsid&""
    rs_content.Open sql_content,conn,1,1
%>
<div>
<%=rs_content("content")%>
</div>
<%
rs_content.close
set rs_content = nothing
%>
