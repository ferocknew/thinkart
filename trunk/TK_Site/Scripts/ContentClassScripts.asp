<!--#include file="../Service/DBHelper.asp"-->
<!--#include file="../Adapter/ContentClassAdapter.asp" -->
<!--#include file="../Adapter/UpLoad_Class.vbs.asp"-->
<script type="text/javascript">
function contentClass_add_check(){
	if(document.form1.ClassName.value == '')
	{
		alert('请输入结构名称');
		document.form1.ClassName.focus();
		return;
	}
	document.form1.action.value = 'add';
	document.form1.submit( );
}
function contentClass_upd_check(){
	if(document.form1.ClassName.value == '')
	{
		alert('请输入结构名称');
		document.form1.ClassName.focus();
		return;
	}
	document.form1.action.value = 'update';
	document.form1.submit( );
}
function contentClass_del_check(id){
	document.form1.delid.value = id;
	if(document.form1.delid.value == '')
	{
		alert('请选择要删除的项');
		return;
	}
	if(confirm('确认删除？'))
	{
		document.form1.action.value = 'delete';
		document.form1.submit( );
	}
}
function contentClass_upd_order_check(){
	if(document.form1.Order.value == '')
	{
		alert('请输入排序数量');
		document.form1.Order.focus();
		return;
	}
	document.form1.action.value = 'update_order';
	document.form1.submit( );
}
</script>
<%
ccid=Request("ccid")
ctype=Request("ctype")
If ccid = "" Then
	ccid = "1"
End If
If ctype = "" Then
	ctype = "1"
End If

dim upload
set upload = new AnUpLoad
Upload.Charset="utf-8"
upload.GetData()
If upload.forms("action") = "add" Then
	Set ContentClassMod=new ContentClass
	ContentClassMod.ClassName=upload.forms("ClassName")
	ContentClassMod.UpClassId=upload.forms("UpClassId")
	ContentClassMod.Order=upload.forms("Order")
	ContentClassMod.Show2hide="1"
	ContentClassMod.ClassType=ctype
	Response.Write "<script>alert('"& ContentClassManager.InsertContentClass(ContentClassMod) &"');window.location='contentClass_mng.asp'</script>"
	response.End()
ElseIf upload.forms("action") = "update" Then
	Set ContentClassMod=new ContentClass
	ContentClassMod.ID=cid
	ContentClassMod.Title=upload.forms("Title")
	ContentClassMod.Keywords=upload.forms("Keywords")
	ContentClassMod.SyncBlog=upload.forms("SyncBlog")
	ContentClassMod.ClassID=upload.forms("ClassID")
	ContentClassMod.CType=upload.forms("CType")
	Response.Write "<script>alert('"& ContentClassManager.UpdateContentClass(ContentClassMod) &"');window.location='contentClass_mng.asp'</script>"
	response.End()
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& ContentClassManager.DeleteContentClass(id) &"')</script>"
ElseIf upload.forms("action") = "alldelete" Then
	id=upload.forms("ck_input_name")
	Response.Write "<script>alert('"& ContentClassManager.DeleteContentClass(id) &"')</script>"
End If
%>
<!--#include file="../Scripts/loadClass.asp"-->