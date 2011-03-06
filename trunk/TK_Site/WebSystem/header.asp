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
<script language="javascript" src="js/menuControl.js"></script>
</head>
<body>
<div id="header_logo"></div>
<div id="menu_top">
  <ul>
  <div id="menu_left" class="text_white12_b"></div><!-- 预留DIV，可以插入消息或天气等信息 -->
	<%
	subMenuId = request("subMenuId")
	if subMenuId = "1" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_4('sMenu1');"><a href="#">BANNER</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_4('sMenu2');"><a href="#">新闻设置</a></li>
    <li id="sMenu3" class="bg_topMenu2 link_white12_b" onclick="selSMenu_4('sMenu3');"><a href="#">产品设置</a></li>
    <li id="sMenu4" class="bg_topMenu2 link_white12_b" onclick="selSMenu_4('sMenu4');"><a href="#">服务设置</a></li>
    <%end if%>
	<%if subMenuId = "2" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_3('sMenu1');"><a href="#">内容结构管理</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_3('sMenu2');"><a href="#">产品结构管理</a></li>
    <li id="sMenu3" class="bg_topMenu2 link_white12_b" onclick="selSMenu_3('sMenu3');"><a href="#">下载结构管理</a></li>
    <%end if%>
	<%if subMenuId = "3" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#">内容添加</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#">内容编辑</a></li>
    <%end if%>
	<%if subMenuId = "4" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#">产品添加</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#">产品编辑</a></li>
    <%end if%>
	<%if subMenuId = "5" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#">下载添加</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#">下载编辑</a></li>
    <%end if%>
	<%if subMenuId = "6" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#">留言字段管理</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#">留言内容管理</a></li>
    <%end if%>
	<%if subMenuId = "7" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#">会员添加</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#">会员编辑</a></li>
    <%end if%>
	<%if subMenuId = "8" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#">访问管理预留1</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#">访问管理预留2</a></li>
    <%end if%>    
	<%if subMenuId = "9" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#">配送设置</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#">订单维护</a></li>
    <%end if%>
	<%if subMenuId = "10" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#">定制管理预留1</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#">定制管理预留2</a></li>
    <%end if%>
	<%if subMenuId = "11" then%>
    <li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu1');"><a href="#">管理员</a></li>
    <li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu2');"><a href="#">定制功能</a></li>
    <li id="sMenu3" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu3');"><a href="#">系统设置</a></li>
    <li id="sMenu4" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu4');"><a href="#">编辑器</a></li>
    <li id="sMenu5" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu5');"><a href="#">弹出风格设定</a></li>
    <li id="sMenu6" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu6');"><a href="#">支付接口</a></li>
    <li id="sMenu7" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu7');"><a href="#">微博账户</a></li>
    <li id="sMenu8" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu8');"><a href="#">系统日志</a></li>
    <%end if%>    
    </ul>
  <div class="menu_close" onmouseover="highlightButton('buttonClose_mouseOut')" onmouseout="highlightButton('buttonClose_mouseOn')">
	<input name="B2" type="button" class="buttonClose_mouseOn" value=" ">
  </div>
</div>
<div id="header_title"><img src="images/img_siteName.gif" /></div>
<div id="header_navi"class="link_deepGray12_b">
  <ul>
    <li><a href="#"><img src="images/ico_user.gif" align="absmiddle" /> Admin</a></li>
    <li><a href="#"><img src="images/btm_logout.gif" align="absmiddle" /> 注销</a></li>
    <li><a href="header.asp?subMenuId=11"><img src="images/ico_cog.gif" align="absmiddle" /> 设置</a></li>
    <li><a style="cursor:help;" href="#"><img src="images/btm_help.gif" align="absmiddle" /> 帮助</a></li>
  </ul>
</div>

</body>
</html>
