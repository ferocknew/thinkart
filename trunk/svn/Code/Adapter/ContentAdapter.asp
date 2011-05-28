<!--#include file="../Service/ContentService.asp"-->
<%
Class ContentAdapter

	Public Function InsertContent(objContent)
		InsertContent="插入失败！"
		ContentDao.InsertContent(objContent)
		InsertContent="插入成功！"
	End Function
	
	Public Function DeleteContent(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			ContentDao.DeleteContent(id)
			DeleteContent="删除成功！"
		Else
			DeleteContent="删除失败！"
		End If
	End Function
	
	Public Function UpdateContent(objContent)
		UpdateContent="修改失败！"
		
		ContentDao.UpdateContent(objContent)
		UpdateContent="修改成功！"
	End Function
	
	Public Function GetAllContent()
		Set GetAllContent=ContentDao.GetAllContent()
	End Function
	
	Public Function GetContentByObjContent(objContent)
		Set GetContentByObjContent=ContentDao.GetContentByObjContent(objContent)
	End Function
	
	Public Function GetContentById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
			Set GetContentById = ContentDao.GetContentById(id)
	End Function
	
End Class

Set ContentManager = new ContentAdapter
%>