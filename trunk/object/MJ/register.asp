<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<div id="logo"></div>
<div id="container">
	<div id="navigation"></div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/title_reg.gif" />
		<hr />
		<p class="fontYellow">注意：菁夫人需要注册码才可以注册! </p>
		<div class="regStep"><a href="#" class="regStep">1.下载填写代理申请表</a> > <a href="#" class="regStep">发送至菁夫人邮箱</a> > 等待审核通过 > 获得注册码</div>
		<p class="fontYellow">我们将在10个工作日内给您回复，如果您已经有注册码,请进行下面步骤：</p>
		<div id="regMessage"> 注册码<br />
			<input type="text" name="code" id="code" />
			<img src="files/images/icon_pass.gif" /> <br />
			邮箱<br />
			<input type="text" name="email" id="email" />
			!邮箱格式不正确<br />
			会员名<br />
			<input type="text" name="name" id="name" />
			!会员名被占用<br />
			密码（6-12位） <br />
			<input type="text" name="pass" id="pass" />
			!请输入密码<br />
			确认密码 <br />
			<input type="text" name="repass" id="repass" />
			!两次输入不一致 </div>
		<div id="regMessage2">经营者<br />
			<input type="text" name="repass2" id="repass2" />
			联系电话<br />
			<input type="text" name="repass3" id="repass3" />
			所在城市<br />
			<input type="text" name="repass4" id="repass4" />
			商铺地址<br />
			<input type="text" name="repass5" id="repass5" />
			营业面积<br />
			<input type="text" name="repass6" id="repass6" />
		</div>
		</p>
		<div style="width:100%; float:left;">
			<p>如遇问题请致电<span class="font12"><strong> 021-87654321</strong></span> 与客服联络 </p>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center"><a href="#"><img src="files/images/button_reg.gif" border="0" /></a></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="footer">
		<div id="footerRight"><br />
			<a href="#" class="footer">会员登录</a> | <a href="#" class="footer">退出登录</a> | <a href="caufil/index.html" target="_blank" class="footer">高菲丽</a> | <a href="jarfect/index.html" target="_blank" class="footer">菁妃</a> | <a href="#" class="footer">网站访问量统计</a></div>
	</div>
</div>
<!--#include file="lib/foot.asp" -->