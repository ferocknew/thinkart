<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<div id="logo"> </div>
<div id="container">
	<div id="navigation">
		<div id="naviLeft">
			<ul>
				<li> <a href="#" class="naviLeft">运动休闲</a> </li>
				<li> <a href="#" class="naviLeft">时尚休闲</a> </li>
				<li> <a href="#" class="naviLeft">时尚职业</a> </li>
			</ul>
			<div id="naviSelect">
				<select name="select" id="select">
					<option>按季节分类</option>
					<option>春季</option>
					<option>夏季</option>
					<option>秋季</option>
					<option>冬季</option>
				</select>
				<select name="select" id="select">
					<option>按功能分类</option>
					<option>外套</option>
					<option>上衣</option>
					<option>连衣裙</option>
				</select>
				<select name="select2" id="select2">
					<option>按年份分类</option>
					<option>2010年</option>
					<option>2009年</option>
					<option>2008年</option>
					<option>2007年</option>
					<option>2006年</option>
				</select>
			</div>
		</div>
	</div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/title_products.gif" />
		<hr/>
		<h1>时尚休闲系列</h1>
		<div class="products" style="background:url(files/images/img_01.jpg);" get_url="http://www.online.sh.cn">
			<div class="prductMouseOn" id="priceBlock" style="display:none;"> 高领印花外套
				<h2>￥599</h2>
			</div>
		</div>
		<div class="products" style="background:url(files/images/img_02.jpg);" get_url="http://www.google.com"> </div>
		<div class="products" style="background:url(files/images/img_03.jpg);" get_url="http://www.google.com"> </div>
		<div class="products" style="background:url(files/images/img_04.jpg);" get_url="http://www.google.com"> </div>
		<div class="products" style="background:url(files/images/img_05.jpg);" get_url="http://www.google.com"> </div>
		<div class="products" style="background:url(files/images/img_06.jpg);" get_url="http://www.google.com"> </div>
		<div class="products" style="background:url(files/images/img_08.jpg);" get_url="http://www.google.com"> </div>
		<div class="products" style="background:url(files/images/img_05.jpg);" get_url="http://www.google.com"> </div>
		<p>&nbsp; </p>
		<div class="contentEnd"> <a href="#"><img src="files/images/button_next.gif" border="0" align="right" /></a><a href="#"><img src="files/images/button_last.gif" border="0" align="right" /></a> </div>
	</div>
	<div id="footer">
		<div id="footerRight"><br />
			<a href="#" class="footer">会员登录</a> | <a href="#" class="footer">退出登录</a> | <a href="webmap.html" class="footer">网站地图</a> | <a href="caufil/index.html" target="_blank" class="footer">高菲丽</a> | <a href="jarfect/index.html" target="_blank" class="footer">菁妃</a> | <a href="#" class="footer">网站访问量统计</a></div>
	</div>
</div>
<!--#include file="lib/foot.asp" -->
<script>
    var _pro_list_show = "<div class=\"prductMouseOn\" id=\"priceBlock\">高领印花外套<h2>￥599</h2></div>"
    var _pro_list = $(".products");
    _pro_list.hover(function(e){
        $(this).html(_pro_list_show);
    }, function(e){
        $(this).html("");
    });
    _pro_list.click(function(e){
		 window.open($(this).attr("get_url"));
    });
</script>
