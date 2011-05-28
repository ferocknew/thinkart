<!--下载列表-->
<!--接收参数：ClassID pagename 可为空-->
<!--#include file="../Code/Service/DBHelper.asp"-->
<!--#include file="../Code/Adapter/DownloadFileAdapter.asp" -->
<%
PageDic = ""
'PageDic 分页数据源
pagename="../PlugIn/DownloadList.asp"
showpage="../PlugIn/DownloadDetail.asp"
ClassID=Request("ClassID")
pageindex=Request("Page")
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
<li><%=rowindex%>. <a href="<%=PageDic.Items()(i).FileName%>"><%=PageDic.Items()(i).ShowName%></a></li>
<%rowindex = rowindex + 1%>
<%Next%>
<!--#include file="../Scripts/PageTemplete.asp" -->