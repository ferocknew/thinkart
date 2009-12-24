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
        //分类设置
        case "classManage.asp":
            var get_info_url = "../lib/dataoutput/action_xmlout.asp";
            $("select").clearAll();
            show_class_list({
                url: get_info_url,
                class_type: $("#class1"),
                do_words: "show_class1",
                type_: 2
            });
            //绑定事件
            $("#add_class1").bind("click", function(){
                add_class($(this).attr("id"), $("#add_class1_input"), "show_class1", $("#class1"))
            });
            $("#class1").bind("click", function(e){
                $("#class1_name").text($(this).getSelectedText())
            });
            $("#del_class1").bind("click", function(){
                del_class("del_class1", $("#class1").getSelectedValue());
            })
            
            //删除class
            function del_class(class_type, class_id){
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
                            class_type: $("#class1"),
                            json: json.class_list,
                            type_: 1
                        });
                    }
                });
            }
            //添加class
            function add_class(class_type, classname, success_do, show_select){
                var post_data = {
                    "classname": classname.val()
                };
                $.ajax({
                    type: "POST",
                    url: get_info_url + "?act=" + class_type,
                    dataType: "json",
                    data: post_data,
                    success: function(json){
                        show_class_list({
                            url: get_info_url,
                            class_type: $("#class1"),
                            json: json.class_list,
                            type_: 1
                        });
                        $("#class1").setSelectedIndex($("#class1").SelectSize() - 1);
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
