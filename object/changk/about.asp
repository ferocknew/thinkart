<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<div id="innerFrame"><!--#include file="inc/inc-html-top.asp" -->
	<div id="innerBanner"></div>
	<!-- #innerBanner-->
	<div id="innerContent">
		<div id="leftSide">
			<p><img src="files/images/img_hotline.jpg" /></p>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><img src="files/images/productTitle2.jpg" /></td>
				</tr>
			</table>
		<!--#include file="inc/inc-procls-list.asp" --> 
		</div>
		<div id="rightSide">
			<div id="rightTitle">&nbsp;&nbsp; 关于畅可
				<div id="innerContent2">
					<%
	  =conn.execute("select [com_intro] from [info] where id=1")(0)
	  %>
				</div>
				<p>&nbsp;</p>
			</div>
		</div>
	</div>
	<!-- #innerContent--> 
	
</div>
<div id="copyRight">COPYRIGHT @ 2010 - DESIGN BY THINKART 2010 ALL RIGHT RESERVED</div>
<!--#include file="lib/foot.asp" -->
<script>
	$(function(){
		$("#bannerRight").transition({
			duration : 3000,
			images : ['files/images/index-banner_1.jpg', 'files/images/index-banner_2.jpg','files/images/index-banner_3.jpg'],
			type : 'fade'
		});
	});
</script>