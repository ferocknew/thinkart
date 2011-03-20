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
<div class="add_right link_deepGray12_b">
<table width="230" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>所属分类 
      <input name="ClassName" type="text" class="add_grayInput" id="ClassName" value="请选择分类" readonly="readonly" />
      <input name="ClassID" type="hidden" id="ClassID" value="" />
      <input name="DivID" type="hidden" id="DivID" value="" />
    </td>
  </tr>
  <tr>
    <td>      <span class="text_gray12_b">选择分类：</span> <a href="#" onclick="hide_alltrees()"><img src="images/ico_showList.gif" align="middle" /> 全部折叠</a>&nbsp;&nbsp; <a href="#" onclick="show_alltrees()"><img src="images/ico_hideList.gif" align="middle" /> 全部展开</a></td>
  </tr>
  <tr>
    <td valign="top" class="programs">
        <div id="tree_area" class="programsDiv text_deepGray12_b">
            <%For i = 0 to contentclassDic.count - 1%>
            <div class="programsItem" id="div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>">
          <div class="programsList tree<%=contentclassDic.Items()(i).LV%>_<%=contentclassDic.Items()(i).Style%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>_class" onclick="tree_click(this,'div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>');"></div>
            <div class="programsList_text" onclick="setval('<%=contentclassDic.Items()(i).ClassName%>','<%=contentclassDic.Items()(i).ID%>','div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>');"><%=contentclassDic.Items()(i).ClassName%></div></div>
<%Next%>
        </div>
	</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#CCCCCC">上次选择的分类： <img src="images/ico_tag.gif" align="middle" /> 行业新闻</td>
  </tr>
  <tr></tr>
</table>
</div>