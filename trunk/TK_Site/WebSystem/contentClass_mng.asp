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
<script type="text/javascript">
	
</script>
<!--#include file="../Scripts/ContentClassScripts.asp"-->
</head>
<body>
<form id="form1" name="form1" method="post" action="product_edit.asp" enctype="multipart/form-data">
<input type="hidden" name="action" id="action" value="" />
<input type="hidden" name="updid" id="updid" value="<%=pid%>" />
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
  <div style="margin-top:9px; float:left;">新增主栏目 
    <input type="text" name="ClassName" id="ClassName" />
    <input class="btm_submit" type="submit" name="button" id="button" value=" " />
  </div>
  <table border="0" align="right" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <tr>
    <td><a href="#"><img src="images/ico_showList.gif" align="middle" /> 全部折叠</a></td>
    <td><a href="#"><img src="images/ico_hideList.gif" align="middle" /> 全部展开</a></td>
  </tr>
</table>
</div>
<div class="programs text_deepGray12_b">
<%For i = 0 to contentclassDic.count - 1%>
	<%If contentclassDic.Items()(i).ID <> ccid Then%>
        <div class="programsItem" id="div_trees_<%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>">
            <div class="programsList tree<%=contentclassDic.Items()(i).LV%>_<%=contentclassDic.Items()(i).Style%>" onclick="tree_click(this);"></div>
            <div class="programsList_text"><%=contentclassDic.Items()(i).ClassName%></div>
        </div>
    <%Else%>
        <div class="programsItem" id="div_trees_<%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>">
            <div class="programsEdit text_white12_b">
                <div class="programsList tree<%=contentclassDic.Items()(i).LV%>_<%=contentclassDic.Items()(i).Style%>" onclick="tree_click(this);"></div>
                <input name="textfield" type="text" class="programsEdit_input" id="textfield" value="<%=contentclassDic.Items()(i).ClassName%>" size="16" />
                <input class="programsEdit_btm" type="button" name="button" id="button" value=" " />
            
            <div class="editBar text_white12_b">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="53"><img src="images/btm_editBar_close.gif" align="top" /></td>
                        <td width="200">添加子分类 <input name="textfield2" type="text" class="input_createTree" id="textfield2" size="8" />
                        <input class="programsEdit_btm" type="button" name="button2" id="button2" value=" " />
                        </td>
                        <td class="editBar_td" width="161">升降序 <img src="images/btm_putDown.gif" align="middle" /><img src="images/btm_putUp.gif" align="middle" />
                        <input class="input_sort" name="textfield3" type="text" id="textfield3" value="0" size="3" maxlength="3" />
                        <input class="programsEdit_btm" type="button" name="button2" id="button2" value=" " /></td>
                        <td class="editBar_td" width="117">删除此分类 <img src="images/ico_trash.gif" align="middle" /></td>
                    </tr>
                </table>
            </div></div>
        </div>
    <%End If%>
<%Next%>
</div>
<div class="page_style text_deepGray12_b"></div>
</form>
</body>
</html>