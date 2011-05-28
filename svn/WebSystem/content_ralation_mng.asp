<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/content_style.css" rel="stylesheet" type="text/css" />
<link href="css/font_link.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../Scripts/ContentRelationScripts.asp" -->
<body>
<div class="breadcrumbs text_gray12_b link_gray12_b">
<img src="images/ico_breadcrumbs.gif" align="absmiddle" />
当前位置: <a href="#"> 内容管理</a> / 
<span class="link_deepGray12_b"><a href="#">公司新闻</a></span>
</div>
<div class="content_title"><img style="float:left;" src="images/ico_contentTitle.gif" />
  <div class="content_titleText">
  <li class="text_deepGray14_b">内容结构管理</li>
  <li class="text_deepGray10_b">Programs List</li>
  </div>
</div>
<div class="content_ctrlbar text_deepGray12_b">
  <table style="float:left;" border="0" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <tr>
    <td><a href="#"><img src="images/ico_add.gif" align="middle" /> 新增内容</a></td>
    <td><a href="#"><img src="images/ico_link.gif" align="middle" /> 关联内容</a></td>
    </tr>
  </table>
  <table border="0" style="float:right;"cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <tr>
    <td><a href="#"><img src="images/ico_select.gif" align="middle" /> 确认修改</a></td>
    </tr>
  </table>
</div>
<div class="content_link text_deepGray12_b">
  <div class="content_linkLeft">
      <label>
        <input type="radio" name="content_link" value="单选" id="content_link_0" />
        全部</label>
      <label>
        <input type="radio" name="content_link" value="单选" id="content_link_1" />
        内容</label>
      <input type="radio" name="content_link" value="单选" id="content_link_2" />
        产品</label>
      <input type="radio" name="content_link" value="单选" id="content_link_3" />
        下载</label>
    <div style="margin-top:10px; background:#FFF;"><!--#include file="thinkart_trees.asp" --></div>
  </div>
  <div class="content_linkCenter">关键字：
    <label for="textfield"></label>
    <input style="width:120px;" type="text" name="textfield" id="textfield" />
  <a href="#"><img src="images/btm_search.gif" width="65" height="21" align="middle" /></a> 
  <div class="content_linkSearch">
    <ul>
      <li class="mouseOn_link">小忻用了融贷通，盆满钵满</li>
      <li>小忻用了融贷通，盆满钵满</li>
      <li>小忻用了融贷通，盆满钵满</li>
      <li>小忻用了融贷通，盆满钵满</li>
      <li>小忻用了融贷通，盆满钵满</li>
    </ul>
  </div>
  </div>
  <div class="content_linkRight"> <span class="text_deepGray14_b">感谢国家感谢党</span>
<div class="content_linkSearch">
      <ul>
        <li class="mouseOn_linked">小忻用了融贷通，盆满钵满</li>
        <li>小忻用了融贷通，盆满钵满</li>
        <li>小忻用了融贷通，盆满钵满</li>
        <li>小忻用了融贷通，盆满钵满</li>
        <li>小忻用了融贷通，盆满钵满</li>
      </ul>
    </div>
  </div>
</div>
<table class="list_style text_deepGray12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30"><img src="images/ico_select.gif" align="middle" /></td>
    <td>内容名称</td>
    <td>修改日期</td>
    <td>所属分类</td>
    <td>操作</td>
  </tr>
</table>
<table class="list_styleBlack link_white12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30"><label class="checkboxBlack_content" for="checkboxBlack_content"> <a href="#checkboxBlack_selected" id="checkboxBlack_default" onclick="checkboxBlack_content.checked=true"></a> <a href="#checkboxBlack_default" id="checkboxBlack_selected" onclick="checkboxBlack_content.checked=false"></a> </label></td>
    <td width="70"><a href="#"><img src="images/btm_delete.gif" /></a></td>
    <td><a href="#"><img src="images/btm_modify.gif" /></a></td>
  </tr>
</table>
<table id="tableStyle" class="table_style text_deepGray12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr class="tr_even">
    <td><label class="checkbox_content" for="checkbox_content"> <a href="#checkbox_selected" id="checkbox_default" onclick="checkbox_content.checked=true"></a> <a href="#checkbox_default" id="checkbox_selected" onclick="checkbox_content.checked=false;"></a> </label></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tr_odd">
    <td width="40"><span id="tableStyle"><img src="images/checkbox_default.gif" align="middle" /></span></td>
    <td width="524"><span id="tableStyle">感谢国家感谢党</span></td>
    <td width="116"><span id="tableStyle">2010-11-12</span></td>
    <td width="105"><span id="tableStyle">公司新闻</span></td>
    <td width="203">&nbsp;</td>
  </tr>
  <tr class="tr_even">
    <td><span id="tableStyle"><img src="images/checkbox_selected.gif" align="middle" /></span></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td><span id="tableStyle"><a href="#"><img src="images/ico_delete.gif" width="15" height="16" align="middle" /></a> <a href="#"><img src="images/ico_modify.gif" width="15" height="16" align="middle" /></a></span></td>
  </tr>
  <tr class="tr_odd">
    <td><span id="tableStyle"><img src="images/checkbox_default.gif" align="middle" /></span></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tr_even">
    <td><span id="tableStyle"><img src="images/checkbox_default.gif" align="middle" /></span></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tr_odd">
    <td><span id="tableStyle"><img src="images/checkbox_default.gif" align="middle" /></span></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td>&nbsp;</td>
  </tr>
</table>
<div class="page_style text_deepGray12_b"></div>
</body>
</html>
