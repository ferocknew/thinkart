//产品列表  class2
var _$menuShowDiv=$("#menu-show-div")
$("#menu-show-div").empty();
$.getJSON("lib/dataoutput/action_xmlout.asp", {
    code: "json",
    act: "show_class",
    classname: "class2",
    upclassid: 59
}, function(json){
    var _html_temp = "";
    $(json.class_list).each(function(i){
        _html_temp += "<div class=\"naviLeft3\" classid=\"" + this.id + "\"><a href=\"#\" class=\"pad\">" + this.classname + ">></a></div>";
    });
    _$menuShowDiv.html(_html_temp)
    show_class_3($("#menu-show-div"));
});

//产品列表 class3
function show_class_3(_$_html_temp){
    $.getJSON("lib/dataoutput/action_xmlout.asp", {
        code: "json",
        act: "show_class_all",
        classname: "class3"
    }, function(json){
        var _html_temp = "";
        $(json.class_list).each(function(i){
            _$_html_temp.find("div[classid='" + this.upclassid + "']").after("<div class=\"naviLeft2\" classid=\"" + this.id + "\"><a href=\"#\"><strong>" + this.classname + "</strong></a></div>");
        });
        show_news(_$_html_temp);
    });
}

//新闻列表
function show_news(_$_html_temp){
    $.getJSON("lib/dataoutput/show_list.asp", {
        act: "news_list",
        do_type: "all"
    }, function(json){
        $(json.news_list).each(function(i){
            _$_html_temp.find("div[class='naviLeft2']:contains('" + this.class3id + "')").after("<div class=\"naviLeft5\"><a href=\"?act=show_news&id="+this.id+"\">"+this.title+"</a></div>");
        });
		$(".naviLeft3:contains('企业融资')",_$menuShowDiv).children("a").attr("href","brand-1-1-3.asp?act=show_news&id=15");
    });
}