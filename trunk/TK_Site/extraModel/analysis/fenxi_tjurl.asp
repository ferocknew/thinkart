
<!--#include file="config.asp"-->
<%
exec="select * from sjmp5_url where sjmp5_url_date=date()"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
  response.Write("<font color=red>���컹û�з��ʼ�¼!</a>")
else
do while not rs.eof
rs.movenext 
loop
rs.close
%>
�����¼����:<font color="#FF0000">
<%
rs.open "select sum(sjmp5_url_hits) from sjmp5_url where sjmp5_url_date=date() "
response.write rs(0)
%>
</font>��
<%end if%>
