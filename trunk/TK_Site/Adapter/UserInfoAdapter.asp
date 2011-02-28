<!--#include file="../Service/UserInfoService.asp"-->
<%
Class UserInfoAdapter

	Public Function InsertUserInfo(objUserInfo)
		InsertUserInfo="插入失败！"
		UserInfoDao.InsertUserInfo(objUserInfo)
		InsertUserInfo="插入成功！"
	End Function
	
	Public Function DeleteUserInfo(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			UserInfoDao.DeleteUserInfo(id)
			DeleteUserInfo="删除成功！"
		Else
			DeleteUserInfo="删除失败！"
		End If
	End Function
	
	Public Function UpdateUserInfo(objUserInfo)
		UpdateUserInfo="修改失败！"
		
		UserInfoDao.UpdateUserInfo(objUserInfo)
		UpdateUserInfo="修改成功！"
	End Function
	
	Public Function GetAllUserInfo()
		Set GetAllUserInfo=UserInfoDao.GetAllUserInfo()
	End Function
	
	Public Function GetUserInfoByObjUserInfo(objUserInfo)
		Set GetUserInfoByObjUserInfo=UserInfoDao.GetUserInfoByObjUserInfo(objUserInfo)
	End Function
	
	Public Function GetUserInfoById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
			Set GetUserInfoById = UserInfoDao.GetUserInfoById(id)
	End Function
	
	Public Function GetPasswordByUserName(UserName)
		Set GetPasswordByUserName = UserInfoDao.GetPasswordByUserName(UserName)
	End Function
	
End Class

Set UserInfoManager = new UserInfoAdapter
%>