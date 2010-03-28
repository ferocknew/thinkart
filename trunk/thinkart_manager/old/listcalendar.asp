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
pj_people = request("pj_people")
work_month = request("work_month")
%>

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
                <td width="435" height="25" align="left" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="120" height="35" class="tabCard">+ <%=pj_people%>_日志</td>
                  </tr>
                </table></td>
                <td align="right" class="bottomBorder1px">
  <%if session("power") = 3 then%>                
                  <form id="form1" name="form1" method="post" action="">
                    <select name="work_month" class="setOptButtom" id="work_month">
                      <option value="1" <%if work_month = 1 or month(now())=1 then%>selected<%end if%>>01月</option>
                      <option value="2" <%if work_month = 2 or month(now())=2 then%>selected<%end if%>>02月</option>
                      <option value="3" <%if work_month = 3 or month(now())=3 then%>selected<%end if%>>03月</option>
                      <option value="4" <%if work_month = 4 or month(now())=4 then%>selected<%end if%>>04月</option>
                      <option value="5" <%if work_month = 5 or month(now())=5 then%>selected<%end if%>>05月</option>
                      <option value="6" <%if work_month = 6 or month(now())=6 then%>selected<%end if%>>06月</option>
                      <option value="7" <%if work_month = 7 or month(now())=7 then%>selected<%end if%>>07月</option>
                      <option value="8" <%if work_month = 8 or month(now())=8 then%>selected<%end if%>>08月</option>
                      <option value="9" <%if work_month = 9 or month(now())=9 then%>selected<%end if%>>09月</option>
                      <option value="10" <%if work_month = 10 or month(now())=10 then%>selected<%end if%>>10月</option>
                      <option value="11" <%if work_month = 11 or month(now())=11 then%>selected<%end if%>>11月</option>
                      <option value="12" <%if work_month = 12 or month(now())=12 then%>selected<%end if%>>12月</option>
                    </select>
  <%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_user where block <> 1"
rs.OPEN sql,Conn,1,1
%>
                    <select name="pj_people" class="setOptButtomLong" id="pj_people">
                      <option selected="selected" value="">请选择...</option>
                      <%while not rs.eof%>
                      <option value="<%=rs("tname")%>"><%=rs("tname")%></option>
                      <%rs.movenext
			wend
			rs.close
			set rs = nothing%>
                    </select>
                    <input name="button" type="submit" class="setOptButtom" id="button" value="提交" />
                  </form>
  <%end if%>
                </td>
              </tr>
            </table>
          <br /></td>
        </tr>
    </table>
    <%
	if work_month = "" then
	work_month=month(now())
	end if
	%>
	<%for i = 1 to 31%>
	<%
	if pj_people <> "" then
	sql = "select * from tm_calendar where work_day = "&i&" and work_month = "&work_month&" and work_people = '"&pj_people&"'"
	else
	sql = "select * from tm_calendar where work_day = "&i&" and work_month = "&work_month&" and work_people = '"&session("tname")&"'"
	end if
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
