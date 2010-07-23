<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<div id="container">
  <div id="banner">
    <div id="bannerLeft"></div>
    <div id="bannerRight">
      <div id="homeHot">
        <div class="homeRightTitle" style="position:relative;"> 新款春装发布
          <div class="homeReg" id="indexLoginDiv" style="display:none;">
            <div class="regIcon"> 会员名
              <input type="text" name="username" id="username" />
              密&nbsp; 码
              <input type="password" name="password" id="password" />
              <br />
              <a href="register.asp">注册</a> | <a href="#" id="userloging-a">登录</a> </div>
            </div>
          <a href="#" id="indexLoginClickA"><img src="files/images/button_login.gif" border="0" align="right" /></a></div>
        <a href="products.asp"><img src="files/images/img_07.jpg" border="0" /></a> </div>
      <table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="bottom"><a href="caufil/index.html" target="_blank"><img src="files/images/logo_2.gif" border="0" /></a></td>
          <td align="center" valign="bottom"><a href="jarfect/index.html" target="_blank"><img src="files/images/logo_3.gif" border="0" /></a></td>
          </tr>
        </table>
      </div>
  </div>
  <div id="homeMenu">
    <ul>
      <li><a href="index.asp"><img src="files/images/menu_home2.gif" border="0" /></a></li>
      <li><a href="about.asp"><img src="files/images/menu_about1.gif" border="0" /></a></li>
      <li><a href="products.asp"><img src="files/images/menu_products1.gif" border="0" /></a></li>
      <li><a href="news.asp"><img src="files/images/menu_news1.gif" border="0" /></a></li>
      <%If Not Easp.GetCookie(CookieName&":index_userid")="" Then%><li><a href="member.asp"><img src="files/images/menu_member1.gif" border="0" /></a></li><%End If%>
      <li><a href="join.asp"><img src="files/images/menu_join1.gif" border="0" /></a></li>
      <li><a href="contact.asp"><img src="files/images/menu_contact1.gif" border="0" /></a></li>
      </ul>
  </div>
</div>
<div id="footerHome">
  <div id="footerRight"><br />
		<a href="#" class="footer">会员登录</a> | <a href="<%=userloginout%>" class="footer">退出登录</a> | <a href="caufil/index.html" target="_blank" class="footer">高菲丽</a> | <a href="jarfect/index.html" target="_blank" class="footer">菁妃</a> | <a href="http://www.google.com/intl/zh-CN/analytics/" target="_blank" class="footer">网站访问量统计</a></div>
</div>
<!--#include file="lib/foot.asp" -->
<script>
$("#indexLoginClickA").toggle(
	function(e){
		e.preventDefault();
		$("#indexLoginDiv").fadeIn("slow");
	},function(e){
		e.preventDefault();
		$("#indexLoginDiv").fadeOut("slow");
	}
);
</script>