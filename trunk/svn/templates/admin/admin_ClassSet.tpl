<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../files/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../files/css/font_link.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" name="form1" method="post" action="contentClass_mng.asp?ccid=<%=ccid%>&cctype=<%=cctype%>" enctype="multipart/form-data">
	<input type="hidden" name="action" id="action" value="" />
	<input type="hidden" name="updid" id="updid" value="<%=ccid%>" />
	<input type="hidden" name="delid" id="delid" value="<%=ccid%>" />
	<input type="hidden" name="UpClassId" id="delid" value="0" />
	<div class="breadcrumbs text_gray12_b link_gray12_b"> <img src="../../files/images/ico_breadcrumbs.gif" align="absmiddle" /> 当前位置: <a href="#"> 内容管理</a> / <span class="link_deepGray12_b"><a href="#">公司新闻</a></span> </div>
	<div class="content_title"><img style="float:left;" src="../../files/images/ico_contentTitle.gif" />
		<div class="content_titleText">
			<li class="text_deepGray14_b">内容结构管理</li>
			<li class="text_deepGray10_b">Programs List</li>
		</div>
	</div>
	<div class="content_ctrlbar text_deepGray12_b">
		<div style="margin-top:9px; float:left;">新增主栏目
			<input type="text" name="ClassName" id="ClassName" />
			<input class="btm_submit" type="button" name="button" id="button" value=" " onclick="contentClass_add_check()" />
		</div>
		<table border="0" align="right" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
			<tr>
				<td><a href="#" onclick="hide_alltrees()"><img src="../../files/images/ico_showList.gif" align="middle" /> 全部折叠</a></td>
				<td><a href="#" onclick="show_alltrees()"><img src="../../files/images/ico_hideList.gif" align="middle" /> 全部展开</a></td>
			</tr>
		</table>
	</div>
	<div class="programs text_deepGray12_b">
		<%For i = 0 to contentclassDic.count - 1%>
		<%If contentclassDic.Items()(i).ID <> ccid Then%>
		<div class="programsItem" id="div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>">
			<div class="programsList tree<%=contentclassDic.Items()(i).LV%>_<%=contentclassDic.Items()(i).Style%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>_class" onclick="tree_click(this,'div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>');"></div>
			<div class="programsList_text" onclick="window.location='contentClass_mng.asp?ccid=<%=contentclassDic.Items()(i).ID%>&cctype=<%=contentclassDic.Items()(i).ClassType%>'"><%=contentclassDic.Items()(i).ClassName%></div>
		</div>
		<%Else%>
		<div class="programsItem" id="div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>">
			<div class="programsEdit text_white12_b">
				<div class="programsList tree<%=contentclassDic.Items()(i).LV%>_<%=contentclassDic.Items()(i).Style%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>_class" onclick="tree_click(this,'div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>');"></div>
				<div class="editBar text_white12_b">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="53"><img src="../../files/images/btm_editBar_close.gif" align="top" /></td>
							<td width="200">添加子分类
								<input name="ClassNameSon" type="text" class="programsEdit_input" id="ClassNameSon" size="8" />
								<input class="programsEdit_btm" type="button" name="button2" id="button2" onclick="contentClass_add_son_check()" value=" " /></td>
							<td class="editBar_td" width="161">升降序 <img src="../../files/images/btm_putDown.gif" align="middle" style="cursor:pointer" onclick="orderdown()" /><img src="../../files/images/btm_putUp.gif" align="middle" style="cursor:pointer" onclick="orderup()" />
								<input class="input_sort" name="Order" type="text" id="Order" value="0" size="3" maxlength="3" />
								<input class="programsEdit_btm" type="button" name="button2" id="button2" value=" " onclick="contentClass_upd_order_check()" /></td>
							<td class="link_white12_b editBar_td" width="117"><a href="#" onclick="contentClass_del_check()">删除此分类 <img src="../../files/images/ico_trash.gif" align="absmiddle" /></a></td>
						</tr>
					</table>
				</div>
				<input name="ContentClassUpd" type="text" class="programsEdit_input" id="ContentClassUpd" value="<%=contentclassDic.Items()(i).ClassName%>" size="16" />
				<input class="programsEdit_btm" type="button" name="button" id="button" value=" " onclick="contentClass_upd_check()" />
			</div>
		</div>
		<%End If%>
		<%Next%>
	</div>
	<div class="page_style text_deepGray12_b"></div>
</form>
</body>
</html>
{include("../incDefaultScript.tpl")}
<script type="text/javascript">
$("a[href='#']").attr("href","javascript:void(0);");
//===============================================================
//设置滚动条
var _DocST = GetCookie("ThinkArt-showClassST");
if (_DocST != null) {
    document.documentElement.scrollTop = _DocST;
}
$(document).scroll(function(){
    SetCookie("ThinkArt-showClassST", document.documentElement.scrollTop);
})

//===============================================================
//设置cookie
function SetCookie(name, value){
    var exp = new Date();
	var _House = 1; //超时时间
    exp.setTime(exp.getTime() + _House*60*60*1000);
    document.cookie = name + "=" + value + "; expires=" + exp.toGMTString() + "; path=/";
}
function getCookieVal(offset){
    var endstr = document.cookie.indexOf(";", offset);
    if (endstr == -1)
        endstr = document.cookie.length;
    return unescape(document.cookie.substring(offset, endstr));
}
//删除cookie
function DelCookie(name){
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = GetCookie(name);
    document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
}

//获取cookie
function GetCookie(name){
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    while (i < clen) {
        var j = i + alen;
        if (document.cookie.substring(i, j) == arg)
            return getCookieVal(j);
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0)
            break;
    }
    return null;
}
</script>