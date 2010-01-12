$(function(){
    var get_file_url = get_url_show("end_file");
    if (get_file_url == "") {
        get_file_url = "index.asp"
    };
    switch (get_file_url) {
        //系统设置
        case "index.asp":
			admin_menu_click($(".rightBorder1px[get_html='system_edit']"));
            var get_info_url = "../lib/dataoutput/inf_xmlout.asp";
            $.getJSON(get_info_url, {
                "code": "json"
            }, show_info);
            //修改信息
            $("#change_info").bind("click", function(e){
                var post_data = {
                    sitename: $("#sitename").val(),
                    comnam: $("#comnam").val(),
                    leader: $("#leader").val(),
                    siteicp: $("#siteicp").val(),
                    siteurl: $("#siteurl").val(),
                    com_intro: $("#com_intro").val(),
                    sitelogo: $("#site_logo").val()
                }
                $.ajax({
                    type: "POST",
                    url: get_info_url + "?code=json&act=edit",
                    dataType: "json",
                    data: post_data,
                    success: show_info
                });
                //hiOverAlert('信息已经修改');
                return false;
                e.stopPropagation();
            });
            break;
        /*
         * 分类设置部分
         */
        case "classManage.asp":
		admin_menu_click($(".rightBorder1px[get_html='Content_manage']"));
            //当前页面体验修改
            var get_info_url = "../lib/dataoutput/action_xmlout.asp";
            $(".optList").clearAll();
            show_class_list({
                url: get_info_url,
                class_type: $("#class1"),
                cat: "show_class",
                classname: $("#class1").attr("id"),
                upclassid: 0,
                type_: 2
            });
            $(".optList").each(function(){
                $(this).bind("click", function(e){
                    $("#" + $(this).attr("id") + "_name").text($(this).getSelectedText());
                    $(this).data("class_id", $(this).getSelectedValue());
                    if ($(this).attr("next_class") == "") {
                        $(this).attr("next_class", "class4")
                    }
                    show_class_list({
                        url: get_info_url,
                        class_type: $("#" + $(this).attr("next_class") + ""),
                        cat: "show_class",
                        classname: $(this).attr("next_class"),
                        upclassid: $(this).getSelectedValue(),
                        type_: 2
                    });
                });
            });
            //绑定事件
            $("#add_class1").bind("click", function(){
                var classname = "class1";
                add_class({
                    class_type: "add_class",
                    input_classname: $("#add_" + classname + "_input"),
                    success_do: "show_class",
                    show_select: $("#" + classname + ""),
                    classname: classname,
                    upclassid: 0
                });
            });
            $("#add_class2").bind("click", function(e){
                var classname = "class2";
                add_class({
                    class_type: "add_class",
                    input_classname: $("#add_" + classname + "_input"),
                    success_do: "show_class",
                    show_select: $("#" + classname + ""),
                    classname: classname,
                    upclassid: $("#class1").data("class_id")
                });
            });
            $("#add_class3").bind("click", function(e){
                var classname = "class3";
                add_class({
                    class_type: "add_class",
                    input_classname: $("#add_" + classname + "_input"),
                    success_do: "show_class",
                    show_select: $("#" + classname + ""),
                    classname: classname,
                    upclassid: $("#class2").data("class_id")
                });
            });
            $("#del_class1").bind("click", function(){
                var classname = "class1";
                var upclassid = 0;
                del_class("del_class", $("#" + classname + "").getSelectedValue(), $("#" + classname + ""), classname, upclassid);
            })
            $("#del_class2").bind("click", function(){
                var classname = "class2";
                var upclassid = $("#class1").data("class_id");
                del_class("del_class", $("#" + classname + "").getSelectedValue(), $("#" + classname + ""), classname, upclassid);
            })
            $("#del_class3").bind("click", function(){
                var classname = "class3";
                var upclassid = $("#class2").data("class_id");
                del_class("del_class", $("#" + classname + "").getSelectedValue(), $("#" + classname + ""), classname, upclassid);
            })
            //删除class
            function del_class(class_type, class_id, classname, class_tab, upclassid){
                var post_data = {
                    "class": class_tab,
                    "classid": class_id,
                    "upclassid": upclassid
                };
                $.ajax({
                    type: "POST",
                    url: get_info_url + "?act=" + class_type,
                    dataType: "json",
                    data: post_data,
                    success: function(json){
                        show_class_list({
                            url: get_info_url,
                            class_type: classname,
                            json: json.class_list,
                            type_: 1
                        });
                        if (json.err == -1) {
                            return false
                        };
                        if (json.err !== "") {
                            alert(json.err)
                        };
                                            }
                });
            }
            //添加class
            function add_class(cmd_words){
                var class_type = cmd_words.class_type;
                var input_classname = cmd_words.input_classname;
                var success_do = cmd_words.success_do;
                var show_select = cmd_words.show_select;
                var classname = cmd_words.classname;
                var upclassid = cmd_words.upclassid;

                if (upclassid == null) {
                    alert("请选择上层分类。");
                    return false;
                };
                if (input_classname.val() == "") {
                    alert("请填写名称。");
                    return false;
                };
                var post_data = {
                    "class": classname,
                    "classname": input_classname.val(),
                    "upclassid": upclassid
                };
                $.ajax({
                    type: "POST",
                    url: get_info_url + "?act=" + class_type,
                    dataType: "json",
                    data: post_data,
                    success: function(json){
                        show_class_list({
                            url: get_info_url,
                            class_type: $("#" + classname + ""),
                            json: json.class_list,
                            type_: 1
                        });
                        $("#" + classname + "").setSelectedIndex($("#" + classname + "").SelectSize() - 1);
                    }
                });
                $(".setClassInput").val("");
            };
            break;
        /*
         * 新闻添加
         */
        case "addContent.asp":
		admin_menu_click($(".rightBorder1px[get_html='Content_manage']"));
            var news_id = getvalue("id");
            show_classmenu($(".rightDotted1px_div"));
            if (news_id == null) {
                show_edit($("#pj_memo2"));
                $("#reset_pj").click(function(){
                    $("input[type='text']").val("");
                });
                var now_data = new Date();
                $("#pj_start").val(now_data.toLocaleString()).attr("disabled", "disabled");
                $("#create_pj").click(function(){
                    var class_data = $("#from_class").data("class_val");
                    if (class_data == undefined) {
                        alert("请选择分类");
                    }
                    else {
                        if ($.trim($("#pj_start2").val()) == "") {
                            alert("请填写标题！")
                        }
                        else {
                            var post_data = {
                                title: $("#pj_start2").val(),
                                classid: class_data.classid,
                                classtype: class_data.class_type,
                                upclassid: class_data.upclassid,
                                Content: $("#pj_memo2").val(),
                                abstract: $("#pj_end").val(),
                                tag: $("#pj_end2").val()
                            };
                            $.ajax({
                                type: "POST",
                                url: "../lib/dataoutput/save_data.asp?act=add_news",
                                dataType: "json",
                                data: post_data,
                                success: function(json){
                                    if (json.err == "") {
                                        alert(json.msg);
                                        $("input[type='text']").val("");
                                        var now_data = new Date();
                                        $("#pj_start").val(now_data.toLocaleString()).attr("disabled", "disabled");
                                        return false;
                                    }
                                    else {
                                        alert(json.err);
                                        return false;
                                    };
                                                                    }
                            });
                        }
                    };
                                    });
            }
            else {
                //新闻修改
                $.getJSON("../lib/dataoutput/action_xmlout.asp", {
                    act: "get_news",
                    newsid: news_id
                }, function(json){
                    var news_con = json.news[0];
                    setTimeout(function(){
                        if (news_con.class3id != 0) {
                            get_class_("treeLv3", news_con.class3id, news_con.class2id);
                        }
                        else
                            if (news_con.class2id != 0) {
                                get_class_("treeLv2", news_con.class2id, news_con.class1id);
                            }
                            else {
                                get_class_("treeLv1", news_con.class1id, 0);
                            }
                    }, 1000);
                    $("#pj_start2").val(news_con.title);
                    $("#pj_start").val(news_con.edittime).attr("disabled", true);
                    $("#pj_end").val(news_con.abstract);
                    $("#pj_memo2").val(news_con.content);
                    $("#pj_end2").val(news_con.tag);
                    show_edit($("#pj_memo2"));
                    $("#create_pj").val("修改");
                    $("#create_pj").bind("click", function(){
                        if ($.trim($("#pj_start2").val()) == "") {
                            alert("请填写标题！");
                            return false;
                        }
                        var class_data = $("#from_class").data("class_val")
                        var post_data = {
                            title: $("#pj_start2").val(),
                            classid: class_data.classid,
                            classtype: class_data.class_type,
                            upclassid: class_data.upclassid,
                            Content: $("#pj_memo2").val(),
                            abstract: $("#pj_end").val(),
                            tag: $("#pj_end2").val()
                        };
                        $.ajax({
                            type: "POST",
                            url: "../lib/dataoutput/save_data.asp?act=edit_news&newsid=" + news_id,
                            dataType: "json",
                            data: post_data,
                            success: function(json){
                                if (json.err == "") {
                                    alert(json.msg);
                                    location.href = "news.asp";
                                    return false;
                                }
                                else {
                                    alert(json.err);
                                    return false;
                                };
                                                            }
                        });
                    });
                });
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
            }
            break;
        /*
         * 新闻呈现
         */
        case "news.asp":
			admin_menu_click($(".rightBorder1px[get_html='Content_manage']"));
            show_news_list($(".news_contect"));
            break;
        default:
    }
    /*
     *调整页面体验
     */
    $(".rightBorder1px").css("cursor", "pointer");
    $("#top_menu td").click(function(){
		admin_menu_click(this)
	});
	$("#loginout_do").click(function(){location.href="../lib/dataoutput/chkuser.asp?act=loginout_admin"});
	function admin_menu_click(click_item){
        $("#manvBar_sub").load("lib/top_admin_menu_children.asp #" + $(click_item).attr("get_html"), function(){
            $(".Top-menu-children span").live("click", function(e){
                location.href = $(e.target).attr("get_url")
            }).hover(function(e){
                $(e.target).css("color", "#ccc")
            }, function(e){
                $(e.target).css("color", "#999")
            });
        });
    }
});
