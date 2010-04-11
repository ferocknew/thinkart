<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim act,id,news_title,news_con
act=Easp.RQ("act",0)
id=Easp.RQ("id",0)
news_title=""
news_con=""

Select Case act
	Case "show_news"
	DBField="id,title,content"
	TabName="news"
	data_temp=table_readdate(conn,"",TabName,DBField,"(id="&id&")","")
	data_temp_num=ArrayisEmpty(data_temp)
	
	If Not data_temp_num=-1 Then
		news_title=data_temp(1,0) '标题
		news_con=data_temp(2,0) '内容
	End If

	Case Else
	id=15
	DBField="id,title,content"
	TabName="news"
	data_temp=table_readdate(conn,"",TabName,DBField,"(id="&id&")","")
	data_temp_num=ArrayisEmpty(data_temp)
	
	If Not data_temp_num=-1 Then
		news_title=data_temp(1,0) '标题
		news_con=data_temp(2,0) '内容
	End If
End Select


%>
<style>
.text img{width:240px;}
</style>
<!-- Html Body -->
<div id="main-container">
	<div id="header" class="container_12">
	<!--#include file="files/inc/index-banner.asp" -->
		<!-- #topbar-->
		<div class="banner">
			<div class="banner-left"> <img src="files/images/banner-left.gif"> </div>
			<!-- .banner-left-->
			<div class="banner-right"> <img src="files/images/banner-right-brand.jpg"> </div>
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
			<div class="about-sidebar" id="menu-show-div">
				<!--div class="naviLeft1"><a href="#" class="pad">企业融资>></a></div>
				<div class="naviLeft2"><a href="brand-1-1-1.html"><strong>抵押类</strong></a></div>
				<div class="naviLeft5"><a href="brand-1-1-1.html">企业厂房抵押贷款</a><strong><br>
					</strong><a href="brand-1-1-2.html">企业流动资金贷</a><strong><br>
					</strong><a href="brand-1-1-3.html">企业商业楼宇抵押贷款</a></div>
				<div class="naviLeft2"><a class="button" href="brand-1-2-1.html"><strong>信用类</strong></a></div>
				<div class="naviLeft5"><a class="button" href="brand-1-2-1.html">贸易授信</a><strong><br>
					</strong><a class="button" href="brand-1-2-2.html">无抵押贷款</a><br>
				</div>
				<div class="naviLeft2"><a href="brand-1-3-1.html"><strong>法人按揭</strong></a></div>
				<div class="naviLeft3"><a href="#" class="pad">个人贷款>></a></div>
				<div class="naviLeft2"><a href="brand-2-1.html"><strong>住房按揭</strong></a></div>
				<div class="naviLeft2"><a href="brand-2-2.html"><strong>持证抵押</strong></a></div>
				<div class="naviLeft3"><a href="#" class="pad">快捷融资>></a></div>
				<div class="naviLeft2"><a href="brand-3-1.html"><strong>短期应急</strong></a></div>
				<div class="naviLeft4"><a href="brand-3-2.html"><strong>过桥垫资</strong></a></div-->
			</div>
			<!-- .sidebar-->
			<div class="about-main">
				<h1><%=news_title%></h1>
				<div><%=news_con%></div>
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