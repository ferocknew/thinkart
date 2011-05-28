<!--#include file="../Service/DBHelper.asp"-->
<!--#include file="../Model/BlogInfo.asp"-->
<!--#include file="DBHelper.asp"-->
<%
Class BlogInfoService

	Public Sub InsertBlogInfo(objBlogInfo)
		strInsertSql="insert into BlogInfo (MicroBlogName,Username,Password) values ('" &InputReplace(objBlogInfo.MicroBlogName) &_
			"','"& InputReplace(objBlogInfo.Username) &"','"& InputReplace(objBlogInfo.Password) &"')"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteBlogInfo(id)
		strDeleteSql="delete from BlogInfo where Id="& InputReplace(id)
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateBlogInfo(objBlogInfo)
		strUpdateSql="update BlogInfo set MicroBlogName='"& InputReplace(objBlogInfo.MicroBlogName)  &"',Username='"& InputReplace(objBlogInfo.Username) &_
			"',Password='"& InputReplace(objBlogInfo.Password) &"' where Id="& InputReplace(objBlogInfo.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllBlogInfo()
		strSelectSql="select * from BlogInfo"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set BlogInfo=CreateBlogInfo(rs) 
			dic.Add BlogInfo.Id,BlogInfo
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetAllBlogInfo=dic
	End Function
	Public Function GetBlogInfoById(id)
		strSelectSql="select * from BlogInfo where Id="&id
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set BlogInfo=CreateBlogInfo(rs)
		rs.Close
		Set rs=nothing 
		Set GetBlogInfoById=BlogInfo
		
	End Function
	
	Private Function CreateBlogInfo(rs)
		Set BlogInfo=new BlogInfo
		If Not rs.Eof Then
			BlogInfo.Id=OutputReplace(rs("Id"))
			BlogInfo.MicroBlogName=OutputReplace(rs("MicroBlogName"))
			BlogInfo.Username=OutputReplace(rs("Username"))
			BlogInfo.Password=OutputReplace(rs("Password"))
		End If
		Set CreateBlogInfo=BlogInfo
	End Function
	
End Class

Set BlogInfoDao = new BlogInfoService
%>


