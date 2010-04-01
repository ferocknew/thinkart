<!--#include file="conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"　"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="files/css/style.css">
	<title>纳普国际-首页</title>
	<script src="files/js/jquery.min.js"></script>
    <script src="files/js/jquery.transitions.js"></script>
	<script>
		$(function(){
            $("#banner").transition({
                duration : 4000,
                images : ['files/images/index-banner_3.jpg', 'files/images/index-banner_4.jpg','files/images/index-banner_5.jpg'],
                type : 'fade'
            });
		});
	</script>
</head>
<%
sql = "select top 5 * from news where class1id = 57 order by id desc"
set rs = conn.execute(sql)
%>
<body>
	<div id="content">
    <!--#include file="inc_header.asp"-->
	<!-- #header-->

	<div id="banner" style="height:493px; width:960px;">

	</div><!-- #banner--><!--img alt="价值源于专业" src="files/images/index-banner.jpg" id="banner-img"-->

	<div id="main">
		<div id="index-left">
			<h1><strong>新闻中心</strong></h1>
			<ul>
            	<%while not rs.eof%>
				<li><a href="#"><strong>+ <%=rs("title")%></strong></a></li>
                <br>
                <a title="更多新闻" href="#" style="float:right; font-weight:bold;">+More></a>
			<br>
<!--			<dl>
				<dt>SENSAPHONE  <span><strong> 中国区总代理</strong></span></dt>
 				<dd id="dd-line">美国Phonetics公司是环境监控领域的著
名国际厂商，有着卓越的产品。</dd>
				<dt>TTK  <span><strong> 中国区总代理</strong></span></dt>
 				<dd>法国TTK公司是全球液体泄露体侧领域内
顶级的厂商，提供卓越品质的产品。</dd>
 			</dl>
			-->
		</ul>
		</div>
		<!-- #index-left-->

		<div id="index-center">
			<h1><strong>公司愿景</strong></h1>
			<p>
			<strong>纳普国际</strong> 是一家专注于为客户提供专业级水平数据中心(Data Centre)建设项目及IT信息技术基础设施整体解决方案的高科技企业从规划设计、方案提供、技术研发、设备供应、项目管理、施工、调试、用户培训、用户培训、维护保养7×24×365紧急现场服务，纳普科技均能提供一站式解决方案。</p>
		</div><!-- #index-center-->

		<div id="index-right">
			<h1><strong>联系我们</strong></h1>
			<img src="files/images/index-right.jpg">
			<p>上海 陆家嘴金融贸易区<br />
			商城路738号 胜康廖氏大厦2203室<br />
			电话：+86 51695889</p>
		</div><!-- #index-right-->
	</div><!-- #main-->

<!--	<div id="footer-button">
		<a href="contact.html"><button type="button">咨询意见</button></a>
	</div>
	-->
    <!--#include file="inc_footer.asp"-->
	<!-- #footer-->
	</div><!-- #content-->
</body>
</html>
