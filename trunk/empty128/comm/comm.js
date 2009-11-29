$(function(){
	var con="";
    $.get("show_file.asp", {Folder: "/images"},
	function(xml_data){
        $("Path_file",xml_data).each(function(i){
			con+="<img src=\""+$("Path_file:eq("+i+")",xml_data).attr("Path")+"\"/><br/><br/>"
		});
		$("#body").html(con)
    });
});