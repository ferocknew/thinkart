<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
[<%=search%>] <span class="text_deepGray12_b"><img src="../../WebSystem/images/ico_cog.gif" align="absmiddle" /></span> 链接来源 统计: <span class="text_green12">
<%
exec="select * from sjmp5_url where sjmp5_url_date=#"&search&"# "
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
response.Write "没有链接记录!"
else
rs.close
rs.open "select sum(sjmp5_url_hits) from sjmp5_url where sjmp5_url_date=#"&search&"# "
response.write rs(0)
%></span> 次
<%end if%>
	</td>
    
    <td>
[<%=search%>]<span class="text_deepGray12_b"><img src="../../WebSystem/images/ico_cog.gif" align="absmiddle" /></span> 独立IP请求记录：  <span class="text_green12">
<%
exec="select * from sjmp5_ip where sjmp5_ip_date=#"&search&"# "
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
response.Write "没有IP记录!"
else
rs.close
rs.open "select sum(sjmp5_ip_fxip) from sjmp5_ip where sjmp5_ip_date=#"&search&"# "
response.write rs(0)
%></span> 个
<%end if%>
	</td>
  </tr>
</table>