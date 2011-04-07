<!--#include file="../Adapter/ProductAdapter.asp" -->
<%
'PageDic 分页数据源
If ClassID<>"" Then
	
	End If
set PageDic = ProductManager.GetAllProduct()
%>
<!--#include file="../Scripts/Page.asp" -->
<%
'分页生成 startindex endindex
For i=startindex to endindex
%>

<%Next%>
<%pagename="product_mng.asp"'设置页面URL地址%>
<!--#include file="../Scripts/PageTemplete.asp" -->