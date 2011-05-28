<%
If setpagesize="" Then setpagesize=12 End If
If pageindex="" Then pageindex="1" End If
pageindex=CInt(pageindex)
setpagecount=Int((PageDic.Count-1)/setpagesize) + 1
lastpage=pageindex-1
nextpage=pageindex+1
If lastpage <= 1 Then
	lastpage = 1
End If
If nextpage >= setpagecount Then
	nextpage = setpagecount
End If
startindex=(pageindex-1)*setpagesize
endindex=startindex+setpagesize-1
If endindex >= PageDic.Count-1 Then
	endindex=PageDic.Count-1
End If
%>