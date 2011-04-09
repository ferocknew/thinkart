<!--#include file="../Model/Product.asp"-->
<%
Class ProductService

	Public Sub InsertProduct(objProduct)
		strInsertSql="insert into Product (ProductName,KeyWords,Abstract,Content,Img1,Img2,Img3,Img4,Price,VIPPrice,ProductCount,ClassID) values ('" &InputReplace(objProduct.ProductName) &_
			"','"& InputReplace(objProduct.KeyWords) &"','"& InputReplace(objProduct.Abstract) &"','"& InputReplace(objProduct.Content) &"','"& InputReplace(objProduct.Img1) &"','"&_
			InputReplace(objProduct.Img2) &"','"& InputReplace(objProduct.Img3) &"','"& InputReplace(objProduct.Img4) &"',"& InputReplace(objProduct.Price) &","& InputReplace(objProduct.VIPPrice) &","& InputReplace(objProduct.ProductCount) &","& InputReplace(objProduct.ClassID) &")"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteProduct(id)
		strDeleteSql="delete from Product where Id in ("& id &")"
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateProduct(objProduct)
		strUpdateSql="update Product set Title='"& InputReplace(objProduct.Title)  &"',Keywords='"& InputReplace(objProduct.Keywords) &_
			"',Abstract='"& InputReplace(objProduct.Abstract) &"',Content='"& InputReplace(objProduct.Content) &"',Price="& InputReplace(objProduct.Price) &",VIPPrice="& InputReplace(objProduct.VIPPrice) &",ProductCount="& InputReplace(objProduct.ProductCount) &",ClassID="& InputReplace(objProduct.ClassID)
		If objProduct.Img1 <> "" Then
			strUpdateSql = strUpdateSql & ",Img1='"& InputReplace(objProduct.Img1) & "'"
		End If
		If objProduct.Img2 <> "" Then
			strUpdateSql = strUpdateSql & ",Img2='"& InputReplace(objProduct.Img2) & "'"
		End If
		If objProduct.Img3 <> "" Then
			strUpdateSql = strUpdateSql & ",Img3='"& InputReplace(objProduct.Img3) & "'"
		End If
		If objProduct.Img4 <> "" Then
			strUpdateSql = strUpdateSql & ",Img4='"& InputReplace(objProduct.Img4) & "'"
		End If
		strUpdateSql = strUpdateSql & " where Id="& InputReplace(objProduct.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllProduct()
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=Product.ClassID) as ClassName from Product Order by Id Desc"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModProduct=CreateProduct(rs) 
			dic.Add ModProduct.Id,ModProduct
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetAllProduct=dic
	End Function
	
	Public Function GetProductByObjProduct(objProduct)
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=Product.ClassID) as ClassName from Product where 1=1"
		If Not objProduct.Id is null and objProduct.Id = "" Then strSelectSql = strSelectSql& " and [Id]="& objProduct.Id End If
		If Not objProduct.Title is null and objProduct.Title = "" Then strSelectSql = strSelectSql& " and [Title]="& objProduct.Title End If
		If Not objProduct.Keywords is null and objProduct.Keywords = "" Then strSelectSql = strSelectSql& " and [Keywords]="& objProduct.Keywords End If
		If Not objProduct.Abstract is null and objProduct.Abstract = "" Then strSelectSql = strSelectSql& " and [Abstract]="& objProduct.Abstract End If
		If Not objProduct.Content is null and objProduct.Content = "" Then strSelectSql = strSelectSql& " and [Content]="& objProduct.Content End If
		If Not objProduct.Price is null and objProduct.Price = "" Then strSelectSql = strSelectSql& " and [Price]="& objProduct.Price End If
		If Not objProduct.VIPPrice is null and objProduct.VIPPrice = "" Then strSelectSql = strSelectSql& " and [VIPPrice]="& objProduct.VIPPrice End If
		If Not objProduct.ProductCount is null and objProduct.ProductCount = "" Then strSelectSql = strSelectSql& " and [ProductCount]="& objProduct.ProductCount End If
		If Not objProduct.ClassID is null and objProduct.ClassID = "" Then strSelectSql = strSelectSql& " and [ClassID]="& objProduct.ClassID End If
		strSelectSql = strSelectSql& " Order by Id Desc"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModProduct=CreateProduct(rs) 
			dic.Add ModProduct.Id,ModProduct
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetProductByObjProduct=dic
	End Function
	
	Public Function GetProductById(id)
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=Product.ClassID) as ClassName from Product where Id="&InputReplace(id)
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModProduct=CreateProduct(rs)
		rs.Close
		Set rs=nothing 
		Set GetProductById=ModProduct
	End Function
	
	Private Function CreateProduct(rs)
		Set ModProduct=new Product
		If Not rs.Eof Then
			ModProduct.Id=OutputReplace(rs("Id"))
			ModProduct.Title=OutputReplace(rs("Title"))
			ModProduct.Keywords=OutputReplace(rs("Keywords"))
			ModProduct.Abstract=OutputReplace(rs("Abstract"))
			ModProduct.Content=OutputReplace(rs("Content"))
			ModProduct.Img1=OutputReplace(rs("Img1"))
			ModProduct.Img2=OutputReplace(rs("Img2"))
			ModProduct.Img3=OutputReplace(rs("Img3"))
			ModProduct.Img4=OutputReplace(rs("Img4"))
			ModProduct.Price=OutputReplace(rs("Price"))
			ModProduct.VIPPrice=OutputReplace(rs("VIPPrice"))
			ModProduct.ProductCount=OutputReplace(rs("ProductCount"))
			ModProduct.ClassID=OutputReplace(rs("ClassID"))
			ModProduct.ClassName=OutputReplace(rs("ClassName"))
		End If
		Set CreateProduct=ModProduct
	End Function
	
End Class

Set ProductDao = new ProductService
%>


