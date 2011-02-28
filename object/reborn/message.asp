<%Session.CodePage=65001%>
<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="javascript" src="files/js/jquery-1.4.2.min.js"></script>
<script language="javascript" src="files/js/common.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>睿邦新能源</title>
<link href="files/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
    <!--#include file="inc_header.asp" -->
  <div id="content">
    <div id="contentLeft">
      <h3>快速导航</h3>
      <ul>
        <li><a href="#"><span class="fontGreen">01/</span>地源热泵 </a></li>
        <li class="naviLeft"><a href="#">土壤换热器 -</a></li>
        <li class="naviLeft"><a href="#">主机 -</a></li>
        <li class="naviLeft"><a href="#">风机盘管 -</a></li>
        <li><a href="#"><span class="fontGreen">02/</span>水处理 </a></li>
        <li><a href="#"><span class="fontGreen">03/</span>生活热水 </a></li>
        <li><a href="#"><span class="fontGreen">04/</span>新风除湿 </a></li>
      </ul>
    </div>
    <div id="contentRight">
      <h2>在线留言</h2>
      <div id="innerBanner"><img src="files/images/banner_01.jpg" width="730" height="117" /></div>
        <div id="contactMessage"> 
          <h1>写下您的意见，我们将在一周给给您回复： </h1>
          <div id="map">
<iframe width="450" height="250" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=zh-CN&amp;geocode=&amp;q=%E4%B8%AD%E5%B1%B1%E8%A5%BF%E8%B7%AF+%E8%99%B9%E6%A1%A5%E9%93%B6%E5%9F%8E%E5%A4%A7%E5%8E%A6&amp;sll=31.203059,121.412842&amp;sspn=0.009599,0.01796&amp;ie=UTF8&amp;hq=%E8%99%B9%E6%A1%A5%E9%93%B6%E5%9F%8E%E5%A4%A7%E5%8E%A6&amp;hnear=%E4%B8%AD%E5%9B%BD%E4%B8%8A%E6%B5%B7%E5%B8%82%E4%B8%AD%E5%B1%B1%E8%A5%BF%E8%B7%AF&amp;ll=31.201606,121.413496&amp;spn=0.004588,0.009634&amp;z=16&amp;output=embed"></iframe><br />          
          </div>
          <p>您的姓名（必填）
            <br />
            <input type="text" name="yourname" id="yourname" />
            <br />
            电话/传真
            <br />
            <input type="text" name="telephone" id="telephone" />
            <br />
            邮箱（必填）<br />
            <input type="text" name="email" id="email" />
            <br />
            公司<br />
            <input type="text" name="company" id="company" />
            <br />
            意见（必填）<br />
            <textarea name="message" rows="5" id="message"></textarea>
          </p>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="100"><table width="80" height="27" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="messageMenu" onmouseover="this.className = 'btmmsg';" onmouseout="this.className = 'messageMenu';" onclick="javascript:submitData();">&nbsp;</td>
                </tr>
              </table></td>
              <td>
              <div id="msg_box"></div>
              </td>
            </tr>
          </table>
      </div>
    </div>
  </div>
  <!--#include file="inc_footer.asp" -->
</div>
</body>
</html>
