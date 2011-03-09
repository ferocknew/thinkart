<%
'╭═══════════════说明════════════════════╮
'║═══════════ASP 来路分析系统V3.0简洁版  ════════════║
'║═══════════发布日期：2008-09-29        ════════════║
'║═════════════════════════════════════║
'║═════════════════════════════════════║
'║════ 做人要厚道,转载或使用本程序完全免费!请保留作者信息!  ══════║
'║═════════════════════════════════════║
'║═══  作者:sjmp5  ═══════════════════════════║
'║═══       sadxy  ═══════════════════════════║
'║═══  mail:sjmp5@126.com  ═══════════════════════║
'║═══    QQ:176341052  ═════════════════════════║
'║═════════════════════════════════════║
'║══官方网站:http://www.sjmp5.com   ═══════════════════║
'║══程序演示:http://www.sjmp5.com/LLFenxi/  ═══════════════║
'║═════════════════════════════════════║
'║════你可自由使用及修改,但修改后请发送一份到：sjmp5@126.com  ═════║
'║════版权归SJMP5所有,请加我QQ:176341052  ═══════════════║
'║════如有转载请勿删除以上信息,谢谢合作!  ═══════════════║
'║非常感谢sadxy的支持，你教会了我很多，没有你我可能写不下去了!再一次感谢！  ║
'╰═════════════════════════════════════╯
%>

<!--#include file="config.asp"-->
<%
if session("sjmp5_admin") = "" and session("sjmp5_flag") = "" then
Response.redirect "login.asp"    
end if   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=keystr%>  >>获取代码</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 14px;
}
a:link {
	font-size: 12px;
	color: #000000;
	text-decoration: none;
}
a:visited {
	font-size: 12px;
	text-decoration: none;
	color: #000000;
}
a:hover {
	font-size: 12px;
	text-decoration: none;
	color: #FF0000;
}
a:active {
	font-size: 12px;
	text-decoration: none;
	color: #FF0000;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.del2 {
	font-size: 12px;
	color: #000000;
	text-decoration: none;
}
.del21 {

	text-decoration: none;
}
.pagefx {font-size: 12px; color: #FF0000;}
.STYLE6 {color: #FF0000}
.STYLE8 {color: #FF0000; font-weight: bold; }
-->
</style>

<SCRIPT src="images/date.js" type=text/javascript></SCRIPT>

</head>
<%
Function sjmp5_setup()
exec="delete * from sjmp5_JL"
conn2.execute(exec)
exec="delete * from sjmp5_URL"
conn2.execute(exec)
exec="delete * from sjmp5_IP"
conn2.execute(exec)
exec="delete * from sjmp5_ip_total"
conn2.execute(exec)
exec="delete * from sjmp5_lyhtml"
conn2.execute(exec)
exec="delete * from sjmp5_html"
conn2.execute(exec)
exec="delete * from sjmp5_keyword"
conn2.execute(exec)
exec="delete * from sjmp5_keyword_total"
conn2.execute(exec)
exec="delete * from sjmp5_member"
conn2.execute(exec)
exec="delete * from sjmp5_config"
conn2.execute(exec)
'conn2.close
End function
%>
<%
if trim(request("action"))="setup" then
if request.form("title")<>"" and request.form("url")<>"" and request.form("tj_url")<>""  then
call sjmp5_setup()
'==============================================
exec="select * from sjmp5_jl"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
   rs.close
   sql2="select * from sjmp5_config"
   rs.open sql2,conn2,1,3
   rs.addnew
   rs("sjmp5_config_title")=request.form("title")
   rs("sjmp5_config_name")=request.form("url")
   rs("sjmp5_config_url")=request.form("tj_url")
   rs("sjmp5_config_date")=date()
   rs("sjmp5_config_off")="yes"
   rs.update 
   rs.close
   Response.Write "<script>window.alert('代码生成成功！');javascript:location.href='sjmp5_setup.asp';</script>" 
else
   Response.Write "<script>window.alert('内容不能为空！');javascript:location.href='sjmp5_setup.asp';</script>"
   response.write "不能为空"
   response.end()
end if
end if

if trim(request("action"))="edit_setup" then
if request.form("title")<>"" and request.form("url")<>"" and request.form("tj_url")<>""  then
exec="delete * from sjmp5_config"
conn2.execute(exec)
'==============================================
exec="select * from sjmp5_jl"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
   rs.close
   sql2="select * from sjmp5_config"
   rs.open sql2,conn2,1,3
   rs.addnew
   rs("sjmp5_config_title")=request.form("title")
   rs("sjmp5_config_name")=request.form("url")
   rs("sjmp5_config_url")=request.form("tj_url")
   rs("sjmp5_config_date")=date()
   rs("sjmp5_config_off")="yes"
   rs.update 
   rs.close
   Response.Write "<script>window.alert('修改成功！');javascript:location.href='sjmp5_setup.asp';</script>" 
else
Response.Write "<script>window.alert('修改内容不能为空！');javascript:location.href='sjmp5_setup.asp';</script>"
   response.write "不能为空"
   response.end()
end if
end if
exec="select * from sjmp5_config"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
if rs.bof and rs.eof then

%>

<body>
<form id="form1" name="form1" method="post" action="?action=setup">

<table width="760" border="0" align="center" cellpadding="1" cellspacing="5">
  <tr>
    <td align="center"><h1><%=keystr%></h1></td>
  </tr>
  <tr>
    <td height="30" align="center"><table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
        <tr>
          <td height="80" align="center" bgcolor="#f8f8f9"><h2>系统初始化设置</h2></td>
        </tr>
    </table>	</td>
  </tr>
  <tr align="left">

    <td align="left" valign="top"><table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#eeeeee">系统初始化设置</td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="left" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>

  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">网站名称&nbsp;&nbsp;</td>
    <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="title" type="text" id="title" size="40" />
      <span class="STYLE6">*</span> 填写完整 如：THINKART</td>
  </tr>
  <tr>
    <td width="110" height="25" align="right" bgcolor="#FFFFFF">网站域名&nbsp;&nbsp;</td>
    <td width="631" height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="url" type="text" id="url" size="40" /> 
      <span class="STYLE6">*</span> 填写完整 如：http://www.thinkart.cn</td>
    </tr>
	  <tr>
    <td width="110" height="25" align="right" bgcolor="#FFFFFF">分析系统目录&nbsp;&nbsp;</td>
    <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="tj_url" type="text" id="tj_url" size="40" /> 
      <span class="STYLE6">*</span> 填写完整 如：thinkart/</td>
    </tr>
  <tr>
    <td height="45" colspan="2" align="center" bgcolor="#F8F8F9"><input type="submit" name="Submit" value=" 点这里获取代码 " /></td>
  </tr>
</table></td>
  </tr>
  <tr align="left">
    <td valign="top"></td>
  </tr>
  <tr align="left">
    <td height="45" align="center" valign="middle">系统版本号:<a href="http://www.sjmp5.com/LLFenxi/" target="_blank"> <%=keystr%></a></td>
  </tr>
</table></form>
<br />
<%else
%>
<table width="760" border="0" align="center" cellpadding="5" cellspacing="5">
  <tr>
    <td align="center"><h1><%=keystr%></h1></td>
  </tr>
</table>
<br />
<table width="760" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  
  <tr>
    <td height="60" colspan="3" align="center" bgcolor="#F8F8F8"><h2>统计代码</h2></td>
  </tr>
  <tr>
    <td width="145" align="right" bgcolor="#F8F8F8">JS统计代码&nbsp;</td>
    <td width="373" bgcolor="#FFFFFF"><textarea name="textfield4" cols="55" rows="6"><script src='<%=rs("sjmp5_config_name")%>/<%=rs("sjmp5_config_url")%>get.asp' language='JavaScript' charset='gb2312'></script></textarea></td>
    <td width="232" bgcolor="#FFFFFF"><p>支持统计HTML等静态页面。</p>
    <p><strong>建议使用JS统计！</strong>因为够方便！</p></td>
  </tr>
  <tr>
    <td height="25" colspan="3" bgcolor="#F8F8F8">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#F8F8F8">ASP包含式统计代码&nbsp;</td>
    <td bgcolor="#FFFFFF"><textarea name="textfield5" cols="55" rows="6">
根目录用：&lt;!-- #include file=&quot;<%=rs("sjmp5_config_url")%>jl_inc.asp&quot; --&gt;
	
WAP统计用：&lt;!-- #include file=&quot;<%=rs("sjmp5_config_url")%>jl_wap.asp&quot; --&gt;
    </textarea></td>
    <td bgcolor="#FFFFFF">只能是ASP包含文件，<br />
      ASP整站的可用。<br />
      ASP程序的WAP网站可以使用。<br />
    <span class="STYLE8">不支持统计HTML等静态页面！</span></td>
  </tr>
  <tr>
    <td height="50" colspan="3" align="left" bgcolor="#F8F8F8"><br />
      作者注：<br />
      <br />
      <strong>一、JS统计代码</strong><br />
    <br />
    1、优点：可以统计静态页面<br />
    2、缺点：当用户浏览器禁用JAVA程序时将无法统计该用户。这是绝大多数统计系统都存在的一个缺陷。<br />
    <hr align="left"   height="1">
    <br />
    <strong>二、ASP包含式统计代码</strong><br />
    <br />
    1、优点：让所有访问网站的用户无处可逃...嘎嘎~~~还可以记录&quot;蜘蛛&quot;爬行所抓取页面,让你一目了然.<br />
2、缺点：无法统计ＨＴＭＬ等静态页面，对ASP不了解的用户谨慎使用!<br />
<br /></td>
  </tr>
  
  <tr>
    <td height="45" colspan="3" align="center" bgcolor="#F8F8F8"><a href="?action=edit">重新生成代码</a></td>
  </tr><%if trim(request("action"))="edit" then%>
  <tr>
    <td height="45" colspan="3" align="center" bgcolor="#F8F8F8"><form id="form2" name="form2" method="post" action="?action=edit_setup">

<table width="760" border="0" align="center" cellpadding="1" cellspacing="5">
  <tr align="left">

    <td align="left" valign="top"><table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#eeeeee">重新生成统计代码</td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="left" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>

  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">网站名称&nbsp;&nbsp;</td>
    <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="title" type="text" id="title" value="<%=rs("sjmp5_config_title")%>" size="40" />
      <span class="STYLE6">*</span> 填写完整 如：THINKART</td>
  </tr>
  <tr>
    <td width="110" height="25" align="right" bgcolor="#FFFFFF">网站域名&nbsp;&nbsp;</td>
    <td width="631" height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="url" type="text" id="url" value="<%=rs("sjmp5_config_name")%>" size="40" /> 
      <span class="STYLE6">*</span> 填写完整 如：http://www.thinkart.cn</td>
    </tr>
	  <tr>
    <td width="110" height="25" align="right" bgcolor="#FFFFFF">分析系统目录&nbsp;&nbsp;</td>
    <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="tj_url" type="text" id="tj_url" value="<%=rs("sjmp5_config_url")%>" size="40" /> 
      <span class="STYLE6">*</span> 填写完整 如：thinkart/</td>
    </tr>
  <tr>
    <td height="45" colspan="2" align="center" bgcolor="#F8F8F9"><input type="submit" name="Submit" value=" 点这里 &gt;&gt; 重新生成代码 " /></td>
  </tr>
</table></td>
  </tr>
  <tr align="left">
    <td valign="top"></td>
  </tr>
  <tr align="left">
    <td valign="top">&nbsp;</td>
  </tr>
</table>
</form></td>
  </tr><%
end if%>
  <tr>
    <td height="45" colspan="3" align="center" bgcolor="#F8F8F8">系统版本号:<a href="http://www.sjmp5.com/LLFenxi/" target="_blank"> <%=keystr%> </a></td>
  </tr>
</table>
<%
end if
%>



<p>&nbsp;</p>
</body>
</html>
