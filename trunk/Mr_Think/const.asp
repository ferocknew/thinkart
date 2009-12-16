<%@language="vbscript" codepage="65001"%>
<%
Response.Buffer = True
'***************mrThink 基本设置*******************
' Update:2009-12-16
'***********************************************

Server.ScriptTimeOut = 90
Session.CodePage=936
Session.LCID=2057

'定义 Cookie,Application 域，必须修改，否则可能运行不正常
Const CookieName="mrThink"
Const CookieNameSetting="mrThink"
Const IPViewURL="http://www.dheart.net/ip/index.php?ip=" 'IP查询网站地址
Response.Cookies(CookieNameSetting).Expires=Date+365

'站点开关操作
If Not IsNumeric(Application(CookieName & "_SiteEnable")) Or IsEmpty(Application(CookieName & "_SiteEnable")) Then
    Application.Lock
    Application(CookieName & "_SiteEnable") = 1
    Application(CookieName & "_SiteDisbleWhy") = ""
    Application.UnLock
End If
If Application(CookieName & "_SiteEnable") = 0 And Application(CookieName & "_SiteDisbleWhy")<>"" And InStr(Replace(LCase(Request.ServerVariables("URL")), "\", "/"), "/control.asp") = 0 And InStr(Replace(LCase(Request.ServerVariables("URL")), "\", "/"), "/login.asp") = 0 And InStr(Replace(LCase(Request.ServerVariables("URL")), "\", "/"), "/conmenu.asp") = 0 And InStr(Replace(LCase(Request.ServerVariables("URL")), "\", "/"), "/conhead.asp") = 0 And InStr(Replace(LCase(Request.ServerVariables("URL")), "\", "/"), "/concontent.asp") = 0 Then
    Response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8"" /><div style='font-size:12px;font-weight:bold;border:1px solid #006;padding:6px;background:#eef'>"&Application(CookieName & "_SiteDisbleWhy")&"</div>")
    Response.End
End If
%>