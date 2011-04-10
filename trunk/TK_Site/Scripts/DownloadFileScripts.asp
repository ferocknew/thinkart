<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/DownloadFileAdapter.asp" -->
<!--#include file="../Code/Adapter/UpLoad_Class.vbs.asp"-->
<script type="text/javascript">
function content_add_check(){
	if(document.form1.Title.value == '')
	{
		alert('请填写企划名称');
		return;
	}
	document.form1.action.value = 'add';
	document.form1.submit( );
}
function content_delete_check(id){
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
</script>
<%
did=Request("did")
pageindex=Request("page")
If did = "" Then
	did = "0"
End If

dim upload
set upload = new AnUpLoad
upload.Exe = "jpg|bmp|jpeg|gif|png"
upload.MaxSize = 200 * 1024 '200K
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
		DownloadFileMod.DownloadName=DownloadName
		DownloadFileMod.KeyWords=KeyWords
		DownloadFileMod.Abstract=Abstract
		DownloadFileMod.ClassID=ClassID
		
		Response.Write "<script>alert('"& DownloadFileManager.InsertDownloadFile(DownloadFileMod) &"');window.location='project_mng.asp'</script>"
	End If
	set upload = nothing
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& DownloadFileManager.DeleteDownloadFile(id) &"')</script>"
End If
%>