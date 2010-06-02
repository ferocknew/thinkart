<%
'===============================================================
'  Check User For dbo.365pub.com/portal/
'    更新时间: 2010-05-29
'===============================================================

'root用户信息
Const RootUserName="root"
Const RootPassWord="rootps"

Response.Write(login("root","rootps")(0))
Response.End()

'登录
Function login(UserName, Password)
	Dim validate, ReInfo, HashKey
	UserName = CheckStr(UserName)
    Password = CheckStr(Password)

	ReInfo = Array(False,"错误信息")
	If Trim(UserName) = "" Or Trim(Password) = "" Then
		ReInfo(0) = "错误信息"
		ReInfo(1) = "<b>请将信息输入完整</b><br/><a href=""javascript:history.go(-1);"">请返回重新输入</a><br/>"
		ReInfo(2) = "WarningIcon"
		login = ReInfo
		logout(False)
		Exit Function
	End If


	login = ReInfo
End Function

'注销
Sub logout(clearHashKey)
    On Error Resume Next
    If clearHashKey Then conn.Execute("UPDATE blog_member set mem_hashKey='' where mem_ID="&UserID)
    If Err Then Err.Clear
    Response.Cookies(CookieName)("memName") = ""
    Response.Cookies(CookieName)("memHashKey") = ""
    memStatus = "Guest"
End Sub

%>