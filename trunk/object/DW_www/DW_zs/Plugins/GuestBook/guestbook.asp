<!--#include file="../../lib/plugins/plugins.asp" -->
<!--内容-->
<style>
.need-do{ color:red;}
</style>
<script language="javascript" type="text/javascript">
$(function(){
    $("#not_submit").click(function(){
        var post_data={"_name":$("#_name").val(),"_tel-num":$("#_tel-num").val(),"_mail-adr":$("#_mail-adr").val(),"_const":$("#_const").val()};
        $.ajax({
            type: "POST",
            url: "Plugins/GuestBook/bookaction.asp",
            data:post_data,
            success: function(msg){
                alert( "留言情况: " + msg );
				$("input[type='text']").val("");
                $("#_const").val("");
            }
        });
    });
})
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="100" height="30" align="right">留言人：</td>
		<td height="30">
<input name="_name" type="text" id="_name" maxlength="20" />
<span class="need-do">(*)</span></td>
	</tr>
	<tr>
		<td width="100" height="30" align="right">联系电话：</td>
		<td height="30"><input name="_tel-num" type="text" id="_tel-num" maxlength="20" /><span class="need-do">(*)</span></td>
	</tr>
	<tr>
		<td width="100" height="30" align="right">邮件地址：</td>
		<td height="30"><input name="_mail-adr" type="text" id="_mail-adr" maxlength="100" /><span class="need-do">(*)</span></td>
	</tr>
	<tr>
		<td width="100" height="30" align="right">内容：</td>
		<td height="30"><textarea name="_const" cols="30" rows="4" id="_const"></textarea></td>
	</tr>
	<tr>
		<td width="100" height="30">&nbsp;</td>
		<td height="30"><input type="submit" name="button" id="not_submit" value="递交留言" /></td>
	</tr>
</table>