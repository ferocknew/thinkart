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
if num = 1 then response.write "WEB"
if num = 2 then response.write "FLAT"
if num = 3 then response.write "PHOTO"
if num = 4 then response.write "PRINT"
if num = 5 then response.write "OTHER"
end function 
%>
<%
dt_id = request("dt_id")
if dt_id <> "" then
sql = "select * from tm_project where id = "&dt_id&""
set rs = conn.execute(sql)
pj_type = rs("pj_type")
pj_start = rs("pj_start")
pj_end = rs("pj_end")
pj_name = rs("pj_name")
pj_desc = rs("pj_desc")
pj_price = rs("pj_price")
pj_pay = rs("pj_pay")
pj_memo = rs("pj_memo")
rs.close
set rs = nothing
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
        <td height="50" class="helpTitle bottomDotted1px">项目信息</td>
      </tr>
      <tr>
        <td class="helpContent bottomDotted1px"><p>完整的项目清单。<br />
            <br />
            *可以查看、编辑、项目详细资料<br />
*可以增加单个项目的历史进度节点。</p></td>
      </tr>
    </table></td>
    <td width="20" class="rightBorder1px">&nbsp;</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 项目详细信息</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td height="50" align="center" class="bottomBorder1px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="tableHead">
              <td width="25%" height="25">项目类型</td>
              <td width="25%">项目名称</td>
              <td width="25%">合同日期</td>
              <td width="25%">剩余时间</td>
            </tr>
            <tr class="rightBorder1px">
              <td height="25" align="center" class="rightBorder1px"><%=trans_type(pj_type)%></td>
              <td align="center" class="rightBorder1px"><%=pj_name%></td>
              <td align="center" class="rightBorder1px"><%=pj_start%></td>
              <td align="center"><%=pj_end%> ——— [<%response.write rs("pj_end")-date()%>]</td>
            </tr>
            <tr class="tableHead">
              <td height="25" colspan="2">项目描述</td>
              <td>项目金额</td>
              <td>项目成本</td>
            </tr>
            <tr class="rightBorder1px">
              <td height="25" colspan="2" align="center" class="rightBorder1px"><%=pj_desc%> -<a href="#" title="<%=pj_memo%>">[备]</a></td>
              <td align="center" class="rightBorder1px"><%=pj_price%></td>
              <td align="center"><%=pj_pay%></td>
            </tr>
          </table></td>
        </tr>
    </table>
    <br /></td>
  </tr>
</table>
</body>
</html>
