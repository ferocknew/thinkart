

<!--#include file="config.asp"--> 
<%
search=replace(replace(replace(replace(replace(replace(request("search"),"'",""),"#",""),Chr(34),""),"?","")," ",""),"=","")
if search<>"" then
	if isdate(request("search")) then 
	else 
		response.write "日期格式不正确" 
		response.end()
	end if
else
search=date()
end if
%>
<html>
<head>
<link href="images/css.css" rel="stylesheet" type="text/css">
<title><%=keystr%></title>
<SCRIPT src="images/date.js" type=text/javascript></SCRIPT>
</head>
<body>
<script language=javascript>
var t=false;
function SelectAll()
	{
		t=!t;
		for(var i=0;i<document.form1.elements.length;i++)
		{
		if (document.form1.elements[i].type=="checkbox")
			{
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
     <td>

<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
        <tr>
          <td height="80" align="center" bgcolor="#f8f8f9"><FORM name=searchForm action=? >
              按日期查看: <INPUT 
name=search id=time_end value="<%=search%>" size=11 readonly> 
              <IMG src="images/date.gif" width="36" height="19" onClick="date_init(this,'time_end')" > &nbsp;
  <INPUT class=button type=submit value=" 查看 "> </FORM><%=search%>来访记录统计
    <script language="javascript">
	function date_init(obj,name)
{
	var D;
	var oInput	= document.getElementById(name);
	var sRetVal	= oInput.returnValue;
	if ( (sRetVal) && sRetVal.length > 0)
	{
		D = ParseUtcDate(sRetVal);
	}
	else
	{
		D = new Date();
	}
	InitCalendar( parent.ORG_DATE_FORMAT, parent.ORG_DATE_SEPARATOR, parent.ORG_DATE_START_DAY, null, null);
	
	LaunchCalendar(oInput, D);
}
	</script> 
          </td>
        </tr>
    </table>
<BR>
<table width="100%" height="34" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td align="center" background="images/tab_bg.gif" bgcolor="#F8f8f8"><%=search%>来路分析</td>
</tr></table>
<table width="750" height="3" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td align="center" bgcolor="#F8f8f8"></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">

<tr>
  <td width="315" height="30" align="center" bgcolor="#EEEEEE">链接来源</td>
  <td width="293" height="30" align="center" bgcolor="#EEEEEE">到访页面</td>
  <td width="225" height="30" align="center" bgcolor="#EEEEEE">IP来源</td>
  <td width="70" height="30" align="center" bgcolor="#EEEEEE">请求时间</td>
  <td width="31" align="center" bgcolor="#EEEEEE">操作</td>
</tr>
<form method="post" action="sjmp5_del_ser.asp" name="form1">
<%
  set rs=server.CreateObject("adodb.recordset")
  sql="select * from sjmp5_jl where sjmp5_jl_fxdate=#"&search&"# order by sjmp5_jl_id desc"
  rs.open sql,conn2,1,3
  page=request.QueryString("page")
   if IsNumeric(page) then
            page=cint(page)
            if page<1 then page=1 
         else 
            page=1 
         end if
  everypage=pagekeyfenxi          
  rs.pagesize=everypage
  if rs.bof and rs.eof then
  response.write "<tr><td colspan=5 align=left bgcolor=#FFFFFF>没有数据记录!</td></tr>"
  else
  page_count=rs.pagecount
  rs.AbsolutePage=page
  do while not rs.eof and j<rs.pagesize
%>
<tr>
<td align="left" bgcolor="#FFFFFF"><div style="width: 310px; overflow: hidden;">
<%
if rs("sjmp5_jl_lyurl")="直接访问" then 
response.write "&nbsp;直接访问"
else
%>
<a href='<%=rs("sjmp5_jl_lyurl")%>' target=_blank title='链接来源:<%=rs("sjmp5_jl_lyurl")%>'>&nbsp;<%=rs("sjmp5_jl_lyurl")%></a><%end if%></div></td>
<td align="left" bgcolor="#FFFFFF"><div style="width: 290px; overflow: hidden;">&nbsp;<%=rs("sjmp5_jl_fwurl")%></div></td>
<td align="left" bgcolor="#FFFFFF">&nbsp;<a href='sjmp5_ip_to_url.asp?ip=<%=rs("sjmp5_jl_ip")%>&did=<%=search%>' target=_blank title='<%=rs("sjmp5_jl_ip")%>'><%=rs("sjmp5_jl_iply")%></td>
<td align="left" bgcolor="#FFFFFF">&nbsp;<%=rs("sjmp5_jl_date")%></td>
<td align="right" bgcolor="#FFFFFF">
<input type="checkbox" name="sjmp5_jl_id" value="<%=rs("sjmp5_jl_id")%>"  title="选择">&nbsp;</td>
</tr>

<%
   j=j+1
  rs.movenext
  loop
  end if
%>
<tr>
  <td colspan="5" align="right" bgcolor="#FFFFFF"><input type="checkbox" name="cek" value="11" onClick="SelectAll()" title="全选">&nbsp;<br> 
      <input type="submit" value="删除" name="B1" style="border-style: solid; border-width: 0px"></td>
  </tr>
</form>
</table>

<table width="750" height="3" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td align="center" bgcolor="#F8f8f8"></td>
  </tr>
</table>
 <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
   <tr>
     <td height="28" align="center" valign="middle" background="images/tab_bgh.gif" bgcolor="#F8F8F9" class="del2">
<%
if page=1 then
   else
 Response.Write"<a href=?search="&search&"&page=1>首页</a>&nbsp;"
 Response.Write"<a href=?search="&search&"&page="&page-1&">上一页</a>"
 end if
 %>
 
 <%for j=page-4 to page-1%>
 <%if j>0 then%>
<span class="STYLE3"><a href="?search=<%=search%>&page=<%=j%>">[<%=j%>]</a></span>
 <%end if%>
 <%next%>
 
<%
 for j=page to page+4
%>
<% if j<=page_count then%>
 <%if j=page then%>
 <span class="pagefx">&nbsp;<%=j%>&nbsp;</span>
 <%else%>
<span class="STYLE3"><a href="?search=<%=search%>&page=<%=j%>">[<%=j%>]</a></span>
 <%end if%> 
  <%end if%>
  <%next%>
<%if page<page_count then%>
<a href='?search=<%=search%>&page=<%=page+1%>'>下一页</a>
&nbsp;<a href='?search=<%=search%>&page=<%=page_count%>'>尾页</a>
<%else
end if%>
</td>
   </tr>
</table>



</td>
   </tr>
   <tr>
     <td><!-- #include file="sjmp5_FOOT.asp" --></td>
   </tr>
</table>
</center>
</body></html>