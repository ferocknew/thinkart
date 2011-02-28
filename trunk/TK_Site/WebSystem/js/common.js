
function switchMenu(){
	var menuObj = parent.document.getElementById("contentFrame");
	var arrowObj = document.getElementById("btm_arrow");
	if(menuObj.cols[0] == 1){
	menuObj.cols = "0,8,*";
	arrowObj.setAttribute('src','images/btm_fold_2.gif');
	}else{
	menuObj.cols = "195,8,*";
	arrowObj.setAttribute('src','images/btm_fold.gif');
	}
}

/*______________________系统框架左右菜单折叠____________________________*/

function highlightButton(s) { 
    if ("INPUT"==event.srcElement.tagName)event.srcElement.className=s}
	
	
/*______________________按钮状态变化____________________________*/
