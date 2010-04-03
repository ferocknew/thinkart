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
	<title>纳普国际-联系我们</title>
</head>

<body>
	<div id="content">
    <!--#include file="inc_header.asp"-->
	<!-- #header-->

	<div id="banner" style="height:243px; width:960px;">
	</div><!-- #banner-->

	<div id="main">
		<div class="sidebar">
			<img src="files/images/contact-sidebar.jpg">
		</div><!-- #sidebar-->

		<div id="post">
			<h1><strong>联系我们</strong></h1>
			<div id="contact-left">
				<img src="files/images/map.jpg">
				<p>
				<dl>
				<dt>&nbsp;</dt>
				<dd>&nbsp;</dd>
			  </dl>
		        <dl><dd>&nbsp;</dd>
		      </dl>
	      </div><!-- #contact-left-->
			<div id="contact-right">
			  <table width="280" class="tab" border="0" cellspacing="2" cellpadding="0">
                <tr>
                  <td><strong>中国上海 陆家嘴金融贸易区商城路738号</strong></td>
                </tr>
                <tr>
                  <td>胜康廖氏大厦2203室</td>
                </tr>
                <tr>
                  <td>电话：+86 21 51695889</td>
                </tr>
                <tr>
                  <td>传真：+86 21 51695889</td>
                </tr>
              </table>
			  <hr>
			  <table width="280" border="0" cellpadding="0" cellspacing="2" class="tab">
                <tr>
                  <td width="370"><strong>中国北京朝阳区朝外大街甲6号</strong></td>
                </tr>
                <tr>
                  <td>万通中心A座4A</td>
                </tr>
                <tr>
                  <td>电话：+86 10 51260619</td>
                </tr>
                <tr>
                  <td>传真：+86 10 51413209</td>
                </tr>
              </table>
			  <hr>
			  <table width="280" border="0" cellpadding="0" cellspacing="2" class="tab">
                <tr>
                  <td width="370"><strong>中国 香港皇后大道東183號</strong></td>
                </tr>
                <tr>
                  <td>合和中心27樓</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>网址：www.natop.com.cn</td>
                </tr>
                <tr>
                  <td>邮箱：info@natop.com.cn</td>
                </tr>
              </table>
			  <p>&nbsp;</p>
			</div>
			<!-- #contact-right-->
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
