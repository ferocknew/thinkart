<!--产品信息-->
<!--接收参数：pid 不可为空-->
<!--#include file="../Adapter/ProductAdapter.asp" -->
<%
If Not IsNumeric(pid) Then pid = 0 End If
set showProduct = ProductManager.GetProductById(pid)
%>
<script type="text/javascript">
try{$('#Product_title').val('<%=showProduct.Title%>');}catch(e){}
try{$('#Product_ProductName').val('<%=showProduct.ProductName%>');}catch(e){}
try{$('#Product_Keywords').val('<%=showProduct.Keywords%>');}catch(e){}
try{$('#Product_Abstract').val('<%=showProduct.Abstract%>');}catch(e){}
try{$('#Product_Content').val('<%=showProduct.Content%>');}catch(e){}
try{$('#Product_Price').val('<%=showProduct.Price%>');}catch(e){}
try{$('#Product_VIPPrice').val('<%=showProduct.VIPPrice%>');}catch(e){}
try{$('#Product_ProductCount').val('<%=showProduct.ProductCount%>');}catch(e){}
try{$('#Product_ClassName').val('<%=showProduct.ClassName%>');}catch(e){}
try{$('#Product_Img1').attr('src','<%=showProduct.Img1%>');}catch(e){}
try{$('#Product_Img2').attr('src','<%=showProduct.Img2%>');}catch(e){}
try{$('#Product_Img3').attr('src','<%=showProduct.Img3%>');}catch(e){}
try{$('#Product_Img4').attr('src','<%=showProduct.Img4%>');}catch(e){}
</script>