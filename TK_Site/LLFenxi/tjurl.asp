
<!--#include file="config.asp"-->
<%
exec="select * from sjmp5_config"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
response.write "<a href=sjmp5_setup.asp target=_blank><font color=000000><u><b>ϵͳ��ʼ������</b></u></font></a><BR>"
else
dayer=date()-cdate(rs("sjmp5_config_date")) 
response.write "��վ��<b>"&rs("sjmp5_config_date")&"</b>��ʼͳ��<BR>��ͳ����<b>"&dayer&"</b>��<BR>"
end if
rs.close


exec="select * from sjmp5_url"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
  response.Write("<font color=red>��û�з��ʼ�¼!</font>")
else
do while not rs.eof
rs.movenext 
loop
rs.close
%>
�ܼ�¼����:<font color="#FF0000">
<%
rs.open "select sum(sjmp5_url_hits) from sjmp5_url"
response.write rs(0)
%>
</font>��
<%end if%>
