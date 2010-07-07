<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<%
Dim NewsType:NewsType=Easp.RQ("type",0)
Dim NewsTitle:NewsTitle=""
Dim NewsID:NewsID=Easp.RQ("id",1)

Select Case NewsType
case "zlzs"
NewsTitle="制冷知识"
case "pzfw"
NewsTitle="品质服务"
NewsID=13
case else
NewsTitle="新闻中心"
end select


Dim NewsClassID:NewsClassID=59
Set NewsRs=Jasp.ado(conn).exec("select [ID],[title] from [news] where (class2id=67)").Get()
Set NewsClassRs=Jasp.ado(conn).exec("select [ID],[class_name] from [class2] where (upclassid="&NewsClassID&") order by orderid desc").Get()


Dim NewsContent:NewsContent=""
if not NewsID="" then
	NewsContent=conn.execute("Select [content] from [news] where (id="&NewsID&")")(0)
end if
%>
<div id="innerFrame">
	<!--#include file="inc/inc-html-top.asp" -->
	<div id="innerBanner"></div>
	<!-- #innerBanner-->
	<div id="innerContent">
		<div id="leftSide">
       		<p><img src="files/images/img_hotline.jpg" /></p>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><img src="files/images/productTitle2.jpg" width="220" height="50" /></td>
				</tr>
			</table>
		<!--#include file="inc/inc-procls-list.asp" -->
		</div>
		<div id="rightSide">
			<div id="rightTitle">&nbsp;&nbsp; <%=NewsTitle%></div>
			<div style="padding:30px; margin-top:30px;">
			<%
			if not NewsContent="" then
			Response.Write("<br/><br/>")
			Response.Write(NewsContent)
			else
			%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<%
			if not NewsRs.length=0 then
			for i=0 to NewsRs.length-1
			%>
				<tr>
				  <td class="newsLine"><%=(i+1)&""%>. <span style="cursor:pointer;" url="?id=<%=NewsRs.slice(i,i+1).[0].id%>"><%=NewsRs.slice(i,i+1).[0].title%></span></td>
			  </tr>
				<%
			next
			end if
			%>
				<tr>
				  <td class="newsLine">&nbsp;</td>
			  </tr>
				<tr>
				  <td class="newsLine">&nbsp;</td>
			  </tr>
				<tr>
				  <td class="newsLine">&nbsp;</td>
			  </tr>
			</table>
			<%end if%>
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
	$(".newsLine span").click(function(){
		window.location.href=$(this).attr("url");
	})
</script>