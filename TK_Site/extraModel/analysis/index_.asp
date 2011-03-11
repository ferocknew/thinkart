

<!--#include file="config.asp"-->
<html>
<head>
<title><%=keystr%></title>
<link href="images/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language=javascript>
var t=false;
function SelectAll()
{
t=!t;
for(var i=0;i<document.form1.elements.length;i++)
{
if (document.form1.elements[i].type=="checkbox"){
document.form1.elements[i].checked=t;
}

}

}
</script>
<center>
 <table width="950" border="0" align="center" cellpadding="0" cellspacing="5">
   <tr>
     <td><!--#include file="sjmp5_top.asp"--></td>
   </tr>
   <tr>
     <td><table width="100%" height="34" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td align="center" background="images/tab_bg.gif" bgcolor="#F8f8f8">来路分析</td>
</tr></table>
<table width="750" height="3" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td align="center" bgcolor="#F8f8f8"></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
<form method="post" action="sjmp5_del_ser.asp" name="form1">
<tr>
  <td width="280" height="30" align="center" bgcolor="#EEEEEE">链接来源</td>
  <td width="279" height="30" align="center" bgcolor="#EEEEEE">到访页面</td>
  <td width="272" height="30" align="center" bgcolor="#EEEEEE">请求IP</td>
  <td width="73" align="center" bgcolor="#EEEEEE">请求时间</td>
  <td width="30" align="center" bgcolor="#EEEEEE">操作</td>
</tr>
<%
  set rs=server.CreateObject("adodb.recordset")
  sql="select * from sjmp5_jl order by sjmp5_jl_id desc"
  rs.open sql,conn2,1,3
  page=request.QueryString("page")
   if IsNumeric(page) then
            page=cint(page)
            if page<1 then page=1 
         else 
            page=1 
         end if
  everypage=pagekeyindex         
  rs.pagesize=everypage
  if rs.bof and rs.eof then
  response.write "<tr><td colspan=6 align=left bgcolor=#FFFFFF>没有数据记录!</td></tr>"
  else
  page_count=rs.pagecount
  rs.AbsolutePage=page
  do while not rs.eof and j<rs.pagesize
%>
<tr onMouseOver="this.bgColor='#F8F8F9';" onMouseOut="this.bgColor='#FFFFFF';" >
<td width="280" align="left" bgcolor="#FFFFFF"><div style="width: 275px; overflow: hidden;">&nbsp;&nbsp;<%if rs("sjmp5_jl_lyurl")="直接访问" then
response.write "直接访问"
else
%>
<a href=<%=rs("sjmp5_jl_lyurl")%> target=_blank title=链接来源:<%=rs("sjmp5_jl_lyurl")%>><%=rs("sjmp5_jl_lyurl")%></a>
<%end if%></div></td>
<td align="left" bgcolor="#FFFFFF"><div style="width: 275px; overflow: hidden;">&nbsp;&nbsp;<%=rs("sjmp5_jl_fwurl")%></div></td>
<td align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
<a href='#' title='来自：<%=rs("sjmp5_jl_ip")%>'><%=rs("sjmp5_jl_iply")%></a>&nbsp;</td>
<td align="center" bgcolor="#FFFFFF"><%=rs("sjmp5_jl_date")%></td>
<td align="right" bgcolor="#FFFFFF">
<input type="checkbox" name="sjmp5_jl_id" value="<%=rs("sjmp5_jl_id")%>" title="选择">&nbsp;</td>
</tr>
<%
   j=j+1
  rs.movenext
  loop
  end if
%>
<tr onMouseOver="this.bgColor='#F8F8F9';" onMouseOut="this.bgColor='#FFFFFF';" >
  <td colspan="5" align="right" bgcolor="#FFFFFF"><input type="checkbox" name="cek" value="11" onClick="SelectAll()" title="全选">&nbsp;<br> 
      <input type="submit" value="删除" name="B1"  style="border-style: solid; border-width: 0px"></td>
  </tr></form>
</table>
<table width="750" height="3" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td align="center" bgcolor="#F8f8f8"></td>
  </tr>
</table>
 <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
   <tr>
     <td height="28" align="center" valign="middle" background="images/tab_bgh.gif" bgcolor="#F8F8F9"  class="page_">
<%
if page=1 then
   else
 Response.Write"<a href=?page=1>首页</a>&nbsp;"
 Response.Write"<a href=?page="&page-1&">上一页</a>"
 end if
 %>
 
 <%for j=page-4 to page-1%>
 <%if j>0 then%>
<a href="?page=<%=j%>">[<%=j%>]</a>
 <%end if%>
 <%next%>
 
<%
 for j=page to page+4
%>
<% if j<=page_count then%>
 <%if j=page then%>
 <span class="pagefx">&nbsp;<%=j%>&nbsp;</span>
 <%else%>
<a href="?page=<%=j%>">[<%=j%>]</a>
 <%end if%> 
  <%end if%>
  <%next%>
<%if page<page_count then%>
<a href="?page=<%=page+1%>">下一页</a>&nbsp;
<a href='?page=<%=page_count%>'>尾页</a>
<%else
end if%></td>
   </tr>
</table></td>
   </tr>
   <tr>
     <td><!-- #include file="sjmp5_FOOT.asp" --></td>
   </tr>
</table>
</center>
</body>
<%call conning()%>