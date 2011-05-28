﻿<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/ProductAdapter.asp" -->
<!--#include file="../Code/Adapter/UpLoad_Class.vbs.asp"-->
<!--#include file="../Code/Adapter/ContentClassAdapter.asp" -->
<script type="text/javascript">
function product_add_check(){
	if(document.form1.Title.value == '')
	{
		alert('请填写产品标题');
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
function product_upd_check(){
	if(document.form1.Title.value == '')
	{
		alert('请填写产品标题');
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
function product_del_check(id){
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
function product_alldel_check(){
	if(confirm('确认删除？'))
	{
		document.form1.action.value = 'alldelete';
		document.form1.submit( );
	}
}
</script>
<%
pid=Request("pid")
pageindex=Request("page")
If pid = "" Then
	pid = "0"
End If
cctype=Request("cctype")
If cctype = "" Then
	cctype = "2"
End If

dim upload
set upload = new AnUpLoad
upload.Exe = "jpg|bmp|jpeg|gif|png"
upload.MaxSize = 1200 * 1024 '300K
Upload.Charset="utf-8"
upload.GetData()
dim file,savpath
If upload.forms("action") = "add" Then
	setErrors = 0
	Img1 = ""
	Img2 = ""
	Img3 = ""
	Img4 = ""
	if upload.ErrorID>0 then 
		response.Write "<script>alert('"& upload.Description &"')</script>"
		setErrors = setErrors + 1
	else
		savepath = "../userfiles"
		set file = upload.files("Img1")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img1 = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
		set file = upload.files("Img2")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img2 = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
		set file = upload.files("Img3")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img3 = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
		set file = upload.files("Img4")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img4 = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
	end if
	
	If setErrors = 0 Then
		Set ProductMod=new Product
			ModProduct.Title=upload.forms("Title")
			ModProduct.Keywords=upload.forms("Keywords")
			ModProduct.Abstract=upload.forms("Abstract")
			ModProduct.Content=upload.forms("Content")
			ModProduct.Img1=upload.forms("Img1")
			ModProduct.Img2=upload.forms("Img2")
			ModProduct.Img3=upload.forms("Img3")
			ModProduct.Img4=upload.forms("Img4")
			ModProduct.Price=upload.forms("Price")
			ModProduct.VIPPrice=upload.forms("VIPPrice")
			ModProduct.ProductCount=upload.forms("ProductCount")
			ModProduct.ClassID=upload.forms("ClassID")
		Response.Write "<script>alert('"& ProductManager.InsertProduct(ProductMod) &"');window.location='product_mng.asp'</script>"
		response.End()
	End If
	set upload = nothing
ElseIf upload.forms("action") = "update" Then
	setErrors = 0
	Img1 = ""
	Img2 = ""
	Img3 = ""
	Img4 = ""
	if upload.ErrorID>0 then 
		response.Write "<script>alert('"& upload.Description &"')</script>"
		setErrors = setErrors + 1
	else
		savepath = "../userfiles"
		set file = upload.files("Img1")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img1 = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
		set file = upload.files("Img2")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img2 = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
		set file = upload.files("Img3")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img3 = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
		set file = upload.files("Img4")
		if not(file is nothing) then
			if file.saveToFile(savepath,0,true) then
				Img4 = savepath & "/" & file.filename
			else
				setErrors = setErrors + 1
				response.Write "<script>alert('"& file.Exception &"')</script>"
			end if
		end if
	end if
	
	If setErrors = 0 Then
		Set ProductMod=new Product
		ProductMod.ID=upload.forms("updid")
		ModProduct.Title=upload.forms("Title")
		ModProduct.Keywords=upload.forms("Keywords")
		ModProduct.Abstract=upload.forms("Abstract")
		ModProduct.Content=upload.forms("Content")
		ModProduct.Price=upload.forms("Price")
		ModProduct.VIPPrice=upload.forms("VIPPrice")
		ModProduct.ProductCount=upload.forms("ProductCount")
		ModProduct.ClassID=upload.forms("ClassID")
		Response.Write "<script>alert('"& ProductManager.UpdateProduct(ProductMod) &"');window.location='product_mng.asp'</script>"
		response.End()
	End If
	set upload = nothing
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& ProductManager.DeleteProduct(id) &"')</script>"
ElseIf upload.forms("action") = "alldelete" Then
	id=upload.forms("ck_input_name")
	Response.Write "<script>alert('"& ProductManager.DeleteProduct(id) &"')</script>"
End If
%>