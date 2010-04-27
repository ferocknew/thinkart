<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim NewsId,SQL,NewsCon
NewsId=Easp.RQ("id",0) '新闻ID
SQL="Select id,title,content From [news] where (id="&NewsId&")"
Set NewsCon=Jexs.ADO2Obj(SQL,Conn,1)  '新闻数据库操作
%>
<div id="logo"></div>
<div id="container">
	<div id="navigation">
		<div id="naviLeft">
			<ul>
				<li><a href="#" class="naviLeft">公司新闻</a></li>
				<li><a href="#" class="naviLeft">行业新闻</a></li>
			</ul>
		</div>
	</div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/title_news.gif" />
		<hr />
		<h1><%=NewsCon.[0].title%></h1>
		<%=NewsCon.[0].content%>
		<div class="contentEnd"><a href="news.asp"><img src="files/images/button_newsBackList.gif" border="0" align="right" /></a></div>
	</div>
	<!--#include file="files/inc/inner-foot-a.asp" -->
</div>
<!--#include file="lib/foot.asp" -->