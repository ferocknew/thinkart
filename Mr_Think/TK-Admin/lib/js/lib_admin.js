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
			$(class_type).data("upclassid",upclassid);
			class_type.setSelectedIndex(class_type.SelectSize()-1);
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
				if (json.err == "Empty") {
					$("#"+classname+"").clearAll();
					if(classname=="class2"){$("#class3").clearAll();}
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