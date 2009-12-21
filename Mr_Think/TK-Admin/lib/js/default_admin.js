$(function(){	
	var get_info_url="../lib/dataoutput/inf_xmlout.asp";
	$.getJSON(get_info_url, {
        "code": "json"
    }, show_info);
    //修改信息
    $("#change_info").bind("click", function(e){
        var post_data = "";
        post_data += "sitename=" + $("#sitename").val() + "&";
        post_data += "comnam=" + $("#comnam").val() + "&";
        post_data += "leader=" + $("#leader").val() + "&";
        post_data += "siteicp=" + $("#siteicp").val() + "&";
        post_data += "siteurl=" + $("#siteurl").val();
        $.ajax({
            type: "POST",
            url: get_info_url+"?code=json&act=edit",
            dataType: "json",
            data: post_data,
            success: show_info
        });
		hiOverAlert('信息已经修改');
        return false;
        e.stopPropagation();
    });
    //添加管理员
    $("#add_admin").bind("click", function(e){
		var post_data="";
		post_data+="username"+$.trim($("#admin_username").val())+"&";
		post_data+="password"+$.trim($("#admin_password").val());
        $.ajax({
            type: "POST",
            url: "xmlout/action_xmlout.asp?code=json&act=add_admin",
            dataType: "json",
            data: post_data,
            success: function(){
				
			}
        });
        return false;
        e.stopPropagation();
    });

});
//显示信息
function show_info(json){
	$("#sitename").val(json.info.site_name);
	$("#comnam").val(json.info.com_name);
	$("#leader").val(json.info.site_leader);
	$("#siteicp").val(json.info.site_icp);
	$("#siteurl").val(json.info.site_url);
	loaddoc(json);
}