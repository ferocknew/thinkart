// JavaScript Document
function msg_Box(content){
		$("#msg_box").html(content);
		$("#msg_box").slideDown('fast');
		$("#msg_box").delay(2000).slideUp('fast');
}

function transBanner(){
	$("#banner").transition({
		duration : 3000,
		images : ['files/images/banner.jpg', 'files/images/banner1.jpg'],
		type : 'fade'
	});
}

function slToggle(divid){
	$("#"+divid).slideToggle("fast");
}

function loadContent(newsid){
	document.getElementById('contentInner').innerHTML = "<img src='files/images/loader.gif' border='0' />";
	$("#contentInner").load('outputNews.asp?newsid='+newsid); 
}

function changeTitle(text){
	document.getElementById('textTitle').innerHTML = text;	
}

function submitData(){
		var yourname = $("#yourname").attr('value');
		var telephone = $("#telephone").attr('value');
		var email = $("#email").attr('value');
		var company = $("#company").attr('value');
		var message = $("#message").attr('value');					
		$.ajax({
		type:"post",
		url:"saveMsg.asp",
		data:"yourname="+ yourname + "&telephone="+ telephone + "&email=" + company + "&company=" + email + "&message=" + message,
		success:function(html){
		msg_Box('谢谢,留言已提交成功 !');
		var yourname = $("#yourname").attr('value','');
		var telephone = $("#telephone").attr('value','');
		var email = $("#email").attr('value','');
		var company = $("#company").attr('value','');
		var message = $("#message").attr('value','');					
		}
	});
}