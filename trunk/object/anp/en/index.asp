<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<div id="content">
	<div id="header">
		<div id="logo"> </div>
		<!-- #logo-->
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
						<div class="news-title"><span>JJTOOLS&nbsp;<strong> </strong></span><strong><span id="result_box2"><span title="中国区总代理" closure_uid_bwqh39="89">China agent</span></span></strong></div>
						<div class="news-body"><span id="result_box5"><span title="赢得了众多国内外著名企业的信任,欢迎选购各种合金铣刀产品." closure_uid_bwqh39="93">Won the trust of   many famous enterprises at home.</span></span></div>
					</li>
					<li>
						<div class="news-image"><img src="files/images/news2-2.jpg" /></div>
						<div class="news-title"><span>Metric</span><span id="result_box3"><span title="中国区总代理" closure_uid_bwqh39="89">&nbsp; <strong>China agent</strong></span></span></div>
						<div class="news-body"><span id="result_box6"><span title="作为专业合金铣刀厂家,以良好的信誉和卓有成效的业绩" closure_uid_bwqh39="95">As a professional alloy   milling factory, with a good reputation and performance</span></span>.</div>
					</li>
					<li>
						<div class="news-image"><img src="files/images/news2-3.jpg" /></div>
						<div class="news-title"><span>Z-Star</span><span id="result_box4"><span title="专业代理" closure_uid_bwqh39="91">&nbsp;&nbsp; <strong>Professional Agents</strong></span></span></div>
						<div class="news-body"><span id="result_box7"><span title="合金铣刀主要产品.我厂作为专业合金铣刀厂家,以良好的信誉和卓有成效的业绩" closure_uid_bwqh39="97">The main   products alloy cutters. I plant as a professional alloy milling factory.</span></span></div>
					</li>
					<li>
						<div class="news-image"><img src="files/images/news2-3.jpg" /></div>
						<div class="news-title"><span>SMT&nbsp;<strong> </strong></span><strong><span id="result_box8"><span title="全国总代理" closure_uid_bwqh39="99">National distributor</span></span></strong></div>
						<div class="news-body"><span id="result_box9"><span title="专业刀具，专业服务" closure_uid_bwqh39="107">Professional tools, professional   services</span></span></div>
					</li>
				</ul>
			</div>
			<!-- #news2-->
			<div id="news3" onClick="document.location='products.asp';" style="cursor:pointer;"> <img src="files/images/news3.jpg">
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
				<div id="text"> -----------<span id="result_box"><span title="定制产品" closure_uid_bwqh39="87">Custom Products</span></span> ------------ </div>
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