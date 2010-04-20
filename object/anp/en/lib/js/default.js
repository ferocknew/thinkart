$(function(){
    //html方式获得系统信息
    var get_info_url = "lib/dataoutput/inf_xmlout.asp";
    $.getJSON(get_info_url, {
        "code": "json"
    }, loaddoc);

    //top_menu 操作
    var _top_menu$ = $("#nav"), get_file_url = get_url_show("end_file");
    if (get_file_url == "")
        get_file_url = "index.asp";
    if(get_file_url=="products-2.asp")
        get_file_url="products.asp";
    if(get_file_url=="services.asp")
        get_file_url="culture.asp";
    if (_top_menu$.length) {
        var temp_text = $("li[get_url='" + get_file_url + "']>a", _top_menu$).text();
        $("li[get_url='" + get_file_url + "']", _top_menu$).html(temp_text);
    }


    switch (get_file_url) {
        //news.asp
        case "news.asp":
            var _news_text$ = $("#news-text");
            $("ul", _news_text$).empty();
            $("a", _news_text$).live("click", function(e){
                e.preventDefault();
                $.getJSON("lib/dataoutput/action_xmlout.asp", {
                    act: "get_news",
                    newsid: $(this).attr("news-id")
                }, function(json){
                    var news_con = json.news[0]
                    var news_html = "";
                    news_html += "<div id='about-text'><h1>" + news_con.title + "<span>About Natop</span></h1><div>" + news_con.content + "</div></div>";
                    _news_text$.replaceWith(news_html);
                });
            });
            $.getJSON("lib/dataoutput/show_list.asp", {
                act: "news_list",
                do_type: "all"
            }, function(json){
                var tmp_html = "";
                $(json.news_list).each(function(i){
                    tmp_html += "<li><a href=\"#\" news-id=\"" + this.id + "\">" + this.title + "</a> <span>— " + new Date(this.edittime).format("yyyy/MM/dd") + "</span></li>"
                });
                $("ul", _news_text$).html(tmp_html);
            });
            break;

        //products.asp
        case "products.asp":
		/*
            var _products_table$ = $("#products-table");
			_products_table$.empty();
            $.getJSON("lib/dataoutput/action_xmlout.asp", {
                code: "json",
                act: "show_class",
                classname: "class2",
                upclassid: 61
            }, function(json){
                var _temp_tr = "";
                var _temp_td = "";
                $(json.class_list).each(function(i){
                    if (i % 2 == 0) {
                        if (i % 4 == 0) {
                            _temp_td += "<td width='50%' bgcolor='#2f3138'><span class-'style1'><a href='#'> >" + this.classname + "</a></span></td>";
                        }
                        else {
                            _temp_td += "<td width='50%'><span class-'style1'><a href='#'> >" + this.classname + "</a></span></td>";
                        }
                    }
                    else {
                        if (i % 4 == 1) {
                            _temp_td += "<td width='50%' bgcolor='#2f3138'><span class-'style1'><a href='#'> >" + this.classname + "</a></span></td>";
                        }
                        else {
                            _temp_td += "<td width='50%'><span class-'style1'><a href='#'> >" + this.classname + "</a></span></td>";
                        }
                        _temp_tr += "<tr>" + _temp_td + "</tr>";
                        _temp_td = "";
                    }
                });
				var _temp_length=json.class_list.length
				if(_temp_length%2==1){
					_temp_tr+="<tr><td width='50%' bgcolor='#2f3138'><span class-'style1'><a href='#'> >" + json.class_list[_temp_length-1].classname + "</a></span></td><td bgcolor='#2f3138'></td></tr>";
				}
                _products_table$.append(_temp_tr);
            });
			$("a",_products_table$).live("click",function(e){
				e.preventDefault();
				var _shwo_pro$=$("<div id='service-text'><h1>产品介绍</h1><p>&nbsp;</p><table class='tab' width='677' border='0' align='right' cellspacing='2'></table></div>");
				console.info(_shwo_pro$);
			});*/
            break;

        default:
            break;
    }
});
