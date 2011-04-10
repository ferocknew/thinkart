<!--分类列表-->
<!--接收参数：jumpurl paraname CType 不可为空-->
<%
If jumpurl = "" Or paraname = "" Then
	jumpurl="ContentList.asp"
	paraname = "cid"
End If
If CType = "" Then CType="1" End If
%>
<!--#include file="../Scripts/loadClass.asp"-->
<script language="javascript" src="../include/jScrollPane/jScrollPane.js"></script>
<script language="javascript" src="../include/jScrollPane/mousewheel.js"></script>
<link href="../include/jScrollPane/jScrollPane.css" rel="stylesheet" type="text/css" />
<script language="javascript">
			$(function()
			{
				// this initialises the demo scollpanes on the page.
				$('#tree_area').jScrollPane();
			});
</script>
<%For i = 0 to contentclassDic.count - 1%>
    <li class="leftMenu_<%=contentclassDic.Items()(i).LV%>" onclick="window.location=='<%=jumpurl%>?<%=paraname%>=<%=contentclassDic.Items()(i).ID%>'"><%=contentclassDic.Items()(i).ClassName%></li>
<%Next%>