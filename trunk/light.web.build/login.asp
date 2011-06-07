<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
username = trim(request("username"))
password = trim(request("password"))

if username <> "" and password <> "" then
	if username = "thinkart" and password = "thinkart123" then
	session("user") = "thinkart"
	response.Redirect("default.asp")
	end if
end if
%>
<body>
<!--#include file="inc_menu.asp"-->
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form id="form1" name="form1" method="post" action="">
  <table width="410" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="150" valign="top" background="images/bg_login.jpg"><table width="410" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="40" colspan="3" align="center" class="text_boldTitle">系统登录</td>
        </tr>
        <tr>
          <td width="80" height="35" align="right" class="text_eng_normal">User:</td>
          <td><input name="username" type="text" class="input_normal input_width" id="username" size="35" /></td>
          <td width="100" rowspan="2"><input name="button" type="submit" class="buttom_login" id="button" value="Login" /></td>
        </tr>
        <tr>
          <td height="35" align="right" class="text_eng_normal">Pass:</td>
          <td><input name="password" type="password" class="input_normal input_width" id="password" size="37" /></td>
        </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
