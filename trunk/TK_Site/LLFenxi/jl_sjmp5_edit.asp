

<!--#include file="config.asp"-->
<!-- #include file="md5.asp" -->
<%
if request.form("sjmp5_admin_password")<>request.form("sjmp5_admin_password2") then
Response.Write "<script>window.alert('两次输入的密码不相同！');window.location.href='jl_pass_edit.asp';</script>" 
Response.end()
end if
%>

<%
   sjmp5_admin_id=trim(request.form("sjmp5_admin_id"))
   str="select * from sjmp5_admin where sjmp5_admin_id=sjmp5_admin_id"
   set rs=server.createobject("adodb.recordset")
   rs.open str,conn2,1,2,1
   if not rs.bof and not rs.eof then
   '修改数据
   rs("sjmp5_admin_username")=trim(request.form("sjmp5_admin_username"))
   rs("sjmp5_admin_password")=md5(trim(request.form("sjmp5_admin_password")),32)  
   end if
   rs.update
   rs.close
   conn2.close
Response.Write "<script>window.alert('修改帐户："&request.form("sjmp5_admin_username")&"成功！\n \n 按确定后重新登陆!');window.location.href='logout.asp';</script>" 
%>