<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/ContentClassAdapter.asp" -->
<!--#include file="../Code/Adapter/UpLoad_Class.vbs.asp"-->
<script type="text/javascript">
function orderup(){
	try{
		$('#Order').val(parseInt($('#Order').val())+1);
		if($('#Order').val()=='NaN')
			$('#Order').val('0');
	}catch(e){
		$('#Order').val('0');
	}
}
function orderdown(){
	try{
		$('#Order').val(parseInt($('#Order').val())-1);
		if($('#Order').val()=='NaN')
			$('#Order').val('0');
	}catch(e){
		$('#Order').val('0');
	}
}
function contentClass_add_check(){
	if(document.form1.ClassName.value == '')
	{
		alert('请输入结构名称');
		document.form1.ClassName.focus();
		return;
	}
	document.form1.UpClassId.value = "0";
	document.form1.action.value = 'add';
	document.form1.submit( );
}
function contentClass_add_son_check(){
	if(document.form1.ClassNameSon.value == '')
	{
		alert('请输入结构名称');
		document.form1.ClassNameSon.focus();
		return;
	}
	document.form1.action.value = 'add_son';
	document.form1.submit( );
}
function contentClass_upd_check(){
	if(document.form1.ContentClassUpd.value == '')
	{
		alert('请输入结构名称');
		document.form1.ContentClassUpd.focus();
		return;
	}
	document.form1.action.value = 'update';
	document.form1.submit( );
}
function contentClass_del_check(){
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
	if(document.form1.Order.value == '' || parseInt($('#Order').val())+''=='NaN')
	{
		alert('请输入正确的排序数量');
		document.form1.Order.focus();
		return;
	}
	document.form1.action.value = 'update_order';
	document.form1.submit( );
}
</script>
<%
ccid=Request("ccid")
cctype=Request("cctype")
If ccid = "" Then
	ccid = "1"
End If
If cctype = "" Then
	cctype = "1"
End If

dim upload
set upload = new AnUpLoad
Upload.Charset="utf-8"
upload.GetData()
If upload.forms("action") = "add" Then
	Set ContentClassMod=new ContentClassInfo
	ContentClassMod.ClassName=upload.forms("ClassName")
	ContentClassMod.UpClassId=upload.forms("UpClassId")
	ContentClassMod.Order=upload.forms("Order")
	ContentClassMod.Show2hide="true"
	ContentClassMod.ClassType=cctype
	Response.Write "<script>alert('"& ContentClassManager.InsertContentClass(ContentClassMod) &"');window.location='contentClass_mng.asp'</script>"
	response.End()
ElseIf upload.forms("action") = "add_son" Then
	Set ContentClassMod=new ContentClassInfo
	ContentClassMod.ClassName=upload.forms("ClassNameSon")
	ContentClassMod.UpClassId=ccid
	ContentClassMod.Order=upload.forms("Order")
	ContentClassMod.Show2hide="true"
	ContentClassMod.ClassType=cctype
	Response.Write "<script>alert('"& ContentClassManager.InsertContentClass(ContentClassMod) &"');window.location='contentClass_mng.asp'</script>"
	response.End()
ElseIf upload.forms("action") = "update" Then
	Set ContentClassMod=new ContentClassInfo
	ContentClassMod.ID=ccid
	ContentClassMod.ClassName=upload.forms("ContentClassUpd")
	Response.Write "<script>alert('"& ContentClassManager.UpdateContentClass(ContentClassMod) &"');window.location='contentClass_mng.asp?ccid="& ccid &"'</script>"
	response.End()
ElseIf upload.forms("action") = "update_order" Then
	Set ContentClassMod=new ContentClassInfo
	ContentClassMod.ID=ccid
	ContentClassMod.Order=upload.forms("Order")
	Response.Write "<script>alert('"& ContentClassManager.UpdateContentClassOrder(ContentClassMod) &"');window.location='contentClass_mng.asp?ccid="& ccid &"'</script>"
	response.End()
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& ContentClassManager.DeleteContentClass(id) &"');window.location='contentClass_mng.asp'</script>"
End If
%>
<!--#include file="../Scripts/loadClass.asp"-->