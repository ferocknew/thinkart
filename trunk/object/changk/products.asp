<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<%
Dim proID:proID=Easp.RQ("id",1)

Set proRS=Jasp.ado(conn).exec("select [id],[name],[content],[img] from [products] where (id="&proID&")").get()

if proRS.length=0 then Response.End()
%>
<div id="innerFrame">
	<!--#include file="inc/inc-html-top.asp" -->
	<div id="innerBanner"></div>
	<!-- #innerBanner-->
	<div id="innerContent">
		<div id="leftSide">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><img src="files/images/productTitle.jpg" width="220" height="50" /></td>
				</tr>
			</table>
		<!--#include file="inc/inc-procls-list.asp" --> 
		</div>
		<div id="rightTitle">&nbsp;&nbsp; <%=proRS.[0].name%>
		  <div id="innerContent2">
		    <div class="productImg"><img src="<%=proRS.[0].img%>" /></div><%=proRS.[0].content%></div>
		  <p>&nbsp;</p>
	  </div>
	</div>
	<!-- #innerContent-->

</div>
<div id="copyRight">COPYRIGHT @ 2010 - DESIGN BY THINKART 2010 ALL RIGHT RESERVED</div>
<!--#include file="lib/foot.asp" -->
<script>
	$(function(){
		$("a[href='#']").attr("href","javascript:void(0);");
		$("#bannerRight").transition({
			duration : 3000,
			images : ['files/images/index-banner_1.jpg', 'files/images/index-banner_2.jpg','files/images/index-banner_3.jpg'],
			type : 'fade'
		});
	});
</script>