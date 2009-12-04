// JavaScript Document
$(document).ready(function() {
	
	$("#navi_home,#navi_prot,#navi_prod,#navi_serv,#navi_lab,#navi_about,#navi_contact").hover(
	  function () {
		$(this).addClass("navi_hover");
	  },
	  function () {
		setTimeout($(this).removeClass("navi_hover"),3000);
	  }
	);
	
	$("#navi_home,#navi_prot,#navi_prod,#navi_serv,#navi_lab,#navi_about,#navi_contact,#logo_icon").click(
	  function () {
		if($(this).attr('id') == "navi_home"){document.location = 'index.html';}
		if($(this).attr('id') == "navi_prot"){document.location = 'protfolio.html';}
		if($(this).attr('id') == "navi_prod"){document.location = 'products.html';}
		if($(this).attr('id') == "navi_serv"){document.location = 'service.html';}
		if($(this).attr('id') == "navi_lab"){document.location = 'lab.html';}
		if($(this).attr('id') == "navi_about"){document.location = 'about.html';}
		if($(this).attr('id') == "navi_contact"){document.location = 'contact.html';}
		if($(this).attr('id') == "logo_icon"){document.location = 'index.html';}
	  }
	);
	
    $("#thinker,#answer").hover(
	  function () {
		$(this).addClass("productNameHover");
	  },
	  function () {
		$(this).removeClass("productNameHover");
	  }
	);
})
//---------------------------- 导航菜单CSS触发访问 --------------------------------

$(document).ready(function(){        
	$("#saveData").click(function(){          
			submitData();                                        
		  });
});

function submitData(){
  $.ajax({                                                 
    type: "POST",                                          
    url: "savedata.asp",                                       
    data: "userName="+$("#userName").val()+"&emailAdd="+$("#emailAdd").val()+"&telephone="+$("#telephone").val()+"&company="+$("#company").val()+"&siteAddress="+$("#siteAddress").val()+"&item1="+$("#item1").val()+"&item2="+$("#item2").val()+"&item3="+$("#item3").val()+"&item4="+$("#item4").val()+"&item5="+$("#item5").val()+"&item6="+$("#item6").val()+"&description="+$("#description").val()+"&progress="+$("#progress").val()+"&budget="+$("#budget").val(),     
    success: function(msg){
      hiOverAlert('需求提交完成！我们会及时联系您！');
    }     
  });    	
}
//---------------------------- CONTACT 表单数据传递 --------------------------------
