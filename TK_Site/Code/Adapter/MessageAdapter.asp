<!--#include file="../Service/MessageService.asp"-->
<%
Class MessageAdapter

	Public Function InsertMessage(objMessage)
		InsertMessage="留言失败，请联系管理员！"
		MessageDao.InsertMessage(objMessage)
		InsertMessage="留言成功！"
	End Function
	
	Public Function DeleteMessage(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			MessageDao.DeleteMessage(id)
			DeleteMessage="删除成功！"
		Else
			DeleteMessage="删除失败！"
		End If
	End Function
	
	Public Function UpdateMessage(objMessage)
		UpdateMessage="修改失败！"
		
		MessageDao.UpdateMessage(objMessage)
		UpdateMessage="修改成功！"
	End Function
	
	Public Function GetAllMessage()
		Set GetAllMessage=MessageDao.GetAllMessage()
	End Function
	
	Public Function GetMessageByObjMessage(objMessage)
		Set GetMessageByObjMessage=MessageDao.GetMessageByObjMessage(objMessage)
	End Function
	
	Public Function GetMessageById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
			Set GetMessageById = MessageDao.GetMessageById(id)
	End Function
	
End Class

Set MessageManager = new MessageAdapter
%>