<%
if session("username") = "" or session("tname") = "" or session("power") = "" then
response.redirect "index.asp"
else
%>
<title>THINK-ART 当前用户:<%=session("tname")%> || 权限：<%=session("power")%></title>
<%									
end if
%>