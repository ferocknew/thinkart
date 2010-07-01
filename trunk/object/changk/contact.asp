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
	      <td><img src="files/images/productTitle2.jpg" width="220" height="50" /></td>
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
    <div id="rightTitle">&nbsp;&nbsp;
      联系我们
        <div id="innerContent2">
        <div class="contant-img"> <img src="files/images/map.jpg" /> </div>
        <div class="contant-text">
		    <p> <strong>上海畅可制冷设备有限公司</strong><br />
		      上海市城银路318号宝山工业园区2号楼<br />
		    </p>
		    <p> 电话：021-55337728<br />
		      传真：021-56139527<br />
		      Email: <a href="mailto:shaoyezhao300@sohu.com">shaoyezhao300@sohu.com</a><br />
		      Web: <a href="http://www.shsuntier.com">http://www.shsuntier.com</a> </p>
	      </div>
          </div>
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