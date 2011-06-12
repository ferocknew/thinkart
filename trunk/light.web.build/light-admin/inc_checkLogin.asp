<%
Response.Expires = 0 '总是过期的
Response.Expiresabsolute = Now() - 1 
Response.AddHeader "pragma","no-cache" '不缓存
Response.AddHeader "cache-control","private" 
Response.CacheControl = "no-cache" 
%>

<%
'if session("user") = "" then
'response.Redirect("login.asp")
'end if
%>
