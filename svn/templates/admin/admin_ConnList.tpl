<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../files/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../files/css/font_link.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript">
function swCheck(ckBoxId,inputId){
	var img_default = "images/checkbox_default.gif";
	var img_selected = "images/checkbox_selected.gif";
	var ckBoxObj = document.getElementById(ckBoxId);
	var ckInputObj = document.getElementById(inputId);
	var ckBoxObjVal = ckBoxObj.getAttribute('src');
	if(ckBoxObjVal == img_default){
	ckBoxObj.setAttribute('src',img_selected);
	ckInputObj.value = 1;
	}else{
	ckBoxObj.setAttribute('src',img_default);
	ckInputObj.value = 0;
	}
	//alert(ckBoxObjVal);
}
</script>
<body>
<div class="breadcrumbs text_gray12_b link_gray12_b">
<img src="../../files/images/ico_breadcrumbs.gif" align="absmiddle" />
当前位置: <a href="#"> 内容管理</a> / 
<span class="link_deepGray12_b"><a href="#">公司新闻</a></span>
</div>
<table class="list_style text_deepGray12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30"><img src="../../files/images/ico_select.gif" align="middle" /></td>
    <td>内容名称</td>
    <td>修改日期</td>
    <td>所属分类</td>
    <td>操作</td>
  </tr>
</table>
<table class="list_styleBlack link_white12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30">
      <label class="checkboxBlack_content" for="checkboxBlack_content">
      <a href="#checkboxBlack_selected" id="checkboxBlack_default" onclick="checkboxBlack_content.checked=true"></a>
      <a href="#checkboxBlack_default" id="checkboxBlack_selected" onclick="checkboxBlack_content.checked=false"></a>
      </label>
    </td>
    <td width="70"><a href="#"><img src="../../files/images/btm_delete.gif" /></a></td>
    <td><a href="#"><img src="../../files/images/btm_modify.gif" /></a></td>
  </tr>
</table>
<table id="tableStyle" class="table_style text_deepGray12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr class="tr_even">
    <td><img id="ck_list_1" src="../../files/images/checkbox_default.gif" align="middle" onclick="swCheck('ck_list_1','ck_input_1');" /><input name="ck_input_1" type="text" id="ck_input_1" value="0" size="5" maxlength="1" />
      
    </td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tr_odd">
    <td width="40"><span id="tableStyle"><img src="../../files/images/checkbox_default.gif" align="middle" /></span></td>
    <td width="524"><span id="tableStyle">感谢国家感谢党</span></td>
    <td width="116"><span id="tableStyle">2010-11-12</span></td>
    <td width="105"><span id="tableStyle">公司新闻</span></td>
    <td width="203">&nbsp;</td>
  </tr>
  <tr class="tr_even">
    <td><img src="../../files/images/checkbox_default.gif" align="middle" /></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td><span id="tableStyle"><a href="#"><img src="../../files/images/ico_delete.gif" width="15" height="16" align="middle" /></a> <a href="#"><img src="../../files/images/ico_modify.gif" width="15" height="16" align="middle" /></a></span></td>
  </tr>
  <tr class="tr_odd">
    <td><span id="tableStyle"><img src="../../files/images/checkbox_default.gif" align="middle" /></span></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tr_even">
    <td><span id="tableStyle"><img src="../../files/images/checkbox_default.gif" align="middle" /></span></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tr_odd">
    <td><span id="tableStyle"><img src="../../files/images/checkbox_default.gif" align="middle" /></span></td>
    <td><span id="tableStyle">感谢国家感谢党</span></td>
    <td><span id="tableStyle">2010-11-12</span></td>
    <td><span id="tableStyle">公司新闻</span></td>
    <td>&nbsp;</td>
  </tr>
</table>
<div class="page_style text_deepGray12_b">
<img src="../../files/images/btm_prevPage.gif" align="top" /> 第 3 页 共 10 页 <img src="../../files/images/btm_nextPage.gif" align="top" />&nbsp;&nbsp; 选择 
<input name="textfield" type="text" class="input_page" id="textfield" maxlength="2" />
页 <a href="#"><img src="../../files/images/btm_enter.gif" align="top" /></a></div>
</body>
</html>
{include("../incDefaultScript.tpl")}