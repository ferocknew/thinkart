<div id="footer">
    <div id="footerRight"  style="position:relative;"><br />
				<div class="reg" id="indexLoginDiv" style=" display:none;">
					<div class="regIcon"> 会员名
						<input type="text" name="username" id="username" />
						密&nbsp; 码
						<input type="password" name="password" id="password" />
						<br />
						<a href="register.asp">注册</a> |  <a href="#" id="userloging-a">登录</a> </div>
				</div>
      <a href="#" class="footer"  id="indexLoginClickA">会员登录</a> | <a href="<%=userloginout%>" class="footer">退出登录</a> | <a href="caufil/index.html" target="_blank" class="footer">高菲丽</a> | <a href="jarfect/index.html" target="_blank" class="footer">菁妃</a> | <a href="http://www.google.com/intl/zh-CN/analytics/" class="footer">网站访问量统计</a></div>
</div>
<script>
$(function(){
	$("#indexLoginClickA").toggle(
	function(e){$("#indexLoginDiv").fadeIn("normal")},
	function(e){$("#indexLoginDiv").fadeOut("normal")}
	)
})
</script>