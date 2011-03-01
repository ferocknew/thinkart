<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<!--#include file="checkLogin.asp"-->
<!--#include file="../Scripts/PowerControl.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/content_style.css" rel="stylesheet" type="text/css" />
<link href="css/font_link.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../include/xheditor-1.1.4/common.css" type="text/css" media="screen" />
<script language="javascript" src="../include/jquery-1.4.4.min.js"></script>
<script language="javascript" src="../include/xheditor-1.1.4/xheditor-zh-cn.min.js?v=1.1.4"></script>
<script type="text/javascript">
$(function(){$('#xhContent').xheditor({upLinkUrl:"../Adapter/upload.asp",upLinkExt:"zip,rar,txt",upImgUrl:"../Adapter/upload.asp",upImgExt:"jpg,jpeg,gif,png",upFlashUrl:"../Adapter/upload.asp",upFlashExt:"swf",upMediaUrl:"../Adapter/upload.asp",upMediaExt:"wmv,avi,wma,mp3,mid"});});
</script>
<!--#include file="../Scripts/ContentScripts.asp" -->
</head>
<body>
<form id="form1" name="form1" method="post" action="content_edit.asp" enctype="multipart/form-data">
<input type="hidden" name="action" id="action" value="" />
<input type="hidden" name="updid" id="updid" value="<%=cid%>" />
<%
Set showContent = ContentManager.GetContentById(cid)
showClass = showContent.ClassID
%>
<div class="wrapper">
<div class="breadcrumbs text_gray12_b link_gray12_b">
<img src="images/ico_breadcrumbs.gif" align="absmiddle" />
当前位置: <a href="#"> 内容管理</a> / 
<span class="link_deepGray12_b"><a href="#">添加编辑内容</a></span>
</div>
<div class="content_title"><img style="float:left;" src="images/ico_contentTitle2.gif" />
  <div class="content_titleText">
    <li class="add_content text_deepGray14_b">添加 / 编辑内容</li>
    <li class="text_deepGray10_b">Add or Edit Content</li>
  </div>
  <div class="content_titleInput">
  	<ul>
      <li><input type="radio" name="CType" value="0" id="CType_0" <%If showContent.CType="" or showContent.CType="0" Then%>checked="checked"<%End If%> />
        <span class="text_deepGray12_b">直接编辑</span></li>
      <li><input type="radio" name="CType" value="1" id="CType_1" <%If showContent.CType="1" Then%>checked="checked"<%End If%> />
        <span class="text_deepGray12_b">上传网页</span></li>
	</ul>
  </div>
</div>
<div class="addContent text_deepGray12_b">
<div class="add_left">
  <table width="550" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50">标  题</td>
    <td width="500"><input class="addText" type="text" name="Title" id="Title" value="<%=showContent.Title%>" /></td>
  </tr>
  <tr>
    <td>关键字</td>
    <td><input class="addText"  type="text" name="Keywords" id="Keywords" value="<%=showContent.Keywords%>" /></td>
  </tr>
  <tr>
    <td>简  述</td>
    <td><input class="addText"  type="text" name="Abstract" id="Abstract" value="<%=showContent.Abstract%>" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="link_deepGray12_b"><span style="float:left;"><img src="images/ico_img.gif" align="middle" /> <a href="#">上传插图</a></span>
    <div class="addImage">
    <div class="addImage_info">上传图片大小需为小于 <span class="text_orange">300K</span> 的 <span class="text_orange">JPG</span> or <span class="text_orange">GIF</span> 格式</div>
    <input name="textfield" type="text" id="textfield" readonly="readonly" />
    </div></td>
  </tr>
  <tr>
    <td valign="top">内  容</td>
    <td><textarea name="xhContent" rows="10" class="addText" style="height:350px;" id="xhContent"><%=showContent.Content%></textarea><input type="hidden" name="Content" id="Content" value="" /></td>
  </tr>
</table>
<br />
</div>
<!--#include file="thinkart_trees.asp"-->
</div>
<div class="push"></div>
</div>
<div class="add_botton link_white12_b">
  <ul>
    <li><a href="#" onclick="$('#Content').val($('#xhContent').val());<%If cid="" or cid="0" then%>content_add_check()<%Else%>content_upd_check()<%End If%>"><img src="images/ico_addSave.gif" align="middle" /> 保存</a></li>
    <li><a href="#"><img src="images/ico_addDel.gif" align="middle" /> 取消</a></li>
    <li><a href="#"><img src="images/ico_addMore.gif" align="middle" /> 保存后继续添加</a></li>
  </ul>
</div>
</form>
</body>
</html>
