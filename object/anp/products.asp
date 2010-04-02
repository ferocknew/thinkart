<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim class_id,DBField
class_id=61 '产品列表ID

DBField="id,class_name"
tablename="class2"
data_temp=table_readdate(conn,"",tablename,DBField,"","order by orderid")
data_temp_num=ArrayisEmpty(data_temp)

%>
<!-- Html Body -->
<style type="text/css">
<!--
.STYLE1 {color: #6490b4}
-->
</style>
<div id="content">
	<div id="header">
		<div id="logo"> </div>
		<!-- #logo-->
		<div id="language"> English </div>
		<!-- #language-->
		<!--#include file="files/inc/top_menu.asp" -->
	</div>
	<!-- #header-->
	<div id="main">
		<div id="about-exhibition"> </div>
		<!-- #exhibition-->
		<div id="services-main">
			<div id="services-left-nav">
				<h2>产品介绍</h2>
				<ul>
					<li id="libg">铣刀系列</li>
					<li>钻头系列</li>
					<li>定心工具及绞刀系列</li>
					<li>锯系列</li>
				</ul><form method="post" action="products-2.asp?act=sch" name="Search-pro">
				<input type="text" name="lastname" value="产品规格搜索" style="color:#CCCCCC;" onBlur="this.style.color='#CCCCCC'" onFocus="this.style.color='#000000'">
				<button height="20">搜索</button></form>
				<div class="dzcp">------- 定制产品 -------</div>
			</div>
			<!-- #left-nav-->
			<div id="services-text">
				<h1>产品介绍</h1>
				<div class="toppic"> <a href="#"><img src="files/images/toppic_01.gif"></a> <a href="#"><img src="files/images/toppic_02.gif"></a> <a href="#"><img src="files/images/toppic_03.gif"></a> <a href="#"><img src="files/images/toppic_04.gif"></a> </div>
				<p>&nbsp;</p>
				<table class="tab" width="677" border="0" align="right" cellpadding="0" cellspacing="2" id="products-table">
<%
If Not data_temp_num=-1 Then
For i=0 To data_temp_num
%>
					<tr>
						<td width="50%" <%If i Mod 4 =0 Then%>bgcolor="#2f3138"<%End If%>><span class="STYLE1"><a href="products-2.asp?proclassid=<%=data_temp(0,i)%>">&gt; 
						<%
						Response.Write(data_temp(1,i))
						i=i+1
						%></a></span></td>
						<td width="50%" <%If i Mod 4 =1 Then%> bgcolor="#2f3138" <%End If%>><%If i<=data_temp_num Then%><span class="STYLE1"><a href="products-2.asp?proclassid=<%=data_temp(0,i)%>">&gt; <%Response.Write(data_temp(1,i))%></a></span><%End If%></td>
					</tr>
<%
Next
End If
%>
				</table>
				<p>&nbsp;</p>
			</div>
			<!-- #services-text-->
		</div>
		<!-- #about-main-->
	</div>
	<!-- #main-->
	<div id="footer"> Copyright©2010 antop(Shanghai)  All RightsReserved. </div>
	<!-- #footer-->
</div>
<!-- #content-->
<!--#include file="lib/foot.asp" -->