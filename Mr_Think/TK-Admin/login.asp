<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<!--#include file="lib/header_html.asp"-->
<script language="javascript" type="text/javascript">
$(function(){
	$.getScript("lib/js/login_admin.js");
});
</script>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form id="form1" name="form1" method="post" action="../lib/dataoutput/chkuser.asp">
  <table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="30" colspan="2" align="center" class="textMsg" id="show_alert"></td>
    </tr>
    <tr>
      <td height="30" colspan="2" class="tableHead">THINK-ART 网站管理系统 - 登录</td>
    </tr>
    <tr>
      <td width="100" height="40" align="right" class="bottomDotted1px">账户：</td>
      <td height="30" class="bottomDotted1px"><input name="username" type="text" class="setLoginInput" id="username" value="请填入用户名"/></td>
    </tr>
    <tr>
      <td height="40" align="right" class="bottomDotted1px">密码：</td>
      <td height="30" class="bottomDotted1px"><input name="password" type="password" class="setLoginInput" id="password" value="请填入密码" /></td>
    </tr>
    <tr>
      <td height="40" align="right" class="bottomDotted1px">&nbsp;</td>
      <td height="30" class="bottomDotted1px"><input name="login_sys" type="submit" class="setButtom" id="login_sys" value="登录" />
        <input name="reset_sys" type="reset" class="setButtom" id="reset_sys" value="重置" /></td>
    </tr>
  </table>
</form>
</body>
<!--#include file="../lib/foot.asp" -->