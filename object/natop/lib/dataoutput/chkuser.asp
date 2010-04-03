<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<!--#include file="action_lib.asp" -->
<%
Dim username,password,datatemp,action_type
action_type=SafeRequest("act",0)
Select Case action_type
Case "loginout_admin"
	Call logout(True)
	Response.Redirect("../../TK-Admin/login.asp?msg=loginout")
Case Else
	username=Trim(Request.Form("username"))
	password=Trim(Request.Form("password"))

	datatemp=table_recordcount(conn,"admin","id","username='"&username&"'")
	If datatemp=1 Then
		datatemp=table_recordcount(conn,"admin","id","(username='"&username&"') and (password='"&md5(password)&"')")
		If datatemp=1 Then
			Response.Cookies(CookieName)("username") = username
			Response.Cookies(CookieName)("usernameHashKey") = "1"
			Response.Cookies(CookieName).expires=(now()+1/24)
			conn.execute("update admin set logintime='"&Now()&"' where (username='"&username&"')")
			Response.Redirect("../../TK-Admin/index.asp")
		Else
			Response.Redirect("../../TK-Admin/login.asp?msg=err_ps")
		End If
	Else
		Response.Redirect("../../TK-Admin/login.asp?msg=err_name")
	End If
	datatemp=""
End Select

'注销用户
Sub logout(clearHashKey)
    On Error Resume Next
    'If clearHashKey Then conn.Execute(UPDATE blog_member set mem_hashKey='' where mem_ID=&UserID)
    If Err Then Err.Clear
    Response.Cookies(CookieName)("username") = "Guest"
    Response.Cookies(CookieName)("usernameHashKey") = "-1"
	Response.Cookies(CookieName).expires=(now()+1)
End Sub
Call CloseDB()
%>