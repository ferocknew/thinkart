

<!--#include file="config.asp"-->
<%
exec="select * from sjmp5_ip where sjmp5_ip_date=date()"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  if rs.bof and rs.eof then
  response.Write("<font color=red>没有数据记录!</a>")
  else

%>
<table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td height="30" colspan="3" align="center" bgcolor="#eeeeee">独立IP请求记录</td>
  </tr>
  <%
do while not rs.eof
dim fxip
fxip=fxip+1
  %>
  <tr>
    <td width="41" height="25" align="left" bgcolor="#FFFFFF">&nbsp;<%=fxip%></td>
    <td width="200" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
    <%=rs("sjmp5_ip_ip")%></td>
    <td width="54" height="25" align="right" bgcolor="#FFFFFF"><font color="#FF0000"><%=rs("sjmp5_ip_hits")%></font>次&nbsp;</td>
  </tr><%
rs.movenext 
loop
rs.close
%>
  <tr>
    <td height="28" colspan="3" align="center" bgcolor="#F8F8F9"><p>今天来访独立IP：<font color="#FF0000">
<%=fxip%>
</font>个</td>
  </tr>
</table>
<%end if%>
