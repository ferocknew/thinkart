$(function($){
    $.get("files/images/lab/info.xml?data="+Date(), function(xml_data){
		var lab_con="";
		$("item",xml_data).each(function(i){
		lab_con += "<div id=\"labItem\"><div class=\"labImage\"><a href=\"files/images/lab/"+$("item:eq("+i+")",xml_data).attr("bimg")+"\"><img src=\"files/images/lab/"+$("item:eq("+i+")",xml_data).attr("simg")+"\"  border=\"0\" /></a></div>"
		lab_con +="<div class=\"labTitleText\">"+$("item:eq("+i+")",xml_data).attr("title")+"</div><div class=\"labText\">"+$("item:eq("+i+")",xml_data).attr("con")+"</div></div>";			
		});
		$("#labsContent").html(lab_con);
    });
});
