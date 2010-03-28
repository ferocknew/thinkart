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
function trans_type(num)
if num = 1 then response.write "网站"
if num = 2 then response.write "平面"
if num = 3 then response.write "摄影"
if num = 4 then response.write "印刷制作"
if num = 5 then response.write "其它"
end function 
%>
<%
del_id = request("del_id")
if del_id <> "" then
sql = "delete from tm_project_detail where dt_id = "&del_id&""
conn.execute(sql)
sql = "delete from tm_project where id = "&del_id&""
conn.execute(sql)
end if
%>
<%
finish_id = request("finish_id")
if finish_id <> "" then
sql = "update tm_project set pj_isok = 1 where id = "&finish_id&""
conn.execute(sql)
end if
%>
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_project order by id desc"
rs.OPEN sql,Conn,1,1
%>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">项目列表</td>
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
              <td width="120" height="35" class="tabCard">+ 项目列表</td>
            </tr>
          </table></td>
          <td height="25" align="right" class="bottomBorder1px">
          <input name="create_pj5" type="button" class="setOptButtom" id="create_pj" value="新建" onclick="javascript:document.location='addproject.asp';" /></td>
        </tr>
      </table>
      <br />
      <form action="process_add_project.asp" method="post" name="form1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="tableHead">
            <td width="50" align="center" class="inputTable">状态</td>
            <td width="80" align="center" class="inputTable">项目类型</td>
            <td height="30" align="center" class="inputTable">项目名称</td>
            <td width="80" align="center" class="inputTable">合同日期</td>
            <td width="100" align="center" class="inputTable">剩余截止(天)</td>
            <td width="150" align="center" class="inputTable">操作</td>
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
            <td align="center" class="inputTable" title="<%=rs("pj_memo")%>"><%if rs("pj_isok") = 1 then%><img src="files/images/finish.png" border="0" /><%else%><img src="files/images/run.png" border="0" /><%end if%></td>
            <td align="center" class="inputTable"><%=trans_type(rs("pj_type"))%></td>
            <td height="30" align="center" class="inputTable" onclick="javascript:document.location='projectdetail.asp?dt_id=<%=rs("id")%>';" style="cursor:pointer;"><%=rs("pj_name")%></td>
            <td align="center" class="inputTable"><%=rs("pj_start")%></td>
            <td align="center" class="inputTable"><%response.write rs("pj_end")-date()%></td>
            <td align="center" class="inputTable"><span class="bottomBorder1px">
              <input name="create_pj2" type="button" class="setOptButtom" id="create_pj2" value="编辑" onclick="javascript:document.location='editproject.asp?edit_id=<%=rs("id")%>';" />
            </span><span class="bottomBorder1px">
            <input name="create_pj3" type="button" class="setOptButtom" id="create_pj3" value="结项" onclick="javascript:if(confirm('确认结项？'))location.href='listproject.asp?finish_id=<%=rs("id")%>'" />
            </span><span class="bottomBorder1px">
            <input name="create_pj4" type="button" class="setOptButtom" id="create_pj4" value="删除" onclick="javascript:if(confirm('确认删除该项目？'))location.href='listproject.asp?del_id=<%=rs("id")%>'" />
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
