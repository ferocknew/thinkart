<!--#include file="../Service/BlogInfoService.asp"-->
<%
Class BlogInfoAdapter

	Public Function InsertBlogInfo(objBlogInfo)
		InsertBlogInfo="插入失败！"
		BlogInfoDao.InsertBlogInfo(objBlogInfo)
		InsertBlogInfo="插入成功！"
	End Function
	
	Public Function DeleteBlogInfo(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			BlogInfoDao.DeleteBlogInfo(id)
			DeleteBlogInfo="删除成功！"
		Else
			DeleteBlogInfo="删除失败！"
		End If
	End Function
	
	Public Function UpdateBlogInfo(objBlogInfo)
		UpdateBlogInfo="修改失败！"
		
		BlogInfoDao.UpdateBlogInfo(objBlogInfo)
		UpdateBlogInfo="修改成功！"
	End Function
	
	Public Function GetAllBlogInfo()
		Set GetAllBlogInfo=BlogInfoDao.GetAllBlogInfo()
	End Function
	
	Public Function GetBlogInfoByObjBlogInfo(objBlogInfo)
		Set GetBlogInfoByObjBlogInfo=BlogInfoDao.GetBlogInfoByObjBlogInfo(objBlogInfo)
	End Function
	
	Public Function GetBlogInfoById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
			Set GetBlogInfoById = BlogInfoDao.GetBlogInfoById(id)
	End Function
	
End Class

Set BlogInfoManager = new BlogInfoAdapter
%>