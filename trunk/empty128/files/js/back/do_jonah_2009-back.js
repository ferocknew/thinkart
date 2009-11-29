/**
 * thinkart_website@Jonah.Fu
 * Edited in 2009-11-28
 */
jQuery(function($){
    var profolio_file = "/files/images/protfolio";
    var get_xml_url = "show_file.asp";
    var url_dir = get_url_show();
    $("#labsContent").empty();
    //var pro_info=$("#proinfo").html();
    
    //console.info($("info",info_xml).attr("name"));
    //获取文件夹列表
    $.get(get_xml_url, {
        Folder: profolio_file
    }, function(xml_data){
		SetCookie("now_page", 1, 1);
        var img_dir = ""; //目录
        var max_show_num = 3;
		var pag_max_num=Math.ceil($("Path_dir", xml_data).length/3);
        var page_code = "";
        for (var i = 0; i < pag_max_num; i++) {
			var pag_num=i+1;
			page_code+="<div class=\"pageText2\" title=\""+pag_num+"\">"+pag_num+"</div>";}
        $("#floatRight").html(page_code);
		var page_index=GetCookie("now_page")-1
		$(".floatRight div:eq("+page_index+")").removeClass();
		$(".floatRight div:eq("+page_index+")").addClass("pageText1");
		
		var next_item=max_show_num*page_index;
		if(page_index==0){next_item=0};
        for(var i=next_item; i<$("Path_dir",xml_data).length; i++){
            if (i >= max_show_num+next_item) {
                return false;
            };
            img_dir = profolio_file + "/" + $("Path_dir:eq(" + i + ")", xml_data).attr("name");
            //取info
            var show_info = "";
            $.get(url_dir + img_dir + "/info.xml?show=" + Date(), function(info_xml){
                show_info += "<div id=\"proinfo\"><div class=\"protfolioInfo\"><div class=\"protfolioItem1\"><span class=\"redText11\">" + $("info", info_xml).attr("name") + "</span>";
                show_info += "<div class=\"protfolioItem\"></div></div><div class=\"protfolioItem2 redText11\">设计师<div class=\"protfolioItem\"></div></div>";
                show_info += "<div class=\"protfolioItem2 redText11\">设计师<div class=\"protfolioItem\">网站设计</div></div>";
                show_info += "<div class=\"protfolioItem3 redText11\">日期<div class=\"protfolioItem\"><span class=\"dateMonth\">12</span><span class=\"dateDay\">/15</span></div></div></div></div>";
            });
            //取img
            $.get(get_xml_url, {
                Folder: img_dir
            }, function(xml_data){
                show_info += "<div id='protfolioImage'>";
                $("Path_file", xml_data).each(function(i){
                    if ($("Path_file:eq(" + i + ")", xml_data).attr("type") == "jpg" && $("Path_file:eq(" + i + ")", xml_data).attr("file_name").indexOf("_b") == -1) {
                        var show_dir = $("Path_file:eq(" + i + ")", xml_data).attr("Path").split("/");
                        show_info += "<a class=\"itemPicBlock\" href=\"" + url_dir + profolio_file + "/" + show_dir[show_dir.length - 2] + "/" + $("Path_file:eq(" + i + ")", xml_data).attr("file_name") + "_b." + $("Path_file:eq(" + i + ")", xml_data).attr("type") + "\"><img border=\"0\" src=\"" + $("Path_file:eq(" + i + ")", xml_data).attr("Path") + "\"/></a>";
                    }
                });
                show_info += "</div>";
                $("#labsContent").append("<div id=\"protfolioItem\">" + show_info + "</div>");
                show_info = "";
                $(".itemPicBlock img").load(function(){
                    $(".itemPicBlock").fancybox();
                });
            });
        }
    });
});
