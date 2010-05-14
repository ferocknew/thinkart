<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
dim sql
SQL="Select id,title,content,abstract,addtime From [news] where (class1id=61)"
Set rs=Jexs.ADO2Obj(SQL,Conn,1)  '新闻数据库操作
%>
<div id="logo"></div>
<div id="container">
	<div id="navigation"></div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/title_member.gif" />
		<hr />
		<%
		for i=0 to rs.length-1
		%>
		<div class="newsList">
			<div class="newsName"><%=rs.slice(i,i+1).[0].title%><span class="newsDate"><%=DateToStr(rs.slice(i,i+1).[0].addtime,"Y-m-d")%></span></div><%=rs.slice(i,i+1).[0].abstract%>趋势走秀<a href="news1.asp?id=<%=rs.slice(i,i+1).[0].id%>&type=member" class="listMore">...&gt; 全部内容</a></div>
		<%
		next
		%>
		<div id="memberAccounts">
			<h3>尊敬的会员您好：</h3>
			您的帐号为：<%=Easp.GetCookie(CookieName&":index_username")%>
			<p><a href="password_edit.asp"><img src="files/images/button_password.jpg" border="0" style="display:none;" /></a> &nbsp;<a href="mumber_edit.asp"><img src="files/images/button_member.gif" border="0" /></a></p>
		</div>
		<div id="memberMessage">
			<h3>我要留言：</h3>
			<p>
			<form action="lib/dataoutput/webservice.asp?act=savemsg" method="post" name="savemsg">
				<textarea name="message" rows="5" id="message"></textarea>
				<input type="hidden" name="company" value="<%=Easp.GetCookie(CookieName&":index_username")%>"/>
				<input type="hidden" name="email" value="-"/>
				<input type="hidden" name="inputname" value="<%=Easp.GetCookie(CookieName&":index_username")%>"/>
				<input type="hidden" name="telnum" value="-"/>
				<input type="hidden" name="messagetype" value="1"/>				
			</form>
			</p>
			<p><a href="javascript:$('form').submit();"><img src="files/images/button_message.gif" border="0" /></a></p>
		</div>
	</div>
	<!--#include file="files/inc/inner-foot-a.asp" -->
</div>
<!--#include file="lib/foot.asp" -->