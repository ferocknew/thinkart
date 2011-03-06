<!--#include file="../Service/DBHelper.asp"-->
<!--#include file="../Adapter/ContentClassAdapter.asp" -->
<!--#include file="../Adapter/UpLoad_Class.vbs.asp"-->
<script type="text/javascript">
function content_add_check(){
	if(document.form1.Title.value == '')
	{
		alert('请填写内容标题');
		document.form1.Title.focus();
		return;
	}
	if(document.form1.ClassID.value == '')
	{
		alert('请选择所属分类');
		return;
	}
	document.form1.action.value = 'add';
	document.form1.submit( );
}
function content_upd_check(){
	if(document.form1.Title.value == '')
	{
		alert('请填写内容标题');
		document.form1.Title.focus();
		return;
	}
	if(document.form1.ClassID.value == '')
	{
		alert('请选择所属分类');
		return;
	}
	document.form1.action.value = 'update';
	document.form1.submit( );
}
function content_del_check(id){
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
function content_alldel_check(){
	if(confirm('确认删除？'))
	{
		document.form1.action.value = 'alldelete';
		document.form1.submit( );
	}
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
	Set ContentMod=new Content
	ContentMod.Title=upload.forms("Title")
	ContentMod.Keywords=upload.forms("Keywords")
	ContentMod.Abstract=upload.forms("Abstract")
	ContentMod.Img=Img
	ContentMod.Content=upload.forms("Content")
	ContentMod.Lasttime=Date()&" "&Time()
	ContentMod.SyncBlog=upload.forms("SyncBlog")
	ContentMod.ClassID=upload.forms("ClassID")
	ContentMod.CType=upload.forms("CType")
	Response.Write "<script>alert('"& ContentManager.InsertContent(ContentMod) &"');window.location='content_mng.asp'</script>"
	response.End()
ElseIf upload.forms("action") = "update" Then
	Set ContentMod=new Content
	ContentMod.ID=cid
	ContentMod.Title=upload.forms("Title")
	ContentMod.Keywords=upload.forms("Keywords")
	ContentMod.Abstract=upload.forms("Abstract")
	ContentMod.Img=Img
	ContentMod.Content=upload.forms("Content")
	ContentMod.Lasttime=Date()&" "&Time()
	ContentMod.SyncBlog=upload.forms("SyncBlog")
	ContentMod.ClassID=upload.forms("ClassID")
	ContentMod.CType=upload.forms("CType")
	Response.Write "<script>alert('"& ContentManager.UpdateContent(ContentMod) &"');window.location='content_mng.asp'</script>"
	response.End()
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& ContentManager.DeleteContent(id) &"')</script>"
ElseIf upload.forms("action") = "alldelete" Then
	id=upload.forms("ck_input_name")
	Response.Write "<script>alert('"& ContentManager.DeleteContent(id) &"')</script>"
End If

<!--#include file="../Scripts/loadClass.asp"-->
%>