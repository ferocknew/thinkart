<!--#include file="../Service/AdminInfoService.asp"-->
<%
Class AdminInfoAdapter

	Public Function InsertAdminInfo(objAdminInfo)
		InsertAdminInfo="插入失败！"
		AdminInfoDao.InsertAdminInfo(objAdminInfo)
		InsertAdminInfo="插入成功！"
	End Function
	
	Public Function DeleteAdminInfo(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			AdminInfoDao.DeleteAdminInfo(id)
			DeleteAdminInfo="删除成功！"
		Else
			DeleteAdminInfo="删除失败！"
		End If
	End Function
	
	Public Function UpdateAdminInfo(objAdminInfo)
		UpdateAdminInfo="修改失败！"
		
		AdminInfoDao.UpdateAdminInfo(objAdminInfo)
		UpdateAdminInfo="修改成功！"
	End Function
	
	Public Function GetAllAdminInfo()
		Set GetAllAdminInfo=AdminInfoDao.GetAllAdminInfo()
	End Function
	
	Public Function GetAdminInfoByObjAdminInfo(objAdminInfo)
		Set GetAdminInfoByObjAdminInfo=AdminInfoDao.GetAdminInfoByObjAdminInfo(objAdminInfo)
	End Function
	
	Public Function GetAdminInfoById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
			Set GetAdminInfoById = AdminInfoDao.GetAdminInfoById(id)
	End Function
	
	Public Function GetPasswordByUserName(UserName)
		Set GetPasswordByUserName = AdminInfoDao.GetPasswordByUserName(UserName)
	End Function
	
End Class

Set AdminInfoManager = new AdminInfoAdapter
%>