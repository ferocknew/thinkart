<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<div id="content">
	<div id="header">
		<div id="logo"> </div>
		<!-- #logo-->
		<div id="language"> English </div>
		<!-- #language-->
		<!--#include file="files/inc/top_menu.asp" -->
	</div>
	<!-- #header-->
	<div id="main">
		<div id="exhibition" style="position:relative;"><div id="index-img-show" style="position:absolute; right:0;bottom:0; width:178px; height:98px; background-color:#999;"></div></div>
		<!-- #exhibition-->
		<div id="nav2">			
		</div>
		<!-- #nav2-->
		<div id="news">
			<div id="news1">
				<ul>
					<li>
						<div class="news-title">汉江工具研制出超大规格指形铣刀</div>
						<div class="news-body">指形齿轮铣刀广泛应用于大模数的直齿、斜齿轮和人字齿轮的齿形加工。</div>
					</li>
					<li>
						<div class="news-title">日立工具推出多功能立铣刀</div>
						<div class="news-body">日立工具推出一种带端面刃（End Tooth）的多功能立铣刀“α快削纵横AHJ形”</div>
					</li>
					<li>
						<div class="news-title">新型TiAlN涂层铣刀的高速切削性能</div>
						<div class="news-body">表面涂层技术的发展与应用对刀具性能的改善和切削加工技术的进步起到了十分关键的作用。</div>
					</li>
				</ul>
			</div>
			<!-- #news1-->
			<div id="news2">
				<ul>
					<li>
						<div class="news-image"><img src="files/images/news2-1.jpg" /></div>
						<div class="news-title"><span>JJTOOLS</span> 中国区总代理</div>
						<div class="news-body">赢得了众多国内外著名企业的信任,欢迎选购各种合金铣刀产品.</div>
					</li>
					<li>
						<div class="news-image"><img src="files/images/news2-2.jpg" /></div>
						<div class="news-title"><span>Metric</span> 中国区总代理</div>
						<div class="news-body">作为专业合金铣刀厂家,以良好的信誉和卓有成效的业绩</div>
					</li>
					<li>
						<div class="news-image"><img src="files/images/news2-3.jpg" /></div>
						<div class="news-title"><span>Z-Star</span> 专业代理</div>
						<div class="news-body">合金铣刀主要产品.我厂作为专业合金铣刀厂家,以良好的信誉和卓有成效的业绩</div>
					</li>
					<li>
						<div class="news-image"><img src="files/images/news2-3.jpg" /></div>
						<div class="news-title"><span>SMT</span> 全国总代理</div>
						<div class="news-body">上海麦讯机床工具，长期从事精密机械制造。擅长高精度航天航空零部件。</div>
					</li>
				</ul>
			</div>
			<!-- #news2-->
			<div id="news3"> <img src="files/images/news3.jpg">
				<ul>
					<li><span>2TBE</span>-高速加工深槽时发挥极大能力力</li>
					<li><span>4CRE</span>-实现卓越的切削能力</li>
					<li><span>4SUC</span>-实现卓越的切削能</li>
				</ul>
				<div id="input"><form method="post" action="products-2.asp?act=sch" name="Search-pro">
					<input name="lastname" type="text" class="searchinput" size="25" maxlength="25" value=""   />
					<input name="btnG" type="submit" class="searchgo" id="goButton" value="Go!" /></form>
				</div>
				<!-- #input-->
				<div id="text"> ----------- 定制产品 ------------ </div>
				<!-- #text-->
			</div>
			<!-- #news3-->
		</div>
		<!-- #news-->
	</div>
	<!-- #main-->
	<div id="footer"> Copyright©2010 antop(Shanghai)  All RightsReserved. </div>
	<!-- #footer-->
</div>
<!-- #content-->
<!--#include file="lib/foot.asp" -->
<script>
    $("#index-img-show").transition({
            duration : 3000,
            images : ['files/images/1.jpg', 'files/images/2.jpg', 'files/images/3.jpg'],
            type : 'fade'
         });
</script>