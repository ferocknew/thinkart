$(function(){
    //html方式获得系统信息
    var get_info_url = "lib/dataoutput/inf_xmlout.asp";
    $.getJSON(get_info_url, {
        "code": "json"
    }, loaddoc);
    
    //index menu css效果
    var get_url_file = get_url_show("end_file");
    $("#index-top-menu a").each(function(i){
        if ($(this).attr("href") == get_url_file) {
            $(this).parent().addClass("nav-now");
        }
    });
	
	var get_url_files=get_url_show("end_file")
	switch(get_url_file){
		case "brand-1-1-3.asp":
		$.getScript("lib/js/ajax-html-class.js")
		break;
	}
});
