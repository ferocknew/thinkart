<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../WebSystem/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../WebSystem/css/font_link.css" rel="stylesheet" type="text/css" />
<title>来访IP排行榜 >><%=keystr%></title>
<SCRIPT src="images/date.js" type=text/javascript></SCRIPT>
</head>
<body>
<!--#include file="sjmp5_top.asp"-->
<div class="content_ctrlbar text_deepGray12_b">
  <table style="float:left;" border="0" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <tr>
      <td><FORM style="background:none;" name=searchForm action=? >
              按日期查看: <INPUT 
name=search id=time_end value="<%=search%>" size=11 readonly> 
              <IMG src="images/date.gif" width="36" height="19" align="absmiddle" onClick="date_init(this,'time_end')" > &nbsp;
  <INPUT class=button type=submit value=" 查看 ">
          </FORM></td>
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
  <table class="link_deepGray12_b" style="float:right;" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%=search%>来访IP</td>
  </tr>
</table>
</div>

<table class="flowTable" width="100%" border="0" cellpadding="0" cellspacing="1">
<tr class="text_white12_b">
  <th width="51" align="center" nowrap="nowrap">ID编号</th>
  <th width="101" align="center" nowrap="nowrap">IP</th>
  <th width="130" align="center" nowrap="nowrap">物理地址</th>
  <th width="200" align="center" nowrap="nowrap">请求次数操作</th>
  </tr>
<%
rs.close
rs.open "select sum(sjmp5_ip_hits) from sjmp5_ip where sjmp5_ip_date=#"&search&"# "
key_tj=rs(0)
rs.close

  set rs=server.CreateObject("adodb.recordset")
  sql="select * from sjmp5_ip where sjmp5_ip_date=#"&search&"# order by sjmp5_ip_hits desc"
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
  dim ip_id
  ip_id=ip_id+1
%>
<tr>
  <td align="left">&nbsp;&nbsp;<%=ip_id%></td>
  <td align="left">&nbsp;&nbsp;<a href='sjmp5_ip_to_url.asp?ip=<%=rs("sjmp5_ip_ip")%>&amp;did=<%=search%>' target='_blank' title='查看详情'><%=rs("sjmp5_ip_ip")%></a></td>
  <td align="left">&nbsp;&nbsp;<%=rs("sjmp5_ip_lyurl")%></td>
<td align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_ip_hits")/key_tj*150)%> height=10>&nbsp;<%=fix(rs("sjmp5_ip_hits")/key_tj*100)%>%&nbsp;&nbsp;(<%=rs("sjmp5_ip_hits")%>次)</td>
</tr>

<%
   j=j+1
  rs.movenext
  loop
  end if
%>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#dddddd">
   <tr>
     <td height="28" align="center" valign="middle" background="images/tab_bgh.gif" bgcolor="#F8F8F9" class="del2">
<%
if page=1 then
' Response.Write"上一页"
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
&nbsp;
<a href='?search=<%=search%>&page=<%=page_count%>'>尾页</a>
<%else
end if%>
</td>
  </tr>
</table>
<!-- #include file="sjmp5_FOOT.asp" -->
</body>
</html>
 <%
rs.close
set rs=nothing   
conn2.close
set conn2=nothing
%>