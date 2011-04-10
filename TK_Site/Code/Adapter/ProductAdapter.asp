<!--#include file="../Service/ProductService.asp"-->
<%
Class ProductAdapter

	Public Function InsertProduct(objProduct)
		InsertProduct="插入失败！"
		ProductDao.InsertProduct(objProduct)
		InsertProduct="插入成功！"
	End Function
	
	Public Function DeleteProduct(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			ProductDao.DeleteProduct(id)
			DeleteProduct="删除成功！"
		Else
			DeleteProduct="删除失败！"
		End If
	End Function
	
	Public Function UpdateProduct(objProduct)
		UpdateProduct="修改失败！"
		
		ProductDao.UpdateProduct(objProduct)
		UpdateProduct="修改成功！"
	End Function
	
	Public Function GetAllProduct()
		Set GetAllProduct=ProductDao.GetAllProduct()
	End Function
	
	Public Function GetProductByObjProduct(objProduct)
		Set GetProductByObjProduct=ProductDao.GetProductByObjProduct(objProduct)
	End Function
	
	Public Function GetProductById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
			Set GetProductById = ProductDao.GetProductById(id)
	End Function
	
End Class

Set ProductManager = new ProductAdapter
%>