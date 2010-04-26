$(function(){
    //html方式获得系统信息
    var get_info_url = "lib/dataoutput/inf_xmlout.asp";
    $.getJSON(get_info_url, {
        "code": "json"
    }, loaddoc);

    //index menu css效果
    var get_url_file = get_url_show("end_file");
    if(get_url_file=="case-1.asp")
        get_url_file="case.asp";
    $("#index-top-menu a").each(function(i){
        if ($(this).attr("href") == get_url_file) {
            $(this).parent().addClass("nav-now");
        }
    });

    switch (get_url_file) {
        case "brand-1-1-3.asp":
            $.getScript("lib/js/ajax-html-class.js")
            break;
        case "about.asp":
            $.getScript("lib/js/ajax-html-class.js")
            break;
        case "case.asp":
            $.getScript("lib/js/ajax-html-class.js")
            break;
        case "industry-3.asp":
            $.getScript("lib/js/ajax-html-class.js")
            break;
        case "knowledge-2.asp":
            $.getScript("lib/js/ajax-html-class.js")
			//$.getScript("lib/js/ajax-html-knowledge.js")
            break;
        case "contact.asp":
            $.getScript("lib/js/ajax-html-class.js")
            break;
        case "case-1.asp":
            $.getScript("lib/js/ajax-html-class.js")
            break;
        default:
            break;
    }
});
document.oncontextmenu=function(e){return false;}