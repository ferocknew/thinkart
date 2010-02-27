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
											<td height="43" valign="middle" bgcolor="#F1F5F8" background="images/index_r9_c1a.jpg" class="titleText">&nbsp;&nbsp; &nbsp;新闻列表</td>
										</tr>
										<tr>
											<td height="100" valign="top" bgcolor="#F1F5F8" id="index_menu">
											<ul>
											<%
											For i=0 To data_temp_num
											%>
											<div class="inner_menu_div"><img src="images/shiye_inner_menu.jpg"/><a style=" color:#6797b7; font-size:14px; font-weight:bolder;" href="?newsid=<%=data_temp(0,i)%>&upclassid=<%=upclassid%>&classtype=<%=classtype%>"><%=data_temp(1,i)%></a></div>
											<%
											Next
											%>
											</ul>
											
											</td>
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
					<td valign="top">
					<div><img src="images/index_r5_c5.jpg"></div>
					<div style="height:60px; line-height:60px; color:#6394b3; font-size:18px; font-weight:bolder; margin-left:20px;"><img src="images/inner_title.jpg" style=" vertical-align:middle; margin-right:20px;" /><%
					If Not data_news_num=-1 And Not newsid=0 Then
					Response.Write(data_news(1,0))
					end if 
					%></div>
					<div style="overflow:auto; width:700px;">
<%
If Not data_news_num=-1 And Not newsid=0 Then
Response.Write(data_news(2,0))
Else
Response.Write("...")
End If
%>
					</div>
					</td>
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