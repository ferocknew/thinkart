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
sql = "delete from tm_calendar where id = "&del_id&""
conn.execute(sql)
end if
%>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">我的工作日志</td>
      </tr>
      <tr>
        <td class="helpContent bottomDotted1px"><p>&nbsp;</p></td>
      </tr>
    </table></td>
    <td width="20" class="rightBorder1px">&nbsp;</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="center" class="bottomBorder1px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" align="left" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="120" height="35" class="tabCard">+ 我的工作日志</td>
                  </tr>
                </table></td>
                <td height="25" align="right" class="bottomBorder1px">&nbsp;</td>
              </tr>
            </table>
            <br /></td>
        </tr>
    </table>
    <%for i = 1 to 31%>
	<%
	sql = "select * from tm_calendar where work_day = "&i&" and work_people = '"&session("tname")&"'"
	set rs = conn.execute(sql)
	if not rs.eof then
	work_result = rs("work_result")
	work_detail = rs("work_detail")
	delwork_id = rs("id")
	rs.close
	set rs = nothing
	else
	work_result = ""
	work_detail = ""
	end if
	%>
    <%
	typeClass = "calendarBlock"
	if day(date()) = i then typeClass = "calendarBlock actDay"
	if work_result <> "" then typeClass = "calendarBlock dataDay"
	if day(date()) = i and work_result <> "" then typeClass = "calendarBlock actDay dataDay"
	%>
    <div class="<%=typeClass%>" title="<%=work_detail%>" <%if work_result = "" and day(date()) = i then%>onclick="document.location='addcalendar.asp'"<%end if%>><%=i%>日 <%if work_result <> "" and day(date()) = i then%>
      &nbsp;&nbsp;<a href="javascript:if(confirm('确认删除日志？'))location.href='listcalendar.asp?del_id=<%=delwork_id%>'" title="删除日志"><img src="files/images/delete.png" border="0" /></a>&nbsp;&nbsp;<a href="editcalendar.asp?edit_id=<%=delwork_id%>"><img src="files/images/edit.png" border="0" /></a>
      <%end if%><br /><%=work_result%></div>
    <%next%>
    </td>
  </tr>
</table>
</body>
</html>
