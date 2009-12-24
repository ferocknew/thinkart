$(function(){
    switch (get_url_show("end_file")) {
        case "index.asp":
            var get_info_url = "../lib/dataoutput/inf_xmlout.asp";
            $.getJSON(get_info_url, {
                "code": "json"
            }, show_info);
            //修改信息
            $("#change_info").bind("click", function(e){
                var post_data =
				{
					sitename:$("#sitename").val(),
					comnam:$("#comnam").val(),
					leader:$("#leader").val(),
					siteicp:$("#siteicp").val(),
					siteurl:$("#siteurl").val(),
					com_intro:$("#com_intro").val(),
					sitelogo:$("#site_logo").val()
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
            //添加管理员
            $("#add_admin").bind("click", function(e){
                var post_data = "";
                post_data += "username" + $.trim($("#admin_username").val()) + "&";
                post_data += "password" + $.trim($("#admin_password").val());
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
            break;
         default:
    }

    /*
     *调整页面体验
     */
    $(".rightBorder1px").css("cursor", "pointer");
    $("#top_menu td").live("click", function(e){
        location.href = $(this).attr("get_url");
    });
});
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
}
//编辑器
function show_edit(show_item){
	show_item.xheditor(
		true,
		{
		tools:'full',
		skin:"o2007silver",
		upLinkUrl:"upload.asp",
		upLinkExt:"zip,rar,txt",
		upImgUrl:"upload.asp",
		upImgExt:"jpg,jpeg,gif,png",
		upFlashUrl:"upload.asp",
		upFlashExt:"swf",
		upMediaUrl:"upload.asp",
		upMediaExt:"avi"
		});
}