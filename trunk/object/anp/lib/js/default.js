$(function(){
	//html方式获得系统信息
	var get_info_url="lib/dataoutput/inf_xmlout.asp";
	$.getJSON(get_info_url,{"code":"json"},loaddoc);
	
	//top_menu.asp 操作
	var _top_menu$=$("#nav"),get_file_url = get_url_show("end_file");
	if(_top_menu$.length){
		var temp_text=$("li[get_url='"+get_file_url+"']>a",_top_menu$).text();
		$("li[get_url='"+get_file_url+"']",_top_menu$).html(temp_text);
	}
});