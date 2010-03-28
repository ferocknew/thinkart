<%
If session("username") = "" Or session("tname") = "" Or session("power") = "" Then
    response.redirect "index.asp"
Else
    Dim title_tml
    title_tml="THINK-ART 当前用户:"&session("tname")&" || 权限："&session("power")
End If
%>