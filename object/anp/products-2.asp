<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim proclassid,act
act=Easp.RQ("act",0)

DBField="id,name,abstract,addtime,edittime,class1id,class2id,class3id,tag"
TabName="products"
Select Case act
Case "sch" '搜索
pro_name=Easp.RF("lastname",0)

data_temp=table_readdate(conn,"",TabName,DBField,"(name like '%"&pro_name&"%')","order by edittime")
data_temp_num=ArrayisEmpty(data_temp)
Case Else '清单
proclassid=Easp.RQ("proclassid",1)

data_temp=table_readdate(conn,"",TabName,DBField,"","order by edittime")
data_temp_num=ArrayisEmpty(data_temp)
End Select
%>
<!-- Html Body -->
<style type="text/css">
<!--
.STYLE1 {color: #6490b4}
-->
</style>
<script language="javascript" type="text/javascript">
$(function(){
		   var _show_pro$=$("#services-text");
			$("a",_show_pro$).fancybox({
            'autoDimensions':false,
            'autoScale':false,
            'type':'iframe',
            'width':630,
            'height':800
            });
		   })
</script>
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
				<p>&nbsp;</p>
				<table class="tab" width="677" border="0" align="right" cellpadding="0" cellspacing="2">
				<%
				If Not data_temp_num=-1 Then
				For i=0 To data_temp_num
				%>
					<tr>
						<td width="9%" bgcolor="#2f3138"><span class="STYLE1"><%=data_temp(8,i)%></span></td>
						<td width="57%" bgcolor="#2f3138"><span class="STYLE1"><a href="ajax-show.asp?act=show-pro&proid=<%=data_temp(0,i)%>"><%=data_temp(1,i)%></a></span></td>
						<td width="34%" bgcolor="#2f3138"><span class="STYLE1"><%=data_temp(2,i)%></span></td>
					</tr>
				<%
				Next
				End If
				%>
				</table>
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