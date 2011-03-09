<%
Function sjmp5_geturl(path)
sjmp5_geturl = left(path,instrRev(path,"/"))
End Function
url="http://"&Request.ServerVariables("http_host")&sjmp5_geturl(Request.ServerVariables("url"))
%>
document.write("<script src='<%=url%>lailufenxi.asp?sjmp5_getlyurl="+escape(document.referrer)+"&sjmp5_geturl="+escape(window.location.href)+"'></script>");
