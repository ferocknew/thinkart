<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="checklogin.asp"-->
<link href="files/css/style.css" rel="stylesheet" type="text/css" />
<link href="files/css/jquery.hiAlerts.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="files/js/jquery-1.3.2.min.js"></script>
<script language="javascript" src="files/js/jquery.hiAlerts-min.js"></script>
<script language="javascript" src="files/js/common.js"></script>
</head>
<body>
<!--#include file="inc_conn.asp"-->
<!--#include file="inc_pageClass.asp"-->
<!--#include file="inc_nav.asp"-->
<%
del_id = request("del_id")
if del_id <> "" then
sql = "delete from tm_user where id = "&del_id&""
conn.execute(sql)
end if
%>

<%
block_id = request("block_id")
block_type = request("block_type")
if block_type = 0 then blockopt = 1
if block_type = 1 then blockopt = 0
if block_id <> "" then
sql = "update tm_user set block = "&blockopt&" where id = "&block_id&""
conn.execute(sql)
end if
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "select * from tm_user"
rs.OPEN sql,Conn,1,1
%>

<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">用户管理</td>
      </tr>
      <tr>
        <td class="helpContent bottomDotted1px"><p>&nbsp;</p></td>
      </tr>
    </table></td>
    <td width="20" class="rightBorder1px">&nbsp;</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 用户列表</td>
            </tr>
          </table></td>
          <td height="25" align="right" class="bottomBorder1px">
          <input name="create_pj5" type="button" class="setOptButtom" id="create_pj" value="新建" onclick="javascript:document.location='adduser.asp';" /></td>
        </tr>
      </table>
      <br />
      <form action="process_add_user.asp" method="post" name="form1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="tableHead">
            <td width="150" align="center" class="inputTable">用户名</td>
            <td width="150" align="center" class="inputTable">密码</td>
            <td width="150" height="30" align="center" class="inputTable">姓名</td>
            <td width="80" align="center" class="inputTable">权限</td>
            <td width="100" align="center" class="inputTable">操作</td>
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
          <tr>
            <td align="center" class="inputTable<%if rs("block")=1 then%> navBarOver<%end if%>"><%=rs("username")%></td>
            <td align="center" class="inputTable"><%=rs("password")%></td>
            <td height="30" align="center" class="inputTable"><%=rs("tname")%></td>
            <td align="center" class="inputTable"><%=rs("power")%></td>
            <td align="center" class="inputTable"><span class="bottomBorder1px">
              <input name="create_pj4" type="button" class="setOptButtom" id="create_pj4" value="删除" onclick="javascript:if(confirm('确认删除该用户？'))location.href='listuser.asp?del_id=<%=rs("id")%>'" />
              <input name="create_pj" type="button" class="setOptButtom" id="create_pj2" value="<%if rs("block")=0 then%>锁定<%else%>解锁<%end if%>" onclick="javascript:if(confirm('确认锁定该用户？'))location.href='listuser.asp?block_id=<%=rs("id")%>&block_type=<%=rs("block")%>'" />
            </span></td>
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
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="center" class="bottomBorder1px"><% response.Write ""&strpagechar %></td>
        </tr>
    </table>
      </form>    
    <br /></td>
  </tr>
</table>
</body>
</html>
