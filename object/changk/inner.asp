<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<%
Dim classtype,classid
classtype=Easp.RQ("classtype",0)
classid=Easp.RQ("classid",1)
SQL=""

if not classtype="" then
	Select case classtype
	case "class2"
		SQL="select [id],[name],[img] from [products] where (class2id="&classid&")"
	case "class3"
		SQL="select [id],[name],[img] from [products] where (class3id="&classid&")"
	end select
else
	SQL="select [id],[name],[img] from [products] where (class3id=21)"
end if

Set proRs=Jasp.ado(conn).exec(SQL).get()
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
						<td height="40" align="center"><a href="#"><img src="files/images/button_viewDetail.jpg" width="79" height="24" border="0" /></a></td>
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
		$("a[href='#']").attr("href","javascript:void(0);");
		$("#bannerRight").transition({
			duration : 3000,
			images : ['files/images/index-banner_1.jpg', 'files/images/index-banner_2.jpg','files/images/index-banner_3.jpg'],
			type : 'fade'
		});
	});
</script>