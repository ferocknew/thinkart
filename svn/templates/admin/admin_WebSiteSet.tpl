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
	<div class="breadcrumbs text_gray12_b link_gray12_b"> <img src="../../files/images/ico_breadcrumbs.gif" align="absmiddle" /> 当前位置: <span class="link_deepGray12_b"><a href="#">全站设定</a></span> </div>
	<div class="content_title"><img style="float:left;" src="../../files/images/ico_settingTitle.gif" />
		<div class="content_titleText">
			<li class="add_content text_deepGray14_b">全站设定</li>
			<li class="text_deepGray10_b">System Settings</li>
		</div>
	</div>
	<div class="addContent text_deepGray12_b">
		<div class="add_left">
		<form id="WebSiteEditForm" action="?at=websiteset&as=save" method="post">
			<table width="550" border="0" cellspacing="0" cellpadding="0" class="setting">
				<tr>
					<td width="84">网站名称</td>
					<td width="466"><input class="settingInput" type="text" name="WebSiteName" id="WebSiteName" value="{$WebSiteName}" /></td>
				</tr>
				<tr>
					<td width="84">关键字</td>
					<td><input class="settingInput"  type="text" name="WebSiteKeywords" id="WebSiteKeywords" value="{$WebSiteKeywords}" /></td>
				</tr>
				<tr>
					<td width="84" valign="top">描 述</td>
					<td><textarea name="WebSiteDescription" rows="5" class="settingInput" style="height:100px;" id="WebSiteDescription">{$WebSiteDescription}</textarea></td>
				</tr>
				<tr>
					<td width="84">版权信息</td>
					<td><table width="466" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="320"><input style="width:300px;" type="text" name="WebSiteCopyright" id="textfield14" value="{$WebSiteCopyright}" /></td>
								<td width="146">备案号
									<input style="width:100px;" type="text" name="WebSiteICP" id="textfield15" value="{$WebSiteICP}"  /></td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td>置顶设置</td>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="31%"> 最新(New)
									<input class="settingInput3"  type="text" name="textfield6" id="textfield13" />
									天</td>
								<td width="64%">最热(Hot)
									<input class="settingInput3"  type="text" name="textfield13" id="textfield6" />
									次</td>
								<td width="5%">&nbsp;</td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td>编辑器宽度</td>
					<td><p>
							<label class="settingRadio">
							<input name="WebSiteEditorWidth_hide"  type="hidden" id="WebSiteEditorWidth_hide" value="{$WebSiteEditorWidth}" />							
								<input style="border:none;" type="radio" name="WebSiteEditorWidth" value="400"/>
								400<span class="text_gray12_b"> Px</span></label>
							<label class="settingRadio">
								<input style="border:none;" type="radio" name="WebSiteEditorWidth" value="500"/>
								550<span class="text_gray12_b"> Px</span></label>
							<label class="settingRadio">
								<input style="border:none;" type="radio" name="WebSiteEditorWidth" value="700" id="RadioGroup1_1" />
								700<span class="text_gray12_b"> Px</span></label>
							<label class="settingRadio">
								<input style="border:none;" type="radio" name="WebSiteEditorWidthSelect"  />
								<input class="settingInput3"  type="text" name="WebSiteEditorWidthInput" id="WebSiteEditorWidthInput" />
								<span class="text_gray12_b"> Px</span> </label>
						</p></td>
				</tr>
				<tr>
					<td>邮件参数设置</td>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>邮件地址
									<input class="settingInput2"  type="text" name="textfield4" id="textfield4" /></td>
								<td>用户名
									<input class="settingInput2"  type="text" name="textfield7" id="textfield7" /></td>
								<td>密码
									<input class="settingInput2"  type="text" name="textfield8" id="textfield8" /></td>
							</tr>
							<tr>
								<td>POP
									<input class="settingInput2"  type="text" name="textfield9" id="textfield9" /></td>
								<td>SMTP
									<input class="settingInput2"  type="text" name="textfield10" id="textfield10" /></td>
								<td>&nbsp;</td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td>系统公告</td>
					<td><input name="WebSiteNotice"  type="text" class="settingInput" id="WebSiteNotice" value="{$WebSiteNotice}" /></td>
				</tr>
				<tr>
					<td>网站开关</td>
					<td><table width="466" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="99"><input type="hidden" name="WebSiteSwitch" id="WebSiteSwitch" value="{$WebSiteSwitch}" /><img src="../../files/images/btm_off.gif" align="middle" /></td>
								<td width="367">自定义关闭提示页
									<input name="WebSiteOffPage" type="text" id="WebSiteOffPage" style="width:250px;" value="{$WebSiteOffPage}" /></td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td>日志开关</td>
					<td><input type="hidden" name="WebSiteLog" id="WebSiteLog" value="{$WebSiteLog}" /><img src="../../files/images/btm_on.gif" align="middle" /></td>
				</tr>
			</table>
			</form>
			<br />
		</div>
	</div>
	<div class="push"></div>
</div>
<div class="add_botton link_white12_b">
	<ul>
		<li><a href="#" id="WebSiteEditAction"><img src="../../files/images/ico_addSave.gif" align="middle" /> 保存</a></li>
		<li><a href="#"><img src="../../files/images/ico_addDel.gif" align="middle" /> 重置</a></li>
	</ul>
</div>
</body>
</html>
{include("../incDefaultScript.tpl")}
<script type="text/javascript">
//编辑框宽度选项事件绑定
switch($("#WebSiteEditorWidth_hide").val()*1){
	case 400:
		$(":radio[name='WebSiteEditorWidth'][value='400']").attr("checked",true);
		break;
	case 550:
		$(":radio[name='WebSiteEditorWidth'][value='550']").attr("checked",true);
		break;
	case 700:
		$(":radio[name='WebSiteEditorWidth'][value='700']").attr("checked",true);
		break;
	default:
		$(":radio[name='WebSiteEditorWidthSelect']").attr("checked",true);
		$("#WebSiteEditorWidthInput").val($("#WebSiteEditorWidth_hide").val());
		break;
}
$(":radio[name='WebSiteEditorWidth']").click(function(){
	$(":radio[name='WebSiteEditorWidthSelect']").attr("checked",false)
	$("#WebSiteEditorWidthInput").val("").attr("disabled",true)
})
$(":radio[name='WebSiteEditorWidthSelect']").click(function(){
	if($(this).attr("checked")){
		$(":radio[name='WebSiteEditorWidth']").attr("checked",false);
		$("#WebSiteEditorWidthInput").val("").attr("disabled",false).focus();
	}
})

//--图片点击递交
$("#WebSiteEditAction").click(function(){
	$("#WebSiteEditForm").submit()
})
</script>