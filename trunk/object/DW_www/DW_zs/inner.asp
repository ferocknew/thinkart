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
	data_temp=table_readdate(conn,"","news",DBField,"(class1id="&upclassid&")","")
	data_temp_num=ArrayisEmpty(data_temp)
End Select

If Not newsid=0 Then
	Dim data_news,data_news_num
	DBField="id,title,content,edittime"
	data_news=table_readdate(conn,"","news",DBField,"(id="&newsid&")","")
	data_news_num=ArrayisEmpty(data_news)
End If
%>
<!-- Html Body -->
<div class="html_body_div">
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
		<td></td>
	</tr>
	<tr>
		<td><table align="left" border="0" cellpadding="0" cellspacing="0" width="950">
				<tr>
					<td width="236" height="243" align="center" valign="top" class="borderRight">
					<table id="__01" width="200" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img id="menu_01" src="images/menu_01.png" width="200" height="51" alt="" /></td>
	</tr>
	<tr>
		<td height="200" valign="top" background="images/menu_bg.jpg"><table width="180" border="0" align="center" cellpadding="0" cellspacing="0" id="inner_list">
		<%
For i=0 To data_temp_num
%>
		  <tr>
		    <td height="25" class="bt_line"><a href="?newsid=<%=data_temp(0,i)%>&upclassid=<%=upclassid%>&classtype=<%=classtype%>" style="color:#fff; font-family:'宋体'; text-decoration:none; font-weight:normal;"><%=data_temp(1,i)%></a></td>
	      </tr>
		  <%
Next
%>
	    </table></td>
	</tr>
	<tr>
		<td>
			<img id="menu_03" src="images/menu_03.jpg" width="200" height="13" alt="" /></td>
	</tr>
</table>
					</td>
					<td height="243" valign="top" class="borderRight" id="show_con">
					<div style="border-bottom:#aac0cb dashed 1px; margin-right:10px; margin-bottom:20px; font-size:12px; color:#999; height:20px; line-height:20px;">
					<%If Not data_news_num=-1 And Not newsid=0 Then
					Response.Write(data_news(1,0))
					end if 
					%></div>
					<div style="overflow:auto; width:700px">
							<%
							If Not data_news_num=-1 And Not newsid=0 Then
							Response.Write(data_news(2,0))
							Else
							Response.Write("...")
							End If
							%>
						</div></td>
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
</div>
<!--#include file="lib/foot.asp" -->
<script>
var inner_list=$("#inner_list");
console.info(inner_list);
$("td",inner_list).hover(function(){$(this).removeClass().addClass("overNews");},function(){$(this).removeClass().addClass("bt_line");})
</script>