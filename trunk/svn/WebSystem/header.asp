﻿<!--#include file="../lib/lib-const.asp"-->
<!--#include file="checkLogin.asp"-->
<!--#include file="../Scripts/PowerControl.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/style_header.css" rel="stylesheet" type="text/css" />
<link href="css/font_link.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/menuControl.js"></script>
</head>
<body>
<div id="header_logo"></div>
<div id="menu_top">
	<ul>
		<div id="menu_left" class="text_white12_b"></div>
		<!-- 预留DIV，可以插入消息或天气等信息 -->
		<%
		subMenuId = Request.QueryString("subMenuId")
		Select Case subMenuId
		Case  "1"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_4('sMenu1');"><a href="#" target="mainFrame">BANNER</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_4('sMenu2');"><a href="#" target="mainFrame">新闻设置</a></li>
		<li id="sMenu3" class="bg_topMenu2 link_white12_b" onclick="selSMenu_4('sMenu3');"><a href="#" target="mainFrame">产品设置</a></li>
		<li id="sMenu4" class="bg_topMenu2 link_white12_b" onclick="selSMenu_4('sMenu4');"><a href="#" target="mainFrame">服务设置</a></li>
		<%
		Case "2"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_3('sMenu1');"><a href="contentClass_mng.asp?cctype=1" target="mainFrame">内容结构管理</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_3('sMenu2');"><a href="contentClass_mng.asp?cctype=2" target="mainFrame">产品结构管理</a></li>
		<li id="sMenu3" class="bg_topMenu2 link_white12_b" onclick="selSMenu_3('sMenu3');"><a href="contentClass_mng.asp?cctype=3" target="mainFrame">下载结构管理</a></li>
		<%
		Case "3"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="content_edit.asp" target="mainFrame">内容添加</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="content_mng.asp" target="mainFrame">内容编辑</a></li>
		<!--bg_topMenu link_black12_b-->
		<%
		Case "4"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="product_edit.asp" target="mainFrame">产品添加</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="product_mng.asp" target="mainFrame">产品编辑</a></li>
		<%
		Case "5"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="download_edit.asp" target="mainFrame">下载添加</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="download_mng.asp" target="mainFrame">下载编辑</a></li>
		<%
		Case "6"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#" target="mainFrame">留言字段管理</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#" target="mainFrame">留言内容管理</a></li>
		<%
		Case "7"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#" target="mainFrame">会员添加</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#" target="mainFrame">会员编辑</a></li>
		<%
		Case "8"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu1');"><a href="../extraModel/analysis/index.asp" target="mainFrame">综合统计</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu2');"><a href="../extraModel/analysis/fenxi_lfjl.asp" target="mainFrame">来源记录</a></li>
		<li id="sMenu3" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu3');"><a href="../extraModel/analysis/search_html_ly.asp" target="mainFrame">来源页面排名</a></li>
		<li id="sMenu4" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu4');"><a href="../extraModel/analysis/search_html.asp" target="mainFrame">受访页面排名</a></li>
		<li id="sMenu5" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu5');"><a href="../extraModel/analysis/search_ip.asp" target="mainFrame">独立IP排名</a></li>
		<li id="sMenu6" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu6');"><a href="../extraModel/analysis/search_keyword.asp" target="mainFrame">单日关键字</a></li>
		<li id="sMenu7" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu7');"><a href="../extraModel/analysis/search_keyword_total.asp" target="mainFrame">总关键字</a></li>
		<li id="sMenu8" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu8');"><a href="#" target="mainFrame">数据操作</a></li>
		<%
		Case "9"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#" target="mainFrame">配送设置</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#" target="mainFrame">订单维护</a></li>
		<%
		Case "10"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="#" target="mainFrame">定制管理预留1</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu2');"><a href="#" target="mainFrame">定制管理预留2</a></li>
		<%
		Case "11"
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu1');"><a href="admin_edit.asp" target="mainFrame">管理员</a></li>
		<li id="sMenu2" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu2');"><a href="#" target="mainFrame">定制功能</a></li>
		<li id="sMenu3" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu3');"><a href="Setting_Site.html" target="mainFrame">系统设置</a></li>
		<li id="sMenu4" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu4');"><a href="#" target="mainFrame">编辑器</a></li>
		<li id="sMenu5" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu5');"><a href="#" target="mainFrame">弹出风格设定</a></li>
		<li id="sMenu6" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu6');"><a href="#" target="mainFrame">支付接口</a></li>
		<li id="sMenu7" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu7');"><a href="#" target="mainFrame">微博账户</a></li>
		<li id="sMenu8" class="bg_topMenu2 link_white12_b" onclick="selSMenu_8('sMenu8');"><a href="#" target="mainFrame">系统日志</a></li>
		<%
		Case Else
		'默认菜单
		%>
		<li id="sMenu1" class="bg_topMenu2 link_white12_b" onclick="selSMenu_2('sMenu1');"><a href="content_edit.asp" target="mainFrame">内容添加</a></li>
		<li id="sMenu2" class="bg_topMenu link_black12_b" onclick="selSMenu_2('sMenu2');"><a href="content_mng.asp" target="mainFrame">内容编辑</a></li>
		<!--bg_topMenu link_black12_b-->
		<%
		End Select
		%>
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
<script type="text/javascript" src="../lib/js/jquery.min.js"></script>
<script type="text/javascript">
//==============================================================
//获取地址栏get变量值
function getvalue(name){
    var str = window.location.search;
    if (str.indexOf(name) != -1) {
        var pos_start = str.indexOf(name) + name.length + 1;
        var pos_end = str.indexOf("&", pos_start);
        if (pos_end == -1) {
            return str.substring(pos_start);
        }
        else {
            return str.substring(pos_start, pos_end)
        }
    }
    else {
        return null;
    }
}
//==============================================================

//设置每个Menu默认首个功能菜单
if(getvalue("subMenuId")!=null){
	var _$temp=$("#menu_top li:first");
	_$temp.trigger("click");
	if($("a",_$temp).attr("href")!="#"){
		$("#mainFrame",window.parent.document).attr("src",$("a",_$temp).attr("href"));
	}
}
//解决#条红钻的问题
$("a[href='#']").attr("href","javascript:void(0);");
</script>