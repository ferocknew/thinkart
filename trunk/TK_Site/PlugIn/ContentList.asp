<!--内容列表-->
<!--接收参数：ClassID pagename showpage可为空-->
<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/ContentAdapter.asp"-->
<%
jumpstyle="load"
pagename="../PlugIn/ContentList.asp"
showpage="../PlugIn/ContentDetail.asp"
PageDic = ""
'PageDic 分页数据源
ClassID=Request("ClassID")
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
<li style="cursor:pointer" onclick="<%If jumpstyle="load" Then%>loadHTML('<%=showpage%>?cid=<%=PageDic.Items()(i).ID%>')<%Else%>window.location='<%=showpage%>?cid=<%=PageDic.Items()(i).ID%>'<%End If%>"><%=rowindex%>. <%=PageDic.Items()(i).Title%></li>
<%rowindex = rowindex + 1%>
<%Next%>
<!--#include file="../Scripts/PageTemplete.asp" -->