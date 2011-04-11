<!--分类列表-->
<!--接收参数：jumpurl paraname CType 不可为空-->
<%
If jumpurl = "" Or paraname = "" Then
	jumpurl="../PlugIn/ContentList.asp"
	paraname = "ClassID"
End If
CType=Request("CType")
If CType = "" Then CType="1" End If
%>
<!--#include file="../Scripts/loadClass.asp"-->
<script language="javascript" src="../include/jScrollPane/jScrollPane.js"></script>
<script language="javascript" src="../include/jScrollPane/mousewheel.js"></script>
<link href="../include/jScrollPane/jScrollPane.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function showtree_click(obj){
	var lv1on="leftMenu_1_on";
	var lv1off="leftMenu_1";
	var lv2on="leftMenu_2_on";
	var lv2off="leftMenu_2";
	var lv3on="leftMenu_3_on";
	var lv3off="leftMenu_3";
	switch(obj.className){
		case lv1on:
			obj.className=lv1off;
			$("li[name='div_trees_lv2']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).fadeOut();}});
			$("li[name='div_trees_lv3']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).fadeOut();}});
			break;
		case lv1off:
			obj.className=lv1on;
			$("li[name='div_trees_lv2']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).fadeIn();}});
			$("li[name='div_trees_lv3']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).fadeIn();}});
			break;
		case lv2on:
			obj.className=lv2off;
			$("li[name='div_trees_lv3']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).fadeOut();}});
			break;
		case lv2off:
			obj.className=lv2on;
			$("li[name='div_trees_lv3']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).fadeIn();}});
			break;
		case lv3on:
			obj.className=lv3off;
		
			break;
		case lv3off:
			obj.className=lv3on;
		
			break;
	}
}
			$(function()
			{
				// this initialises the demo scollpanes on the page.
				$('#tree_area').jScrollPane();
				$("li[name='div_trees_lv2']").fadeOut();
				$("li[name='div_trees_lv3']").fadeOut();
			});
</script>
<%For i = 0 to contentclassDic.count - 1%>
    <li id="div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>" style="cursor:pointer" class="leftMenu_<%=contentclassDic.Items()(i).LV%>" onclick="<%If contentclassDic.Items()(i).Style="open" or contentclassDic.Items()(i).Style="open2" Then%>showtree_click(this)<%Else%>this.className='leftMenu_<%=contentclassDic.Items()(i).LV%>_on';loadHTML('<%=jumpurl%>?<%=paraname%>=<%=contentclassDic.Items()(i).ID%>')<%End If%>"><%=contentclassDic.Items()(i).ClassName%></li>
<%Next%>