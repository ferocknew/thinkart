$(function ()
{
	admin_menu_click($(".rightBorder1px[get_html='system_edit']"));
	if($(".edit_val").length)
	{
		$(".edit_val").click(function ()
		{
			$("#top_menu_val").val($(this).attr("val_date"));
			$("#add_menu_form").attr("action","action_save.asp?act=edit_top_menu&id="+$(this).attr("menu_id"));
			$("#add_menu").val("修改");
		});
	};
});