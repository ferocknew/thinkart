/**
 * thinkart_website@Jonah.Fu
 * Edited in 2010-01-31
 */
$(function($){
    var profolio_file = "/files/images/protfolio";
    var get_xml_url = "show_file.asp";
    var url_dir = get_url_show();
    var img_html = $("<a class='itemPicBlock' href='' rel=''><img border='0' src=''/></a>");
    
    showResult(1);
    function showResult(pageIndex){
        $("#labsContent").empty();
        var insert_html = "";
        $.get(get_xml_url, {
            Folder: profolio_file
        }, function(data_xml){
            var json = $.xml2json(data_xml);
            $(json.Path_dir).each(function(i){
                //获取每个项目组成$对象
                insert_html += "<div id='protfolioItem' item_id='" + this.id + "' up_dir='" + this.name + "'><div id='protfolioImage'></div></div>"
            });
            var itemPicBlock_html = $(insert_html);
            $(json.Path_dir).each(function(i){
                var img_dir = profolio_file + "/" + this.name;
                $.get(get_xml_url, {
                    Folder: img_dir
                }, function(data_xml){
                    var img_info = $("Path_file", data_xml);
                    img_info.each(function(i){
                        if ($(this).attr("type") == "jpg" && $(this).attr("file_name").indexOf("_b") == -1) {
                            var img_html_copy = img_html.clone();
                            img_html_copy.filter(".itemPicBlock").attr("href", url_dir + profolio_file + "/" + $(this).attr("up_dir") + "/" + $(this).attr("file_name") + "_b." + $(this).attr("type"));
                            img_html_copy.filter(".itemPicBlock").attr("rel", $(this).attr("up_dir"));
                            img_html_copy.find("img").attr("src", $(this).attr("Path")).load(function(){
                                $(".itemPicBlock").fancybox()
                            });
                            itemPicBlock_html.filter("div[up_dir='" + $(this).attr("up_dir") + "']").children("div:eq(0)").append(img_html_copy);
                        }
                    });
                });
            });
            $(json.Path_dir).each(function(i){
				var up_dir=this.name;
                $.get(url_dir + profolio_file + "/" + this.name + "/info.xml", function(data_xml){
                    var div_con = $("<div id=\"proinfo\"><div class=\"protfolioInfo\"><div class=\"protfolioItem1\"><span class=\"redText11 pro_name\"></span><div class=\"protfolioItem\"></div></div><div class=\"protfolioItem2 redText11\">设计师<div id='maker' class=\"protfolioItem\"></div></div><div class=\"protfolioItem2 redText11\">类型<div id='kind' class=\"protfolioItem\"></div></div><div class=\"protfolioItem3 redText11\">日期<div id='show_date' class=\"protfolioItem\"></div></div></div>");
                    var div_con_copy = div_con.clone();
                    div_con_copy.find(".pro_name").text($("info", data_xml).attr("name"));
                    div_con_copy.find(".protfolioItem").text($("pro_con", data_xml).text());
                    div_con_copy.find("#kind").text($("info", data_xml).attr("type"));
                    div_con_copy.find("#maker").text($("info", data_xml).attr("maker"));
					div_con_copy.find("#show_date").html($("date", data_xml).text());
					itemPicBlock_html.filter("div[up_dir='" + up_dir + "']").children("div:eq(0)").before(div_con_copy);
                });
            });
            $("#labsContent").html(itemPicBlock_html);
        });
    }
});
