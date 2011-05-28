
<!--#include file="config.asp"-->
<%
if session("sjmp5_admin") = "" and session("sjmp5_flag") = "" then
Response.redirect "login.asp"    
end if   
%>
<%
exec="Select * from sjmp5_jl where sjmp5_jl_id="&request("tid")
set rs=server.CreateObject("adodb.recordset")
rs.open exec,conn2,1,3
if not rs.bof and not rs.eof then
rs.delete
rs.update
end if
rs.close
set rs=nothing
conn2.close
set conn2=nothing
Response.Write "<script>window.alert('删除成功！');window.location.href='"&Cstr(Request.ServerVariables("HTTP_REFERER"))&"';</script>" 
%>