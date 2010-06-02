</body>
</html>
<script language="javascript" type="text/javascript" src="lib/js/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="lib/js/xheditor/xheditor-zh-cn.min.js"></script>
<script language="javascript" type="text/javascript" src="fancybox/jquery.mousewheel-3.0.2.pack.js"></script>
<script language="javascript" type="text/javascript" src="fancybox/jquery.fancybox-1.3.1.js"></script>
<script language="javascript" type="text/javascript" src="lib/js/jquery.validate.min.js"></script>
<script language="javascript" type="text/javascript" src="lib/js/jquery.plugin-more.js"></script>
<script language="javascript" type="text/javascript" src="lib/js/lib-little.js"></script>
<script language="javascript" type="text/javascript" src="lib/js/jquery-ui.min.js"></script>
<script language="javascript" type="text/javascript" src="files/js/default.js"></script>

<%
Session(CookieName&"_LastDo") = "" '最近的一次数据库操作
Call CloseDB()
%>