<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../files/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../files/css/font_link.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="wrapper">
<div class="breadcrumbs text_gray12_b link_gray12_b">
<img src="../../files/images/ico_breadcrumbs.gif" align="absmiddle" />
当前位置: <a href="#"> 内容管理</a> / 
<span class="link_deepGray12_b"><a href="#">添加编辑内容</a></span>
</div>
<div class="content_title"><img style="float:left;" src="../../files/images/ico_contentTitle2.gif" />
  <div class="content_titleText">
  <li class="add_content text_deepGray14_b">添加 / 编辑内容</li>
  <li class="text_deepGray10_b">Add or Edit Content</li>
  </div>
  <div class="content_titleInput">
    <ul>
      <li>
        <input name="RadioGroup1" type="radio" id="RadioGroup1_0" value="单选" checked="checked" />
        <span class="text_deepGray12_b">直接编辑</span></li>
      <li>
        <input type="radio" name="RadioGroup1" value="单选" id="RadioGroup1_1" />
        <span class="text_deepGray12_b">上传网页</span></li>
    </ul>
  </div>
</div>
<div class="addContent text_deepGray12_b">
<div class="add_left">
  <table width="550" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50">标  题</td>
    <td width="500"><input class="addText" type="text" name="textfield2" id="textfield2" /></td>
  </tr>
  <tr>
    <td>关键字</td>
    <td><input class="addText"  type="text" name="textfield3" id="textfield3" /></td>
  </tr>
  <tr>
    <td>简  述</td>
    <td><input class="addText"  type="text" name="textfield4" id="textfield4" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="link_deepGray12_b"><span style="float:left;"><img src="../../files/images/ico_img.gif" align="middle" /> <a href="#">上传插图</a></span>
    <div class="addImage">
    <div class="addImage_info">上传图片大小需为小于 <span class="text_orange">300K</span> 的 <span class="text_orange">JPG</span> or <span class="text_orange">GIF</span> 格式</div>
    <input name="textfield" type="text" id="textfield" readonly="readonly" />
    </div></td>
  </tr>
  <tr>
    <td valign="top">内  容</td>
    <td><textarea name="Content" rows="10" class="addText" style="height:350px;" id="Content"></textarea></td>
  </tr>
</table>
<br />
</div>
<div class="add_right link_deepGray12_b"><table width="230" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>所属分类 
      <input name="textfield6" type="text" class="add_grayInput" id="textfield6" value="请选择分类" readonly="readonly" /></td>
  </tr>
  <tr>
    <td>      <span class="text_gray12_b">选择分类：</span> <a href="#"><img src="../../files/images/ico_showList.gif" align="middle" /> 全部折叠</a>&nbsp;&nbsp; <a href="#"><img src="../../files/images/ico_hideList.gif" align="middle" /> 全部展开</a></td>
  </tr>
  <tr>
    <td style="height:385px; border:1px dashed #999; margin-bottom:10px;">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#CCCCCC">上次选择的分类： <img src="../../files/images/ico_tag.gif" align="middle" /> 行业新闻</td>
  </tr>
  <tr></tr>
</table>
</div>
</div>
<div class="push"></div>
</div>
<div class="add_botton link_white12_b">
  <ul>
    <li><a href="#"><img src="../../files/images/ico_addSave.gif" align="middle" /> 保存</a></li>
    <li><a href="#"><img src="../../files/images/ico_addDel.gif" align="middle" /> 取消</a></li>
    <li><a href="#"><img src="../../files/images/ico_addMore.gif" align="middle" /> 保存后继续添加</a></li>
  </ul>
</div>

</body>
</html>
{include("../incDefaultScript.tpl")}
<script language="javascript" src="../../files/js/xheditor/xheditor-1.1.7-zh-cn.min.js"></script>
<script type="text/javascript">
$('#Content').xheditor({tools:'simple'});
</script>