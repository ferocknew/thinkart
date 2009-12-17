$(function(){
	//网站基本信息
    $.getJSON("xmlout/inf_xmlout.asp",{"code":"json"}, loaddoc);

});
function loaddoc(json){document.title=json.info.site_name;}