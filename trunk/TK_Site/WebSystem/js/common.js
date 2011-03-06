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

function clsTip(){
	$("#img_tip").hide();	
}
/*______________________清空file控件框提示____________________________*/

function selContentType(words,types){
	var fieldTitleObj = document.getElementById('field_title');
	fieldTitleObj.innerHTML = words;
	var dataContentObj = document.getElementById('data_content');
	var htmlContentObj = document.getElementById('html_content');
	if(types == "datas"){
	dataContentObj.style.display = 'block';
	htmlContentObj.style.display = 'none';
	}else{
	dataContentObj.style.display = 'none';
	htmlContentObj.style.display = 'block';
	}
}
