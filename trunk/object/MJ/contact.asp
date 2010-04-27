<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<div id="logo"></div>
<div id="container">
	<div id="navigation"></div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<form method="post" action="lib/dataoutput/webservice.asp?act=savemsg" name="savemsg">
		<div id="content"> <img src="files/images/title_contact.gif" />
			<hr />
			<div id="contactMessage"> 写下您的意见，我们将在一周给给您回复：
				<p>您的姓名（必填）
					<input type="text" name="inputname" id="inputname" />
					电话/传真
					<input type="text" name="telnum" id="telnum" />
					邮箱（必填）
					<input type="text" name="email" id="email" />
					公司
					<input type="text" name="company" id="company" />
					意见（必填）
					<textarea name="message" rows="5" id="message"></textarea>
				</p>
				<p><a href="javascript:void(0);" id="savemsgSubmit"><img src="files/images/button_contact.gif" border="0" /></a></p>
			</div>
			<div id="contactADD"> <img src="files/images/img_map.gif" width="300" height="200" />
				<h1>联系地址</h1>
				<p>上海市虹口区汶水东路918号<br />
					电话：+86 021 65926606<br />
					公司传真：+86 020 65926605<br />
					邮箱：<span class="font12">shmjfsyxgs@163.com</span></p>
				<h3>招聘热线</h3>
				<p><strong>徐经理 13801768081 柏经理 13501875557</strong><br />
					公司欢迎服装人才加入本公司于公司共同发展，提供创造自我价值的平台。我们需要技术、管理、销售类人才及缝纫熟练工的加入，公司会给你提供事业发展的平台及良好的福利待遇，让你安心的学习、工作、生活。</p>
			</div>
			<p><br />
			</p>
		</div>
	</form>
	<!--#include file="files/inc/inner-foot-a.asp" -->
</div>
<script>
$("#savemsgSubmit")[0].onclick=function(){
	if($.trim($("#inputname").val())==""||$.trim($("#email").val())==""||$.trim($("#message").val())==""){
		alert("请先写相关必填内容！");
		return false;
	}else{
		$("form").submit();
	}
}
</script>
<!--#include file="lib/foot.asp" -->
