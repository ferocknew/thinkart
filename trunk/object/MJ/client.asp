<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<div id="logo"></div>
<div id="container">
	<div id="navigation">
		<div id="naviLeft">
			<ul>
				<ul>
					<li><a href="join.asp" class="naviLeft">公司简介</a></li>
				</ul>
				<li><a href="join2.asp" class="naviLeft">代理加盟</a></li>
				<li><a href="client.asp" class="naviLeft">我们的客户</a></li>
			</ul>
		</div>
	</div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/title_client.gif" />
		<hr />
		<div class="clientContent">
			<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td width="230" rowspan="4"><div class="clientImg" id="clientImg"></div></td>
					<td class="clientStyle1">上海长寿路店</td>
				</tr>
				<tr>
					<td class="clientStyle3">营业面积：60平米</td>
				</tr>
				<tr>
					<td class="clientStyle2">开业时间：2009年</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<div class="clientContent">
			<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td width="230" rowspan="4"><div class="clientImg" id="clientImg2"></div></td>
					<td class="clientStyle1">上海新世界店</td>
				</tr>
				<tr>
					<td class="clientStyle3">营业面积：60平米</td>
				</tr>
				<tr>
					<td class="clientStyle2">开业时间：2004年</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<div class="clientContent">
			<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td width="230" rowspan="4"><div class="clientImg" id="clientImg3"></div></td>
					<td class="clientStyle1">上海控江路店</td>
				</tr>
				<tr>
					<td class="clientStyle3">营业面积：75平米</td>
				</tr>
				<tr>
					<td class="clientStyle2">开业时间：2004年</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<div class="clientContent">
			<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td width="230" rowspan="4"><div class="clientImg" id="clientImg4"></div></td>
					<td class="clientStyle1">常熟菁夫人</td>
				</tr>
				<tr>
					<td class="clientStyle3">营业面积：32平面</td>
				</tr>
				<tr>
					<td class="clientStyle2">开业时间：1997年</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<div class="clientContent">
			<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td width="230" rowspan="4"><div class="clientImg" id="clientImg5"></div></td>
					<td class="clientStyle1">无锡菁夫人</td>
				</tr>
				<tr>
					<td class="clientStyle3">营业面积：85平</td>
				</tr>
				<tr>
					<td class="clientStyle2">开业时间：1985年</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<div class="clientContent">
			<table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td width="230" rowspan="4"><div class="clientImg" id="clientImg6"></div></td>
					<td class="clientStyle1">郑州菁夫人</td>
				</tr>
				<tr>
					<td class="clientStyle3">营业面积：53平</td>
				</tr>
				<tr>
					<td class="clientStyle2">开业时间：2005年</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<br />
	</div>
	<!--#include file="files/inc/inner-foot-a.asp" -->
</div>
</body>
</html>
<!--#include file="lib/foot.asp" -->
<script type="text/javascript" src="files/js/jquery.d.imagechange.min.js"></script>
<script>
var _data= [ {src:'files/images/shop1_1.jpg'},{src:'files/images/shop1_2.jpg'},{src:'files/images/shop1_3.jpg'}];
$('#clientImg').d_imagechange({ data:_data, playTime:100000, width:230, height:140, bgHeight:20, btnWidth:10, btnHeight:10, bgOpacity:0, bg:false, title:false, desc:false, btnText:false });

var _data= [ {src:'files/images/shop2_1.jpg'},{src:'files/images/shop2_2.jpg'},{src:'files/images/shop2_3.jpg'}];
$('#clientImg2').d_imagechange({ data:_data, playTime:100000, width:230, height:140, bgHeight:20, btnWidth:10, btnHeight:10, bgOpacity:0, bg:false, title:false, desc:false, btnText:false });

var _data= [ {src:'files/images/shop3_1.jpg'},{src:'files/images/shop3_2.jpg'},{src:'files/images/shop3_3.jpg'}];
$('#clientImg3').d_imagechange({ data:_data, playTime:100000, width:230, height:140, bgHeight:20, btnWidth:10, btnHeight:10, bgOpacity:0, bg:false, title:false, desc:false, btnText:false });

var _data= [ {src:'files/images/shop4_1.jpg'},{src:'files/images/shop4_2.jpg'},{src:'files/images/shop4_3.jpg'}];
$('#clientImg4').d_imagechange({ data:_data, playTime:100000, width:230, height:140, bgHeight:20, btnWidth:10, btnHeight:10, bgOpacity:0, bg:false, title:false, desc:false, btnText:false });

var _data= [ {src:'files/images/shop5_1.jpg'},{src:'files/images/shop5_2.jpg'},{src:'files/images/shop5_3.jpg'}];
$('#clientImg5').d_imagechange({ data:_data, playTime:100000, width:230, height:140, bgHeight:20, btnWidth:10, btnHeight:10, bgOpacity:0, bg:false, title:false, desc:false, btnText:false });

var _data= [ {src:'files/images/shop6_1.jpg'},{src:'files/images/shop6_2.jpg'},{src:'files/images/shop6_3.jpg'}];
$('#clientImg6').d_imagechange({ data:_data, playTime:100000, width:230, height:140, bgHeight:20, btnWidth:10, btnHeight:10, bgOpacity:0, bg:false, title:false, desc:false, btnText:false });
</script>
