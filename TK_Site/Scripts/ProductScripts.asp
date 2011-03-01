<!--#include file="../Service/DBHelper.asp"-->
<!--#include file="../Adapter/ProductAdapter.asp" -->
<!--#include file="../Adapter/UpLoad_Class.vbs.asp"-->
<!--#include file="../Adapter/ContentClassAdapter.asp" -->
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
ctype="1"    '产品树

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
		set file = upload.files("fileImg")
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
	End If
	set upload = nothing
ElseIf upload.forms("action") = "update" Then
	Set ProductMod=new Product
	ProductMod.ID=pid
			ModProduct.Title=upload.forms("Title")
			ModProduct.Keywords=upload.forms("Keywords")
			ModProduct.Abstract=upload.forms("Abstract")
			ModProduct.Content=upload.forms("Content")
			ModProduct.Price=upload.forms("Price")
			ModProduct.VIPPrice=upload.forms("VIPPrice")
			ModProduct.ProductCount=upload.forms("ProductCount")
			ModProduct.ClassID=upload.forms("ClassID")
	Response.Write "<script>alert('"& ProductManager.UpdateProduct(ProductMod) &"');window.location='product_mng.asp'</script>"
ElseIf upload.forms("action") = "delete" Then
	id=upload.forms("delid")
	Response.Write "<script>alert('"& ProductManager.DeleteProduct(id) &"')</script>"
ElseIf upload.forms("action") = "alldelete" Then
	id=upload.forms("ck_input_name")
	Response.Write "<script>alert('"& ProductManager.DeleteProduct(id) &"')</script>"
End If
%>