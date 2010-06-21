<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" --> 
<!-- Html Body -->
<%
NewsClassID=59
Set NewsRs=Jasp.ado(conn).exec("select [ID],[title] from [news]").Get()
Set NewsClassRs=Jasp.ado(conn).exec("select [ID],[class_name] from [class2] where (upclassid="&NewsClassID&") order by orderid desc").Get()
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
				<%
			if not NewsClassRs.length=0 then
			for i=0 to NewsClassRs.length-1
			%>
				<tr> 
					<!--class="unselProduct"-->
					<td height="35" class="onselProduct"><%=NewsClassRs.slice(i,i+1).[0].class_name%></td>
				</tr>
				<%
			next
			end if
			%>
			</table>
		</div>
		<div id="rightSide">
			<div id="rightTitle">&nbsp;&nbsp; 新闻中心</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<%
			if not NewsRs.length=0 then
			for i=0 to NewsRs.length-1
			%>
				<tr>
					<td width="50" height="30">&nbsp;</td>
					<td class="newsLine"><%=(i+1)&""%>. <%=NewsRs.slice(i,i+1).[0].title%></td>
				</tr>
				<%
			next
			end if
			%>
				<tr>
					<td width="50" height="30">&nbsp;</td>
					<td class="newsLine">&nbsp;</td>
				</tr>
				<tr>
					<td width="50" height="30">&nbsp;</td>
					<td class="newsLine">&nbsp;</td>
				</tr>
				<tr>
					<td width="50" height="30">&nbsp;</td>
					<td class="newsLine">&nbsp;</td>
				</tr>
			</table>
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