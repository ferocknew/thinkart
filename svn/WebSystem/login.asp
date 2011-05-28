<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/login_style.css" rel="stylesheet" type="text/css" />
<link href="css/font_link.css" rel="stylesheet" type="text/css" />
<!--#include file="../Scripts/LoginScripts.asp"-->
</head>
<body>
<div id="header">
    <form id="form1" name="form1" method="post" action="login.asp">
	<input type="hidden" name="action" id="action" value="" />
  <div id="header_logo"></div>
  <div id="header_title"><img src="images/img_siteName.gif" /></div>
  <div id="header_navi"class="link_deepGray12_b">
    <ul>
      <li><a style="cursor:help;" href="#"><img src="images/btm_help.gif" align="absmiddle" /> 帮助</a></li>
    </ul>
  </div>
</div>
<div id="login_bar">
  <ul>
    <li><img src="images/ico_ID.gif" align="middle" />
      <input name="UserName" type="text" id="UserName" maxlength="16" />
    </li>
    <li><img src="images/ico_pass.gif" align="middle" />
    <input name="Password" type="password" id="Password" maxlength="12" />    </li>
    <li>
    <input class="c_code" name="ccode" type="text" id="ccode" maxlength="6" />&nbsp;&nbsp;<img id="imgCaptcha" src="captcha.asp" align="absmiddle" />&nbsp;&nbsp;<a href="javascript:void(0)" onclick="RefreshImage('imgCaptcha')">刷新</a>
    </li>
  </ul>
  <div id="login_button"><img src="images/btm_login.gif" style="cursor:pointer" onclick="login_check()" /></div>
    </form>
</div>
</body>
</html>
