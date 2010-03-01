<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim DBField,data_con,data_con_num
DBField="id,title"
data_con=table_readdate(conn,"","news",DBField,"(class1id=57)","")
data_con_num=ArrayisEmpty(data_con)

Dim data_pro,data_pro_num
DBField="id,title"
data_pro=table_readdate(conn,"","news",DBField,"(class1id=59)","")
data_pro_num=ArrayisEmpty(data_pro)

Dim data_zg,data_zg_num
DBField="id,title"
data_zg=table_readdate(conn,"","news",DBField,"(class1id=60)","")
data_zg_num=ArrayisEmpty(data_zg)

Dim data_dt,data_dt_num
DBField="id,title"
data_dt=table_readdate(conn,"","news",DBField,"(class1id=61)","")
data_dt_num=ArrayisEmpty(data_dt)
%>
<style>
.index_ul a{ color:#000; font-weight:normal; text-decoration:none;}
</style>
<!-- Html Body -->
<div class="html_body_div">
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF;">
		<tr>
			<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="950">
					<tr>
						<td><img name="index_r1_c1" src="images/index_r1_c1.jpg" width="202" height="87" border="0" id="index_r1_c1" alt="" /></td>
						<td width="607" height="87">&nbsp;</td>
						<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="117">
								<tr>
									<td width="117" height="12">&nbsp;</td>
								</tr>
								<tr>
									<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="117">
											<tr>
												<td><img name="index_r2_c13" src="images/index_r2_c13.jpg" width="60" height="22" border="0" id="index_r2_c13" alt="" /></td>
												<td><img name="index_r2_c14" src="images/index_r2_c14.jpg" width="57" height="22" border="0" id="index_r2_c14" alt="" /></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td width="117" height="53">&nbsp;</td>
								</tr>
							</table></td>
						<td width="24" height="87">&nbsp;</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><!--#include file="lib/inc/top_menu.asp" --></td>
		</tr>
		<tr>
			<td><img name="index_r5_c1" src="images/index_r5_c1.jpg" width="950" height="20" border="0" id="index_r5_c1" alt="" /></td>
		</tr>
		<tr>
			<td><img name="index_r6_c1" src="images/index_r6_c1.jpg" width="950" height="313" border="0" id="index_r6_c1" alt="" /></td>
		</tr>
		<tr>
			<td width="950" height="26">&nbsp;</td>
		</tr>
		<tr>
			<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="950">
					<tr>
						<td><img name="index_r8_c1" src="images/index_r8_c1.jpg" width="236" height="34" border="0" id="index_r8_c1" alt="" /></td>
						<td><img name="index_r8_c4" src="images/index_r8_c4.jpg" width="240" height="34" border="0" id="index_r8_c4" alt="" /></td>
						<td><img name="index_r8_c7" src="images/index_r8_c7.jpg" width="250" height="34" border="0" id="index_r8_c7" alt="" /></td>
						<td><img name="index_r8_c10" src="images/index_r8_c10.jpg" width="224" height="34" border="0" id="index_r8_c10" alt="" /></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="950" class="index_ul">
					<tr>
						<td width="236" height="243" valign="top" class="borderRight index_news_show">
						<div style="color:#676767; line-height:22px; margin:20px;">
						上海德威装饰工程有限公司是一家以代理日本著名建材品牌和装饰设计、施工为一体的专业化企业。在总公司上海德威实业有限公司的强大支持及兄弟公司上海德崴房地产经纪有限公司等的大力配合下，使我公司拥有完善的管理制度，专业的设计团队、严谨的施工管理、雄厚的经济实力及...
						</div>
						</td>
						<td width="240" height="243" valign="top" class="borderRight index_news_show" id="index_pro_show"><div style="padding-left:15px;">
								<div><img src="images/ad_news1.jpg" style="margin-top:26px;" /></div>
								<div class="index_pro_show_div">[古北国际广场] &nbsp;&nbsp;<img src="images/but_more.jpg" style="vertical-align:middle;" id="gubei" /></div>
								<div><img src="images/ad_news2.jpg" /></div>
								<div class="index_pro_show_div">[爵士酒店公寓] &nbsp;&nbsp;<img src="images/but_more.jpg" style="vertical-align:middle;" id="jueshi" /></div>
							</div></td>
						<td width="250" height="243" valign="top" class="borderRight index_news_show"><div style="padding-left:15px;">
								<div><img src="images/ad_news3.jpg" style="margin-top:24px;" /></div>
								<div id="index_zg_list">
									<ul>
										<li><img src="images/index_show_list.jpg"/>东瀛建材展厅照片</li>
										<li><img src="images/index_show_list.jpg"/>东瀛建材生活馆效果图</li>
										<li><img src="images/index_show_list.jpg"/>东瀛建材生活馆方位图</li>
									</ul>
								</div>
							</div></td>
						<td width="224" height="243" valign="top" class="index_news_show"><div style="padding-top:24px; padding-left:15px; color:#686868; padding-right:10px;">
								<div class="index_news_div_title">[2009-10-16]</div>
								<div class="index_news_div_con">日前，14位专家集体上书国土资源部、住房部和城乡建设部，希望进行二次房改。他们在建...</div>
								<div class="index_news_div_title">[2009-10-16]</div>
								<div class="index_news_div_con">日前，14位专家集体上书国土资源部、住房部和城乡建设部，希望进行二次房改。他们在建...</div>
								<div><img src="images/but_more.jpg" style="cursor:pointer;" id="news_more"/></div>
							</div></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><br />
				<img name="index_r10_c1" src="images/index_r10_c1.jpg" width="950" height="110" border="0" id="index_r10_c1" alt="" /></td>
		</tr>
	</table>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF;">
		<tr>
			<td height="60" align="center">德威实业&nbsp;&nbsp; |&nbsp;&nbsp; 德威装饰&nbsp; |&nbsp;&nbsp; 德威房产<br />
				沪ICP备0810721号 Copyright（C）2008 DeWei Co., Ltd. All Rights Reserved.</td>
		</tr>
	</table>
</div>
<br />
</body>
<!--#include file="lib/foot.asp" -->
<script>
$("#gubei").click(function(){window.location='inner.asp?newsid=30&upclassid=59&classtype=class1';});
$("#jueshi").click(function(){window.location='inner.asp?newsid=32&upclassid=59&classtype=class1';});
$("#news_more").click(function(){window.location='inner.asp?newsid=19&upclassid=61&classtype=class1';});
</script>