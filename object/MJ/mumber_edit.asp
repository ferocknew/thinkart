<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim UserId,UserCon,SQL
UserId=Easp.GetCookie(CookieName&":index_userid") '用户ID

If UserId="" Then
	Easp.JS("alert('请先登录！');window.location.href='index.asp';")
	Response.End()
End If

SQL="Select username,email,regcity,RegOperators,telNum,address,userArea From [user] where (id="&UserId&")"
Set UserCon=Jexs.ADO2Obj(SQL,Conn,1)  '数据库操作
%>
<div id="logo"></div>
<div id="container">
	<div id="navigation"></div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<form method="post" action="lib/dataoutput/webservice.asp?act=eidtuser&userid=<%=UserId%>" name="eidtuser">
		<div id="content"> <img src="files/images/title_edit.gif" />
			<hr />
			<p class="fontYellow">尊敬的会员，如果您注册时未详细填写，也可在此处补填信息，修改前请核对信息无误： </p>
			<div id="regMessage"> 邮箱 <br />
				<input type="text" name="email" id="email" value="<%=UserCon.[0].email%>"/>
				<img src="files/images/icon_pass.gif" /> <br />
				经营者<br />
				<input type="text" name="RegOperators" id="RegOperators" value="<%=UserCon.[0].RegOperators%>" />
				<br />
				联系电话<br />
				<input type="text" name="telNum" id="telNum" value="<%=UserCon.[0].telNum%>" />
				<br />
			</div>
			<div id="regMessage2">所在城市<br />
				<input type="text" name="regcity" id="regcity" value="<%=UserCon.[0].regcity%>"  />
				商铺地址<br />
				<input type="text" name="address" id="address" value="<%=UserCon.[0].address%>" />
				营业面积<br />
				<input type="text" name="userArea" id="userArea" value="<%=UserCon.[0].userArea%>"  />
			</div>
			</p>
			<div style="width:100%; float:left;">
				<p>如遇问题请致电<span class="font12"><strong> 021-87654321</strong></span> 与客服联络 </p>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center"><a href="javascript:void(0);" onClick="$('form').submit();"><img src="files/images/button_edit.gif" border="0" /></a></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<!--#include file="files/inc/inner-foot-a.asp" -->
</div>
<!--#include file="lib/foot.asp" -->