<%
title1="机构简介"
title2="融贷通产品"
title3="热门话题"
title4="专业优势"
title5="成功案例"
title6="融资常识"
title7="联系我们"
link1=""
link2=""
link3=""
link4=""
link5=""
link6=""
link7=""

Set seaContentClass=new ContentClassInfo
seaContentClass.UpClassID="0"
Set ContentClassDic = ContentClassManager.GetContentClassByObjContentClass(seaContentClass)
For i=0 to ContentClassDic.Count-1
	If ContentClassDic.Items()(i).ClassName=title1 Then
		link1=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName=title2 Then
		link2=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName=title3 Then
		link3=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName=title4 Then
		link4=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName=title5 Then
		link5=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName=title6 Then
		link6=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName=title7 Then
		link7=ContentClassDic.Items()(i).ID
	End If
Next
ClassID=Request("ClassID")
showTitle=""
If ClassID=link1 Then
 showTitle=title1
ElseIf ClassID=link2 Then
 showTitle=title2
ElseIf ClassID=link3 Then
 showTitle=title3
ElseIf ClassID=link4 Then
 showTitle=title4
ElseIf ClassID=link5 Then
 showTitle=title5
ElseIf ClassID=link6 Then
 showTitle=title6
ElseIf ClassID=link7 Then
 showTitle=title7
End If
%>