<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<div id="logo"></div>
<div id="container">
<div id="navigation">
  <div id="naviLeft">
    <ul>
      <li><a href="about.asp" class="naviLeft">关于菁夫人</a></li>
      <li><a href="team.asp" class="naviLeft">设计团队</a></li>
      <li><a href="brand.asp" class="naviLeft">附属品牌介绍</a></li>
    </ul>
  </div>
</div>
<!--#include file="files/inc/inner-menu.asp" -->
  <div id="content">
    <img src="files/images/title_team.gif" />
   <hr />
   <img src="files/images/img_team.jpg" />
   <div class="teamContent">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
    <td width="18%" rowspan="7" align="left" valign="top"><img src="files/images/img_team2.jpg" /></td>
    <td width="82%" class="teamStyle1">정세희(1969.11.13) 鄭世喜　CHUNG SE HEE　　　　  　　　　  　　设计总监</td>
  </tr>
  <tr>
    <td>1995年 "MADMIX"公司担任 设计师</td>
  </tr>
  <tr>
    <td class="teamStyle2">1997年  "miwha HONG"公司担任 设计师</td>
  </tr>
  <tr>
    <td>2000年  创立"HURO"女性时尚服饰品牌</td>
  </tr>
  <tr>
    <td class="teamStyle2">2002年  " Thru Park Eu-Kyung" 公司担任设计组长</td>
  </tr>
  <tr>
    <td>2005年 "JACKLIN" 公司担任 设计总监</td>
  </tr>
  <tr>
    <td class="teamStyle2">2006年 菁夫人担任设计总监</td>
  </tr>
</table>

   </div>
   <div class="teamContent">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td width="18%" rowspan="5" align="left" valign="top"><img src="files/images/img_team1.jpg" /></td>
         <td width="82%" class="teamStyle1">이미정(1977.11.22) 李美贞 LEE MI JUNG  　　  　  　  　  　　　　 　　设计师</td>
       </tr>
       <tr>
         <td>2000年 韩国 &quot;AENOC&quot; 设计师</td>
       </tr>
       <tr>
         <td class="teamStyle2">2002年 日本 &quot;INTERMODE&quot; 公司担任设计师</td>
       </tr>
       <tr>
         <td>2004年 &quot;MIR&quot; 公司担任设计师</td>
       </tr>
       <tr>
         <td class="teamStyle2">2006年 菁夫人担任 设计师</td>
       </tr>
     </table>
   </div>
   <div class="teamContent">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td width="18%" rowspan="5" align="left" valign="top"><img src="files/images/img_team3.jpg" /></td>
         <td width="82%" class="teamStyle1">서정선(1971.07.30) 徐庭仙 　　　　  　  　  　  　  　  　  　  　　设计部 M/D</td>
       </tr>
       <tr>
         <td>1997年 "KIRRA" 公司担任设计师</td>
       </tr>
       <tr>
         <td class="teamStyle2">1999年 创立 "COZZY"  品牌</td>
       </tr>
       <tr>
         <td>2006年 菁夫人 设计部 M/D</td>
       </tr>
       <tr>
         <td class="teamStyle2">&nbsp;</td>
       </tr>
     </table>
   </div>
  </div>
  <div id="footer">
    <div id="footerRight"  style="position:relative;"><br />
				<div class="reg" id="indexLoginDiv" style="display:none;">
					<div class="regIcon"> 会员名
						<input type="text" name="textfield" id="textfield" />
						密&nbsp; 码
						<input type="password" name="textfield2" id="textfield2" />
						<br />
						<a href="register.asp">注册</a> | <a href="#">忘记密码</a> | <a href="#">登录</a> </div>
				</div>
      <a href="#" class="footer"  id="indexLoginClickA">
      会员登录</a> | <a href="#" class="footer">退出登录</a> | <a href="caufil/index.html" target="_blank" class="footer">高菲丽</a> | <a href="jarfect/index.html" target="_blank" class="footer">菁妃</a> | <a href="#" class="footer">网站访问量统计</a></div>
  </div>
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