<!--下载列表-->
<!--接收参数：ClassID pagename 可为空-->
<!--#include file="../Adapter/DownloadFileAdapter.asp" -->
<%
PageDic = ""
'PageDic 分页数据源
If ClassID<>"" Then
	set seaDownloadFile = new DownloadFile
	seaDownloadFile.ClassID = ClassID
	set PageDic = DownloadFileManager.GetDownloadFileByObjDownloadFile(seaDownloadFile)
Else
	set PageDic = DownloadFileManager.GetAllDownloadFile()
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