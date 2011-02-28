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
<!--#include file="../Scripts/admin_edit_scripts.asp" -->
</head>
<body>
<form id="form1" name="form1" method="post" action="admin_edit.asp" enctype="multipart/form-data">
<input type="hidden" name="action" id="action" value="" />
<input type="hidden" name="updid" id="updid" value="<%=showAdminInfo.ID%>" />
<div class="wrapper">
<div class="breadcrumbs text_gray12_b link_gray12_b">
<img src="images/ico_breadcrumbs.gif" align="absmiddle" />
当前位置: <span class="link_deepGray12_b"><a href="#">管理员设定</a></span>
</div>
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
    <td width="466"><input class="settingInput" type="text" name="UserName" id="UserName" value="<%=showAdminInfo.UserName%>" /></td>
  </tr>
  <tr>
    <td width="84">密 码</td>
    <td><input class="settingInput"  type="text" name="Password" id="Password" value="<%=showAdminInfo.Password%>" /></td>
  </tr>
  <tr>
    <td width="84">真 名</td>
    <td><input class="settingInput"  type="text" name="TrueName" id="TrueName" value="<%=showAdminInfo.TrueName%>" /></td>
  </tr>
  <tr>
    <td width="84">添加日期</td>
    <td><input class="settingInput"  type="text" name="AddTime" id="AddTime" disabled="disabled" value="<%If showAdminInfo.AddTime <> "" Then%><%=showAdminInfo.AddTime%><%Else%><%=date()%><%End If%>" /></td>
  </tr>
  <tr>
    <td>状 态</td>
    <td>
      <label>
        <input type="radio" name="UserState" value="true" id="UserState_1" <%If showAdminInfo.UserState = "True" Then%>checked="checked"<%End If%> />
        启用</label>
      <label>
        <input type="radio" name="UserState" value="false" id="UserState_0" <%If showAdminInfo.UserState <> "True" Then%>checked="checked"<%End If%> />
        关闭</label>
      </td>
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
    <li><a href="#" onclick="<%If aid="0" Then%>content_add_check()<%Else%>content_update_check()<%End If%>"><img src="images/ico_addSave.gif" align="middle" /> 保存</a></li>
    <li><a href="#"><img src="images/ico_addDel.gif" align="middle" /> 重置</a></li>
  </ul>
</div>

</body>
</html>
