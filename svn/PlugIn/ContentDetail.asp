<!--产品信息-->
<!--接收参数：cid 不可为空-->
<!--#include file="../Code/Service/DBHelper.asp" -->
<!--#include file="../Code/Adapter/ContentAdapter.asp" -->
<%
cid=Request("cid")
If Not IsNumeric(cid) Then cid = 0 End If
set showContent = ContentManager.GetContentById(cid)
%>
<%=showContent.Title%><br />
<%=showContent.Content%>
<script type="text/javascript">
try{$('#Content_title').val('<%=showContent.Title%>');}catch(e){}
try{$('#Content_Keywords').val('<%=showContent.Keywords%>');}catch(e){}
try{$('#Content_Abstract').val('<%=showContent.Abstract%>');}catch(e){}
try{$('#Content_Content').val('<%=showContent.Content%>');}catch(e){}
try{$('#Content_Lasttime').val('<%=showContent.Lasttime%>');}catch(e){}
try{$('#Content_SyncBlog').val('<%=showContent.SyncBlog%>');}catch(e){}
try{$('#Content_CType').val('<%=showContent.CType%>');}catch(e){}
try{$('#Content_ClassName').val('<%=showContent.ClassName%>');}catch(e){}
try{$('#Content_Img').attr('src','<%=showContent.Img%>');}catch(e){}
try{$('#Content_HtmlFile').attr('src','../WebForm/innerPages/<%=showContent.HtmlFile%>');}catch(e){}
</script>