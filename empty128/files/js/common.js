// JavaScript Document
$(document).ready(function() {
	
	$("#navi_prot,#navi_prod,#navi_serv,#navi_lab,#navi_about,#navi_contact").hover(
	  function () {
		$(this).addClass("navi_hover");
	  },
	  function () {
		$(this).removeClass("navi_hover");
	  }
	);
	
	$("#navi_prot,#navi_prod,#navi_serv,#navi_lab,#navi_about,#navi_contact,#logo_icon").click(
	  function () {
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
