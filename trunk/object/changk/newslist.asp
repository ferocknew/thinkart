<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<div id="innerFrame">
   	<div id="topBar">ABOUT &nbsp;|&nbsp; ENGLISH&nbsp; &nbsp;</div>
    <!-- #topBar-->
        <div id="logoArea">
        	<div id="searchArea">
        	  <table width="250" border="0" cellspacing="0" cellpadding="0">
        	    <tr>
        	      <td width="210"><input name="textarea" type="text" class="searchInput" id="textarea" value="" size="20" /></td>
        	      <td><img src="files/images/button_search.jpg" width="25" height="25" /></td>
      	      </tr>
      	    </table>
       	  </div>
        </div>
        <!-- #logoArea-->
      <div id="navBar">
        <table width="914" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="127" class="" onmouseover="this.className = 'navBar_home';" onmouseout="this.className = '';">&nbsp;</td>
            <td width="135" class="" onmouseover="this.className = 'navBar_about';" onmouseout="this.className = '';">&nbsp;</td>
            <td width="135" class="" onmouseover="this.className = 'navBar_news';" onmouseout="this.className = '';">&nbsp;</td>
            <td width="135" class="" onmouseover="this.className = 'navBar_product';" onmouseout="this.className = '';">&nbsp;</td>
            <td width="135" class="" onmouseover="this.className = 'navBar_knowLeg';" onmouseout="this.className = '';">&nbsp;</td>
            <td width="135" class="" onmouseover="this.className = 'navBar_service';" onmouseout="this.className = '';">&nbsp;</td>
            <td width="112" height="54" class="" onmouseover="this.className = 'navBar_contact';" onmouseout="this.className = '';">&nbsp;</td>
          </tr>
        </table>
      </div>
  <div id="innerBanner"></div>
  <!-- #innerBanner-->
  <div id="innerContent">
	<div id="leftSide">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><img src="files/images/productTitle.jpg" width="220" height="50" /></td>
        </tr>
      </table>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td height="35" class="unselProduct">S165 A/W/S215 A/W</td>
        </tr>
	    <tr>
	      <td height="35" class="onselProduct">S165 A/W/S215 A/W</td>
        </tr>
	    <tr>
	      <td height="35" class="unselProduct">S165 A/W/S215 A/W</td>
        </tr>
	    <tr>
	      <td height="35" class="unselProduct">S165 A/W/S215 A/W</td>
        </tr>
	    <tr>
	      <td height="35" class="unselProduct">S165 A/W/S215 A/W</td>
        </tr>
      </table>
    </div>
	<div id="rightSide">
    <div id="rightTitle">&nbsp;&nbsp; 新闻中心</div>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">1.北京长流科学仪器公司成功中标《北京正负电子对撞机重大改造工程》 </td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">2.北京长流科学仪器公司成功中标《北京正负电子对撞机重大改造工程》 </td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">3.北京长流科学仪器公司成功中标《北京正负电子对撞机重大改造工程》 </td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">&nbsp;</td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">&nbsp;</td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">&nbsp;</td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">&nbsp;</td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">&nbsp;</td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">&nbsp;</td>
        </tr>
	    <tr>
	      <td width="50" height="30">&nbsp;</td>
	      <td class="newsLine">&nbsp;</td>
        </tr>
      </table>
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