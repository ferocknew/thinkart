<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim classid,act
act=Easp.RQ("act",0)
classid=Easp.RQ("classid",1)

If classid="" Then classid=71

class1id=62
DBField="id,class_name"
TabName="class2"
data_temp_class1=table_readdate(conn,"",TabName,DBField,"(upclassid="&class1id&")","")
data_temp_class1_num=ArrayisEmpty(data_temp_class1)

DBField="id,title,class2id"
TabName="news"
data_temp_news=table_readdate(conn,"",TabName,DBField,"(class2id="&classid&")","order by edittime")
data_temp_news_num=ArrayisEmpty(data_temp_news)

data_temp_class1_title=table_readdate(conn,"","class2","class_name,upclassid","(id="&classid&")","")
data_temp_class1_title_num=ArrayisEmpty(data_temp_class1_title)
If Not data_temp_class1_title_num=-1 Then class_title=data_temp_class1_title(0,0)

If Not act="" Then
	NewsId=Easp.RQ("id",1)
	data_temp_show_news=table_readdate(conn,"","news","title,content","(id="&NewsId&")","")
	data_temp_show_news_num=ArrayisEmpty(data_temp_show_news)
	If Not data_temp_show_news_num=-1 Then
	news_title=data_temp_show_news(0,0)
	news_con=data_temp_show_news(1,0)
	End If
End If
%>
<!-- Html Body -->
	<div id="main-container">
	<div id="header" class="container_12">
	<!--#include file="files/inc/index-banner.asp" -->
<!-- #topbar-->

		<div class="banner">
			<div class="banner-left">
				<img src="files/images/banner-left.gif">
			</div><!-- .banner-left-->

			<div class="banner-right">
				<img src="files/images/banner-right-about.jpg">
			</div><!-- .banner-right-->
		</div><!-- .banner--><!--#include file="files/inc/index-menu.asp" --><!-- .header-nav-->
	</div><!-- #header-->

	<div id="content" class="container_12">
		<div id="container">
		<div class="about-mid"></div>
		<div class="about-sidebar">
			<h2 class="red"><%=class_title%></h2>
			<ul>
			<%
			If Not data_temp_class1_num=-1 Then
			For i=0 To data_temp_class1_num
			%>
				<li class="pad"><a href="?classid=<%=data_temp_class1(0,i)%>"><%=data_temp_class1(1,i)%></a></li>
			<%
			Next
			End If
			%>
			</ul>
			<ul id="menu-show-div" style="padding:0px; width:230px;">
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
		</div><!-- .sidebar-->

		<div class="about-main" id="about-main-id">
			<h1><%
			If act="" Then
			Response.Write(class_title)
			Else
			Response.Write(news_title)
			End If%></h1>
			<div class="text1">
			  <div class="text2">
			  	<%
				If act="" Then
				If Not data_temp_news_num=-1 Then
				For i=0 To data_temp_news_num
				%>
			    <p class="listBoder"><strong><a href="?act=show-news&id=<%=data_temp_news(0,i)%>" news_id="<%=data_temp_news(0,i)%>"><%=data_temp_news(1,i)%></a></strong></p>
				<%
				Next
				End If
				Else
				Response.Write(news_con)
				End IF
				%>
			  </div>
			</div>
		</div><!-- .main-->

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
	</div><!-- #content-->
	</div>
<!--#include file="lib/foot.asp" -->