


<%
if session("sjmp5_admin") = "" and session("sjmp5_flag") = "" then
Response.redirect "login.asp"    
end if   
%>
<%
pagekeyindex="20"                                        '全部分析每页记录条数分页
pagekeyfenxi="20"                                        '当天分析每页记录条数分页
keystr="网站流量分析系统"                      '分析系统当前版本
zz="thinkart"                                               '作者
emails="service@thinkart.cn"                                   '作者E_mail
zzqq="445012229"                                         '作者QQ  
%>
<!--#include file="mdb.asp"-->
<%
session.Timeout=600
Set conn2 = Server.CreateObject ("ADODB.Connection")
	connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&sjmp5_mdb&"")
	conn2.Open connstr
Function SafeRequest(ParaName,ParaType) 
Dim ParaValue 
ParaValue=Request(ParaName) 
If ParaType=1 then 
If not isNumeric(ParaValue) then 
Response.write "注入失败！" 
Response.end 
End if 
Else 
ParaValue=replace(ParaValue,"'","''") 
End if 
SafeRequest=ParaValue 
End function

Function conning()
rs.close
set rs=nothing   
conn2.close
set conn2=nothing
End function
%>
