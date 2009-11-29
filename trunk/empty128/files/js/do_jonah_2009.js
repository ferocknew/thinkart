/**
 * thinkart_website@Jonah.Fu
 * Edited in 2009-11-28
 */
$(function($){
    //目录
    var img_dir = "";
    //div内容
    var div_con = "";
    var img_div_con = "";
	
    var profolio_file = "/files/images/protfolio";
    var get_xml_url = "show_file.asp";
    var url_dir = get_url_show(); //获取地址栏信息
    //获取文件夹列表
    $.get(get_xml_url, {
        Folder: profolio_file
    }, show_dir);
    
    //获取文件夹列表Callback
    function show_dir(xml_data){
        for (var i = 0; i < $("Path_dir", xml_data).length; i++) {
			if ($("Path_dir:eq("+i+")", xml_data).attr("name") != ".svn") {
				//获取照片            
				img_dir = profolio_file + "/" + $("Path_dir:eq(" + i + ")", xml_data).attr("name");
				
				$.get(get_xml_url, {Folder: img_dir}, function(xml_data){img_div_con=1;});
				alert(img_div_con);
				div_con += "<div id=\"protfolioItem\"><div id=\"proinfo\"><div class=\"protfolioInfo\">"
				div_con += "<div class=\"protfolioItem1\"><span class=\"redText11 pro_name\">123123</span>"
				div_con += "<div class=\"protfolioItem\">K&amp;k是一个关于爱和勇气的品牌 , 来自台湾的审美情怀 ,飘洋过海在上海生根发芽……<br />以自身跨越十年时间, 2000公里空间的坚定.<br /></div>"
				div_con += "</div><div class=\"protfolioItem2 redText11\">设计师<div class=\"protfolioItem\">Jack Daniels</div>"
				div_con += "</div><div class=\"protfolioItem2 redText11\">设计师<div class=\"protfolioItem\">网站设计</div>"
				div_con += "</div><div class=\"protfolioItem3 redText11\">日期<div class=\"protfolioItem\">"
				div_con += "<span class=\"dateMonth\">12</span><span class=\"dateDay\">/15</span></div>"
				div_con += "</div></div></div>"
				div_con += "<div id=\"protfolioImage\">" + $("#js_temp").html() + "</div></div>";
				$("#js_temp").html("");
			};
        };
        
        $("#labsContent").html(div_con);
    };
});
