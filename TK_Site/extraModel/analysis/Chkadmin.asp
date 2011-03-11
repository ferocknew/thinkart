<%
server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
if mid(server_v1,8,len(server_v2))<>server_v2 then
   response.Redirect("http://www.sjmp5.com") 
end if
%>
<!--#include file="mdb.asp"-->
<%
Set conn2 = Server.CreateObject ("ADODB.Connection")
	connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&sjmp5_mdb&"")
	conn2.Open connstr
Function SafeRequest(ParaName,ParaType) 
Dim ParaValue 
ParaValue=Request(ParaName) 
If ParaType=1 then 
If not isNumeric(ParaValue) then 
Response.write "×¢ÈëÊ§°Ü£¡" 
Response.end 
End if 
Else 
ParaValue=replace(ParaValue,"'","''") 
End if 
SafeRequest=ParaValue 
End function
%>
<!--#include file=md5.asp-->
<%
	dim sql
	dim rs
	dim sjmp5_admin_username
	dim sjmp5_admin_password
	sjmp5_admin_username=left(replace(trim(request("sjmp5_admin_username")),"'",""),40)
	sjmp5_admin_password=md5(left(replace(trim(Request("sjmp5_admin_password")),"'",""),40),32)
	set rs=server.createobject("adodb.recordset")
	sql="select * from sjmp5_admin where sjmp5_admin_password='"&sjmp5_admin_password&"'  and sjmp5_admin_username='"&sjmp5_admin_username&"'"
'	response.write ""&sql&""
'	response.end
	rs.open sql,conn2,1,1
 	if not(rs.bof and rs.eof) then
			session("sjmp5_admin")=rs("sjmp5_admin_username")
			session("sjmp5_flag")=rs("sjmp5_admin_flag")	
		Response.Write "<script>window.location='index.asp';</script>" 
	else
		call Error()
	end if
	sub Error()
Response.Write "<script>window.alert('ÕÊºÅÃÜÂë´íÎó£¡£¡£¡');window.location='login.asp';</script>"     
	end sub
	rs.close
	conn2.close
	set rs=nothing
	set conn2=nothing

%>

