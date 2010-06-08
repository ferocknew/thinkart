<!--#include file="lib/lib-const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/lib-Head.asp" -->
<!--#include file="lib/lib-Html.asp" -->
<div class="body-input">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="right" valign="bottom"><input type="text" id="username" name="username"/></td>
		<td width="109" height="164" valign="bottom"><a href="#" id="goinner"><img src="files/images/go.gif" border="0"/></a></td>
	</tr>
</table>
</div>
<div class="fixed" id="fixed">
POWER BY THINKART
</div>
<!--#include file="inc/inc-foot.asp" -->
<script type="text/javascript">
$("#goinner").click(function(){
	if ($.trim($("#username").val()) !== "") {
		window.location.href = "inner.asp?username=" + $("#username").val();
	}else{
		alert("请填入用户ID");
		return false;
	}
})	
</script>
