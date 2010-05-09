/*
 * index.asp
 */
//显示信息
function show_info(json){
    $("#sitename").val(json.info.site_name);
    $("#comnam").val(json.info.com_name);
    $("#leader").val(json.info.site_leader);
    $("#siteicp").val(json.info.site_icp);
    $("#siteurl").val(json.info.site_url);
    $("#site_logo").val(json.info.site_logo);
    $("#com_intro").val(json.info.site_com_intro);
    show_edit($("#com_intro"));
    loaddoc(json);
};
//编辑器
function show_edit(show_item){
    show_item.xheditor(true, {
        tools: 'full',
        skin: "o2007silver",
        upLinkUrl: "lib/upload.asp",
        upLinkExt: "zip,rar,txt,psd,jpg",
        upImgUrl: "lib/upload.asp",
        upImgExt: "jpg,jpeg,gif,png",
        upFlashUrl: "lib/upload.asp",
        upFlashExt: "swf"
    });
}

/*
 * classManage.asp
 */
//显示class列表
function show_class_list(com_words){
    var do_words = com_words.cat;
    var classname = com_words.classname;
    var class_type = com_words.class_type;
    var type_ = com_words.type_;
    var get_info_url = com_words.url;
    var get_json = com_words.json;
    var upclassid = com_words.upclassid;
    function ezshow(class_type, class_json){
        class_type.clearAll();
        if (class_json != null) {
            $(class_json).each(function(i){
                class_type.addOption(class_json[i].classname, class_json[i].id);
            })
            $(class_type).data("upclassid", upclassid);
            //class_type.setSelectedIndex(class_type.SelectSize()-1);
        }
    };
    if (type_ == 1) {
        ezshow(class_type, get_json);
    }
    else {
        if (classname !== "class4") {
            $.getJSON(get_info_url, {
                "code": "json",
                "act": do_words,
                "classname": classname,
                "upclassid": upclassid
            }, function(json){
                if (classname == "class2") {
                    $("#class3").clearAll();
                }
                if (json.err == "-1") {
                    $("#" + classname + "").clearAll();
                }
                else {
                    var class_json = json.class_list;
                    ezshow(class_type, class_json);
                }
            });
        }
    }
};
function show_classmenu(left_menu_div){
    //var left_menu_div = $(".rightDotted1px_div");
    left_menu_div.empty();
    var get_info_url = "../lib/dataoutput/action_xmlout.asp";
    $.getJSON(get_info_url, {
        code: "json",
        act: "show_class",
        classname: "class1",
        upclassid: 0
    }, function(json){
        $(json.class_list).each(function(i){
            var show_menu = $("<div class=\"treeLv1\" classid=\"" + json.class_list[i].id + "\" upclassid='0'>" + json.class_list[i].classname + "</div>")
            left_menu_div.append(show_menu);
        });
        bind_menu();
        load_class2();
    });
    function load_class2(){
        $.getJSON(get_info_url, {
            code: "json",
            act: "show_class_all",
            classname: "class2"
        }, function(json){
            for (var i = json.class_list.length - 1; i >= 0; i--) {
                $(".treeLv1[classid='" + json.class_list[i].upclassid + "']").after("<div class=\"treeLv2\" upclassid=\"" + json.class_list[i].upclassid + "\" classid=\"" + json.class_list[i].id + "\">" + json.class_list[i].classname + "</div>");
            }
            bind_menu();
            load_class3();
        })
    }
    function load_class3(){
        $.getJSON(get_info_url, {
            code: "json",
            act: "show_class_all",
            classname: "class3"
        }, function(json){
            for (var i = json.class_list.length - 1; i >= 0; i--) {
                $(".treeLv2[classid='" + json.class_list[i].upclassid + "']").after("<div class=\"treeLv3\" upclassid=\"" + json.class_list[i].upclassid + "\" classid=\"" + json.class_list[i].id + "\">" + json.class_list[i].classname + "</div>");
            }
            bind_menu();
        })
    }
    function bind_menu(){
        var left_menu = $("div", left_menu_div);
        left_menu.click(function(e){
            left_menu.css({
                "background-color": "",
                color: "#666"
            });
            $(e.target).css({
                "background-color": "#666",
                color: "#fff"
            });
            $("#from_class").text($(this).text()).data("class_val", {
                classid: $(this).attr("classid"),
                class_type: $(this).attr("class"),
                upclassid: $(this).attr("upclassid")
            });
        });
    }
}
//列表显示
function get_class_(class_type, classid, upclassid){
    var get_class_div = $("." + class_type + "[classid='" + classid + "']");
    get_class_div.css({
        "background-color": "#666",
        color: "#fff"
    });
    $("#from_class").text(get_class_div.text()).data("class_val", {
        classid: classid,
        class_type: class_type,
        upclassid: upclassid
    });
};
//显示新闻列表
function show_news_list(con_div){
    var get_url = "../lib/dataoutput/show_list.asp";
    var news_tab = con_div.clone();
    con_div.empty();
    $.getJSON(get_url, {
        act: "news_list",
        do_type: "all"
    }, function(json){
        var news_ = json.news_list;
        $(news_).each(function(i){
            var news_tab_copy = news_tab.clone();
            news_tab_copy.filter(".news_contect").removeClass().attr("news_id", this.id);
            news_tab_copy.find("td:eq(0)").html("<span class='news_name' ness_id='" + this.id + "'>" + this.title + "</span>");
            news_tab_copy.find("td:eq(1)").html(this.class1id);
            news_tab_copy.find("td:eq(2)").html(this.class2id);
            news_tab_copy.find("td:eq(3)").html(this.class3id);
            news_tab_copy.find("td:eq(4)").html(new Date(this.edittime).format("yyyy年MM月dd日 hh:mm") + " <span class='del_news' news_id='" + this.id + "'>删</span>");
            $(".news_contect").after(news_tab_copy);
        });
        $(".del_news").css("cursor", "pointer");
        $(".news_name").hover(function(){
            $(this).css({
                color: "red",
                cursor: "pointer"
            })
        }, function(){
            $(this).css("color", "#000")
        });
        $(".news_name").click(function(){
            location.href = "addContent.asp?id=" + $(this).attr("ness_id");
        });
        $(".del_news").click(function(e){
            if (confirm("确认删除么？")) {
                $.getJSON("../lib/dataoutput/action_xmlout.asp", {
                    act: "del_news",
                    newsid: $(this).attr("news_id")
                }, function(json){
                    if (json.err == 0) {
                        alert(json.msg);
                        $("tr[news_id='" + json.del_id + "']").empty();
                    }
                });
            }
        });
    });
};

//显示产品列表
function show_pros_list(con_div){
    var get_url = "../lib/dataoutput/show_list.asp";
    var news_tab = con_div.clone();
    con_div.empty();
    $.getJSON(get_url, {
        act: "pro_list",
        do_type: "all"
    }, function(json){
        var pros_ = json.pros_list;
        $(pros_).each(function(i){
            var news_tab_copy = news_tab.clone();
            news_tab_copy.filter(".news_contect").removeClass().attr("news_id", this.id);
            news_tab_copy.find("td:eq(0)").html(i+"&nbsp;&nbsp;&nbsp;<span class='news_name' ness_id='" + this.id + "'>" + this.name +"["+this.tag+"]" +"</span>");
            news_tab_copy.find("td:eq(1)").html(this.class1id);
            news_tab_copy.find("td:eq(2)").html(this.class2id);
            news_tab_copy.find("td:eq(3)").html(this.class3id);
            news_tab_copy.find("td:eq(4)").html(new Date(this.edittime).format("yyyy年MM月dd日 hh:mm") + " <span class='del_news' news_id='" + this.id + "'>删</span>");
            $(".news_contect").after(news_tab_copy);
        });
        $(".del_news").css("cursor", "pointer");
        $(".news_name").hover(function(){
            $(this).css({
                color: "red",
                cursor: "pointer"
            })
        }, function(){
            $(this).css("color", "#000")
        });
        $(".news_name").click(function(){
            location.href = "addpro.asp?id=" + $(this).attr("ness_id");
        });
        $(".del_news").click(function(e){
            if (confirm("确认删除么？")) {
                $.getJSON("../lib/dataoutput/action_xmlout.asp", {
                    act: "del_pros",
                    proid: $(this).attr("news_id")
                }, function(json){
                    if (json.err == 0) {
                        alert(json.msg);
                        $("tr[news_id='" + json.del_id + "']").empty();
                    }
                });
            }
        });
    });
}
