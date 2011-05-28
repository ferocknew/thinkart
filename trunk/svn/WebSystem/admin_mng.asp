﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
<!--#include file="../Scripts/ProductScripts.asp" -->
<script language="javascript">
function swCheck(ckBoxId,inputId){
	var img_default = "images/checkbox_default.gif";
	var img_selected = "images/checkbox_selected.gif";
	var ckBoxObj = document.getElementById(ckBoxId);
	var ckInputObj = document.getElementById(inputId);
	var ckBoxObjVal = ckBoxObj.getAttribute('src');
	if(ckBoxObjVal == img_default){
		ckBoxObj.setAttribute('src',img_selected);
		ckInputObj.checked = true;
	}else{
		ckBoxObj.setAttribute('src',img_default);
		ckInputObj.checked = false;
	}
	//alert(ckBoxObjVal);
}
function allCheck(){
	var img_default = "images/checkbox_default.gif";
	var img_selected = "images/checkbox_selected.gif";
	var ckBoxObj = document.getElementById('ck_list_all');
	var ck_list_names=document.getElementsByName('ck_list_name');
	var ck_input_names=document.getElementsByName('ck_input_name');
	if(ckBoxObj.getAttribute('src') == img_default){
		ckBoxObj.setAttribute('src',img_selected);
		for(var i=0;i<ck_list_names.length;i++){
			ck_list_names.item(i).setAttribute('src',img_selected);
			ck_input_names.item(i).checked = true;
		}
	}else{
		ckBoxObj.setAttribute('src',img_default);
		for(var i=0;i<ck_list_names.length;i++){
			ck_list_names.item(i).setAttribute('src',img_default);
			ck_input_names.item(i).checked = false;
		}
	}
}
</script>
</head>
<body>
<form id="form1" name="form1" method="post" action="product_mng.asp" enctype="multipart/form-data">
<input type="hidden" name="action" id="action" value="" />
<input type="hidden" name="delid" id="delid" value="" />
<div class="breadcrumbs text_gray12_b link_gray12_b">
<img src="images/ico_breadcrumbs.gif" align="absmiddle" />
当前位置: <a href="#"> 内容管理</a> / 
<span class="link_deepGray12_b"><a href="#">管理员设定</a></span>
</div>
<div class="content_title"><img style="float:left;" src="images/ico_adminTitle.gif" />
  <div class="content_titleText">
    <li class="add_content text_deepGray14_b">管理员设定</li>
    <li class="text_deepGray10_b">Administrator Settings</li>
  </div>
</div>
<table class="list_style text_deepGray12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30"><img src="images/ico_select.gif" align="middle" /></td>
    <td>管理员名称</td>
    <td>锁定帐号</td>
    <td>操作</td>
  </tr>
</table>
<table class="list_styleBlack link_white12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30">
      <!--<label class="checkboxBlack_product" for="checkboxBlack_product">
      <a href="#checkboxBlack_selected" id="checkboxBlack_default" onclick="checkboxBlack_product.checked=true"></a>
      <a href="#checkboxBlack_default" id="checkboxBlack_selected" onclick="checkboxBlack_product.checked=false"></a>
      </label>-->
      <img id="ck_list_all" name="ck_list_all" src="images/checkbox_default.gif" align="middle" onclick="allCheck()" />
    </td>
    <td width="70"><a href="#"><img src="images/btm_add.gif" /></a></td>
    <td width="70"><a href="#"><img src="images/btm_lock.gif" /></a></td>
    <td width="70"><a href="#"><img src="images/btm_modify.gif" /></a></td>
    <td><a href="#" onclick="product_alldel_check()"><img src="images/btm_delete.gif" /></a></td>
  </tr>
</table>
<table id="tableStyle" class="table_style text_deepGray12_b" width="100%" border="0" cellpadding="0" cellspacing="0">
<%
'PageDic 分页数据源
set PageDic = ProductManager.GetAllProduct()
%>
<!--#include file="../Scripts/Page.asp" -->
<%
'分页生成 startindex endindex
For i=startindex to endindex
%>
<tr class="<% If i mod 2 = 0 Then %>tr_even<% Else %>tr_odd<% End If %>">
    <td>
    <img id="ck_list_<%=PageDic.Items()(i).ID%>" name="ck_list_name" src="images/checkbox_default.gif" align="middle" onclick="swCheck('ck_list_<%=PageDic.Items()(i).ID%>','ck_input_<%=PageDic.Items()(i).ID%>');" /><input name="ck_input_name" type="checkbox" id="ck_input_<%=PageDic.Items()(i).ID%>" value="<%=PageDic.Items()(i).ID%>" style="display:none" />
    </td>
    <td><span id="tableStyle"><%=PageDic.Items()(i).Title%></span></td>
    <td><span id="tableStyle"><img src="images/ico_unlock.gif" align="middle" /><img src="images/ico_lock.gif" align="middle" /> 锁定</span></td>
    <td><span id="tableStyle"><a href="#" onclick="product_del_check('<%=PageDic.Items()(i).Id%>')"><img src="images/ico_delete.gif" width="15" height="16" align="middle" /></a> <a href="product_edit.asp?pid=<%=PageDic.Items()(i).Id%>"><img src="images/ico_modify.gif" width="15" height="16" align="middle" /></a></span></td>
  </tr>
<% Next %>
</table>
<div class="page_style text_deepGray12_b"><!--分页程序-->
<%pagename="product_mng.asp"'设置页面URL地址%>
<!--#include file="../Scripts/PageTemplete.asp" -->
</div>
</form>
</body>
</html>
