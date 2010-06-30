<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<div id="content">
	<div id="header">
		<div id="logo"> </div>
		<!-- #logo-->
		<!--#include file="files/inc/top_menu.asp" -->
	</div>
	<!-- #header-->
	<div id="main">
		<div id="about-exhibition"> </div>
		<!-- #exhibition-->
		<div id="contact-main">
			<div id="contact-left-nav">
				<h2>Contact</h2>
			</div>
			<!-- #left-nav-->
			<div id="contact-text">
				<h1><span id="result_box"><span title="联系方式" closure_uid_bwqh39="61">Contact</span></span></h1>
				<img src="files/images/map.jpg">
			  <p><strong>SH.AP Import and Export Company</strong><br />
					--------------------------------------------<br />
				Tel： +86-21-58762069 </p>
			  <p> +86-13611977713&nbsp;&nbsp; MR.SONG<br />
			    Fax： +86-21-58762069 <br />
			    Email：tiger@anpaichina.com<br />
			    <span id="result_box3"><span title="邮编" closure_uid_bwqh39="67">Zip Code</span></span>： 200120 </p>
			</div>
			<!-- #contact-text-->
			<form method="post" action="lib/dataoutput/save_data.asp?act=addmsg">
			<div id="contact-text2">
				<h1><img src="files/images/contact_title_patch.jpg" width="232" height="25" /></h1>
		    <b>Name:</b><br/>
				<input type="text" name="user-name" class="inputbox">
				<br/>
			  <b>Tel:</b><br />
				<input type="text" name="tel-num" class="inputbox">
				<br/>
				<b>Eamil:</b><br/>
				<input type="text" name="e-mail" class="inputbox">
				<br/>
				<b>Company:</b><br/>
				<input type="text" name="com-name" class="inputbox">
				<br/>
        <span id="result_box5"><span title="地址" closure_uid_bwqh39="73"><strong>Address</strong></span></span><strong>:</strong><br>
				<input name="com-adr" type="text" class="inputbox" id="com-adr">
				<br/>
				<b>Custom Products:</b><br>
				<input type="text" name="Custom-Model" class="inputbox">
				<br/>
        <span id="result_box6"><span title="交货周期" closure_uid_bwqh39="75"><strong>Delivery cycle</strong></span></span><strong>:</strong><br>
				<input type="text" name="Delivery-cycle" class="inputbox">
				<br/>
        <span id="result_box7"><span title="您的要求" closure_uid_bwqh39="77"><strong>Your request</strong></span></span><strong>:</strong><br>
				<textarea class="biginputbox" name="content"></textarea>
				<button>Send</button>
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