$(function(){
    switch (get_url_show("end_file")) {
        //系统设置
        case "index.asp":
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
            show_classmenu($(".rightDotted1px_div"));
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
                    if ($("#pj_start2").val().trim() == "") {
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
            break;
        /*
         * 新闻呈现
         */
        case "news.asp":
            var get_url = "../lib/dataoutput/show_list.asp"
			var news_tab = $(".news_contect").clone();
			$(".news_contect").empty();
            $.getJSON(get_url, {
                act: "news_list",
                do_type: "all"
            }, function(json){
                var news_=json.news_list;
				$(news_).each(function(i){
					var news_tab_copy=news_tab.clone();
					news_tab_copy.filter(".news_contect").removeClass();
					news_tab_copy.find("td:eq(0)").html(this.title);
					news_tab_copy.find("td:eq(1)").html(this.class1id);
					news_tab_copy.find("td:eq(2)").html(this.class2id);
					news_tab_copy.find("td:eq(3)").html(this.class3id);
					news_tab_copy.find("td:eq(4)").html(new Date(this.edittime).format("yyyy年MM月dd日 hh:mm"));
					$(".news_contect").after(news_tab_copy);
				})
            });            
            break;
        default:
    }
    /*
     *调整页面体验
     */
    $(".rightBorder1px").css("cursor", "pointer");
    $("#top_menu td").live("click", function(e){
        location.href = $(e.target).attr("get_url");
    });
});
