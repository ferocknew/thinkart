
<!--#include file="config.asp"-->

<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding-right:20px;">
	<%
exec="select * from sjmp5_config"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
response.write "<a href=sjmp5_setup.asp target=_blank><font color=000000><u><b>系统初始化设置</b></u></font></a><BR>"
else
dayer=date()-cdate(rs("sjmp5_config_date")) 
response.write "网站于 <b>"&rs("sjmp5_config_date")&"</b> 开始统计<br>共统计了 <b>"&dayer&"</b> 天"
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
</td>
    <td>
    总记录访问：<span class="text_green12">
<%
rs.open "select sum(sjmp5_url_hits) from sjmp5_url"
response.write rs(0)
%>
</span>次
<%end if%>
<br />
<!--#include file="tjip.asp"-->
    </td>
  </tr>
</table>
