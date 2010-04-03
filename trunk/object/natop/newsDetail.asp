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
newsid = request("newsid")
sql_news = "select * from news where id = "&newsid&""
set rs_news = conn.execute(sql_news)
%>
		<div id="post">
        <h1><strong><%=rs_news("title")%></strong></h1>
          <table width="95%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" class="dottedBottom"><%=rs_news("content")%></td>
            </tr>
          </table>
          <table width="95%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" align="right"><a href="newslist.asp?sel=about">[返回]</a></td>
            </tr>
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
