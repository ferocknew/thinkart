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
	<div class="breadcrumbs text_gray12_b link_gray12_b"> <img src="../../files/images/ico_breadcrumbs.gif" align="absmiddle" /> 当前位置: <span class="link_deepGray12_b"><a href="#">管理员设定</a></span> </div>
	<div class="content_title"><img style="float:left;" src="../../files/images/ico_adminTitle.gif" />
		<div class="content_titleText">
			<li class="add_content text_deepGray14_b">管理员设定</li>
			<li class="text_deepGray10_b">Administrator Settings</li>
		</div>
	</div>
	<div class="addContent text_deepGray12_b">
		<div class="add_left">
			<form id="AdminEditAction" action="?at=adminedit&as=save" method="post">
			<table width="550" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="84">用户名</td>
					<td width="466"><input class="settingInput" type="text" name="AdminName" id="AdminName" value="{$AdminName}" /></td>
				</tr>
				<tr>
					<td width="84">密 码</td>
					<td><input name="AdminPassWord"  type="text" class="settingInput" id="AdminPassWord" /></td>
				</tr>
				<tr style="display:none">
					<td width="84">真 名</td>
					<td><input class="settingInput"  type="text" name="textfield3" id="textfield3" /></td>
				</tr>
				<tr>
					<td width="84">添加日期</td>
					<td><input class="settingInput"  type="text" name="AdminCDate" id="AdminCDate" value="{$AdminCDate}" disabled="disabled" /></td>
				</tr>
				<tr>
					<td>状 态</td>
					<td><input name="adminType_Hide" value="{$AdminType}" type="hidden" id="adminType" />
						<input type="radio" name="AdminType" value="1"/>
						启用
						</label>
						<label>
							<input type="radio" name="AdminType" value="0"/>
						关闭</label></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<div class="push"></div>
</div>
<div class="add_botton link_white12_b">
	<ul>
		<li><a href="#" id="AdminEditActionSave"><img src="../../files/images/ico_addSave.gif" align="middle" /> 保存</a></li>
		<li><a href="#"><img src="../../files/images/ico_addDel.gif" align="middle" /> 重置</a></li>
	</ul>
</div>
</body>
</html>
{include("../incDefaultScript.tpl")}
<script type="text/javascript">
//--三元判断单选设置
$("#adminType").val()*1?$(":radio[value='1']").attr("checked",true):$(":radio[value='0']").attr("checked",true);

//--图片点击递交
$("#AdminEditActionSave").click(function(){
	$("#AdminEditAction").submit()
})
//--密码框动作
$("#AdminPassWord").focus(function(){
	$(this).val("");
})
</script>