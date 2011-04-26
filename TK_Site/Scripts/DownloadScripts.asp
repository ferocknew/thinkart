<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/DownloadFileAdapter.asp" -->
<!--#include file="../Code/Adapter/UpLoad_Class.vbs.asp"-->
<!--#include file="../Code/Adapter/ContentClassAdapter.asp" -->
<script type="text/javascript">
function download_add_check(){
	if(document.form1.ShowName.value == '')
	{
		alert('请填写内容标题');
		document.form1.ShowName.focus();
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
function download_upd_check(){
	if(document.form1.ShowName.value == '')
	{
		alert('请填写内容标题');
		document.form1.ShowName.focus();
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
function download_del_check(id){
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
function download_alldel_check(){
	if(confirm('确认删除？'))
	{
		document.form1.action.value = 'alldelete';
		document.form1.submit( );
	}
}
</script>
<%
did=Request("did")
pageindex=Request("page")
If did = "" Then
	did = "0"
End If
cctype=Request("cctype")
If cctype = "" Then
	cctype = "3"
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
	FileName = ""
	if upload.ErrorID>0 then 
		response.Write "<script>alert('"& upload.Description &"')</script>"
		setErrors = setErrors + 1
	else
		savepath = "../userfiles"
		set file = upload.files("FileName")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				FileName = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
	end if
	
	If setErrors = 0 Then
		Set DownloadFileMod=new DownloadFile
		DownloadFileMod.FileName=FileName
		DownloadFileMod.ShowName=upload.forms("ShowName")
		DownloadFileMod.KeyWords=upload.forms("KeyWords")
		DownloadFileMod.Abstract=upload.forms("Abstract")
		DownloadFileMod.ClassID=upload.forms("ClassID")
		Response.Write "<script>alert('"& DownloadFileManager.InsertDownloadFile(DownloadFileMod) &"');window.location='download_mng.asp'</script>"
		response.End()
	End If
	set upload = nothing
ElseIf upload.forms("action") = "update" Then
	setErrors = 0
	FileName = ""
	if upload.ErrorID>0 then 
		response.Write "<script>alert('"& upload.Description &"')</script>"
		setErrors = setErrors + 1
	else
		savepath = "../userfiles"
		set file = upload.files("FileName")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				FileName = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
	end if
	
	If setErrors = 0 Then
		Set DownloadFileMod=new DownloadFile
		DownloadFileMod.FileName=FileName
		DownloadFileMod.ShowName=upload.forms("ShowName")
		DownloadFileMod.KeyWords=upload.forms("KeyWords")
		DownloadFileMod.Abstract=upload.forms("Abstract")
		DownloadFileMod.ClassID=upload.forms("ClassID")
		Response.Write "<script>alert('"& DownloadFileManager.UpdateDownloadFile(DownloadFileMod) &"');window.location='download_mng.asp'</script>"
		response.End()
	End If
	set upload = nothing
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& DownloadFileManager.DeleteDownloadFile(id) &"')</script>"
ElseIf upload.forms("action") = "alldelete" Then
	id=upload.forms("ck_input_name")
	Response.Write "<script>alert('"& DownloadFileManager.DeleteDownloadFile(id) &"')</script>"
End If
%>