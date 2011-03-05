<script type="text/javascript">
function tree_click(obj){
	var lv1open="programsList tree1_open";
	var lv1close="programsList tree1_close";
	var lv1none="programsList tree1_none";
	var lv2open="programsList tree2_open";
	var lv2close="programsList tree2_close";
	var lv2none="programsList tree2_none1";
	var lv2lastopen="programsList tree2_open2";
	var lv2lastclose="programsList tree2_close2";
	var lv2lastnone="programsList tree2_none2";
	var lv3normal="programsList tree3_3";
	var lv3last="programsList tree3_4";
	switch(obj.className){
		case lv1open:
			obj.className=lv1close;
			
			break;
		case lv1close:
			obj.className=lv1open;
		
			break;
		case lv1none:
		
			break;
		case lv2open:
			obj.className=lv2close;
		
			break;
		case lv2close:
			obj.className=lv2open;
		
			break;
		case lv2none:
		
			break;
		case lv2lastopen:
			obj.className=lv2lastclose;
		
			break;
		case lv2lastclose:
			obj.className=lv2lastopen;
		
			break;
		case lv2lastnone:
		
			break;
		case lv3normal:
		
			break;
		case lv3last:
		
			break;
	}
}
function setval(name,id){
	$('#ClassName').val(name);
	$('#ClassID').val(id);
}
function hide_alltrees(){
	$("div[name='div_trees_lv2']").fadeOut();
	$("div[name='div_trees_lv3']").fadeOut();
}
function show_alltrees(){
	$("div[name='div_trees_lv2']").fadeIn();
	$("div[name='div_trees_lv3']").fadeIn();
}
</script>
<%
Set nonSortDic = ContentClassManager.GetAllContentClass(ctype)
Set contentclassDic = Server.CreateObject("Scripting.Dictionary")
strlv1id=""
strlv2id=""
strlv3id=""
strlv1index=""
strlv2index=""
strlv3index=""
strlv2upid=""
strlv3upid=""
Private Function AddStr(str,newstr)
	If str = "" Then
		str = newstr
	Else
		str = str & "," & newstr
	End If
	AddStr = str
End Function
For i = 0 to nonSortDic.count - 1
	If nonSortDic.Items()(i).LV = "1" Then
	 	strlv1id = AddStr(strlv1id,nonSortDic.Items()(i).ID)
	 	strlv1index = AddStr(strlv1index,i)
	ElseIf nonSortDic.Items()(i).LV = "2" Then
		strlv2id = AddStr(strlv2id,nonSortDic.Items()(i).ID)
	 	strlv2index = AddStr(strlv2index,i)
		strlv2upid = AddStr(strlv2upid,nonSortDic.Items()(i).UpClassId)
	ElseIf nonSortDic.Items()(i).LV = "3" Then
		strlv3id = AddStr(strlv3id,nonSortDic.Items()(i).ID)
	 	strlv3index = AddStr(strlv3index,i)
		strlv3upid = AddStr(strlv3upid,nonSortDic.Items()(i).UpClassId)
	End If
Next
arraystrlv1id=Split(strlv1id,",")
arraystrlv2id=Split(strlv2id,",")
arraystrlv3id=Split(strlv3id,",")
arraystrlv1index=Split(strlv1index,",")
arraystrlv2index=Split(strlv2index,",")
arraystrlv3index=Split(strlv3index,",")
arraystrlv2upid=Split(strlv2upid,",")
arraystrlv3upid=Split(strlv3upid,",")
van = false
For i = 0 to ubound(arraystrlv1id)
	contentclassDic.Add nonSortDic.Keys()(arraystrlv1index(i)),nonSortDic.Items()(arraystrlv1index(i))
	For j = 0 to ubound(arraystrlv2id)
		If arraystrlv2upid(j) = arraystrlv1id(i) Then
			If j <> ubound(arraystrlv2id) Then
				If arraystrlv2upid(j) <> arraystrlv2upid(j+1) Then
					nonSortDic.Items()(arraystrlv2index(j)).Style = nonSortDic.Items()(arraystrlv2index(j)).Style & "2"
					van = true
				Else
					van = false
				End If
			Else
				nonSortDic.Items()(arraystrlv2index(j)).Style = nonSortDic.Items()(arraystrlv2index(j)).Style & "2"
				van = true
			End If
			contentclassDic.Add nonSortDic.Keys()(arraystrlv2index(j)),nonSortDic.Items()(arraystrlv2index(j))
			For k = 0 to ubound(arraystrlv3id)
				If arraystrlv3upid(k) = arraystrlv2id(j) Then
					styletype = ""
					If k <> ubound(arraystrlv3id) Then
						If arraystrlv3upid(k) <> arraystrlv3upid(k+1) Then
							If van Then styletype = "2" Else styletype = "4" End If
						Else
							If van Then styletype = "1" Else styletype = "3" End If
						End If
					Else
						If van Then styletype = "2" Else styletype = "4" End If
					End If
					nonSortDic.Items()(arraystrlv3index(k)).Style = nonSortDic.Items()(arraystrlv3index(k)).Style & styletype
					contentclassDic.Add nonSortDic.Keys()(arraystrlv3index(k)),nonSortDic.Items()(arraystrlv3index(k))
				End If
			Next
		End If
	Next
Next
%>
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