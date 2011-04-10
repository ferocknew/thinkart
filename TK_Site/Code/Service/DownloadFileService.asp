﻿<!--#include file="../Model/DownloadFile.asp"-->
<%
Class DownloadFileService

	Public Sub InsertDownloadFile(objDownloadFile)
		strInsertSql="insert into DownloadFile ([ShowName],[FileName],[KeyWords],[Abstract],[ClassID]) values ('" &InputReplace(objDownloadFile.ShowName) &_
			"','"& InputReplace(objDownloadFile.FileName) &"','"& InputReplace(objDownloadFile.KeyWords) &"','"& InputReplace(objDownloadFile.Abstract) &"',"& InputReplace(objDownloadFile.ClassID) &")"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteDownloadFile(id)
		strDeleteSql="delete from DownloadFile where Id="& InputReplace(id)
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateDownloadFile(objDownloadFile)
		strUpdateSql="update DownloadFile set ShowName='"& InputReplace(objDownloadFile.ShowName)  &"',[KeyWords]='"& InputReplace(objDownloadFile.KeyWords) &"',Abstract='"& InputReplace(objDownloadFile.Abstract) &"',ClassID="& InputReplace(objDownloadFile.ClassID)
		If objDownloadFile.FileName <> "" Then
			strUpdateSql = strUpdateSql & ",FileName='"& InputReplace(objDownloadFile.FileName) & "'"
		End If
		strUpdateSql = strUpdateSql &" where Id="& InputReplace(objDownloadFile.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllDownloadFile()
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=DownloadFile.ClassID) as ClassName,(select ClassType from ContentClass where ContentClass.ID=Content.ClassID) as ClassType from DownloadFile Order by Id Desc"
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
	
	Public Function GetDownloadFileByObjDownloadFile(objDownloadFile)
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=DownloadFile.ClassID) as ClassName,(select ClassType from ContentClass where ContentClass.ID=Content.ClassID) as ClassType from DownloadFile where 1=1"
		If Not objDownloadFile.Id is null and objDownloadFile.Id = "" Then strSelectSql = strSelectSql& " and [Id]="& objDownloadFile.Id End If
		If Not objDownloadFile.ShowName is null and objDownloadFile.ShowName = "" Then strSelectSql = strSelectSql& " and [ShowName]="& objDownloadFile.ShowName End If
		If Not objDownloadFile.Keywords is null and objDownloadFile.Keywords = "" Then strSelectSql = strSelectSql& " and [Keywords]="& objDownloadFile.Keywords End If
		If Not objDownloadFile.Abstract is null and objDownloadFile.Abstract = "" Then strSelectSql = strSelectSql& " and [Abstract]="& objDownloadFile.Abstract End If
		If Not objDownloadFile.FileName is null and objDownloadFile.FileName = "" Then strSelectSql = strSelectSql& " and [FileName]="& objDownloadFile.FileName End If
		If Not objDownloadFile.ClassID is null and objDownloadFile.ClassID = "" Then strSelectSql = strSelectSql& " and [ClassID]="& objDownloadFile.ClassID End If
		strSelectSql = strSelectSql& " Order by Id Desc"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModDownloadFile=CreateDownloadFile(rs)
			dic.Add ModDownloadFile.Id,ModDownloadFile
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetContentByObjContent=dic
	End Function
	
	Public Function GetDownloadFileById(id)
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=DownloadFile.ClassID) as ClassName,(select ClassType from ContentClass where ContentClass.ID=Content.ClassID) as ClassType from DownloadFile where Id="&id
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
			ModDownloadFile.ShowName=OutputReplace(rs("ShowName"))
			ModDownloadFile.FileName=OutputReplace(rs("FileName"))
			ModDownloadFile.KeyWords=OutputReplace(rs("KeyWords"))
			ModDownloadFile.Abstract=OutputReplace(rs("Abstract"))
			ModDownloadFile.ClassID=OutputReplace(rs("ClassID"))
			ModDownloadFile.ClassType=OutputReplace(rs("ClassType"))
		End If
		Set CreateDownloadFile=ModDownloadFile
	End Function
	
End Class

Set DownloadFileDao = new DownloadFileService
%>