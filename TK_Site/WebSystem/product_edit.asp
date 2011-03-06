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
        当前位置: <a href="#"> 内容管理</a> / 
        <span class="link_deepGray12_b"><a href="#">添加编辑内容</a></span>
    </div>
    <div class="content_title"><img style="float:left;" src="images/ico_contentTitle2.gif" />
        <div class="content_titleText">
            <li class="add_content text_deepGray14_b">添加 / 编辑内容</li>
            <li class="text_deepGray10_b">Add or Edit Content</li>
        </div>
    </div>
	<div class="addContent text_deepGray12_b">
        <div class="add_left">
            <table width="550" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="46">产品名</td>
                    <td width="504"><input class="addText" type="text" name="Title" id="Title" /></td>
                </tr>
                <tr>
                    <td width="46">关键字</td>
                    <td><input class="addText"  type="text" name="Keywords" id="Keywords" /></td>
                </tr>
                <tr>
                    <td width="46">简  述</td>
                    <td><input class="addText"  type="text" name="Abstract" id="Abstract" /></td>
                </tr>
                <tr>
                    <td width="46">&nbsp;</td>
                    <td class="link_deepGray12_b">
                        <div class="img_update">
                          <div class="addImage">
                            <div id="img_tip" class="addImage_info">上传图片大小需为小于 <span class="text_orange">300K</span> 的 <span class="text_orange">JPG</span> or <span class="text_orange">GIF</span> 格式</div>
                            <input name="Img1" type="file" id="Img1" onChange="clsTip();" />
                          </div>
                        </div>
                        <div class="img_update">
                          <div class="addImage">
                            <input name="Img2" type="file" id="Img2" />
                          </div>
                        </div>
                        <div class="img_update">
                          <div class="addImage">
                           <input name="Img3" type="file" id="Img3" />
                          </div>
                        </div>
                        <div class="img_update">
                          <div class="addImage">
                            <input name="Img4" type="file" id="Img4" />
                          </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="46" valign="top">内  容</td>
                    <td><textarea name="textfield5" rows="10" class="addText" style="height:350px;" id="textfield5"></textarea></td>
                </tr>
            </table>
            <br />
        </div>
        <div class="add_right link_deepGray12_b">
          <table width="230" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td>价格
                <input name="textfield7" type="text" class="addText_r" id="Price" name="Price" /></td>
            </tr>
            <tr>
              <td>VIP 价格
                <input name="textfield8" type="text" class="addText_r" id="VIPPrice" name="VIPPrice" /></td>
            </tr>
            <tr>
              <td>数量
                <input name="textfield9" type="text" class="addText_r" id="ProductCount" name="ProductCount" /></td>
            </tr>
          </table>
          <!--#include file="thinkart_trees.asp"-->
        </div>
	</div>
	<div class="push"></div>
</div>
<div class="add_botton link_white12_b">
  <ul>
    <li><a href="#"><img src="images/ico_addSave.gif" align="middle" onclick="<%If pid="" or pid="0" then%>product_add_check()<%Else%>product_upd_check()<%End If%>" /> 保存</a></li>
    <li><a href="#"><img src="images/ico_addDel.gif" align="middle" /> 取消</a></li>
    <li><a href="#"><img src="images/ico_addMore.gif" align="middle" /> 保存后继续添加</a></li>
  </ul>
</div>
</form>
</body>
</html>
