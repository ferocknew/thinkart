<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 

<%
search_key=request("search_key")
'page=page
%>

<!--#include file="config.asp"-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../WebSystem/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../WebSystem/css/font_link.css" rel="stylesheet" type="text/css" />
<title>关键字排名 >><%=keystr%></title>
</head>
<body>
<!-- #include file="sjmp5_top.asp" -->
<table width="100%" border="0" cellpadding="0" cellspacing="5">

  <tr align="left">
    <td width="50%" align="left" valign="top">	
	<%if request("search_key")<>"" then%>
	
<table class="flowTable" width="100%" border="0" align="left" cellpadding="1" cellspacing="1">
  <tr>
    <th class="text_white12_b" colspan="2" align="center">总关键字:<font color="#339933"><b><%=search_key%></b></font></th>
  </tr>
<%
exec="select * from sjmp5_keyword_total where sjmp5_keyword_total_name='"&search_key&"' "
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
'response.write exec
'response.End()
if rs.bof and rs.eof then
response.write "<tr><td height=25 colspan=2 align=center bgcolor=#FFFFFF>&nbsp;没有数据记录!</td></tr>"
else
key_id=200
%>
<%if rs("sjmp5_keyword_total_baidu")>0 then%>
  <tr>
    <td width="60" height="25" align="center">百度:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_total_baidu")/rs("sjmp5_keyword_total_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_total_baidu")/rs("sjmp5_keyword_total_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_total_baidu")%>次)
	</td>
  </tr><%end if 
  if rs("sjmp5_keyword_total_google")>0 then%>
  <tr>
    <td width="60" height="25" align="center">谷歌:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_total_google")/rs("sjmp5_keyword_total_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_total_google")/rs("sjmp5_keyword_total_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_total_google")%>次)</td>
    </tr><%end if 
	if rs("sjmp5_keyword_total_soso")>0 then%>
  <tr>
    <td width="60" height="25" align="center">搜搜:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_total_soso")/rs("sjmp5_keyword_total_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_total_soso")/rs("sjmp5_keyword_total_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_total_soso")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_total_sogou")>0 then%>
  <tr>
    <td width="60" height="25" align="center">搜狗:</td>
    <td width="376" height="25" align="left"><img src='images/smallbg.jpg' width='<%=fix(rs("sjmp5_keyword_total_sogou")/rs("sjmp5_keyword_total_hits")*key_id)%>'  height='10'>&nbsp;<%=fix(rs("sjmp5_keyword_total_sogou")/rs("sjmp5_keyword_total_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_total_sogou")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_total_yahoo")>0 then%>
  <tr>
    <td width="60" height="25" align="center">雅虎:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_total_yahoo")/rs("sjmp5_keyword_total_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_total_yahoo")/rs("sjmp5_keyword_total_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_total_yahoo")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_total_youdao")>0 then%>
  <tr>
    <td width="60" height="25" align="center">有道:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_total_youdao")/rs("sjmp5_keyword_total_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_total_youdao")/rs("sjmp5_keyword_total_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_total_youdao")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_total_msn")>0 then%>
  <tr>
    <td width="60" height="25" align="center">MSN:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_total_msn")/rs("sjmp5_keyword_total_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_total_msn")/rs("sjmp5_keyword_total_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_total_msn")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_total_qt")>0 then%>
  <tr>
    <td width="60" height="25" align="center">其它:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_total_qt")/rs("sjmp5_keyword_total_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_total_qt")/rs("sjmp5_keyword_total_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_total_qt")%>次)</td>
  </tr>  
<%end if
end if
%>
</table>
<%end if%>
	</td>
    <td width="50%" align="right" valign="top">	
<table class="flowTable" width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <th class="text_white12_b" colspan="3" align="center"><b>总关键字 搜索排行榜 </b></th>
  </tr>	
 <%
rs.close
 rs.open "select sum(sjmp5_keyword_total_hits) from sjmp5_keyword_total "
key_tj=rs(0)
rs.close
%>
  <%
  
exec="select * from sjmp5_keyword_total  order by sjmp5_keyword_total_hits desc "
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
'if rs.bof and rs.eof then
'response.write "<tr><td height=25 colspan=3 align=center bgcolor=#FFFFFF> &nbsp;没有数据记录!</td></tr>"
'else
'do while not rs.eof

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
  response.write "<tr><td colspan=3 align=left bgcolor=#FFFFFF>没有数据记录!</td></tr>"
  else
  page_count=rs.pagecount
  rs.AbsolutePage=page
  do while not rs.eof and j<rs.pagesize

dim iikey
iikey=iikey+1
  %>
  <tr>
    <td width="40" height="25" align="left">&nbsp;<%=iikey%> &nbsp;</td>
    <td width="228" height="25" align="left">&nbsp;<a href='search_keyword_total.asp?search_key=<%=rs("sjmp5_keyword_total_name")%>&page=<%=page%>' title='受访次数:<%=rs("sjmp5_keyword_total_hits")%>' >
    <%=rs("sjmp5_keyword_total_name")%></a>   &nbsp;</td>
    <td width="188" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_total_hits")/key_tj*150)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_total_hits")/key_tj*100)%>%&nbsp;(<font color="#339933"><%=rs("sjmp5_keyword_total_hits")%></font>)</td>
  </tr>
  <%
   j=j+1
  rs.movenext
  loop
'  end if
'rs.movenext 
'loop
'rs.close
%>
  <tr>
    <td height="28" colspan="3" align="center">有 <font color="#339933">
<%
rs.close
rs.open "select sum(sjmp5_keyword_total_tj) from sjmp5_keyword_total "
response.write rs(0)
rs.close
%>
</font> 个关键字</td>
  </tr><%end if%>
</table>

</td>
  </tr>
  <tr align="left">
    <td colspan="2" valign="top">
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
   <tr>
     <td height="28" align="center" valign="middle" background="images/tab_bgh.gif" bgcolor="#F8F8F9" class="del2">
<%
if page=1 then
' Response.Write"上一页"
   else
 Response.Write"<a href=?search_key="&search_key&"&page=1>首页</a>&nbsp;"

 Response.Write"<a href=?search_key="&search_key&"&page="&page-1&">上一页</a>"
 end if
 %>
 
 <%for j=page-4 to page-1%>
 <%if j>0 then%>
<span class="STYLE3"><a href="?search_key=<%=search_key%>&page=<%=j%>">[<%=j%>]</a></span>
 <%end if%>
 <%next%>
 
<%
 for j=page to page+4
%>
<% if j<=page_count then%>
 <%if j=page then%>
 <span class="pagefx">&nbsp;<%=j%>&nbsp;</span>
 <%else%>
<span class="STYLE3"><a href="?search_key=<%=search_key%>&page=<%=j%>">[<%=j%>]</a></span>
 <%end if%> 
  <%end if%>
  <%next%>
<%if page<page_count then%>
<a href='?search_key=<%=search_key%>&page=<%=page+1%>'>下一页</a>&nbsp;
<a href='?search_key=<%=search_key%>&page=<%=page_count%>'>尾页</a>
<%
else
end if%>
</td>
   </tr>
</table>
</td>
  </tr>
</table>

<!-- #include file="sjmp5_foot.asp" -->
</body>
</html>
