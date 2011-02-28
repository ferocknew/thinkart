<%Session.CodePage=65001%>
<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>睿邦新能源</title>
<script language="javascript" src="files/js/jquery-1.4.2.min.js"></script>
<script language="javascript" src="files/js/common.js"></script>
<link href="files/css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
news_id = request("news_id")
if news_id = 0 then load_id = 32
if news_id = 1 then load_id = 32
if news_id = 2 then load_id = 35
if news_id = 3 then load_id = 37
if news_id = 4 then load_id = 38
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM news where class1id = 1"
rs.OPEN sql,Conn,1,1
%>
<body onLoad="loadContent('<%=load_id%>');changeTitle('');">
<div id="container">
    <!--#include file="inc_header.asp" -->
  <div id="content">
    <div id="contentLeft">
      <h3>我们的产品</h3>
      <ul>
        <li><a href="javascript:slToggle('submenu1');"><span class="fontGreen">01/</span>地源热泵 </a></li>
        <ul id="submenu1">
        <li class="naviLeft"><a href="javascript:loadContent('32');">土壤换热器 -</a></li>
        <li class="naviLeft"><a href="javascript:loadContent('33');">主机 -</a></li>
        <li class="naviLeft"><a href="javascript:loadContent('34');">风机盘管 -</a></li>
        </ul>
        <li><a href="javascript:slToggle('submenu2');"><span class="fontGreen">02/</span>水处理</a></li>
        <ul id="submenu2">
        <li class="naviLeft"><a href="javascript:loadContent('35');">软水 -</a></li>
        <li class="naviLeft"><a href="javascript:loadContent('36');">净水 -</a></li>
        </ul>
        <li><a href="javascript:loadContent('37');"><span class="fontGreen">03/</span>生活热水 </a></li>
        <li><a href="javascript:loadContent('38');"><span class="fontGreen">04/</span>新风除湿 </a></li>
      </ul>
    </div>
    <div id="contentRight">
      <h2 id="textTitle">起源与发展</h2>
      <div id="innerBanner"><img src="files/images/banner_01.jpg" width="730" height="117" /></div>
      <div id="contentInner">
        <h1>&nbsp;</h1>
</div>
    </div>
  </div>
    <!--#include file="inc_footer.asp" -->
</div>
</body>
</html>
