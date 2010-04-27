<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim userCookies
userCookies=Easp.GetCookie(CookieName&":index_username")
Response.Write(userCookies)

If userCookies="" Then
Easp.JS("var userCookie=0")
Else
Easp.JS("var userCookie=1")
End If
%>
<!-- Html Body -->
<div id="logo"> </div>
<div id="container">
	<div id="navigation">
		<div id="naviLeft">
			<ul>
				<li> <a href="#" class="naviLeft">运动休闲</a> </li>
				<li> <a href="#" class="naviLeft">时尚休闲</a> </li>
				<li> <a href="#" class="naviLeft">时尚职业</a> </li>
			</ul>
			<div id="naviSelect">
				<select name="select" id="select">
					<option>按季节分类</option>
					<option>春季</option>
					<option>夏季</option>
					<option>秋季</option>
					<option>冬季</option>
				</select>
				<select name="select" id="select">
					<option>按功能分类</option>
					<option>外套</option>
					<option>上衣</option>
					<option>连衣裙</option>
				</select>
				<select name="select2" id="select2">
					<option>按年份分类</option>
					<option>2010年</option>
					<option>2009年</option>
					<option>2008年</option>
					<option>2007年</option>
					<option>2006年</option>
				</select>
			</div>
		</div>
	</div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/title_products.gif" />
		<hr/>
		<h1>时尚休闲系列</h1>
		<div id="products_fancybox">
			<!--
		<a href="fancybox.asp"><div class="products" style="background:url(files/images/img_01.jpg);"> </div></a>
		<a href="fancybox.asp"><div class="products" style="background:url(files/images/img_02.jpg);"> </div></a>
		<div class="products" style="background:url(files/images/img_03.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_04.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_05.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_06.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_08.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_05.jpg);" href="fancybox.asp"> </div>-->
		</div>
		<p>&nbsp; </p>
		<div class="contentEnd"> <a href="#"><img src="files/images/button_next.gif" border="0" align="right" /></a><a href="#"><img src="files/images/button_last.gif" border="0" align="right" /></a> </div>
	</div>
	<!--#include file="files/inc/inner-foot-a.asp" -->
</div>
<!--#include file="lib/foot.asp" -->