<!--#include file="../Model/Message.asp"-->
<%
Class MessageService

	Public Sub InsertMessage(objMessage)
		strInsertSql="insert into Message (Person,Phone,Email,Company,Content,Remark,Temp1,Temp2,Temp3) values ('"& InputReplace(objMessage.Person) &"','"& InputReplace(objMessage.Phone) &"','"& InputReplace(objMessage.Email) &"','"& InputReplace(objMessage.Company) &"','"& InputReplace(objMessage.Content) &"','"&_
			InputReplace(objMessage.Remark) &"','"& InputReplace(objMessage.Temp1) &"','"& InputReplace(objMessage.Temp2) &"','"& InputReplace(objMessage.Temp3) &"')"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteMessage(id)
		strDeleteSql="delete from Message where Id in ("& id &")"
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateMessage(objMessage)
		strUpdateSql="update Message set Person='"& InputReplace(objMessage.Person)  &"',Phone='"& InputReplace(objMessage.Phone) &_
			"',Email='"& InputReplace(objMessage.Email) &"',Company='"& InputReplace(objMessage.Company) &"',Content='"& InputReplace(objMessage.Content) &_
			"',Remark='"& InputReplace(objMessage.Remark) &"',Temp1='"& InputReplace(objMessage.Temp1) &"',Temp2='"& InputReplace(objMessage.Temp2) &"',Temp3='"& InputReplace(objMessage.Temp3) &"'"
		strUpdateSql=strUpdateSql &" where Id="& InputReplace(objMessage.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllMessage()
		strSelectSql="select * from Message Order by Id Asc"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModMessage=CreateMessage(rs) 
			dic.Add ModMessage.Id,ModMessage
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetAllMessage=dic
	End Function
	
	Public Function GetMessageByObjMessage(objMessage)
		strSelectSql="select * from Message where 1=1"
		If objMessage.Person <> "" Then strSelectSql = strSelectSql& " and [Person] like '%"& objMessage.Person &"'%" End If
		If objMessage.Phone <> "" Then strSelectSql = strSelectSql& " and [Phone] like '%"& objMessage.Phone &"'%" End If
		If objMessage.Email <> "" Then strSelectSql = strSelectSql& " and [Email] like '%"& objMessage.Email &"'%" End If
		If objMessage.Company <> "" Then strSelectSql = strSelectSql& " and [Company] like '%"& objMessage.Company &"'%" End If
		If objMessage.Content <> "" Then strSelectSql = strSelectSql& " and [Content] like '%"& objMessage.Content &"'%" End If
		If objMessage.Remark <> "" Then strSelectSql = strSelectSql& " and [Remark] like '%"& objMessage.Remark &"'%" End If
		If objMessage.Temp1 <> "" Then strSelectSql = strSelectSql& " and [Temp1] like '%"& objMessage.Temp1 &"'%" End If
		If objMessage.Temp2 <> "" Then strSelectSql = strSelectSql& " and [Temp2] like '%"& objMessage.Temp2 &"'%" End If
		If objMessage.Temp3 <> "" Then strSelectSql = strSelectSql& " and [Temp3] like '%"& objMessage.Temp3 &"'%" End If
		strSelectSql = strSelectSql& " Order by Id Asc"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModMessage=CreateMessage(rs) 
			dic.Add ModMessage.Id,ModMessage
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetMessageByObjMessage=dic
	End Function
	
	Public Function GetMessageById(id)
		strSelectSql="select * from Message where Id="&InputReplace(id)
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModMessage=CreateMessage(rs)
		rs.Close
		Set rs=nothing 
		Set GetMessageById=ModMessage
	End Function
	
	Private Function CreateMessage(rs)
		Set ModMessage=new Message
		If Not rs.Eof Then
			ModMessage.Id=OutputReplace(rs("Id"))
			ModMessage.Person=OutputReplace(rs("Person"))
			ModMessage.Phone=OutputReplace(rs("Phone"))
			ModMessage.Email=OutputReplace(rs("Email"))
			ModMessage.Company=OutputReplace(rs("Company"))
			ModMessage.Content=OutputReplace(rs("Content"))
			ModMessage.Remark=OutputReplace(rs("Remark"))
			ModMessage.Temp1=OutputReplace(rs("Temp1"))
			ModMessage.Temp2=OutputReplace(rs("Temp2"))
			ModMessage.Temp3=OutputReplace(rs("Temp3"))
		End If
		Set CreateMessage=ModMessage
	End Function
	
End Class

Set MessageDao = new MessageService
%>


