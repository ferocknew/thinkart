<!--#include file="../lib/lib-const.asp"-->
<!--#include file="../lib/lib-Head.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/content_style.css" rel="stylesheet" type="text/css" />
<link href="css/font_link.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" name="form1" method="post" action="admin_edit.asp" enctype="multipart/form-data">
<input type="hidden" name="action" id="action" value="" />
<input type="hidden" name="updid" id="updid" value="" />
<div class="wrapper">
	<div class="breadcrumbs text_gray12_b link_gray12_b"> <img src="images/ico_breadcrumbs.gif" align="absmiddle" /> 当前位置: <span class="link_deepGray12_b"><a href="#">管理员设定</a></span> </div>
	<div class="content_title"><img style="float:left;" src="images/ico_adminTitle.gif" />
		<div class="content_titleText">
			<li class="add_content text_deepGray14_b">管理员设定</li>
			<li class="text_deepGray10_b">Administrator Settings</li>
		</div>
	</div>
	<div class="addContent text_deepGray12_b">
		<div class="add_left">
			<table width="550" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="84">用户名</td>
					<td width="466"><input class="settingInput" type="text" name="UserName" id="UserName" value="" /></td>
				</tr>
				<tr>
					<td width="84">密 码</td>
					<td><input class="settingInput"  type="text" name="Password" id="Password" value="" /></td>
				</tr>
				<tr style="display:none">
					<td width="84">真 名</td>
					<td><input class="settingInput"  type="text" name="TrueName" id="TrueName" value="" /></td>
				</tr>
				<tr>
					<td width="84">添加日期</td>
					<td><input class="settingInput"  type="text" name="AddTime" id="AddTime" disabled="disabled" value="" /></td>
				</tr>
				<tr>
					<td>状 态</td>
					<td><label>
							<input type="radio" name="UserState" value="1" />
							启用</label>
						<label>
							<input type="radio" name="UserState" value="0"/>
							关闭</label></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<br />
		</div>
	</div>
	<div class="push"></div>
</div>
<div class="add_botton link_white12_b">
	<ul>
		<li><a href="#"><img src="images/ico_addSave.gif" align="middle" /> 保存</a></li>
		<li><a href="#"><img src="images/ico_addDel.gif" align="middle" /> 重置</a></li>
	</ul>
</div>
</body>
</html>
<script type="text/javascript" src="../lib/js/jquery.min.js"></script>
<script type="text/javascript" src="../files/js/Default.js"></script>
<script type="text/javascript">
//解决#条红钻的问题
$("a[href='#']").attr("href","javascript:void(0);");


$.getJSON("../" + _AjaxUrl, {
    at: "admin",
    as: "get"
}, function(json){
	//UserName 用户名
	$("#UserName").val(json.AdminName);
	$("#AddTime").val(new Date(json.AdminCDate*1000).toLocaleDateString())
	
	if(json.AdminType){
		$(":radio[value='1']").attr("checked",true);
	}else{
		$(":radio[value='0']").attr("checked",true);
	}
})
</script>