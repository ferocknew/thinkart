<!--#include file="../Model/DownloadFileInfo.asp"-->
<%
Class DownloadFileService

	Public Sub InsertDownloadFile(objDownloadFile)
		strInsertSql="insert into DownloadFile ([DownloadName],[FileName],[KeyWords],[Abstract],[ClassID]) values ('" &InputReplace(objDownloadFile.DownloadName) &_
			"','"& InputReplace(objDownloadFile.FileName) &"','"& InputReplace(objDownloadFile.KeyWords) &"','"& InputReplace(objDownloadFile.Abstract) &"',"& InputReplace(objDownloadFile.ClassID) &")"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteDownloadFile(id)
		strDeleteSql="delete from DownloadFile where Id="& InputReplace(id)
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateDownloadFile(objDownloadFile)
		strUpdateSql="update DownloadFile set DownloadName='"& InputReplace(objDownloadFile.DownloadName)  &"',FileName='"& InputReplace(objDownloadFile.FileName) &_
			"',[KeyWords]='"& InputReplace(objDownloadFile.KeyWords) &"',Abstract='"& InputReplace(objDownloadFile.Abstract) &"',ClassID="& InputReplace(objDownloadFile.ClassID) &" where Id="& InputReplace(objDownloadFile.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllDownloadFile()
		strSelectSql="select * from DownloadFile"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModDownloadFile=CreateDownloadFile(rs)
			dic.Add ModDownloadFile.Id,ModDownloadFile
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetAllDownloadFile=dic
	End Function
	
	Public Function GetDownloadFileById(id)
		strSelectSql="select * from DownloadFile where Id="&id
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModDownloadFile=CreateDownloadFile(rs)
		rs.Close
		Set rs=nothing
		Set GetDownloadFileById=ModDownloadFile
	End Function
	
	Public Function GetDownloadFileByClassID(ClassID)
		strSelectSql="select * from DownloadFile where ClassID="&ClassID
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModDownloadFile=CreateDownloadFile(rs)
		rs.Close
		Set rs=nothing
		Set GetDownloadFileById=ModDownloadFile
	End Function
	
	Public Function GetDownloadFileByKeyWords(KeyWords)
		strSelectSql="select * from DownloadFile where KeyWords like '%"&KeyWords&"%'"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModDownloadFile=CreateDownloadFile(rs)
		rs.Close
		Set rs=nothing
		Set GetDownloadFileById=ModDownloadFile
	End Function
	
	Private Function CreateDownloadFile(rs)
		Set ModDownloadFile=new DownloadFileInfo
		If Not rs.Eof Then
			ModDownloadFile.Id=OutputReplace(rs("Id"))
			ModDownloadFile.DownloadName=OutputReplace(rs("DownloadName"))
			ModDownloadFile.FileName=OutputReplace(rs("FileName"))
			ModDownloadFile.KeyWords=OutputReplace(rs("KeyWords"))
			ModDownloadFile.Abstract=OutputReplace(rs("Abstract"))
			ModDownloadFile.ClassID=OutputReplace(rs("ClassID"))
		End If
		Set CreateDownloadFile=ModDownloadFile
	End Function
	
End Class

Set DownloadFileDao = new DownloadFileService
%>