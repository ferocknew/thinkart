function selectMenu(menuId,p){
	var menuObjs = new Array("mObj1","mObj2","mObj3","mObj4","mObj5","mObj6","mObj7","mObj8","mObj9","mObj10");
	for(var i = 0;i<= menuObjs.length - 1;i++){
	j = i + 1
	document.getElementById(menuObjs[i]).setAttribute('class','menu_0'+j);
	}
	document.getElementById(menuId).setAttribute('class','menuSelected_0'+p);	
}


/*------------------主菜单选择定位---------------------*/

function selSMenu_2(sMenuId){
	var sMenuObjs = new Array("sMenu1","sMenu2");
	for(var i = 0;i<= sMenuObjs.length - 1;i++){
	j = i + 1
	document.getElementById(sMenuObjs[i]).setAttribute('class','bg_topMenu2 link_white12_b');
	}
	document.getElementById(sMenuId).setAttribute('class','bg_topMenu link_black12_b');	
}
/*------------------长度2的子菜单选中---------------------*/
function selSMenu_3(sMenuId){
	var sMenuObjs = new Array("sMenu1","sMenu2","sMenu3");
	for(var i = 0;i<= sMenuObjs.length - 1;i++){
	j = i + 1
	document.getElementById(sMenuObjs[i]).setAttribute('class','bg_topMenu2 link_white12_b');
	}
	document.getElementById(sMenuId).setAttribute('class','bg_topMenu link_black12_b');	
}
/*------------------长度3的子菜单选中---------------------*/
function selSMenu_4(sMenuId){
	var sMenuObjs = new Array("sMenu1","sMenu2","sMenu3","sMenu4");
	for(var i = 0;i<= sMenuObjs.length - 1;i++){
	j = i + 1
	document.getElementById(sMenuObjs[i]).setAttribute('class','bg_topMenu2 link_white12_b');
	}
	document.getElementById(sMenuId).setAttribute('class','bg_topMenu link_black12_b');	
}
/*------------------长度4的子菜单选中---------------------*/
function selSMenu_8(sMenuId){
	var sMenuObjs = new Array("sMenu1","sMenu2","sMenu3","sMenu4","sMenu5","sMenu6","sMenu7","sMenu8");
	for(var i = 0;i<= sMenuObjs.length - 1;i++){
	j = i + 1
	document.getElementById(sMenuObjs[i]).setAttribute('class','bg_topMenu2 link_white12_b');
	}
	document.getElementById(sMenuId).setAttribute('class','bg_topMenu link_black12_b');	
}
/*------------------长度8的子菜单选中---------------------*/
