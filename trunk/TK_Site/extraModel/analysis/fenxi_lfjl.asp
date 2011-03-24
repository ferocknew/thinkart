<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<head>
<title><%=keystr%></title>
<SCRIPT src="images/date.js" type=text/javascript></SCRIPT>
<link href="../../WebSystem/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../WebSystem/css/font_link.css" rel="stylesheet" type="text/css" />
</head>

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
<body>
<!--#include file="sjmp5_top.asp"-->
<div class="content_ctrlbar text_deepGray12_b">
  <table style="float:left;" border="0" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <tr>
      <td><FORM style="background:none;" name=searchForm action=? >
              按日期查看: <INPUT 
name=search id=time_end value="<%=search%>" size=11 readonly> 
              <IMG src="images/date.gif" width="36" height="19" align="absmiddle" onClick="date_init(this,'time_end')" > &nbsp;
  <INPUT class=button type=submit value=" 查看 "> </FORM>
</td>
    </tr>
  </table>
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
<table class="link_deepGray12_b"  style="float:right;" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><span class="text_green12"><%=search%></span> 来访记录统计</td>
  </tr>
</table>
</div>


<table class="flowTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <th width="315" align="center" nowrap="nowrap" class="text_white12_b">链接来源</th>
    <th width="293" align="center" nowrap="nowrap" class="text_white12_b">到访页面</th>
    <th width="225" align="center" nowrap="nowrap" class="text_white12_b">IP来源</th>
    <th width="70" align="center" nowrap="nowrap" class="text_white12_b">请求时间</th>
    <th width="40" align="center" nowrap="nowrap" class="text_white12_b">操作</th>
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
      <td align="left"><div style="width: 310px; overflow: hidden;">
        <%
if rs("sjmp5_jl_lyurl")="直接访问" then 
response.write "&nbsp;直接访问"
else
%>
        <a href='<%=rs("sjmp5_jl_lyurl")%>' target=_blank title='链接来源:<%=rs("sjmp5_jl_lyurl")%>'>&nbsp;<%=rs("sjmp5_jl_lyurl")%></a>
        <%end if%>
      </div></td>
      <td align="left"><div style="width: 290px; overflow: hidden;">&nbsp;<%=rs("sjmp5_jl_fwurl")%></div></td>
      <td align="left">&nbsp;<a href='sjmp5_ip_to_url.asp?ip=<%=rs("sjmp5_jl_ip")%>&did=<%=search%>' target=_blank title='<%=rs("sjmp5_jl_ip")%>'><%=rs("sjmp5_jl_iply")%></td>
      <td align="left">&nbsp;<%=rs("sjmp5_jl_date")%></td>
      <td valign="middle"><input type="checkbox" name="sjmp5_jl_id" value="<%=rs("sjmp5_jl_id")%>"  title="选择">
        &nbsp;</td>
    </tr>
    <%
   j=j+1
  rs.movenext
  loop
  end if
%>
    <tr>
      <td colspan="5" align="right"><input type="checkbox" name="cek" value="11" onClick="SelectAll()" title="全选">
        &nbsp;<br>
        <input type="submit" value="删除" name="B1" style="border-style: solid; border-width: 0px"></td>
    </tr>
  </form>
</table>
<div style="float:left;" class="page_style text_deepGray12_b link_deepGray12_b"> <%
if page=1 then
   else
 Response.Write"<a href=?search="&search&"&page=1>首页</a>&nbsp;"
 Response.Write"<a href=?search="&search&"&page="&page-1&"><img src='../../WebSystem/images/btm_prevPage.gif' align='top' /></a>"
 end if
 %>
 
 <%for j=page-4 to page-1%>
 <%if j>0 then%>
 <a href="?search=<%=search%>&page=<%=j%>"><%=j%></a>&nbsp;&nbsp;
 <%end if%>
 <%next%>
 
<%
 for j=page to page+4
%>
<% if j<=page_count then%>
 <%if j=page then%>
 <span class="text_gray12_b"><%=j%>&nbsp;</span>
 <%else%>
<a href="?search=<%=search%>&page=<%=j%>"><%=j%></a>
 <%end if%> 
  <%end if%>
  <%next%>
<%if page<page_count then%>
<a href='?search=<%=search%>&page=<%=page+1%>'><img src="../../WebSystem/images/btm_nextPage.gif" align="top" /></a>
&nbsp;<a href='?search=<%=search%>&page=<%=page_count%>'>尾页</a>
<%else
end if%>
  
</div>

<!-- #include file="sjmp5_FOOT.asp" -->
</body>
</html>