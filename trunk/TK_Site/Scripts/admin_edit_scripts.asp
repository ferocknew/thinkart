<!--#include file="../Service/DBHelper.asp"-->
<!--#include file="../Adapter/AdminInfoAdapter.asp" -->
<!--#include file="../Adapter/UpLoad_Class.vbs.asp"-->
<script type="text/javascript">
function content_add_check(){
	if(document.form1.UserName.value == '')
	{
		alert('请填写用户名');
		return;
	}
	if(document.form1.Password.value == '')
	{
		alert('请填写密码');
		return;
	}
	if(document.form1.TrueName.value == '')
	{
		alert('请填写真实姓名');
		return;
	}
	if(document.form1.AddTime.value == '')
	{
		alert('请填写添加时间');
		return;
	}
	if(document.form1.UserState.value == '')
	{
		alert('请选择用户状态');
		return;
	}
	document.form1.action.value = 'add';
	document.form1.submit( );
}
function content_update_check(){
	if(document.form1.updid.value == '')
	{
		alert('数据出错，请重新刷新该页面');
		return;
	}
	if(document.form1.UserName.value == '')
	{
		alert('请填写用户名');
		return;
	}
	if(document.form1.Password.value == '')
	{
		alert('请填写密码');
		return;
	}
	if(document.form1.TrueName.value == '')
	{
		alert('请填写真实姓名');
		return;
	}
	if(document.form1.AddTime.value == '')
	{
		alert('请填写添加时间');
		return;
	}
	if(document.form1.UserState.value == '')
	{
		alert('请选择用户状态');
		return;
	}
	document.form1.action.value = 'update';
	document.form1.submit( );
}
function content_delete_check(aid){
	document.form1.delid.value = aid
	if(document.form1.delid.value == '')
	{
		alert('请选择要删除的记录');
		return;
	}
	document.form1.action.value = 'delete';
	document.form1.submit( );
}
</script>
<%
aid=Request("aid")
If aid = "" Then
	aid = "0"
End If
Set showAdminInfo = AdminInfoManager.GetAdminInfoById(aid)

dim upload
set upload = new AnUpLoad
Upload.Charset="utf-8"
upload.GetData()
dim file,savpath
If upload.forms("action") = "add" Then
	Set AdminInfoMod=new AdminInfo
	AdminInfoMod.UserName=upload.forms("UserName")
	AdminInfoMod.Password=upload.forms("Password")
	AdminInfoMod.TrueName=upload.forms("TrueName")
	AdminInfoMod.AddTime=date()
	AdminInfoMod.UserState=upload.forms("UserState")
	Response.Write "<script>alert('"& AdminInfoManager.InsertAdminInfo(AdminInfoMod) &"');window.location='admin_mng.asp'</script>"
	set upload = nothing
ElseIf upload.forms("action") = "update" Then
	Set AdminInfoMod=new AdminInfo
	AdminInfoMod.ID=upload.forms("updid")
	AdminInfoMod.UserName=upload.forms("UserName")
	AdminInfoMod.Password=upload.forms("Password")
	AdminInfoMod.TrueName=upload.forms("TrueName")
	AdminInfoMod.UserState=upload.forms("UserState")
	Response.Write "<script>alert('"& AdminInfoManager.UpdateAdminInfo(AdminInfoMod) &"');window.location='admin_mng.asp'</script>"
	set upload = nothing
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& AdminInfoManager.DeleteAdminInfo(id) &"')</script>"
	set upload = nothing
End If
%>