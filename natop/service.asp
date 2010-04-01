<%@codepage=65001%>
<!--#include file="conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"　"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="files/css/style.css">
    <script src="files/js/jquery.min.js"></script>
    <script src="files/js/jquery.transitions.js"></script>
    <script>
	function loadContent(newsid){
	document.getElementById('post').innerHTML = "<img src='files/images/loader.gif' border='0' />";
	$("#post").load('outputNews.asp?newsid='+newsid); 
	}
	
	function swTipImg(imgName){
	var imgObj = document.getElementById("tipImg");
	imgObj.setAttribute("src","files/images/"+imgName);
	}
    </script>    
	<title>纳普国际-服务</title>
</head>
<%
sql = "select * from news where class1id = 60"
set rs = conn.execute(sql)
%>
<body onLoad="javascript:loadContent('27');">
	<div id="content">
	<!--#include file="inc_header.asp"-->
    <!-- #header-->
	
	<div id="banner">
		<img  id="tipImg" alt="价值源于专业" src="files/images/service-6-banner.jpg">
	</div><!-- #banner-->

	<div id="main">
		<div class="sidebar about-sidebar">
			<h2><strong>服务</strong></h2>
			<ul>
            <%
			i = 0
			while not rs.eof
			i = i + 1
			if i = 1 then bannerImg = "service-6-banner.jpg"
			if i = 2 then bannerImg = "service-banner.jpg"
			if i = 3 then bannerImg = "service-2-banner.jpg"
			if i = 4 then bannerImg = "service-3-banner.jpg"
			if i = 5 then bannerImg = "service-4-banner.jpg"
			if i = 6 then bannerImg = "service-5-banner.jpg"
			%>
				<li><a title="<%=rs("title")%>" href="javascript:loadContent('<%=rs("id")%>');swTipImg('<%=bannerImg%>');"><strong><%=rs("title")%></strong></a></li>
            <%rs.movenext
			wend
			rs.close
			set rs = nothing%>
			</ul>
		</div><!-- #sidebar-->

		<div id="post">
		</div><!-- #post-->
	</div><!-- #main-->

	<div id="footer-button">
		<a href="contact.html"><button type="button">咨询意见</button></a>
	</div>

	<!--#include file="inc_footer.asp"-->
	<!-- #footer-->
	</div><!-- #content-->
</body>
</html>
