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
	var upclassid=com_words.upclassid;
    
    function ezshow(class_type, class_json){
        class_type.clearAll();
        if (class_json != null) {
            $(class_json).each(function(i){
                class_type.addOption(class_json[i].classname, class_json[i].id);
            })
			class_type.data("upclassid",upclassid);
        }
    };
    if (type_ == 1) {
        ezshow(class_type, get_json);
    }
    else {
        $.getJSON(get_info_url, {
            "code": "json",
            "act": do_words,
            "classname": classname,
			"upclassid":upclassid
        }, function(json){
            var class_json = json.class_list;
            ezshow(class_type, class_json);
        });
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
