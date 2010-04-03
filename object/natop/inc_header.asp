<script language="javascript">
	function hideSub(){
		var subMenus = new Array('about_sub','product_sub','service_sub');
		for(var i=0;i<subMenus.length;i++){
		document.getElementById(subMenus[i]).style.display = 'none';}
	}
	function showSub(subName){
		document.getElementById(subName).style.display = 'block';
	}
</script>
<%
info = request("sel")
%>

	<div id="header">
		<img alt="返回首页" src="files/images/logo.jpg">
		<ul>
			<li class="<%if info = "index" then%>nav-now<%end if%>" onmouseover="hideSub();"><a title="首页"  href="index.asp?sel=index"><strong>首页</strong></a></li>
			<li class="<%if info = "about" then%>nav-now<%end if%>" onmouseover="hideSub();showSub('about_sub');"><a title="关于纳普" href="about.asp?sel=about"><strong>关于纳普</strong></a></li>
			<li class="<%if info = "product" then%>nav-now<%end if%>" onmouseover="hideSub();showSub('product_sub');"><a title="我们的产品" href="products.asp?sel=product"><strong>产品</strong></a></li>
			<li class="<%if info = "service" then%>nav-now<%end if%>" onmouseover="hideSub();showSub('service_sub');"><a title="我们的服务" href="service.asp?sel=service"><strong>服务</strong></a></li>
			<li class="<%if info = "database" then%>nav-now<%end if%>" onmouseover="hideSub();"><a title="资料库" href="database.asp?sel=database"><strong>资料库</strong></a></li>
			<li class="<%if info = "contact" then%>nav-now<%end if%>" id="nav-contact" onmouseover="hideSub();"><a title="联系我们" href="contact.asp?sel=contact"><strong>联系我们</strong></a></li>
		</ul>
        <div id="about_sub" style="float:right; height:25px; width:600px; display:none;">
          <table width="300" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="about.asp?showid=1&sel=about">公司简介</a></td>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="about.asp?showid=2&sel=about">纳普文化</a></td>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="about.asp?showid=3&sel=about">我们的客户</a></td>
              <td align="center"><a href="newsList.asp?sel=about">新闻中心</a></td>
            </tr>
          </table>
        </div>



        <div id="product_sub" style="float:right; height:25px; width:490px; display:none;">
		<table width="290" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="products.asp?showid=1&sel=product">产品总揽</a></td>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="products.asp?showid=2&sel=product">Senseyhome</a></td>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="products.asp?showid=3&sel=product">TTK</a></td>
              <td align="center"><a href="products.asp?showid=4&sel=product">VESDA</a></td>
            </tr>
          </table>
        </div>



        <div id="service_sub" style="float:right; height:25px; width:440px; display:none;">
          <table width="400" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="service.asp?showid=1&sel=service">服务总揽</a></td>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="service.asp?showid=2&sel=service">咨询</a></td>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="service.asp?showid=3&sel=service">建设</a></td>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="service.asp?showid=4&sel=service">EFIST</a></td>
              <td align="center" style="border-right:1px dotted #cccccc;"><a href="service.asp?showid=5&sel=service">LEED认证</a></td>
              <td align="center"><a href="service.asp?showid=6&sel=service">维护</a></td>
            </tr>
          </table>
        </div>
        
	</div>