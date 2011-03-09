
<!--#include file="config.asp"-->
<%
exec="select * from sjmp5_config"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
response.write "<a href=sjmp5_setup.asp target=_blank><font color=000000><u><b>系统初始化设置</b></u></font></a><BR>"
else
dayer=date()-cdate(rs("sjmp5_config_date")) 
response.write "网站于<b>"&rs("sjmp5_config_date")&"</b>开始统计<BR>共统计了<b>"&dayer&"</b>天<BR>"
end if
rs.close


exec="select * from sjmp5_url"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
  response.Write("<font color=red>还没有访问记录!</font>")
else
do while not rs.eof
rs.movenext 
loop
rs.close
%>
总记录访问:<font color="#FF0000">
<%
rs.open "select sum(sjmp5_url_hits) from sjmp5_url"
response.write rs(0)
%>
</font>次
<%end if%>
