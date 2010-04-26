<%@language="vbscript" codepage="65001"%>
<%
Response.Buffer = True
'***************mrThink 基本设置*******************
' Update:2009-12-16
'***********************************************

Server.ScriptTimeOut = 90
Session.codepage=65001
Session.LCID=2057

'定义 Cookie,Application 域，必须修改，否则可能运行不正常
Const CookieName="mrThink-MJ"
Const CookieNameSetting="mrThink-MJ-Setting"
Const site_ver="0.0.1"
Const IPViewURL="http://www.dheart.net/ip/index.php?ip=" 'IP查询网站地址
Response.Cookies(CookieNameSetting).Expires=Date+365
%>