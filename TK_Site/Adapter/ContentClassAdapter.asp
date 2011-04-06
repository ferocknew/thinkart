<!--#include file="../Service/ContentClassService.asp"-->
<%
Class ContentClassAdapter

	Public Function InsertContentClass(objContentClass)
		InsertContentClass="插入失败！"
		ContentClassDao.InsertContentClass(objContentClass)
		InsertContentClass="插入成功！"
	End Function
	
	Public Function DeleteContentClass(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			ContentClassDao.DeleteContentClass(id)
			DeleteContentClass="删除成功！"
		Else
			DeleteContentClass="删除失败！"
		End If
	End Function
	
	Public Function UpdateContentClass(objContentClass)
		UpdateContentClass="修改失败！"
		
		ContentClassDao.UpdateContentClass(objContentClass)
		UpdateContentClass="修改成功！"
	End Function
	
	Public Function UpdateContentClassOrder(objContentClass)
		UpdateContentClassOrder="修改失败！"
		
		ContentClassDao.UpdateContentClassOrder(objContentClass)
		UpdateContentClassOrder="修改成功！"
	End Function
	
	Public Function GetAllContentClass(classtype)
		Set GetAllContentClass=ContentClassDao.GetAllContentClass(classtype)
	End Function
	
	Public Function GetContentClassByObjContentClass(objContentClass)
		Set GetContentClassByObjContentClass=ContentClassDao.GetContentClassByObjContentClass(objContentClass)
	End Function
	
	Public Function GetContentClassById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
			Set GetContentClassById = ContentClassDao.GetContentClassById(id)
	End Function
	
End Class

Set ContentClassManager = new ContentClassAdapter
%>