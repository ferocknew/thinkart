/**
 * thinkart_website@Jonah.Fu
 * Edited in 2009-12-04
 */
$(function($){
    var profolio_file = "/files/images/protfolio";
    var get_xml_url = "show_file.asp";
    var url_dir = get_url_show();
    var img_html = $("<a class='itemPicBlock' href='' rel=''><img border='0' src=''/></a>");
    
    $("#protfoliopage").paging({
        loadPages: showResult,
        perpage: 3,
        autoPage: 1,
        jumpAble: 0,
    });
    function showResult(pageIndex){
        var self = this;
        if (self.initFlag !== true) {
            $.get(get_xml_url, {
                Folder: profolio_file
            }, function(data_xml){
                self.nodes = $("Path_dir", data_xml);
                self.totalnum = self.nodes.length;
                self.initNav();
                self.initFlag = true;
                parsePage(self, pageIndex);
            });
        }
        else {
            parsePage(self, pageIndex);
        };
            };
    function parsePage(self, pageIndex){
        self.setNav(pageIndex);
        var from = (pageIndex - 1) * self.perpage, end = from + self.perpage;
        var items = self.nodes.slice(from, end);
        var html = $("<div id='protfolioItem'><div id='proinfo' up_dir=''></div>");
        //html.filter("#protfolioItem").css("display", "none");
        $("#labsContent").empty();
        items.each(function(){
            var html_copy = html.clone();
            html_copy.find("#proinfo").attr("up_dir", $(this).attr("name"));
            $("#labsContent").append(html_copy);
        });
        
        items.each(function(j){
            //获取照片
            var up_dir = $(this).attr("name");
            var img_dir = profolio_file + "/" + up_dir;
            $.get(get_xml_url, {
                Folder: img_dir
            }, function get_img_list(data_xml){
                var img_into_html = $("<div id='protfolioImage'></div>");
                var img_into_html_copy = img_into_html.clone();
                var img_info = $("Path_file", data_xml);
                img_info.each(function(){
                    if ($(this).attr("type") == "jpg" && $(this).attr("file_name").indexOf("_b") == -1) {
                        var img_html_copy = img_html.clone();
                        img_html_copy.filter(".itemPicBlock").attr("href", url_dir + profolio_file + "/" + $(this).attr("up_dir") + "/" + $(this).attr("file_name") + "_b." + $(this).attr("type"));
                        img_html_copy.filter(".itemPicBlock").attr("rel", up_dir);
                        img_html_copy.find("img").attr("src", $(this).attr("Path"));
                        img_into_html_copy.append(img_html_copy);
                    };
                                    });
                $("#proinfo[up_dir='" + up_dir + "']").after(img_into_html_copy);
            });
            //获取信息
            $.get(url_dir + profolio_file + "/" + up_dir + "/info.xml", function(data_xml){
                var div_con = $("<div id=\"proinfo\"><div class=\"protfolioInfo\"><div class=\"protfolioItem1\"><span class=\"redText11 pro_name\"></span><div class=\"protfolioItem\"></div></div><div class=\"protfolioItem2 redText11\">设计师<div id='maker' class=\"protfolioItem\"></div></div><div class=\"protfolioItem2 redText11\">类型<div id='kind' class=\"protfolioItem\"></div></div><div class=\"protfolioItem3 redText11\">日期<div id='show_date' class=\"protfolioItem\"></div></div></div>")
                var div_con_copy = div_con.clone();
                div_con_copy.find(".pro_name").text($("info", data_xml).attr("name"));
                div_con_copy.find(".protfolioItem").text($("pro_con", data_xml).text());
                div_con_copy.find("#kind").text($("info", data_xml).attr("type"));
                div_con_copy.find("#maker").text($("info", data_xml).attr("maker"));
                div_con_copy.find("#show_date").html($("date", data_xml).text());
                $("#proinfo[up_dir='" + up_dir + "']").html(div_con_copy);
                $(".itemPicBlock img").load(function(){
                    $(".itemPicBlock").fancybox();
                });
            });
        });
    };
    
    });
