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
								<td><img name="index_r4_c5" src="images/index_r4_c5.jpg" width="719" height="251" border="0" id="index_r4_c5" alt="" /></td>
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
											<td width="236" height="211" valign="top">
<ul>
<%
For i=0 To data_con_num
%>
<li><a class="index_menu" href="inner.asp?newsid=<%=data_con(0,i)%>&upclassid=57&classtype=class1"><%=data_con(1,i)%></a></li>
<%
Next
%>
</ul>
											</td>
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
											<td width="249" height="188">&nbsp;</td>
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
								<td width="234" height="398" valign="top"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td height="380" valign="top" bgcolor="#F1F5F8">
											<ul>
<%
For i=0 To data_zp_num
%>
<li><a class="index_menu" href="inner.asp?newsid=<%=data_zp(0,i)%>&upclassid=57&classtype=class1"><%=data_zp(1,i)%></a></li>
<%
Next
%>
</ul>
											</td>
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
<map name="index_r6_c1Map" id="index_r6_c1Map">
	<area shape="rect" coords="43,42,143,74" href="#" />
	<area shape="rect" coords="160,42,251,74" href="#" />
</map>
</body>
<!--#include file="lib/foot.asp" -->