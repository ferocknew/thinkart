<!--#include file="const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="header_commad.asp" -->
<!--#include file="header_html.asp" -->
<script>
$(function($){
	$.getJSON("xmlout/inf_xmlout.asp",{"code":"json"}, show_info);
	$("#change_info").bind("click",function(e){
			var post_data="";
			post_data+="sitename="+$("#sitename").val()+"&";
			post_data+="comnam="+$("#comnam").val()+"&";
			post_data+="leader="+$("#leader").val()+"&";
			post_data+="siteicp="+$("#siteicp").val()+"&";
			post_data+="siteurl="+$("#siteurl").val();
			$.ajax({
				type:"POST",
				url:"xmlout/inf_xmlout.asp?code=json&act=edit",
				dataType: "json",
				data:post_data,
				success:show_info
			});
			return false;
			e.stopPropagation();
	});
	function show_info(json){
		$("#sitename").val(json.info.site_name);
		$("#comnam").val(json.info.com_name);
		$("#leader").val(json.info.site_leader);
		$("#siteicp").val(json.info.site_icp);
		$("#siteurl").val(json.info.site_url);
		loaddoc(json);
	}
});
</script>
<body>
网站名称：
<input type="text" id="sitename" />
<p />
公司名称：
<input type="text" id="comnam" />
<p />
负责人：
<input type="text" id="leader" />
<p />
ICP备案：
<input type="text" id="siteicp" />
<p />
网站地址：
<input type="text" id="siteurl" />
<p />
<button id="change_info">修改</button>
</body>
<!--#include file="foot.asp" -->