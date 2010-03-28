// JavaScript Document
$(document).ready(function(){
    $("#create_pj").click(function(){
        if ($("#pj_type").val().length > 0 && $("#pj_start").val().length > 0 && $("#pj_end").val().length > 0 && $("#pj_name").val().length > 0 && $("#pj_desc").val().length > 0 && $("#pj_price").val().length > 0 && $("#pj_pay").val().length > 0) {
            form1.submit();
        }
        else {
            hiOverAlert('数据不完整，请检查！');
        }
    });

    $("#create_dt").click(function(){
        if ($("#pj_name").val().length > 0 && $("#pj_desc").val().length > 0 && $("#pj_dline").val().length > 0) {
            form1.submit();
        }
        else {
            hiOverAlert('数据不完整，请检查！');
        }
    });

    $("#create_ca").click(function(){
        if ($("#work_date").val().length > 0 && $("#work_detail").val().length > 0 && $("#work_result").val().length > 0) {
            form1.submit();
        }
        else {
            hiOverAlert('数据不完整，请检查！');
        }
    });

    $("#create_user").click(function(){
        if ($("#username").val().length > 0 && $("#password").val().length > 0 && $("#tname").val().length > 0) {
            form1.submit();
        }
        else {
            hiOverAlert('数据不完整，请检查！');
        }
    });

    $("#create_cont").click(function(){
        if ($("#cont_num").val().length > 0 && $("#cont_name").val().length > 0) {
            form1.submit();
        }
        else {
            hiOverAlert('数据不完整，请检查！');
        }
    });

    $("#create_custm").click(function(){
        if ($("#infoadder").val().length > 0 && $("#subtype").val().length > 0 && $("#builder").val().length > 0 && $("#cpyname").val().length > 0 && $("#address").val().length > 0 && $("#contact").val().length > 0 && $("#perlevel").val().length > 0 && $("#phonenum").val().length > 0 && $("#securityinfo").val().length > 0) {
            form1.submit();
        }
        else {
            hiOverAlert('数据不完整，请检查！');
        }
    });

    $("#create_bulid").click(function(){
        if ($("#budarea").val().length > 0 && $("#budname").val().length > 0 && $("#budaddress").val().length > 0 && $("#budlv").val().length > 0 && $("#budinfo").val().length > 0) {
            form1.submit();
        }
        else {
            hiOverAlert('数据不完整，请检查！');
        }
    });

    showSubMenu('menu_a');
	//get_file_url
	var get_file_url = get_url_show("end_file");
	switch (get_file_url) {
		//listcontract.asp 合同管理
		case "listcontract.asp":
			showSubMenu('menu_b');
			break;

		default:
		break;
	}
});

function showSubMenu(divName){
    var menuObjs = new Array("menu_a", "menu_b", "menu_c", "menu_d");
    for (i = 0; i < menuObjs.length; i++) {
        var actObj = $("#" + menuObjs[i]);
        actObj.css("display", "none");
    }
    $("#" + divName).css("display", "block");
}

