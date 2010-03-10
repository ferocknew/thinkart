$(function(){
	//html方式获得系统信息
	var get_info_url="lib/dataoutput/inf_xmlout.asp";
	$.getJSON(get_info_url,{"code":"json"},loaddoc);
	$("#inner_bg_div").transition({
            duration : 3000,
            images : ['images/inner_bg.jpg', 'images/inner_bg1.jpg', 'images/inner_bg2.jpg'],
            type : 'fade'
         });
});