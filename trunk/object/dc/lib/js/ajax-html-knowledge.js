var _$AboutMainId = $("#about-main-id");
$("a", _$AboutMainId).toggle(function(e){
    e.preventDefault();
    $.getJSON("lib/dataoutput/action_xmlout.asp", {
        act: "get_news",
        newsid: $(this).attr("news_id")
    }, function(json){
		$(e.target).parents("p").after("<div style=\"width:650px;\">"+json.news[0].content+"</div>")
    });
},function(e){
	$(e.target).parents("p").next().hide();
});
