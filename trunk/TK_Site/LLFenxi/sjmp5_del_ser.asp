

<!--#include file="config.asp"-->
<%
if session("sjmp5_admin") = "" and session("sjmp5_flag") = "" then
Response.redirect "login.asp"    
end if   
%>
<%
if request("sjmp5_jl_id")="" then
response.write "<script>window.alert('删除记录不能为空！');window.location.href='"&Cstr(Request.ServerVariables("HTTP_REFERER"))&"';</script>"
response.end()
end if
%> 
<%
exec="delete * from sjmp5_jl where sjmp5_jl_id in("&request("sjmp5_jl_id")&")"
conn2.execute(exec)
conn2.close
Response.Write "<script>window.alert('删除成功！');window.location.href='"&Cstr(Request.ServerVariables("HTTP_REFERER"))&"';</script>"
%>
