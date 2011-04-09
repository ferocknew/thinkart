<!--内容列表-->
<!--接收参数：ClassID pagename 可为空-->
<!--#include file="../Adapter/ContentAdapter.asp" -->
<%
PageDic = ""
'PageDic 分页数据源
If ClassID<>"" Then
	set seaContent = new Content
	seaContent.ClassID = ClassID
	set PageDic = ContentManager.GetContentByObjContent(seaContent)
Else
	set PageDic = ContentManager.GetAllContent()
End If
%>
<!--#include file="../Scripts/Page.asp" -->
<%
rowindex = 1
'分页生成 startindex endindex
For i=startindex to endindex
%>
<li><%=rowindex%>. <%=PageDic.Items()(i).Title%></li>
<%rowindex = rowindex + 1%>
<%Next%>
<!--#include file="../Scripts/PageTemplete.asp" -->