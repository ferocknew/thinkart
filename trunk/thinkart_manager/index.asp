<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="files/css/style.css" rel="stylesheet" type="text/css" />
<title>THINK-ART 内部管理系统</title>
</head>

<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<%
username = trim(request("username"))
password = trim(request("password"))

if username <> "" and password <> "" then
    Set rs = Server.CreateObject("ADODB.Recordset")
    sql = "SELECT * FROM tm_user where username = '"&username&"' and password = '"&password&"'"
    rs.OPEN sql,Conn,1,1
	if not rs.eof then
	session("username") = rs("username")
	session("tname") = rs("tname")
	session("power") = rs("power")
	response.redirect "listproject.asp"
	else
	errTag = 1
	end if
end if
%>
<form id="form1" name="form1" method="post" action="">
  <table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="30" colspan="2" align="center" class="textMsg">
      <%if errTag = 1 then%>用户名或密码错误,请重新输入<%end if%>
      </td>
    </tr>
    <tr>
      <td height="30" colspan="2" class="tableHead">THINK-ART 内部管理系统 - 登录</td>
    </tr>
    <tr>
      <td width="100" height="40" align="right" class="bottomDotted1px">账户：</td>
      <td height="30" class="bottomDotted1px"><input name="userName" type="text" class="setLoginInput" id="userName" /></td>
    </tr>
    <tr>
      <td height="40" align="right" class="bottomDotted1px">密码：</td>
      <td height="30" class="bottomDotted1px"><input name="password" type="password" class="setLoginInput" id="password" /></td>
    </tr>
    <tr>
      <td height="40" align="right" class="bottomDotted1px">&nbsp;</td>
      <td height="30" class="bottomDotted1px">
        <input name="login_sys" type="submit" class="setButtom" id="login_sys" value="登录" />
          <input name="reset_sys" type="reset" class="setButtom" id="reset_sys" value="重置" />
      </td>
    </tr>
  </table>
</form>
</body>
</html>
