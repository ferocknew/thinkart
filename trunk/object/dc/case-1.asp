<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim act,id,news_title,news_con
act=Easp.RQ("act",0)
id=Easp.RQ("id",1)
news_title=""
news_con=""

DBField="id,title,content"
TabName="news"
data_temp=table_readdate(conn,"",TabName,DBField,"(id="&id&")","")
data_temp_num=ArrayisEmpty(data_temp)

If Not data_temp_num=-1 Then
	news_title=data_temp(1,0)
	news_con=data_temp(2,0)
End If
%>
<div id="main-container">
	<div id="header" class="container_12">
    <!--#include file="files/inc/index-banner.asp" -->
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
			<div class="about-sidebar"  id="menu-show-div">
				<h2 class="red">融贷通产品</h2>
				<ul class="about-sidebar-im">
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
				<div class="text1">
					<div class="text1-mod">
						<%=news_con%>
						<p><a href="case.asp"><strong>&lt;&lt; 返 回</strong></a></p>
					</div>
				</div>
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
</div>
<!--#include file="lib/foot.asp" -->