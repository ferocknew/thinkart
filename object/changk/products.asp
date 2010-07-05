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
		<div id="rightTitle">&nbsp;&nbsp; 产品名称
		  <div id="innerContent2">
		    <div class="productImg">产品图片插这里</div>
	      产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍产品介绍。</div>
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