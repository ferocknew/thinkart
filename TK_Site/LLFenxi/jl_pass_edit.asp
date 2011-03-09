

<!--#include file="config.asp"-->
<%
exec="select * from sjmp5_admin order by sjmp5_admin_id desc"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
%>
<title>管理员帐号密码修改！</title>
<style type="text/css">
<!--
.STYLE2 {
	color: #999999;
	font-size: 36px;
}
.del2 {
	font-size: 12px;
	color: #000000;
	text-decoration: none;
}
.del21 {

	text-decoration: none;
}
-->
</style>


<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br /> 
<br />
<br /> 
<br />
  <form id=form name=form method=post action=jl_sjmp5_edit.asp?sjmp5_admin_id=<%=rs("sjmp5_admin_id")%>>
<table width="300" height="156" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#f8f8f8">管理员帐号密码修改</td>
    </tr>
  <tr>
    <td height="30" align="right" bgcolor="#FFFFFF">帐号:</td>
    <td height="30" align="left" bgcolor="#FFFFFF"> <input name="sjmp5_admin_username" type="text"  style="BORDER-RIGHT: 1px #ffffff solid; BORDER-TOP: 1px #ffffff solid; BORDER-LEFT: 1px #ffffff solid; WIDTH: 130px; BORDER-BOTTOM: 1px #dddddd solid" value=<%=rs("sjmp5_admin_username")%> /></td>
    </tr>
  <tr>
    <td width="82" height="30" align="right" bgcolor="#FFFFFF">密码:</td>
    <td width="211" height="30" align="left" bgcolor="#FFFFFF"> <input name="sjmp5_admin_password" type="password"  style="BORDER-RIGHT: 1px #ffffff solid; BORDER-TOP: 1px #ffffff solid; BORDER-LEFT: 1px #ffffff solid; WIDTH: 130px; BORDER-BOTTOM: 1px #dddddd solid" value= ></td>
    </tr>
	  <tr>
    <td width="82" height="30" align="right" bgcolor="#FFFFFF">确认密码:</td>
    <td width="211" height="30" align="left" bgcolor="#FFFFFF"> <input name="sjmp5_admin_password2" type="password"  style="BORDER-RIGHT: 1px #ffffff solid; BORDER-TOP: 1px #ffffff solid; BORDER-LEFT: 1px #ffffff solid; WIDTH: 130px; BORDER-BOTTOM: 1px #dddddd solid" value= ></td>
    </tr>
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#f8f8f8"><input name="submit" type="submit" value="修改"  style="width:60px; border-style: solid; border-width: 0px " /></td>
    </tr>
</table>
 </form>

