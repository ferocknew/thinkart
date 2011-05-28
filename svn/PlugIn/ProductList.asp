<!--产品列表-->
<!--接收参数：ClassID pagename 可为空-->
<!--#include file="../Adapter/ProductAdapter.asp" -->
<%
PageDic = ""
'PageDic 分页数据源
If ClassID<>"" Then
	set seaProduct = new Product
	seaProduct.ClassID = ClassID
	set PageDic = ProductManager.GetProductByObjProduct(seaProduct)
Else
	set PageDic = ProductManager.GetAllProduct()
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