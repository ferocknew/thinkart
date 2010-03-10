<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim newsid,upclassid,classtype,DBField,data_temp,data_temp_num
classtype=Easp.R("classtype",0)
newsid=Easp.R("newsid",1)
upclassid=Easp.R("upclassid",1)

Select Case classtype
Case "class1"
	DBField="id,title"
	data_temp=table_readdate(conn,"","news",DBField,"(class1id="&upclassid&")","order by addtime desc")
	data_temp_num=ArrayisEmpty(data_temp)
End Select

If Not newsid=0 Then
	Dim data_news,data_news_num
	DBField="id,title,content,edittime"
	data_news=table_readdate(conn,"","news",DBField,"(id="&newsid&")","")
	data_news_num=ArrayisEmpty(data_news)
End If
%>
<style>
 a.index_menu {
	color:#000;
	text-decoration:none;
	font-weight:normal;
	}
.con_us_list li{ height:26px; line-height:26px;}
.con_us_list ul{ list-style:none; padding:0px;}
.con_us_list img{ vertical-align:middle; margin-right:10px;}
.con_us_brother{margin:0px; color:#bbbbbb; list-style:none; padding:0px;}
.con_us_brother span{color:#8395b1;}
.con_us_brother li{ line-height:24px; border-bottom:#999999 dashed 1px;}
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
			<td align="center"><img src="images/shiye_inner_top.jpg" style="margin-left:12px; margin-top:10px; margin-bottom:10px;" /></td>
		</tr>
		<tr>
			<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="1000">
					<tr>
						<td width="281" valign="top"><table align="left" border="0" cellpadding="0" cellspacing="0" width="281">
								<tr>
									<td><table width="88%" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="43" valign="middle" bgcolor="#F1F5F8" background="images/index_r9_c1a.jpg" class="titleText">&nbsp;&nbsp; &nbsp;联系我们</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td><img name="index_r16_c1" src="images/index_r16_c1.jpg" width="281" height="33" border="0" id="index_r16_c1" alt="" /></td>
								</tr>
								<tr>
									<td><table width="88%" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="100" valign="top" bgcolor="#F1F5F8"><img src="images/index_r17_c1.jpg" /></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td valign="top"><div><img src="images/index_r5_c5.jpg"></div>
							<div style="height:60px; line-height:60px; color:#6394b3; font-size:14px; font-weight:bolder; margin-left:20px;"><img src="images/inner_title.jpg" style=" vertical-align:middle; margin-right:20px; " />联系我们</div>
							<div style="overflow:auto; width:700px;">
								<div style="height:20px;"></div>
								<div style="width:275px; float:left; color:#999999;">
									<div style="margin-bottom:17px;"><img src="images/con_us_map.jpg" /></div>
									<div style="line-height:24px;"><img src="images/con_us_adr.jpg" style="vertical-align:middle; margin-right:10px;" /><span style="font-weight:bolder;">上海德威实业有限公司</span><br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上海市虹桥路1452号1103</div>
									<div class="con_us_list">
										<ul style="margin:0px;">
											<li style="background-color:#f5f5f5;"><img src="images/con_us_tel.jpg" />电话： +86 21 62782228</li>
											<li><img src="images/con_us_fax.jpg" />电话： +86 21 62782228</li>
											<li style="background-color:#f5f5f5;"><img src="images/con_us_jt.jpg" />电话： +86 21 62782228</li>
										</ul>
									</div>
								</div>
								<div style="float:left; width:340px; margin-left:22px;"><span style=" color:#8395b1; font-weight:bolder; font-size:14px;">兄弟公司</span>
									<p />
									<ul class="con_us_brother">
									<li><span>上海德威实业有限公司</span><br />青浦区徐泾镇振泾路198号 59884848/59884864</li>
									<li><span>上海德崴房地产经纪有限公司</span><br />青浦区徐泾镇振泾路198号 62782228/62782227</li>
									<li><span>上海德威装饰工程有限公司</span><br />上海市杨浦区隆昌路619号422幢111室 52417771/52417772</li>
									<li><span>上海德崴服装有限公司</span><br />青浦区徐泾镇双联路365号 59883000/59884811</li>
									<li><span>上海伴德体育运动信息咨询有限公司</span><br />上海市长宁区荣华东道96号306室 62091815</li>
									<li><span>上海淮兆自动化系统有限公司</span><br />青浦区徐泾镇沪青平公路1818号7-298室 62099465/62095469</li>
									<li><span>上海松源投资开发有限公司</span><br />青浦区徐泾镇振泾路198号 59884851</li>									
									</ul>
									<div style="height:200px;"></div>
								</div>
							</div></td>
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
</body>
<!--#include file="lib/foot.asp" -->