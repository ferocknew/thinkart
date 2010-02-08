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
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
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
					<td width="236" height="243" valign="top" class="borderRight">
						<ul>
						<%
						For i=0 To data_con_num
						%>
						<li><a href="inner.asp?newsid=<%=data_con(0,i)%>&upclassid=57&classtype=class1"><%=data_con(1,i)%></a></li>
						<%
						Next
						%>
						</ul>
					</td>
					<td width="240" height="243" valign="top" class="borderRight">
											<ul>
						<%
						For i=0 To data_pro_num
						%>
						<li><a href="inner.asp?newsid=<%=data_pro(0,i)%>&upclassid=59&classtype=class1"><%=data_pro(1,i)%></a></li>
						<%
						Next
						%>
						</ul>
					</td>
					<td width="250" height="243" valign="top" class="borderRight">
											<ul>
						<%
						For i=0 To data_zg_num
						%>
						<li><a href="inner.asp?newsid=<%=data_zg(0,i)%>&upclassid=60&classtype=class1"><%=data_zg(1,i)%></a></li>
						<%
						Next
						%>
						</ul>
					</td>
					<td width="224" height="243" valign="top">
											<ul>
						<%
						For i=0 To data_dt_num
						%>
						<li><a href="inner.asp?newsid=<%=data_dt(0,i)%>&upclassid=61&classtype=class1"><%=data_dt(1,i)%></a></li>
						<%
						Next
						%>
						</ul>
					</td>
				</tr>
		</table></td>
	</tr>
	<tr>
		<td><br />
			<img name="index_r10_c1" src="images/index_r10_c1.jpg" width="950" height="110" border="0" id="index_r10_c1" alt="" /></td>
	</tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="60" align="center">德威实业&nbsp;&nbsp; |&nbsp;&nbsp; 德威装饰&nbsp; |&nbsp;&nbsp; 德威房产<br />
			沪ICP备0810721号 Copyright（C）2008 DeWei Co., Ltd. All Rights Reserved.</td>
	</tr>
</table>
</body>
<!--#include file="lib/foot.asp" -->