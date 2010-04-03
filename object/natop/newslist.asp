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
    $(function(){
        $("#banner").transition({
            duration : 4000,
            images : ['files/images/about-banner.jpg','files/images/sv-banner.jpg','files/images/database-banner.jpg','files/images/contact-banner.jpg'],
            type : 'fade'
        });
    });
	
	function loadContent(newsid){
	document.getElementById('post').innerHTML = "<img src='files/images/loader.gif' border='0' />";
	$("#post").load('outputNews.asp?newsid='+newsid); 
	}
    </script>
	<title>纳普国际-关于纳普</title>
</head>
<%
sql = "select * from news where class1id = 58"
set rs = conn.execute(sql)
%>
<body onLoad="hideSub();showSub('about_sub');">
	<div id="content">
    <!--#include file="inc_header.asp"-->
	<!-- #header-->

<div id="banner" style="height:243px; width:960px;">
	</div><!-- #banner-->

	<div id="main">
		<div class="sidebar about-sidebar">
			<h2><strong>关于纳普</strong></h2>
			<ul>
            	<%while not rs.eof%>
				<li><a title="<%=rs("title")%>" href="javascript:loadContent('<%=rs("id")%>');"><strong><%=rs("title")%></strong></a></li>
                <%rs.movenext
				wend
				rs.close
				set rs = nothing%>
                <li><a title="新闻中心" href="newslist.asp"><strong>新闻中心</strong></a></li>
			</ul>
		</div><!-- #sidebar-->
<%
sql_news = "select * from news where class1id = 57 order by id desc"
set rs_news = conn.execute(sql_news)
%>
		<div id="post">
        <h1><strong>新闻中心</strong></h1>
          <table width="95%" border="0" cellspacing="0" cellpadding="0">
            <%
			i = 0
			while not rs_news.eof
			i = i + 1
			%>
            <tr>
              <td height="30" class="dottedBottom"><a href="newsDetail.asp?newsid=<%=rs_news("id")%>"><%=rs_news("title")%></a></td>
            </tr>
            <%rs_news.movenext
			wend
			rs_news.close
			set rs_news = nothing%>
          </table>
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
