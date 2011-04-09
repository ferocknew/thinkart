<!--分类列表-->
<!--接收参数：jumpurl paraname 不可为空-->
<%
If jumpurl = "" Or paraname = "" Then
	jumpurl="ContentList.asp"
	paraname = "cid"
End If
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
<div id="tree_area" class="programsDiv text_deepGray12_b">
    <%For i = 0 to contentclassDic.count - 1%>
    <div class="programsItem" id="div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>">
  		<div class="programsList tree<%=contentclassDic.Items()(i).LV%>_<%=contentclassDic.Items()(i).Style%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>_class" onclick="tree_click(this,'div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>');"></div>
    	<div class="programsList_text" onclick="window.location=='<%=jumpurl%>?<%=paraname%>=<%=contentclassDic.Items()(i).ID%>'"><%=contentclassDic.Items()(i).ClassName%></div>
    </div>
<%Next%>
</div>