<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<div id="logo"></div>
<div id="container">
	<div id="navigation"></div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/title_member.gif" />
		<hr />
		<div class="newsList">
			<div class="newsName">菁夫人2010夏季订货会在公司本部举办<span class="newsDate">2010.4.1</span></div>
			2009年2月10日至14日，东尚股份09秋冬订货会在雅宝路公司本部举办。受全球经济危机的影响，09年的服装出口形势面临严峻考验，在征求客户关于订货会举办地点意见的基础上，本着合理、有效、理性、精致的原则，09秋冬产品趋势走秀<a href="news1.html" class="listMore">...&gt; 全部内容</a></div>
		<div class="newsList">
			<div class="newsName">菁夫人2010夏季订货会在公司本部举办<span class="newsDate">2010.4.1</span></div>
			2009年2月10日至14日，东尚股份09秋冬订货会在雅宝路公司本部举办。受全球经济危机的影响，09年的服装出口形势面临严峻考验，在征求客户关于订货会举办地点意见的基础上，本着合理、有效、理性、精致的原则，09秋冬产品趋势走秀<a href="news1.html" class="listMore">...&gt; 全部内容</a></div>
		<div class="newsList">
			<div class="newsName">菁夫人2010夏季订货会在公司本部举办<span class="newsDate">2010.4.1</span></div>
			2009年2月10日至14日，东尚股份09秋冬订货会在雅宝路公司本部举办。受全球经济危机的影响，09年的服装出口形势面临严峻考验，在征求客户关于订货会举办地点意见的基础上，本着合理、有效、理性、精致的原则，09秋冬产品趋势走秀<a href="news1.html" class="listMore">...&gt; 全部内容</a></div>
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