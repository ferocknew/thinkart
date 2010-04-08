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
    
    //产品列表  class2
    $.getJSON("lib/dataoutput/action_xmlout.asp", {
        code: "json",
        act: "show_class",
        classname: "class2",
        upclassid: 59
    }, function(json){
        var _html_temp = "";
        $(json.class_list).each(function(i){
            _html_temp += "<div class=\"naviLeft3\"><a href=\"#\" class=\"pad\">" + this.classname + ">></a></div>"
        });
        $("#menu-show-div").empty().html(_html_temp);
    });
	
    //产品列表 class3
    $.getJSON("lib/dataoutput/action_xmlout.asp", {
        code: "json",
        act: "show_class_all",
        classname: "class3"
    }, function(json){
		    
    });
});
