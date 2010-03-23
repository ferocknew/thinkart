<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim DBField,data_con,data_con_num
DBField="id,title"
data_con=table_readdate(conn,"","news",DBField,"(class1id=57)","")
data_con_num=ArrayisEmpty(data_con)

Dim data_zp,data_zp_num
DBField="id,title"
data_zp=table_readdate(conn,"","news",DBField,"(class1id=60)","")
data_zp_num=ArrayisEmpty(data_zp)
%>
<style>
 a.index_menu {
	color:#000;
	text-decoration:none;
	font-weight:normal;
	}
</style>
<!-- Html Body -->
<div class="html_body_div">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="1000">
	<tr>
		<td><img name="index_r1_c1" src="images/index_r1_c1.jpg" width="48" height="78" border="0" id="index_r1_c1" alt="" /></td>
		<td><img name="index_r1_c3" src="images/index_r1_c3.jpg" width="193" height="78" border="0" id="index_r1_c3" alt="" /></td>
		<td><img name="index_r1_c4" src="images/index_r1_c4.jpg" width="594" height="78" border="0" id="index_r1_c4" alt="" /></td>
		<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="116">
				<tr>
					<td><img name="index_r1_c8" src="images/index_r1_c8.jpg" width="116" height="33" border="0" id="index_r1_c8" alt="" /></td>
				</tr>
				<tr>
					<td width="116" height="45">&nbsp;</td>
				</tr>
			</table></td>
		<td width="49" height="78">&nbsp;</td>
	</tr>
</table>
<!--#include file="lib/inc/top_menu.asp" -->
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="1000">
				<tr>
					<td><img name="index_r4_c1" src="images/index_r4_c1.jpg" width="281" height="288" border="0" id="index_r4_c1" alt="" /></td>
					<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="719">
							<tr>
								<td><div id="index_top_img" style="height:251px; width:719px;"></div></td>
							</tr>
							<tr>
								<td><img name="index_r5_c5" src="images/index_r5_c5.jpg" width="719" height="37" border="0" id="index_r5_c5" alt="" /></td>
							</tr>
						</table></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="1000">
				<tr>
					<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="281">
							<tr>
								<td><img src="images/index_r6_c1.jpg" alt="" name="index_r6_c1" width="281" height="88" border="0" usemap="#index_r6_c1Map" id="index_r6_c1" /></td>
							</tr>
							<tr>
								<td><img name="index_r9_c1" src="images/index_r9_c1.jpg" width="281" height="58" border="0" id="index_r9_c1" alt="" /></td>
							</tr>
							<tr>
								<td><img name="index_r10_c1" src="images/index_r10_c1.jpg" width="281" height="38" border="0" id="index_r10_c1" alt="" /></td>
							</tr>
							<tr>
								<td><img name="index_r11_c1" src="images/index_r11_c1.jpg" width="281" height="36" border="0" id="index_r11_c1" alt="" /></td>
							</tr>
							<tr>
								<td><img name="index_r13_c1" src="images/index_r13_c1.jpg" width="281" height="36" border="0" id="index_r13_c1" alt="" /></td>
							</tr>
							<tr>
								<td><img name="index_r14_c1" src="images/index_r14_c1.jpg" width="281" height="36" border="0" id="index_r14_c1" alt="" /></td>
							</tr>
							<tr>
								<td><img name="index_r15_c1" src="images/index_r15_c1.jpg" width="281" height="20" border="0" id="index_r15_c1" alt="" /></td>
							</tr>
							<tr>
								<td><img name="index_r16_c1" src="images/index_r16_c1.jpg" width="281" height="33" border="0" id="index_r16_c1" alt="" /></td>
							</tr>
							<tr>
								<td><img name="index_r17_c1" src="images/index_r17_c1.jpg" width="281" height="99" border="0" id="index_r17_c1" alt="" /></td>
							</tr>
						</table></td>
					<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="485">
							<tr>
								<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="485">
										<tr>
											<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="249">
													<tr>
														<td><img name="index_r6_c5" src="images/index_r6_c5.jpg" width="249" height="54" border="0" id="index_r6_c5" alt="" /></td>
													</tr>
													<tr>
														<td><img name="index_r8_c5" src="images/index_r8_c5.jpg" width="249" height="92" border="0" id="index_r8_c5" alt="" /></td>
													</tr>
													<tr>
														<td width="249" height="65">&nbsp;</td>
													</tr>
												</table></td>
											<td width="236" height="211" valign="top"><div class="index_show_div">
													<p>德威企业经过十多年的发展，已经组建成为一家集投资经营、装饰工程、建材销售、房产销售租赁、信息咨询、投资咨询和销售流通为一体的综合性民营企业...</p>
													<p><span style="color:#f57326; font-weight:bolder; cursor:pointer;" id="index_about">查看</span> <img src="images/more_sy.jpg" width="4" height="6" /></p>
												</div></td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td><img name="index_r12_c5" src="images/index_r12_c5.jpg" width="485" height="9" border="0" id="index_r12_c5" alt="" /></td>
							</tr>
							<tr>
								<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="485">
										<tr>
											<td><img name="index_r13_c5" src="images/index_r13_c5.jpg" width="249" height="36" border="0" id="index_r13_c5" alt="" /></td>
											<td><img name="index_r13_c6" src="images/index_r13_c6.jpg" width="236" height="36" border="0" id="index_r13_c6" alt="" /></td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="485">
										<tr>
											<td width="249" height="188" valign="top"><div class="index_show_div" style="margin-top:10px; margin-left:10px;">总公司上海德威实业有限公司成立于1995年，现已投资经营为主，下属上海德威装饰工程有限公司、上海德威房地产经纪有限公司、苏州工业园区德威置业有限公司等多家子公司，分别在上海和苏州的装饰装潢、建材销售、涉外房产租赁建立起良好的商业信誉和稳定的...</div></td>
											<td><img name="index_r14_c6" src="images/index_r14_c6.jpg" width="236" height="188" border="0" id="index_r14_c6" alt="" /></td>
										</tr>
									</table></td>
							</tr>
						</table></td>
					<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="234">
							<tr>
								<td><img name="index_r6_c7" src="images/index_r6_c7.jpg" width="234" height="48" border="0" id="index_r6_c7" alt="" /></td>
							</tr>
							<tr>
								<td width="234" height="398" valign="top"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#d7d8da solid 1px;">
										<tr>
											<td height="380" valign="top" bgcolor="#F1F5F8" style="padding:10px;"><div class="index_show_div_right">[2009-10-16]</div>
												<div class="index_show_div" style=" margin-top:10px; line-height:20px;">中新网10月30日电 创业板首日交易火爆，创富效应明显，仅以今天开盘价计算，已有86名亿万富豪，更有5人跻身10亿富豪。</div>
												<div class="index_show_div_right">[2009-10-15]</div>
												<div class="index_show_div" style=" margin-top:10px; line-height:20px;">对于优惠政策年底取消与否的问题，首先要明确一点，有时间表的政策，肯定会按时取消，明年是否延续今年的优惠。                况再制定下一步的政策安排。</div>
												<div class="index_right_news_more" id="index_news_more">更多</div></td>
										</tr>
									</table></td>
							</tr>
						</table></td>
				</tr>
			</table></td>
	</tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td><img name="index_r18_c1" src="images/index_r18_c1.jpg" width="1000" height="16" border="0" id="index_r18_c1" alt="" /></td>
	</tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="60" align="center">德威实业&nbsp;&nbsp; |&nbsp;&nbsp; 德威装饰&nbsp; |&nbsp;&nbsp; 德威房产<br />
			沪ICP备0810721号 Copyright（C）2008 DeWei Co., Ltd. All Rights Reserved.</td>
	</tr>
</table>
</div>
<map name="index_r6_c1Map" id="index_r6_c1Map">
	<area shape="rect" coords="43,42,143,74" href="#" />
	<area shape="rect" coords="160,42,251,74" href="#" />
</map>

</body>
<!--#include file="lib/foot.asp" -->
<script>
$("#index_about").bind("click",function(){window.location="inner.asp?newsid=19&upclassid=57&classtype=class1";});
$("#index_news_more").bind("click",function(){window.location="inner.asp?newsid=23&upclassid=58&classtype=class1";});
</script>