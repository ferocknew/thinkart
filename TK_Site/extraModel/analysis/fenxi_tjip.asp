

<!--#include file="config.asp"-->
<%
exec="select * from sjmp5_ip where sjmp5_ip_date=date()"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  if rs.bof and rs.eof then
  response.Write("<font color=red>���컹û��IP��¼!</a>")
  else
do while not rs.eof
rs.movenext 
loop
rs.close
%>
�������ö���IP��<font color="#FF0000"> 
<%
rs.open "select sum(sjmp5_ip_fxip) from sjmp5_ip where sjmp5_ip_date=date() "
response.write rs(0)
%></font> ��
<%end if%>
