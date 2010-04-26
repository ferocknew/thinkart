$(function(){
    //html方式获得系统信息
    var get_info_url = "lib/dataoutput/inf_xmlout.asp";
    $.getJSON(get_info_url, {
        "code": "json"
    }, loaddoc);
    
    var url_fileName = get_url_show("end_file"); //当前访问文件
    //menu设置
    switch (url_fileName) {
        case "about.asp","team.asp","brand.asp":
            $("#header").find("a[href='about.asp']").children("img").attr("src", "files/images/menu_about2.gif");
            break;
        case "products.asp":
            $("#header").find("a[href='products.asp']").children("img").attr("src", "files/images/menu_products2.gif");
            break;
        case "news.asp","news1.asp":
            $("#header").find("a[href='news.asp']").children("img").attr("src", "files/images/menu_news2.gif");
            break;
        case "member.asp":
            $("#header").find("a[href='member.asp']").children("img").attr("src", "files/images/menu_member2.gif");
            break;
        case "join.asp":
            $("#header").find("a[href='join.asp']").children("img").attr("src", "files/images/menu_join2.gif");
            break;
        case "contact.asp":
            $("#header").find("a[href='contact.asp']").children("img").attr("src", "files/images/menu_contact2.gif");
            break;
    }
    
    //userlogin
    var userlogin_a = $("#userloging-a");
    if (userlogin_a.length) {
        userlogin_a.attr("href", "javascript:void(0);");
        userlogin_a[0].onclick = userlogin;
    }
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
            }
        });
    }
});
