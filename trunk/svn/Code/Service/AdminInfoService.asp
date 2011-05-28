<!--#include file="../Model/AdminInfo.asp"-->
<%
Class AdminInfoService

	Public Sub InsertAdminInfo(objAdminInfo)
		strInsertSql="insert into [AdminInfo] ([UserName],[Password],[TrueName],[AddTime],[UserState]) values ('" &InputReplace(objAdminInfo.UserName) &_
			"','"& InputReplace(objAdminInfo.Password) &"','"& InputReplace(objAdminInfo.TrueName) &"','"& InputReplace(objAdminInfo.AddTime) &"',"& InputReplace(objAdminInfo.UserState) &")"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteAdminInfo(id)
		strDeleteSql="delete from [AdminInfo] where [Id]="& InputReplace(id)
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateAdminInfo(objAdminInfo)
		strUpdateSql="update [AdminInfo] set [UserName]='"& InputReplace(objAdminInfo.UserName)  &"',[Password]='"& InputReplace(objAdminInfo.Password) &_
			"',[TrueName]='"& InputReplace(objAdminInfo.TrueName) &"',[UserState]="& InputReplace(objAdminInfo.UserState) &" where [Id]="& InputReplace(objAdminInfo.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllAdminInfo()
		strSelectSql="select * from [AdminInfo]"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModAdminInfo=CreateAdminInfo(rs) 
			dic.Add AdminInfo.Id,AdminInfo
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetAllAdminInfo=dic
	End Function
	
	Public Function GetAdminInfoById(id)
		strSelectSql="select * from [AdminInfo] where [Id]="& InputReplace(id)
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModAdminInfo=CreateAdminInfo(rs)
		rs.Close
		Set rs=nothing 
		Set GetAdminInfoById=ModAdminInfo
	End Function
	
	Public Function GetPasswordByUserName(UserName)
		strSelectSql="select * from [AdminInfo] where [UserName]='"& InputReplace(UserName) &"' and UserState = true"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModAdminInfo=CreateAdminInfo(rs)
		rs.Close
		Set rs=nothing 
		Set GetPasswordByUserName=ModAdminInfo
	End Function
	
	Private Function CreateAdminInfo(rs)
		Set ModAdminInfo=new AdminInfo
		If Not rs.Eof Then
			ModAdminInfo.Id=OutputReplace(rs("Id"))
			ModAdminInfo.UserName=OutputReplace(rs("UserName"))
			ModAdminInfo.Password=OutputReplace(rs("Password"))
			ModAdminInfo.TrueName=OutputReplace(rs("TrueName"))
			ModAdminInfo.AddTime=OutputReplace(rs("AddTime"))
			ModAdminInfo.UserState=OutputReplace(rs("UserState"))
		End If
		Set CreateAdminInfo=ModAdminInfo
	End Function
	
End Class

Set AdminInfoDao = new AdminInfoService
%>


