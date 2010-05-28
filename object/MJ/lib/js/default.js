$(function(){
    var webserviceurl = "lib/dataoutput/webservice.asp";
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
        case "password_edit.asp":
            $("#header").find("a[href='member.asp']").children("img").attr("src", "files/images/menu_member2.gif");
            break;
        case "join.asp":
        case "join2.asp":
        case "client.asp":
            $("#header").find("a[href='join.asp']").children("img").attr("src", "files/images/menu_join2.gif");
            break;
        case "contact.asp":
            $("#header").find("a[href='contact.asp']").children("img").attr("src", "files/images/menu_contact2.gif");
            break;
    }

    //锚点设置
    $("a[href='#']").attr("href", "javascript:void(0);");
    if (url_fileName == "")
        url_fileName = "index.asp";
    switch (url_fileName) {
        default:
            var userlogin_a = $("#userloging-a");
            if (userlogin_a.length) {
                userlogin_a.click(function(){
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
                            if (json.err == 0){
                                $("#indexLoginDiv").hide();
                            window.location.href = "member.asp";}
                        }
                    });
                });
            }
            break;
        case "news.asp": //新闻列表
            function get_newslist(newskind){
                $.getJSON(webserviceurl, {
                    act: "newslist",
                    newskind: newskind
                }, function(json){
                    var _temp_html = "";
                    $(json.datalist).each(function(i){
                        _temp_html += '<div class="newsList"><div class="newsName">' + this.title + '<span class="newsDate">' + new Date(this.addtime).format("yyyy.M.dd") + '</span></div>' + this.abstract + '<a href="news1.asp?id=' + this.id + '" class="listMore">...> 全部内容</a></div>';
                    });
                    $("#NewsListContent").html(_temp_html);
                });
            }
            function alertfn(e){
                get_newslist(e.data);
                if (e.data == 71) {
                    newsgif = "title_news.gif"
                }
                else {
                    newsgif = "title_cnews.gif"
                }
                $("#content>img").eq(0).attr("src", "files/images/" + newsgif);
            }

			if (getvalue("type") !== "industry") {
				get_newslist(70);
				$("#content>img").eq(0).attr("src", "files/images/" + "title_cnews.gif");
			}
			else {
				get_newslist(71);
				$("#content>img").eq(0).attr("src", "files/images/" + "title_news.gif");
			}
            $("#com_list").bind("click", 70, alertfn);
            $("#hangye_list").bind("click", 71, alertfn);
            break;
        case "products.asp": //产品列表
            var _$products_fancybox = $("#products_fancybox");
            $("a", _$products_fancybox).fancybox({
                'padding': 0,
                'autoDimensions': true,
                'autoScale': true,
                'type': 'iframe',
                'width': 600,
                'height': 550
            });
            var _pro_list = $(".products");
            _pro_list.hover(function(e){
                $(this).children().show();
            }, function(e){
                $(this).children().hide();
            });
            break;
            var pageNum = 1;

            function showProlist(pageNum_in, classid, profilter, profilterid){
                $.getJSON(webserviceurl, {
                    act: "prolist",
                    class3id: classid,
                    page: pageNum_in,
                    profilter: "",
                    profilterid: ""

                }, function(json){
                    var _temp_html = "";
                    $(json.datalist).each(function(i){
                        if (userCookie == 1) {
                            _temp_html += '<a href="fancybox.asp?id=' + this.id + '"><div class="products" style="background:url(' + this.img + ');"><div class=\"prductMouseOn\" id=\"priceBlock\" style=\"color:#fff;display:none;\">' + this.name + '<h2>￥' + this.Price + '</h2></div></div></a>';
                        }
                        else {
                            _temp_html += '<a href="fancybox.asp?id=' + this.id + '"><div class="products" style="background:url(' + this.img + ');"><div class=\"prductMouseOn\" id=\"priceBlock\" style=\"color:#fff;display:none;\">' + this.name + '<h2></h2></div></div></a>';
                        }
                    });
                    _$products_fancybox.html(_temp_html);
                    var _pro_list = $(".products");
                    _pro_list.hover(function(e){
                        $(this).children().show();
                    }, function(e){
                        $(this).children().hide();
                    });
                    if (pageNum > parseInt(json.pageMAX) - 1) {
                        pageNum = parseInt(json.pageMAX);
                    }
                    if (pageNum < 2)
                        pageNum = 1;
                });
            }
            showProlist(pageNum, 17); //显示列表
            $(".contentEnd").children("a").eq(0).click(function(){
                //下一页
                pageNum += 1
                showProlist(pageNum, 17);
            })
            $(".contentEnd").children("a").eq(1).click(function(){
                //上一页
                pageNum -= 1
                showProlist(pageNum, 17);
            })
            break;
    }

    //userlogin
    function userlogin(){

    }
});
