// JavaScript Document
$(document).ready(function(){        
	$("#create_pj").click(function(){          
			if($("#pj_type").val().length > 0 && $("#pj_start").val().length > 0 && $("#pj_end").val().length > 0 && $("#pj_name").val().length > 0 && $("#pj_desc").val().length > 0 && $("#pj_price").val().length > 0 && $("#pj_pay").val().length > 0){
			form1.submit();	
			}else{
      		hiOverAlert('数据不完整，请检查！');
			}
		  });
	showSubMenu('menu_a');
});

function showSubMenu(divName){
	var menuObjs = new Array("menu_a","menu_b","menu_c","menu_d");
	for(i=0;i<menuObjs.length;i++){
	var actObj = $("#"+menuObjs[i]);
	actObj.css("display","none");
	}
	$("#"+divName).css("display","block");
}
