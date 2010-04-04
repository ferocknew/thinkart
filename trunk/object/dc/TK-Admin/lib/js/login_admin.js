var err_msg = getvalue("msg");
switch (err_msg) {
    case "err_name":
        $("#show_alert").text("用户名错误！");
        break;
    case "err_ps":
        $("#show_alert").text("密码错误！");
        break;
    case "loginout":
        $("#show_alert").text("您已登出...");
        break;
    default:
}
$(".setLoginInput").focus(function(){
    $(this).val("")
});

$("#form1").submit(function(){
    if ($.trim($("#username").val()) == "") {
        $("#show_alert").text("用户名为空！");
        return false;
    }
    if ($.trim($("#password").val()) == "") {
        $("#show_alert").text("密码为空！");
        return false;
    }
});
