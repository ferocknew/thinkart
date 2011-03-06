<!--#include file="loadClass.asp"-->
<div class="add_right link_deepGray12_b">
<table width="230" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>所属分类 
      <input name="ClassName" type="text" class="add_grayInput" id="ClassName" value="请选择分类" readonly="readonly" />
      <input name="ClassID" type="hidden" id="ClassID" value="" />
    </td>
  </tr>
  <tr>
    <td>      <span class="text_gray12_b">选择分类：</span> <a href="#" onclick="hide_alltrees()"><img src="images/ico_showList.gif" align="middle" /> 全部折叠</a>&nbsp;&nbsp; <a href="#" onclick="show_alltrees()"><img src="images/ico_hideList.gif" align="middle" /> 全部展开</a></td>
  </tr>
  <tr>
    <td style="height:385px; border:1px dashed #999; margin-bottom:10px;">
        <div class="programs text_deepGray12_b">
            <%For i = 0 to contentclassDic.count - 1%>
            <div id="div_trees_<%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>">
          <div class="programsList tree<%=contentclassDic.Items()(i).LV%>_<%=contentclassDic.Items()(i).Style%>" style="float:left; cursor:pointer" onclick="tree_click(this);"></div>
            <div class="programsList_text" style="cursor:pointer" onclick="setval('<%=contentclassDic.Items()(i).ClassName%>','<%=contentclassDic.Items()(i).ID%>');"><%=contentclassDic.Items()(i).ClassName%></div></div>
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