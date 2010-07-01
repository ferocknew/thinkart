<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" --> 
<!-- Html Body -->
<div id="innerFrame"><!--#include file="inc/inc-html-top.asp" -->
  <div id="innerBanner"></div>
  <!-- #innerBanner-->
  <div id="innerContent">
	<div id="leftSide">
	  <p><img src="files/images/img_hotline.jpg" /></p>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><img src="files/images/productTitle2.jpg" /></td>
        </tr>
      </table>
	  <div id="productList">
	    <ul>
	      <!--li class="onselProduct">S165 A/W/S215 A/W</li>
	      <li class="onselProductSub">S165 A/W/S215 A/W</li-->
	      <%
				if not proClassRs.length=0 then
				for i=0 to proClassRs.length-1
				%>
	      <li class="unselProduct" classid="<%=proClassRs.slice(i,i+1).[0].id%>"><%=proClassRs.slice(i,i+1).[0].class_name%></li>
	      <%
				next
				end if
				%>
        </ul>
	  </div>
	</div>
	<div id="rightSide">
    <div id="rightTitle">&nbsp;&nbsp; 关于畅可
      <div id="innerContent2"><strong>革新创造影响力。</strong><br />
        弗格森制冷是德国Külinda（柯琳徳）企业在中国的全资子公司，我们的总部位于德国法兰克福（Frankfurt）。1929年，公司创始人Jüergen   Hans发明了世界上第一台管状冰型食用制冰机，即管冰机(Tube Ice Machine)，从此，弗格森成为制冰机的代名词。<br />
        <br />
        作为全球领先的制冷设备制造商，弗格森（FOCUSUNTM）专业从事制冷技术的研发。我们的产品主要有块冰机、片冰机、管冰机、颗粒冰机、板冰机、冷水机、混凝土冷却系统、自动储冰送冰系统、动态冰蓄冷系统、各类冷库等。<br />
        <br />
        我们拥有丰富的制冰系统设计和制造经验。弗格森（FOCUSUNTM）以其精湛的工艺、优良的品质及良好的信誉独领当今世界。我们的目标是针对客户不同之需求，提供最佳的制冷系统解决方案。<br />
        <br />
        在弗格森（FOCUSUNTM），我们一直致力于人类制冷事业的提升并不断进行技术革新，矢志不渝。凭借过硬的产品质量、卓越的技术支持以及优质的客户服务，弗格森成为全球客户信赖的制冰机供应商。</div>
      <p>&nbsp;</p>
    </div>
	</div>
	
  </div>  <!-- #innerContent-->
  
</div>
<div id="copyRight">COPYRIGHT @ 2010 - DESIGN BY THINKART 2010 ALL RIGHT RESERVED</div>
<!--#include file="lib/foot.asp" -->
<script>
	$(function(){
		$("#bannerRight").transition({
			duration : 3000,
			images : ['files/images/index-banner_1.jpg', 'files/images/index-banner_2.jpg','files/images/index-banner_3.jpg'],
			type : 'fade'
		});
	});
</script>