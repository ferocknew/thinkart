<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
news_id=Easp.RQ("news_id",1)
If news_id="" Then news_id="26"
class1id=61
DBField="id,title"
TabName="news"
data_temp_list=table_readdate(conn,"",TabName,DBField,"(class1id="&class1id&")","")
data_temp_list_num=ArrayisEmpty(data_temp_list)

news_id=Cdbl(news_id)
DBField="id,title,content"
TabName="news"
data_temp=table_readdate(conn,"",TabName,DBField,"(id="&news_id&")","")
data_temp_num=ArrayisEmpty(data_temp)

If Not data_temp_num=-1 Then
	news_title=data_temp(1,0)
	news_con=data_temp(2,0)
End If
%>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
    </style>
<div id="main-container">
	<div id="header" class="container_12">
		<div id="topbar">
			<ul class="grid_12">
				<li><a href="brand-3-1.html"><img src="files/images/top-3.jpg"></a></li>
				<li><a href="brand-2-1.html"><img src="files/images/top-2.jpg"></a></li>
				<li><a href="brand.html"><img src="files/images/top-1.jpg"></a></li>
			</ul>
		</div>
		<!-- #topbar-->
		<div class="banner">
			<div class="banner-left"> <img src="files/images/banner-left.gif"> </div>
			<!-- .banner-left-->
			<div class="banner-right"> <img src="files/images/banner-right-about.jpg"> </div>
			<!-- .banner-right-->
		</div>
		<!-- .banner-->
		<!--#include file="files/inc/index-menu.asp" -->
		<!-- .header-nav-->
	</div>
	<!-- #header-->
	<div id="content" class="container_12">
		<div id="container">
			<div class="about-mid"></div>
			<div class="about-sidebar">
				<h2 class="red">行业介绍</h2>
				<ul>
				<%
				If Not data_temp_list_num=-1 Then
				For i=0 To data_temp_list_num
				%>
					<li class="pad"><a href="?news_id=<%=data_temp_list(0,i)%>"><%=data_temp_list(1,i)%></a></li>
				<%
				Next
				End If
				%>
				</ul>
				<h2>融贷通产品</h2>
				<ul id="menu-show-div" style="padding:0px; width:200px;">
					<li class="pad"><a href="#"><strong>企业融资>></strong></a></li>
					<li class="pad"><a href="brand-1-1-1.html">抵押类</a></li>
					<li class="pad"><a href="brand-1-2-1.html">信用类</a></li>
					<li class="pad"><a href="brand-1-3-1.html">法人按揭</a></li>
					<li class="pad"><a href="#"><strong>个人贷款>></strong></a></li>
					<li class="pad"><a href="brand-2-1.html">住房按揭</a></li>
					<li class="pad"><a href="brand-2-2.html">持证抵押</a></li>
					<li class="pad"><a href="#"><strong>快捷融资>></strong></a></li>
					<li class="pad"><a href="brand-3-1.html">短期应急</a></li>
					<li class="pad"><a href="brand-3-2.html">过桥垫资</a></li>
				</ul>
			</div>
			<!-- .sidebar-->
			<div class="about-main">
				<h1><%=news_title%></h1>
				<div class="text"><%=news_con%></div>
			</div>
			<!-- .main-->
			<div class="main-bottom">
				<ul>
					<li><img src="files/images/main-bottom-1.jpg"></li>
					<li><img src="files/images/main-bottom-2.jpg"></li>
					<li><img src="files/images/main-bottom-3.jpg"></li>
					<li><img src="files/images/main-bottom-4.jpg"></li>
					<li><img src="files/images/main-bottom-5.jpg"></li>
					<li><img src="files/images/main-bottom-6.jpg"></li>
					<li><img src="files/images/main-bottom-7.jpg"></li>
					<li><img src="files/images/main-bottom-8.jpg"></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- #content-->
	<div id="footer">
		<div class="footer">
			<p>版权所有 上海德驰投资管理限公司</p>
		</div>
	</div>
	<!-- #footer-->
</div>
<!--#include file="lib/foot.asp" -->