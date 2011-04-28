﻿<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/ContentAdapter.asp" -->
<!--#include file="../Code/Adapter/UpLoad_Class.vbs.asp"-->
<!--#include file="../Code/Adapter/ContentClassAdapter.asp" -->
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
cid=Request("cid")
pageindex=Request("page")
If cid = "" Then
	cid = "0"
End If
cctype=Request("cctype")
If cctype = "" Then
	cctype = "1"
End If

dim upload
set upload = new AnUpLoad
upload.Exe = "jpg|bmp|jpeg|gif|png"
upload.MaxSize = 300 * 1024 '300K
Upload.Charset="utf-8"
upload.GetData()
dim file,savpath
If upload.forms("action") = "add" Then
	setErrors = 0
	Img = ""
	if upload.ErrorID>0 then 
		response.Write "<script>alert('"& upload.Description &"')</script>"
		setErrors = setErrors + 1
	else
		savepath = "../userfiles"
		If upload.forms("CType") = "1" Then savepath = "../WebForm/innerPages" End If
		set file = upload.files("IMG")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
	end if
	
	If setErrors = 0 Then
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
	End If
	set upload = nothing
ElseIf upload.forms("action") = "update" Then
	setErrors = 0
	Img = ""
	if upload.ErrorID>0 then 
		response.Write "<script>alert('"& upload.Description &"')</script>"
		setErrors = setErrors + 1
	else
		savepath = "../userfiles"
		set file = upload.files("IMG")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
	end if
	
	If setErrors = 0 Then
		Set ContentMod=new Content
		ContentMod.ID=upload.forms("updid")
		ContentMod.Title=upload.forms("Title")
		ContentMod.Keywords=upload.forms("Keywords")
		ContentMod.Abstract=upload.forms("Abstract")
		ContentMod.Img=Img
		ContentMod.Content=upload.forms("Content")
		ContentMod.HtmlFile=upload.forms("HtmlFile")
		ContentMod.Lasttime=Date()&" "&Time()
		ContentMod.SyncBlog=upload.forms("SyncBlog")
		ContentMod.ClassID=upload.forms("ClassID")
		ContentMod.CType=upload.forms("CType")
		Response.Write "<script>alert('"& ContentManager.UpdateContent(ContentMod) &"');window.location='content_mng.asp'</script>"
		response.End()
	End If
	set upload = nothing
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& ContentManager.DeleteContent(id) &"')</script>"
ElseIf upload.forms("action") = "alldelete" Then
	id=upload.forms("ck_input_name")
	Response.Write "<script>alert('"& ContentManager.DeleteContent(id) &"')</script>"
End If
%>