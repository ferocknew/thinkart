


<%
if session("sjmp5_admin") = "" and session("sjmp5_flag") = "" then
Response.redirect "login.asp"    
end if   
%>
<%
pagekeyindex="20"                                        'ȫ������ÿҳ��¼������ҳ
pagekeyfenxi="20"                                        '�������ÿҳ��¼������ҳ
keystr="��վ��������ϵͳ"                      '����ϵͳ��ǰ�汾
zz="thinkart"                                               '����
emails="service@thinkart.cn"                                   '����E_mail
zzqq="445012229"                                         '����QQ  
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
Response.write "ע��ʧ�ܣ�" 
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
