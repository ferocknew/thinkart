<!--#include file="../lib/const.asp" -->
<!--#include file="conn_admin.asp" -->
<!--#include file="../lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<style>
*{ margin:0px; padding:0px;}
</style><form method="post" target="update-file" action="lib/upload.asp" enctype="multipart/form-data">
添加置顶图片<br/>
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
	parent.imgShowTop.val(ret.msg);
	parent.$.fancybox.close();
	return ret;
}

</script>
<!--#include file="../lib/foot.asp" -->