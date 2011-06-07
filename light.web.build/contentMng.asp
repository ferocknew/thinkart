<%Session.CodePage=65001%>
<!--#include file="inc_checkLogin.asp"-->
<!--#include file="inc_pageClass.asp"-->
<!--#include file="inc_conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script>
</script>

<!--#include file="inc_menu.asp"-->
<br />
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * from light_content order by id desc"
rs.OPEN sql,Conn,1,1
%>

<%
delid = request("delid")
if delid <> "" then
conn.execute("delete from light_content where id = "&delid&"")
end if
%>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" class="text_boldTitle bottom_line">内容管理</td>
  </tr>
  <tr>
    <td height="20" class="text_boldTitle bottom_line">&nbsp;</td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center" bgcolor="#FFFFCC" class="bottom_line">ID</td>
    <td align="center" bgcolor="#FFFFCC" class="bottom_line">标题</td>
    <td align="center" bgcolor="#FFFFCC" class="bottom_line">简述</td>
    <td align="center" bgcolor="#FFFFCC" class="bottom_line">所属分类</td>
    <td align="center" bgcolor="#FFFFCC" class="bottom_line">静态文件名</td>
    <td align="center" bgcolor="#FFFFCC" class="bottom_line">编辑/添加时间</td>
    <td align="center" bgcolor="#FFFFCC" class="bottom_line">操作</td>
  </tr>
  <%
    '******************分页********************
    '调用分页函数来实现分项功能
    pagesize	= FI("PageSize",10)
    page		= FI("Page", 1)
    
    Set pageObj = new PageClass
    
    pageObj.pagesize	= pagesize
    pageObj.page		= page
    
    pageObj.GetPage(rs)
    If  pageObj.EndofPage(rs) Then
    Else
    i = 1
    While Not pageObj.EndofPage(rs)
    %>
  <tr onMouseOver="this.bgColor = '#cccccc';" onMouseOut="this.bgColor='#ffffff';">
    <td height="25" align="center" class="bottom_line"><%=rs("id")%></td>
    <td align="center" class="bottom_line"><%=rs("c_title")%></td>
    <td align="center" class="bottom_line"><%=rs("c_abstract")%></td>
    <td align="center" class="bottom_line"><%=rs("c_follow_class_name")%></td>
    <td align="center" class="bottom_line"><%=rs("c_filename")%></td>
    <td align="center" class="bottom_line"><%=rs("c_edittime")%></td>
    <td align="center" class="bottom_line"><a href="contentAdd.asp?editid=<%=rs("id")%>">编辑</a> | <a href="#" onClick="{if(confirm('确定删除吗?')){window.location='contentMng.asp?delid=<%=rs("id")%>';return true;}return false;}" style="cursor:pointer;">删除</a></td>
  </tr>
	<%
    i = i + 1
    rs.Movenext
    Wend
    strpagechar = PageObj.ShowNavBar(rs)
    End If
    rs.close
    set rs=nothing
    Set pageObj = Nothing
    %> 
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" align="right" class="text_boldTitle bottom_line"><% response.Write ""&strpagechar %></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
