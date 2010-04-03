<%
If Not GetLocationURLfile()="login.asp" Then
	If Not Request.Cookies(CookieName)("usernameHashKey")="1" Then Response.Redirect("login.asp")
End If
%>