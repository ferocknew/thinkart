$(function(){
    //html方式获得系统信息
    var get_info_url = "lib/dataoutput/inf_xmlout.asp";
    $.getJSON(get_info_url, {
        "code": "json"
    }, loaddoc);
    
    //顶部菜单
    var _$navBar_td = $("#navBar").find("td")
    _$navBar_td.eq(0).click(function(){
        window.location.href = 'index.asp';
        //首页
    });
    _$navBar_td.eq(1).click(function(){
        window.location.href = 'about.asp';
        //关于畅可
    });
    _$navBar_td.eq(2).click(function(){
        window.location.href = 'newslist.asp';
        //新闻中心
    });
    _$navBar_td.eq(3).click(function(){
        window.location.href = 'inner.asp';
        //产品中心
    });
    _$navBar_td.eq(4).click(function(){
        window.location.href = 'newslist.asp';
        //制冷知识
    });
    _$navBar_td.eq(5).click(function(){
        window.location.href = 'newslist.asp';
        //品质服务
    });
    _$navBar_td.eq(6).click(function(){
        window.location.href = 'contact.asp';
        //联系我们
    });
    
    //右侧导航
    var _$productList = $("#productList");
    if (_$productList.length == 1) {
        var _jsonURL = "lib/dataoutput/action_xmlout.asp";
        var _upclassid = 68;
        $.getJSON(_jsonURL, {
            act: "show_class",
            classname: "class3",
            upclassid: _upclassid
        }, function(json){
            var _html_temp = "";
            $(json.class_list).each(function(i){
                _html_temp += '<li class="onselProductSub" style="display:none">' + this.classname + '</li>';
            });
            
            $("li[classid='" + _upclassid + "']", _$productList).after(_html_temp);
            $(".onselProductSub", _$productList).slideDown();
        });
    }
});
