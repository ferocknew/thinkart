$(function(){
	//html方式获得系统信息
	var get_info_url="lib/dataoutput/inf_xmlout.asp";
	$.getJSON(get_info_url,{"code":"json"},loaddoc);

});