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
sql = "delete from tm_building where id = "&del_id&""
conn.execute(sql)
end if
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "select * from tm_building order by id desc"
rs.OPEN sql,Conn,1,1
%>

<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+楼宇列表</td>
            </tr>
          </table></td>
          <td height="25" align="right" class="bottomBorder1px"><input name="create_pj5" type="button" class="setOptButtom" id="create_pj" value="新建" onclick="javascript:document.location='addbuilding.asp';" /></td>
        </tr>
      </table>
      <br />
      <form action="" method="post" name="form1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="tableHead">
            <td width="60" height="30" align="center" class="inputTable">等级</td>
            <td width="80" align="center" class="inputTable">区域</td>
            <td width="150" align="center" class="inputTable">楼宇名称</td>
            <td width="300" align="center" class="inputTable">联系地址</td>
            <td align="center" class="inputTable">详细情况</td>
            <td width="100" align="center" class="inputTable">操作</td>
          </tr>
          <%
	'******************分页********************
	'调用分页函数来实现分项功能
	pagesize	= FI("PageSize",20)
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
            <td height="30" align="center" class="inputTable"><%=rs("budlv")%></td>
            <td align="center" class="inputTable"><%=rs("budarea")%></td>
            <td align="center" class="inputTable"><%=rs("budname")%></td>
            <td align="center" class="inputTable"><%=rs("budaddress")%></td>
            <td align="center" class="inputTable"><%=rs("budinfo")%></td>
            <td align="center" class="inputTable"><span class="bottomBorder1px">
              <input name="create_pj4" type="button" class="setOptButtom" id="create_pj4" value="删除" onclick="javascript:if(confirm('确认删除该记录？'))location.href='listbuilding.asp?del_id=<%=rs("id")%>'" />
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
            <td height="50" align="center" class="bottomBorder1px"> &nbsp;
               <% response.Write ""&strpagechar %></td>
          </tr>
        </table>
      </form>
      <br /></td>
  </tr>
</table>
</body>
</html>
