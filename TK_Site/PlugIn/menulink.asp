<%
hyfa=""
cpfa=""
rhtb=""
lpzx=""
jrwm=""

Set seaContentClass=new ContentClassInfo
seaContentClass.UpClassID="0"
Set ContentClassDic = ContentClassManager.GetContentClassByObjContentClass(seaContentClass)
For i=0 to ContentClassDic.Count-1
	If ContentClassDic.Items()(i).ClassName="行业方案" Then
		hyfa=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName="产品方案" Then
		cpfa=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName="如何投保" Then
		rhtb=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName="理赔咨询" Then
		lpzx=ContentClassDic.Items()(i).ID
	ElseIf ContentClassDic.Items()(i).ClassName="加入我们" Then
		jrwm=ContentClassDic.Items()(i).ID
	End If
Next
%>