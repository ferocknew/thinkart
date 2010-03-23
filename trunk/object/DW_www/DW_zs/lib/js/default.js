$(function(){
	//html方式获得系统信息
	var get_info_url="lib/dataoutput/inf_xmlout.asp";
	$.getJSON(get_info_url,{"code":"json"},loaddoc);
    $("#index_top_img").transition({
            duration : 3000,
            images : ['images/index_r6_c1.jpg', 'images/index_r6_c11.jpg', 'images/index_r6_c12.jpg'],
            type : 'fade'
         });
});