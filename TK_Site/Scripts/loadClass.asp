<script type="text/javascript">
function tree_click(obj,objid){
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
			$("div[name='div_trees_lv2']").each(function(){if(this.id.indexOf(objid+"_")!=-1){$(this).fadeOut();}});
			$("div[name='div_trees_lv3']").each(function(){if(this.id.indexOf(objid+"_")!=-1){$(this).fadeOut();}});
			break;
		case lv1close:
			obj.className=lv1open;
			$("div[name='div_trees_lv2']").each(function(){if(this.id.indexOf(objid+"_")!=-1){$(this).fadeIn();}});
			$("div[name='div_trees_lv3']").each(function(){if(this.id.indexOf(objid+"_")!=-1){$(this).fadeIn();}});
			break;
		case lv1none:
		
			break;
		case lv2open:
			obj.className=lv2close;
			$("div[name='div_trees_lv3']").each(function(){if(this.id.indexOf(objid+"_")!=-1){$(this).fadeOut();}});
			break;
		case lv2close:
			obj.className=lv2open;
			$("div[name='div_trees_lv3']").each(function(){if(this.id.indexOf(objid+"_")!=-1){$(this).fadeIn();}});
			break;
		case lv2none:
		
			break;
		case lv2lastopen:
			obj.className=lv2lastclose;
			$("div[name='div_trees_lv3']").each(function(){if(this.id.indexOf(objid+"_")!=-1){$(this).fadeOut();}});
			break;
		case lv2lastclose:
			obj.className=lv2lastopen;
			$("div[name='div_trees_lv3']").each(function(){if(this.id.indexOf(objid+"_")!=-1){$(this).fadeIn();}});
			break;
		case lv2lastnone:
		
			break;
		case lv3normal:
		
			break;
		case lv3last:
		
			break;
	}
}
function setval(name,id,divid){
	$('#ClassName').val(name);
	$('#ClassID').val(id);
	try{$('#'+$('#DivID').val()).css({"background":"None"});}catch(e){}
	$('#DivID').val(divid);
	$('#'+$('#DivID').val()).css({"background":"#cccccc"});
}
function hide_alltrees(){
	$("div[name='div_trees_lv1_class']").each(function(){if(this.className=="programsList tree1_open"){this.className="programsList tree1_close";}});
	$("div[name='div_trees_lv2']").fadeOut();
	$("div[name='div_trees_lv3']").fadeOut();
}
function show_alltrees(){
	$("div[name='div_trees_lv1_class']").each(function(){if(this.className=="programsList tree1_close"){this.className="programsList tree1_open";}});
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
Next
%>