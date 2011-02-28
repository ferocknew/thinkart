<!--#include file="../Model/UserInfo.asp"-->
<%
Class UserInfoService

	Public Sub InsertUserInfo(objUserInfo)
		strInsertSql="insert into [UserInfo] ([UserName],[Password],[Power]) values ('" &InputReplace(objUserInfo.UserName) &_
			"','"& InputReplace(objUserInfo.Password) &"','"& InputReplace(objUserInfo.Power) &"')"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteUserInfo(id)
		strDeleteSql="delete from [UserInfo] where [Id]="& InputReplace(id)
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateUserInfo(objUserInfo)
		strUpdateSql="update [UserInfo] set [UserName]='"& InputReplace(objUserInfo.UserName)  &"',[Password]='"& InputReplace(objUserInfo.Password) &_
			"',[Power]='"& InputReplace(objUserInfo.Power) &"' where [Id]="& InputReplace(objUserInfo.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllUserInfo()
		strSelectSql="select * from [UserInfo]"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModUserInfo=CreateUserInfo(rs) 
			dic.Add UserInfo.Id,UserInfo
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetAllUserInfo=dic
	End Function
	
	Public Function GetUserInfoById(id)
		strSelectSql="select * from [UserInfo] where [Id]="& InputReplace(id)
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModUserInfo=CreateUserInfo(rs)
		rs.Close
		Set rs=nothing 
		Set GetUserInfoById=UserInfo
	End Function
	
	Public Function GetPasswordByUserName(UserName)
		strSelectSql="select * from [UserInfo] where [UserName]='"& InputReplace(UserName) &"'"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModUserInfo=CreateUserInfo(rs)
		rs.Close
		Set rs=nothing 
		Set GetPasswordByUserName=ModUserInfo
	End Function
	
	Private Function CreateUserInfo(rs)
		Set ModUserInfo=new UserInfo
		If Not rs.Eof Then
			ModUserInfo.Id=OutputReplace(rs("Id"))
			ModUserInfo.UserName=OutputReplace(rs("UserName"))
			ModUserInfo.Password=OutputReplace(rs("Password"))
			ModUserInfo.Power=OutputReplace(rs("Power"))
		End If
		Set CreateUserInfo=ModUserInfo
	End Function
	
End Class

Set UserInfoDao = new UserInfoService
%>


