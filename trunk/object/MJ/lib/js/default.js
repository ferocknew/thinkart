$(function(){
    //html方式获得系统信息
    var get_info_url = "lib/dataoutput/inf_xmlout.asp";
    $.getJSON(get_info_url, {
        "code": "json"
    }, loaddoc);

    var url_fileName = get_url_show("end_file"); //当前访问文件
    //menu设置
    switch (url_fileName) {
        case "about.asp":
        case "team.asp":
        case "brand.asp":
            $("#header").find("a[href='about.asp']").children("img").attr("src", "files/images/menu_about2.gif");
            break;
        case "products.asp":
            $("#header").find("a[href='products.asp']").children("img").attr("src", "files/images/menu_products2.gif");
            break;
        case "news.asp":
        case "news1.asp":
            $("#header").find("a[href='news.asp']").children("img").attr("src", "files/images/menu_news2.gif");
            break;
        case "member.asp":
		case "mumber_edit.asp":
            $("#header").find("a[href='member.asp']").children("img").attr("src", "files/images/menu_member2.gif");
            break;
        case "join.asp":
            $("#header").find("a[href='join.asp']").children("img").attr("src", "files/images/menu_join2.gif");
            break;
        case "contact.asp":
            $("#header").find("a[href='contact.asp']").children("img").attr("src", "files/images/menu_contact2.gif");
            break;
    }

    switch (url_fileName) {
        case "index.asp": //userlogin
            var userlogin_a = $("#userloging-a");
            if (userlogin_a.length) {
                userlogin_a.attr("href", "javascript:void(0);");
                userlogin_a[0].onclick = userlogin;
            }
            break;
        case "news.asp": //新闻列表
            $.getJSON("lib/dataoutput/webservice.asp", {
                act: "newslist"
            }, function(json){
				var _temp_html="";
				$(json.datalist).each(function(i){
					_temp_html+='<div class="newsList"><div class="newsName">'+this.title+'<span class="newsDate">'+new Date(this.addtime).format("yyyy.M.dd")+'</span></div>'+this.abstract+'<a href="news1.asp?id='+this.id+'" class="listMore">...> 全部内容</a></div>';
				});
				$("#NewsListContent").html(_temp_html);
            });
            break;
    }

    //userlogin
    function userlogin(){
        if ($.trim($("#username").val()) == "" || $.trim($("#password").val()) == "") {
            alert("请输入对应的内容");
            return false;
        }
        var ajaxdata = {
            username: $.trim($("#username").val()),
            password: $.trim($("#password").val())
        };
        $.ajax({
            type: "POST",
            url: "lib/dataoutput/webservice.asp?act=userlogin",
            data: ajaxdata,
            dataType: "json",
            success: function(json){
                alert(json.msg);
                if (json.err == 0)
                    $("#indexLoginDiv").hide();
            }
        });
    }
});
