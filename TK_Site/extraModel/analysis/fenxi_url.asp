
<!--#include file="config.asp"-->
<%
exec="select * from sjmp5_url where sjmp5_url_date=date()"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  if rs.bof and rs.eof then
  response.Write("<font color=red>û�����ݼ�¼!</a>")
  else
%>
<title><%=keystr%></title>
<table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td height="30" colspan="3" align="center" bgcolor="#eeeeee">������Դͳ��</td>
  </tr>
  <%
do while not rs.eof
dim ii
ii=ii+1
  %>
  <tr>
    <td width="41" height="25" align="left" bgcolor="#FFFFFF">&nbsp;<%=ii%></td>
    <td width="200" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
    <%if rs("sjmp5_url_name")="sjmp5" then%>ֱ�ӷ���<%else%><%=rs("sjmp5_url_name")%><%end if%></td>
    <td width="54" height="25" align="right" bgcolor="#FFFFFF"><font color="#FF0000"><%=rs("sjmp5_url_hits")%></font>��&nbsp;</td>
  </tr><%
rs.movenext 
loop
rs.close
%>
  <tr>
    <td height="28" colspan="3" align="center" bgcolor="#F8F8F9"><p>�����¼���ʣ�<font color="#FF0000">
<%
rs.open "select sum(sjmp5_url_hits) from sjmp5_url where sjmp5_url_date=date() "
response.write rs(0)
%>
</font>��</td>
  </tr>
</table>
<%end if%>
