<!--#include file="const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="header_commad.asp" -->
<!--#include file="header_html.asp" -->
<%
Response.Write(site_url)
%>
<script>
$(function(){
$.getJSON("xmlout/inf_xmlout.asp?code=json", function(json){
  alert(json.info.site_name);
});

})
</script>
<!--#include file="foot.asp" -->