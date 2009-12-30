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
function load_class3(){$.getJSON(get_info_url, {
        code: "json",
        act: "show_class_all",
        classname: "class3"
    }, function(json){
        for (var i = json.class_list.length - 1; i >= 0; i--) {
            $(".treeLv2[classid='" + json.class_list[i].upclassid + "']").after("<div class=\"treeLv3\" upclassid=\"" + json.class_list[i].upclassid + "\" classid=\"" + json.class_list[i].id + "\">" + json.class_list[i].classname + "</div>");
        }
        bind_menu();
    })}
    function bind_menu(left_menu){
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
