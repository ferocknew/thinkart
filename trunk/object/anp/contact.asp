﻿<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<div id="content">
	<div id="header">
		<div id="logo"> </div>
		<!-- #logo-->
		<div id="language"> English </div>
		<!-- #language-->
		<!--#include file="files/inc/top_menu.asp" -->
	</div>
	<!-- #header-->
	<div id="main">
		<div id="about-exhibition"> </div>
		<!-- #exhibition-->
		<div id="contact-main">
			<div id="contact-left-nav">
				<h2>联系我们</h2>
			</div>
			<!-- #left-nav-->
			<div id="contact-text">
				<h1>联系方式</h1>
				<img src="files/images/map.jpg">
				<p> 上海安湃进出口有限公司<br />
					SH.AP Import and Export Company<br />
					--------------------------------------------<br />
					上海市浦东新区张杨路188号汤臣中心A座1215室<br />
					电话： +86-21-58762069 +86-13918131183 <br />
					传真： +86-21-58762069 <br />
					Email：mr_tony@yahoo.cn<br />
					邮编： 200120 </p>
			</div>
			<!-- #contact-text-->
			<form method="post" action="lib/dataoutput/save_data.asp?act=addmsg">
			<div id="contact-text2">
				<h1>定制产品</h1>
				<b>姓名</b><br/>
				<input type="text" name="user-name" class="inputbox">
				<br/>
				<b>电话</b><br />
				<input type="text" name="tel-num" class="inputbox">
				<br/>
				<b>邮箱</b><br/>
				<input type="text" name="e-mail" class="inputbox">
				<br/>
				<b>公司</b><br/>
				<input type="text" name="com-name" class="inputbox">
				<br/>
				<b>地址</b><br>
				<input name="com-adr" type="text" class="inputbox" id="com-adr">
				<br/>
				<b>定制型号</b><br>
				<input type="text" name="Custom-Model" class="inputbox">
				<br/>
				<b>交货周期</b><br>
				<input type="text" name="Delivery-cycle" class="inputbox">
				<br/>
				<b>您的要求</b><br>
				<textarea class="biginputbox" name="content"></textarea>
				<button>发送</button>
			</div>
			</form>
			<!-- #contact-text2-->
		</div>
		<!-- #about-main-->
	</div>
	<!-- #main-->
	<div id="footer"> Copyright©2010 antop(Shanghai)  All RightsReserved. </div>
	<!-- #footer-->
</div>
<!-- #content-->
<!--#include file="lib/foot.asp" -->