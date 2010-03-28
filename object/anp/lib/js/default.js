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
    if (_top_menu$.length) {
        var temp_text = $("li[get_url='" + get_file_url + "']>a", _top_menu$).text();
        $("li[get_url='" + get_file_url + "']", _top_menu$).html(temp_text);
    }
    
    //news.asp
	if (get_file_url == "news.asp") {
		var _news_text$ = $("#news-text");
		$("li>a", _news_text$).click(function(e){
			e.preventDefault();
			$.get("news-1.asp", function(content){
				_news_text$.replaceWith($("#about-text", content));
			});
		});
	}
	
	//products.asp
	if(get_file_url=="products.asp"){
		var _products_table$ = $("#products-table");
		$("a",_products_table$).click(function(e){
			e.preventDefault();
			$.get("products-2.asp", function(content){
				$("#services-text").replaceWith($("#services-text", content));
			});
		})
	}
	
});
