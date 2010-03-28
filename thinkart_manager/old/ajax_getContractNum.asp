<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->
<%
cont_type = request("cont_type")
sql = "select * from tm_contract where cont_type = "&cont_type&" order by id desc"
rs.OPEN sql,Conn,1,1
cont_num = rs("cont_num")
rs.close
set rs = nothing
response.write "111111"
%>