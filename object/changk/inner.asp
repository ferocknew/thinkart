<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" --> 
<!-- Html Body -->
<%
Dim proClassID:proClassID=60
Set proClassRs=Jasp.ado(conn).exec("select [id],[class_name] from [class2] where ([upclassid]="&proClassID&")").get()

Set proRs=Jasp.ado(conn).exec("select [id],[name],[img] from [products]").get()
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
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<!--tr>
					<td height="35" class="unselProduct">S165 A/W/S215 A/W</td>
				</tr-->
				<%
				if not proClassRs.length=0 then
				for i=0 to proClassRs.length-1
				%>
				<tr>
					<td height="35" class="onselProduct"><%=proClassRs.slice(i,i+1).[0].class_name%></td>
				</tr>
				<%
				next
				end if 
				%>
			</table>
		</div>
		<div id="rightSide">
			<div id="rightTitle">&nbsp;&nbsp; 产品中心</div>
			<%
			if not proRs.length=0 then
			for i=0 to proRs.length-1
			%>
			<div id="productObj">
				<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td height="30" align="center"><%=proRs.slice(i,i+1).[0].name%></td>
					</tr>
					<tr>
						<td align="center"><img src="<%=proRs.slice(i,i+1).[0].img%>" width="140" height="140" /></td>
					</tr>
					<tr>
						<td height="40" align="center"><img src="files/images/button_viewDetail.jpg" width="79" height="24" /></td>
					</tr>
				</table>
			</div>
			<%
			next
			end if
			%>
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