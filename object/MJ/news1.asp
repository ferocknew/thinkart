<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim NewsId,SQL,NewsCon
NewsId=Easp.RQ("id",0) '新闻ID
Newstype=Easp.RQ("type",0) '新闻ID

If Newstype="" Then
	NewsBack="news.asp"
Else
	NewsBack="member.asp"
End If

SQL="Select id,title,content,class2id From [news] where (id="&NewsId&")"
Set NewsCon=Jexs.ADO2Obj(SQL,Conn,1)  '新闻数据库操作

If NewsCon.[0].class2id=70 Then
titleimgurl="title_cnews.gif"
Else
titleimgurl="title_news.gif"
End If
%>
<div id="logo"></div>
<div id="container">
	<div id="navigation">
		<div id="naviLeft">
			<ul>
				<li><a href="news.asp?type=com" class="naviLeft">公司新闻</a></li>
				<li><a href="news.asp?type=industry" class="naviLeft">行业新闻</a></li>
			</ul>
		</div>
	</div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/<%=titleimgurl%>" />
		<hr />
		<h1><%=NewsCon.[0].title%></h1>
		<%=NewsCon.[0].content%>
		<div class="contentEnd"><a href="<%=NewsBack%>"><img src="files/images/button_newsBackList.gif" border="0" align="right" /></a></div>
	</div>
	<!--#include file="files/inc/inner-foot-a.asp" -->
</div>
<!--#include file="lib/foot.asp" -->
<script>
$(function(){
	var gettype=getvalue("type");
	if(gettype=="member"){
		$("#naviLeft").hide();
		$("#content>img").eq(0).hide();
	}
})
</script>