<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<%
Dim ShowPro:ShowPro=4
Set Prors=Jasp.ado(conn).exec("select top "&ShowPro&" [id],[name],[img] from [products]").get()
%>
<!--#include file="lib/header_html.asp" --> 
<!-- Html Body -->
<div id="mainFrame"> 
	<!--#include file="inc/inc-html-top.asp" -->
	<div id="banner">
		<div id="bannerLeft"><img src="files/images/banner_left.jpg" width="311" height="285" /></div>
		<div id="bannerRight"></div>
	</div>
	<!-- #banner-->
	<div id="newsArea">
		<div id="newsBlock" class="cutLine"><img src="files/images/sub_title_desc.jpg" width="335" height="25" /><br />
			<br />
			畅可与深浅设计合作，对公司网站形象进行包装 畅可生产部门新上线一条流水线，应对夏日来临。畅可2010年度第一季度总结大会召开畅可研发部门赴德工程师学成归来寒冬使得制冷行业受到冲击<br />
			畅可逆流而上畅可与深浅设计合作，对公司网站形象进行包装 畅可生产部门新上线一条流水线，应对夏日来临。<br />
			畅可2010年度第一季度总结大会召开畅可研发部门赴德工程师学成归来寒冬使得制冷行业受到冲击，畅可逆流而上    畅可与深浅设计合作，对公司网站形象进行包装 畅可生产部门新上线一条流水线，应对夏日来临。畅可2010年度第一季度总结大会召开畅可研发部门赴德...<br />
			<br />
			<a href="about.asp"><img src="files/images/readMore.jpg" width="95" height="15" border="0" /></a> </div>
		<div id="newsBlock"><img src="files/images/sub_title_news.jpg" width="335" height="25" /><br />
			<br />
			<img src="files/images/newsAd.jpg" width="430" height="90" /> <br />
			<br />
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="20" height="22" align="center">·</td>
					<td>我公司成功参加首届全国制冰机行业发展论坛 </td>
				</tr>
				<tr>
					<td height="22" align="center">·</td>
					<td>北京交通大学科研设备采购采购结果公示</td>
				</tr>
				<tr>
					<td height="22" align="center">·</td>
					<td>中国农业大学“985工程”设备采购中标公告</td>
				</tr>
				<tr>
					<td height="22" align="center">·</td>
					<td>北京长流科学仪器公司成功中标《北京正负电子对撞机重大改造工程》 </td>
				</tr>
			</table>
			<br />
			<a href="newslist.asp"><img src="files/images/readMore.jpg" width="95" height="15" border="0" /></a> <br />
		</div>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<!-- #newsArea-->
	<div id="productArea"> <br />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<%
			if not Prors.length=0 then
			for i=0 to Prors.length-1
			%>
				<td width="25%" height="250" valign="top"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="40" align="center"><%=Prors.slice(i,i+1).[0].name%></td>
						</tr>
						<tr>
							<td align="center"><img src="<%=Prors.slice(i,i+1).[0].img%>" width="140" height="140" /></td>
						</tr>
						<tr>
							<td height="50" align="center"><img src="files/images/button_viewDetail.jpg" width="79" height="24" /></td>
						</tr>
					</table></td>
			<%
			next
			end if
			%>
			</tr>
		</table>
	</div>
	<!-- #newsArea--> 
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