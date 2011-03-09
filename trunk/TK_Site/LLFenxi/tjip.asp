<!--#include file="config.asp"-->
<%
exec="select * from sjmp5_ip_total"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  if rs.bof and rs.eof then
  response.Write("<font color=red>还没有IP记录!</a>")
  else
do while not rs.eof
rs.movenext 
loop
rs.close
%>
总来访独立IP：<font color="#FF0000"> 
<%
rs.open "select sum(sjmp5_ip_total_tj) from sjmp5_ip_total "
response.write rs(0)
%></font> 个
<%end if%>
