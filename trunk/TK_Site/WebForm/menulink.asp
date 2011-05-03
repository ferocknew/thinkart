<%
title1="行业方案"
title2="产品方案"
title3="如何投保"
title4="理赔咨询"
title5="加入我们"
title6="关于星达"
title7="新闻中心"
title8="下载中心"
banner1="行业方案.jpg"
banner2="产品方案.jpg"
banner3="如何投保.jpg"
banner4="理赔咨询.jpg"
banner5="加入我们.jpg"
banner6="加入我们.jpg"
banner7=""
banner8=""
link1=""
link2=""
link3=""
link4=""
link5=""
link6=""
link7=""
link8=""

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
	ElseIf ContentClassDic.Items()(i).ClassName=title8 Then
		link8=ContentClassDic.Items()(i).ID
	End If
Next
ClassID=Request("ClassID")
showTitle=""
showBanner=""
If ClassID=link1 Then
 showTitle=title1
 showBanner=banner1
ElseIf ClassID=link2 Then
 showTitle=title2
 showBanner=banner2
ElseIf ClassID=link3 Then
 showTitle=title3
 showBanner=banner3
ElseIf ClassID=link4 Then
 showTitle=title4
 showBanner=banner4
ElseIf ClassID=link5 Then
 showTitle=title5
 showBanner=banner5
ElseIf ClassID=link6 Then
 showTitle=title6
 showBanner=banner6
ElseIf ClassID=link7 Then
 showTitle=title7
 showBanner=banner7
ElseIf ClassID=link8 Then
 showTitle=title8
 showBanner=banner8
End If
%>
<%If showBanner<>"" Then%>
<script type="text/javascript">$(function(){$('#banner').css('background-image','url(images/banner/inner/<%=showBanner%>)')})</script>
<%End If%>