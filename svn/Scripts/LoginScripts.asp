<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/CaptchaAdapter.asp"-->
<!--#include file="../Code/Adapter/AdminInfoAdapter.asp"-->
<script type="text/javascript">
function login_check(){
	if(document.getElementById("UserName").value == ""){
		alert("请输入用户名");
		document.getElementById("UserName").focus();
		return;
	}
	if(document.getElementById("Password").value == ""){
		alert("请输入密码");
		document.getElementById("Password").focus();
		return;
	}
	if(document.getElementById("ccode").value == ""){
		alert("请输入验证码");
		document.getElementById("ccode").focus();
		return;
	}
	document.form1.action.value="login";
	document.form1.submit();
}
</script>
<%
If Request.Form("action") = "login" Then
	if Request.Form("ccode") <> "" then
		if TestCaptcha("ASPCAPTCHA", Request.Form("ccode")) then
			UserName=Request.Form("UserName")
			Password=Request.Form("Password")
			Set currentAdminInfo = AdminInfoManager.GetPasswordByUserName(UserName)
			If Password=currentAdminInfo.Password Then
				session("user") = "admin"
				session("UserName") = currentAdminInfo.UserName
				session("TrueName") = currentAdminInfo.TrueName
				Response.Redirect "main.asp"
			Else
				Response.Write("<script>alert('用户名密码错误')</script>")
			End If
		else
			Response.Write("<script>alert('验证码错误')</script>")
		end if
	end if
End If
%>