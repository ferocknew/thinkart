<!--分类列表-->
<!--接收参数：jumpurl paraname CType sc不可为空-->
<%
sc=Request("sc")'showcontent 即左侧菜单是否显示内容 不显示即为列表
If sc = "" Then sc="true" End If
CType=Request("CType")
If CType = "" Then CType="1" End If
If jumpurl = "" Or paraname = "" Or showpage = "" Then
	If CType = "1" Then
		jumpurl="../PlugIn/ContentList.asp"
		showpage="../PlugIn/ContentDetail.asp"
	ElseIf CType = "2" Then
		jumpurl="../PlugIn/ProductList.asp"
		showpage="../PlugIn/ProductDetail.asp"
	ElseIf CType = "3" Then
		jumpurl="../PlugIn/DownloadList.asp"
		showpage="../PlugIn/DownloadDetail.asp"
	End If
		paraname = "ClassID"
End If
ClassID=Request("ClassID")
If ClassID = "" Then ClassID = "0" End If
%>
<%
Set nonSortDic = ContentClassManager.GetAllContentClass(CType)
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
	'contentclassDic.Add nonSortDic.Keys()(arraystrlv1index(i)),nonSortDic.Items()(arraystrlv1index(i))
If ClassID = nonSortDic.Items()(arraystrlv1index(i)).ID Then
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
			nonSortDic.Items()(arraystrlv2index(j)).HisId = arraystrlv1id(i) &"_"
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
					nonSortDic.Items()(arraystrlv3index(k)).HisId = arraystrlv1id(i) &"_"& arraystrlv2id(j) &"_"
					contentclassDic.Add nonSortDic.Keys()(arraystrlv3index(k)),nonSortDic.Items()(arraystrlv3index(k))
				End If
			Next
		End If
	Next
End If
Next
%>
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
			$("li[name='div_trees_lv2']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideUp("fast");}});
			$("li[name='div_trees_lv3']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideUp("fast");}});
			$("li[name='div_trees_content']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideUp("fast");}});
			break;
		case lv1off:
			$("li[name='div_trees_lv1']").each(function(){if(this.id!=obj.id){this.className=lv1off;}});
			obj.className=lv1on;
			$("li[name='div_trees_lv2']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideDown("fast");}else{$(this).slideUp("fast");}});
			$("li[name='div_trees_lv3']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideDown("fast");}else{$(this).slideUp("fast");}});
			$("li[name='div_trees_content']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideDown("fast");}else{$(this).slideUp("fast");}});
			break;
		case lv2on:
			obj.className=lv2off;
			$("li[name='div_trees_lv3']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideUp("fast");}});
			$("li[name='div_trees_content']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideUp("fast");}});
			break;
		case lv2off:
			$("li[name='div_trees_lv2']").each(function(){if(this.id!=obj.id){this.className=lv2off;}});
			obj.className=lv2on;
			$("li[name='div_trees_lv3']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideDown("fast");}else{$(this).slideUp("fast");}});
			$("li[name='div_trees_content']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideDown("fast");}else{$(this).slideUp("fast");}});
			break;
		case lv3on:
			obj.className=lv3off;
			$("li[name='div_trees_content']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideUp("fast");}});
			break;
		case lv3off:
			$("li[name='div_trees_lv3']").each(function(){if(this.id!=obj.id){this.className=lv3off;}});
			obj.className=lv3on;
			$("li[name='div_trees_content']").each(function(){if(this.id.indexOf(obj.id+"_")!=-1){$(this).slideDown("fast");}else{$(this).slideUp("fast");}});
			break;
	}
}
function checkcontent(obj){
	var lv1on="leftMenu_1_on";
	var lv1off="leftMenu_1";
	var lv2on="leftMenu_2_on";
	var lv2off="leftMenu_2";
	var lv3on="leftMenu_3_on";
	var lv3off="leftMenu_3";
	$("li[name='div_trees_content']").each(function(){if(this.id!=obj.id){this.className='leftMenu_content';}});
	$("li[name='div_trees_lv3']").each(function(){if(obj.id.indexOf(this.id)!=-1 && this.className!=lv3on){this.click();}});
	$("li[name='div_trees_lv2']").each(function(){if(obj.id.indexOf(this.id)!=-1 && this.className!=lv2on){this.click();}});
	obj.className='leftMenu_content_on';
}
			$(function()
			{
				// this initialises the demo scollpanes on the page.
				$('#tree_area').jScrollPane();
				//$("li[name='div_trees_lv2']").slideUp("fast");
				//$("li[name='div_trees_lv3']").slideUp("fast");
				//<%If sc="true" Then%>$("li[name='div_trees_content']").slideUp("fast");<%End If%>
			});
</script>
<%For i = 0 to contentclassDic.count - 1%>
    <li id="div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>" name="div_trees_lv<%=contentclassDic.Items()(i).LV%>" style="cursor:pointer" class="leftMenu_<%=contentclassDic.Items()(i).LV%>" onclick="showtree_click(this);<%If sc<>"true" Then%>loadHTML('<%=jumpurl%>?ClassID=<%=contentclassDic.Items()(i).ID%>')<%End If%>"><%=contentclassDic.Items()(i).ClassName%></li>
<%If sc="true" Then
    If contentclassDic.Items()(i).Style<>"open" and contentclassDic.Items()(i).Style<>"open2" Then
    	set seaContent = new Content
		seaContent.ClassID = contentclassDic.Items()(i).ID
		set showContentDic = ContentManager.GetContentByObjContent(seaContent)
        For j = 0 to showContentDic.Count-1%>
			<li id="div_trees_<%=contentclassDic.Items()(i).HisId%><%=contentclassDic.Items()(i).ID%>_content_<%=showContentDic.Items()(j).ID%>" name="div_trees_content" class="leftMenu_content" style="cursor:pointer" onclick="checkcontent(this);loadHTML('<%If showContentDic.Items()(j).CType="0" Then%><%=showpage%>?cid=<%=showContentDic.Items()(j).ID%><%Else%>../WebForm/innerPages/<%=showContentDic.Items()(j).HtmlFile%><%End If%>')"><%=showContentDic.Items()(j).Title%></li>
		<%Next
    End If
End If%>
<%Next%>
<%If contentclassDic.count = 0 Then%>
	<%If sc = "true" Then%>
		<%
		showContentDic=""
		If CType="1" Then
			set seaContent = new Content
			seaContent.ClassID = ClassID
			set showContentDic = ContentManager.GetContentByObjContent(seaContent)
		ElseIf CType="2" Then
			set seaContent = new Product
			seaContent.ClassID = ClassID
			set showContentDic = ProductManager.GetProductByObjProduct(seaContent)
		ElseIf CType="3" Then
			set seaContent = new DownloadFile
			seaContent.ClassID = ClassID
			set showContentDic = DownloadFileManager.GetDownloadFileByObjDownloadFile(seaContent)
		End If
		For j = 0 to showContentDic.Count-1%>
			<li id="div_trees_content_<%=showContentDic.Items()(j).ID%>" name="div_trees_content" class="leftMenu_content" style="cursor:pointer" onclick="checkcontent(this);loadHTML('<%If CType="1" Then%><%If showContentDic.Items()(j).CType="0" Then%><%=showpage%>?cid=<%=showContentDic.Items()(j).ID%><%Else%>../WebForm/innerPages/<%=showContentDic.Items()(j).HtmlFile%><%End If%><%Else%><%=showpage%>?cid=<%=showContentDic.Items()(j).ID%><%End If%>')"><%If CType<>"3" Then%><%=showContentDic.Items()(j).Title%><%Else%><%=showContentDic.Items()(j).ShowName%><%End If%></li>
		<%Next%>
    <%Else%>
    	<script type="text/javascript">$(function(){loadHTML('<%=jumpurl%>?ClassID=<%=ClassID%>')});</script>
	<%End If%>
<%End If%>
