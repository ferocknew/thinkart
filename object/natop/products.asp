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
    
	<title>纳普国际-产品</title>
    <style type="text/css">
<!--
.STYLE1 {
	color: #6b90b0;
	font-weight: bold;
}
-->
    </style>
</head>
<%
sql = "select * from news where class1id = 59"
set rs = conn.execute(sql)
%>
<%
showid = request("showid")
if showid = 1 then num = 23
if showid = 2 then num = 24
if showid = 3 then num = 25
if showid = 4 then num = 26
if showid = "" then num = 23
%>
<body onLoad="loadContent('<%=num%>');hideSub();showSub('product_sub');">
	<div id="content">
    <!--#include file="inc_header.asp"-->
	<!-- #header-->
	
	<div id="banner">
		<img alt="价值源于专业" src="files/images/products-banner.jpg">
	</div><!-- #banner-->

	<div id="main">
		<div class="sidebar about-sidebar">
			<h2><strong>产品</strong></h2>
			<ul>
			<%while not rs.eof%>            
		    <li><a title="<%=rs("title")%>" href="javascript:loadContent('<%=rs("id")%>');"><strong><%=rs("title")%></strong></a></li>
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
