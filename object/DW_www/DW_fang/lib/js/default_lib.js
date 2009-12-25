//html方式获得系统信息
function loaddoc(json){document.title=json.info.site_name;}
//编辑器
function show_edit(show_item){
	show_item.xheditor(
		true,
		{
		tools:'full',
		skin:"o2007silver",
		upLinkUrl:"upload.asp",
		upLinkExt:"zip,rar,txt",
		upImgUrl:"upload.asp",
		upImgExt:"jpg,jpeg,gif,png",
		upFlashUrl:"upload.asp",
		upFlashExt:"swf",
		upMediaUrl:"upload.asp",
		upMediaExt:"avi"
		});
}