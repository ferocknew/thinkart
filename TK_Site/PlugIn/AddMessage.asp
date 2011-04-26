<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/MessageAdapter.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
If Request("action") = "add" Then
	set addMessage = new Message
	addMessage.Person=Request("Person")
	addMessage.Phone=Request("Phone")
	addMessage.Email=Request("Email")
	addMessage.Company=Request("Company")
	addMessage.Content=Request("Content")
	addMessage.Remark=Request("Remark")
	addMessage.Temp1=Request("Temp1")
	addMessage.Temp2=Request("Temp2")
	addMessage.Temp3=Request("Temp3")
	Response.Write "<script>alert('"& MessageManager.InsertMessage(addMessage) &"');window.history.go(-1);</script>"
End If
%>
</head>
</html>