</body>
</html>
<%
Session(CookieName&"_LastDo") = "" '最近的一次数据库操作
Call CloseDB()
%>
<script type="text/javascript">
  <!--
  $(function () {
	if($.browser.msie&& $.browser.version<7){
	   document.documentElement.onscroll=fun;
	}
  });
  function fun(){
	 var H=$(window).height();
	 var W=$(window).width();
	 var scrollTop=document.documentElement.scrollTop;
	 var h=$("#fixed").height();
	 var w=$("#fixed").width();
	 $("#fixed").css({top:scrollTop+H-h,left:W-w});
	 //alert(H+","+W+","+h+","+w+","+scrollTop);
  }  
 // -->
</script>