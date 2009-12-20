$(function(){
	//网站基本信息
    $.getJSON(file_url,{"code":"json"}, loaddoc);

});
function loaddoc(json){document.title=json.info.site_name;}