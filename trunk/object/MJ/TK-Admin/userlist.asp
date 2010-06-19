<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<!--#include file="lib/header_html.asp"-->
<!--#include file="lib/top_admin.asp" -->
<%
Dim act:act=Easp.RQ("act",0)
if not act="" then
	Dim userid:userid=Easp.RQ("id",1)
	if not userid="" then conn.execute("DELETE FROM [user] WHERE (ID="&userid&")")
	Call Jasp.js("alert('用户删除成功！'),window.location.href='userlist.asp';")
else
	Set rs=Jasp.ado(conn).exec("select [ID],[username],[password],[addtime],[logintime],[email] from [user]").Get()
end if 
%>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">注册用户管理</td>
      </tr>
    </table></td>
    <td width="20" class="rightBorder1px">&nbsp;</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 注册用户列表</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tableHead">
          <td width="100" height="30" align="center" class="inputTable">用户名</td>
          <td width="100" align="center" class="inputTable">邮件</td>
          <td width="100" align="center" class="inputTable">注册时间</td>
          <td width="100" align="center" class="inputTable">最后登录时间</td>
		  <td width="100" align="center" class="inputTable">操作</td>
        </tr>
<%
For i=0 To rs.length-1
%>
        <tr align="center">
          <td height="30" class="inputTable"><%=rs.slice(i,i+1).[0].username%></td>
          <td class="inputTable"><%=rs.slice(i,i+1).[0].email%></td>
          <td class="inputTable"><%=Jasp.date(rs.slice(i,i+1).[0].addtime).format("yyyyy-MM-dd").Get()%></td>
          <td class="inputTable"><%
		  If Not isNull(rs.slice(i,i+1).[0].logintime) Then
		  Response.Write(Jasp.date(rs.slice(i,i+1).[0].logintime).format("yyyyy-MM-dd").Get())
		  End If%></td>
		  <td class="inputTable"><a href="javascript:if(confirm('确实要删除吗?')){window.location.href='?act=delete&id=<%=rs.slice(i,i+1).[0].id%>'}else{void(0);}" style="color:red; font-weight:normal;">删除</a></td>
        </tr>
<%
Next
%>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" class="bottomBorder1px">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
<!--#include file="../lib/foot.asp" -->