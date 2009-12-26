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
                    show_class_list({
                        url: get_info_url,
                        class_type: $("#"+$(this).attr("next_class")+""),
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
                add_class($(this).attr("id"), $("#add_" + classname + "_input"), "show_class", $("#" + classname + ""), classname)
            });
            $("#del_class1").bind("click", function(){
                var classname = $("#class1");
                del_class("del_class1", classname.getSelectedValue(), classname);
            })
            //删除class
            function del_class(class_type, class_id, classname){
                var post_data = {
                    "classid": class_id
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
                    }
                });
            }
            //添加class
            function add_class(class_type, input_classname, success_do, show_select, classname){
                var post_data = {
                    "classname": input_classname.val()
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
            };
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
