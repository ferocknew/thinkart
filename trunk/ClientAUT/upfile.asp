<!--#include file="lib/lib-const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/lib-Head.asp" -->
<!--#include file="lib/lib-Html.asp" -->
<style>
*{ margin:0px; padding:0px;}
</style><form method="post" target="update-file" action="lib/action/upload.asp" enctype="multipart/form-data">
添加图片<br/>
<input type="file" name="upfile" /><input type="submit" /></form>
<iframe name="update-file" style="display:none;" id="update-file" onload="funa()"></iframe>
<script>
var flagFirst=true;
function funa(){
	if(flagFirst){
		flagFirst=false;
		return ;
	}
	var dom=$("#update-file")[0];
	var doc;
	if($.browser.msie && $.browser.version<8){
		doc=dom.Document;
	}else{
		doc=dom.contentDocument;
	}
	var ret= eval("("+doc.body.innerHTML+")");
	parent.$("#input_upfiles").val(ret.msg);
	parent.$.fancybox.close();
	return ret;
}

</script>
<!--#include file="inc/inc-foot.asp" -->