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
<script language="javascript" src="../include/jquery-1.4.4.min.js"></script>
<script language="javascript" src="../include/jquery.filestyle.js"></script>
<script language="javascript" src="js/common.js"></script>
<script language="javascript" src="js/fileInputInit.js"></script>
<!--#include file="../Scripts/ProductScripts.asp" -->
</head>

<body>
<form id="form1" name="form1" method="post" action="product_edit.asp" enctype="multipart/form-data">
<input type="hidden" name="action" id="action" value="" />
<input type="hidden" name="updid" id="updid" value="<%=pid%>" />
<div class="wrapper">
<div class="breadcrumbs text_gray12_b link_gray12_b">
<img src="images/ico_breadcrumbs.gif" align="absmiddle" />
当前位置: <a href="#"> 下载管理</a> / 
<span class="link_deepGray12_b"><a href="#">添加下载</a></span>
</div>
<div class="content_title"><img style="float:left;" src="images/ico_downloadTitle.gif" />
  <div class="content_titleText">
  <li class="add_content text_deepGray14_b">添加下载</li>
  <li class="text_deepGray10_b">Add Download File</li>
  </div>
</div>
<div class="addContent text_deepGray12_b">
<div class="add_left">
  <table width="550" border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td width="46">&nbsp;</td>
    <td class="link_deepGray12_b">
      <div class="img_update">
        <div class="addImage">
          <div id="img_tip" class="addImage_info">上传文件大小需大于 <span class="text_orange">30K</span></div>
          <input name="FileName" type="file" id="FileName" onchange="clsTip();" />
          </div>
        </div></td>
  </tr>
  <tr>
    <td width="46">下载名</td>
    <td width="504"><input class="addText" type="text" name="ShowName" id="ShowName" /></td>
  </tr>
  <tr>
    <td width="46">关键字</td>
    <td><input class="addText"  type="text" name="KeyWords" id="KeyWords" /></td>
  </tr>
  <tr>
    <td width="46" valign="top">描 述</td>
    <td><textarea name="Abstract" rows="10" class="addText" style="height:350px;" id="Abstract"></textarea></td>
  </tr>
</table>
<br />
</div>
<div class="add_right link_deepGray12_b">
  <!--#include file="thinkart_trees.asp"-->
</div>
</div>
<div class="push"></div>
</div>
<div class="add_botton link_white12_b">
  <ul>
    <li><a href="#"><img src="images/ico_addSave.gif" align="middle" onclick="<%If did="" or did="0" then%>download_add_check()<%Else%>download_upd_check()<%End If%>" /> 保存</a></li>
    <li><a href="#"><img src="images/ico_addDel.gif" align="middle" /> 取消</a></li>
    <li><a href="#"><img src="images/ico_addMore.gif" align="middle" /> 保存后继续添加</a></li>
  </ul>
</div>
</form>
</body>
</html>
