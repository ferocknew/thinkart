<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<!--#include file="checkLogin.asp"-->
<!--#include file="../Scripts/PowerControl.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/style_header.css" rel="stylesheet" type="text/css" />
<link href="css/font_link.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header_logo"></div>
<div id="menu_top">
  <ul>
  <div id="menu_left" class="text_white12_b"></div><!-- 预留DIV，可以插入消息或天气等信息 -->
    <li class="bg_topMenu2 link_white12_b"><a href="#"><img src="images/ico_user.gif" align="top" /> 二级菜单</a></li>
    <li class="bg_topMenu link_black12_b"><a href="#">最少三</a></li>
    <li class="bg_topMenu link_black12_b"><a href="#"><img src="images/ico_user.gif" align="top" /> 最多八个字加图标</a></li>  </ul>
  <div class="menu_close" onmouseover="highlightButton('buttonClose_mouseOut')" onmouseout="highlightButton('buttonClose_mouseOn')">
	<input name="B2" type="button" class="buttonClose_mouseOn" value=" ">
  </div>
</div>
<div id="header_title"><img src="images/img_siteName.gif" /></div>
<div id="header_navi"class="link_deepGray12_b">
  <ul>
    <li><a href="#"><img src="images/ico_user.gif" align="absmiddle" /> Admin</a></li>
    <li><a href="#"><img src="images/btm_logout.gif" align="absmiddle" /> 注销</a></li>
    <li><a style="cursor:help;" href="#"><img src="images/btm_help.gif" align="absmiddle" /> 帮助</a></li>
  </ul>
</div>

</body>
</html>
