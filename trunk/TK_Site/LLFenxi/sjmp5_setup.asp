<%
'�q�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T˵���T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�r
'�U�T�T�T�T�T�T�T�T�T�T�TASP ��·����ϵͳV3.0����  �T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T�T�T�T�T�T�T�T�T�������ڣ�2008-09-29        �T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T�T ����Ҫ���,ת�ػ�ʹ�ñ�������ȫ���!�뱣��������Ϣ!  �T�T�T�T�T�T�U
'�U�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T  ����:sjmp5  �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T       sadxy  �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T  mail:sjmp5@126.com  �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T    QQ:176341052  �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�ٷ���վ:http://www.sjmp5.com   �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T������ʾ:http://www.sjmp5.com/LLFenxi/  �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T�T�������ʹ�ü��޸�,���޸ĺ��뷢��һ�ݵ���sjmp5@126.com  �T�T�T�T�T�U
'�U�T�T�T�T��Ȩ��SJMP5����,�����QQ:176341052  �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�T�T�T�T����ת������ɾ��������Ϣ,лл����!  �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�U
'�U�ǳ���лsadxy��֧�֣���̻����Һܶ࣬û�����ҿ���д����ȥ��!��һ�θ�л��  �U
'�t�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�s
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
<title><%=keystr%>  >>��ȡ����</title>
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
   Response.Write "<script>window.alert('�������ɳɹ���');javascript:location.href='sjmp5_setup.asp';</script>" 
else
   Response.Write "<script>window.alert('���ݲ���Ϊ�գ�');javascript:location.href='sjmp5_setup.asp';</script>"
   response.write "����Ϊ��"
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
   Response.Write "<script>window.alert('�޸ĳɹ���');javascript:location.href='sjmp5_setup.asp';</script>" 
else
Response.Write "<script>window.alert('�޸����ݲ���Ϊ�գ�');javascript:location.href='sjmp5_setup.asp';</script>"
   response.write "����Ϊ��"
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
          <td height="80" align="center" bgcolor="#f8f8f9"><h2>ϵͳ��ʼ������</h2></td>
        </tr>
    </table>	</td>
  </tr>
  <tr align="left">

    <td align="left" valign="top"><table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#eeeeee">ϵͳ��ʼ������</td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="left" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>

  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">��վ����&nbsp;&nbsp;</td>
    <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="title" type="text" id="title" size="40" />
      <span class="STYLE6">*</span> ��д���� �磺THINKART</td>
  </tr>
  <tr>
    <td width="110" height="25" align="right" bgcolor="#FFFFFF">��վ����&nbsp;&nbsp;</td>
    <td width="631" height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="url" type="text" id="url" size="40" /> 
      <span class="STYLE6">*</span> ��д���� �磺http://www.thinkart.cn</td>
    </tr>
	  <tr>
    <td width="110" height="25" align="right" bgcolor="#FFFFFF">����ϵͳĿ¼&nbsp;&nbsp;</td>
    <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="tj_url" type="text" id="tj_url" size="40" /> 
      <span class="STYLE6">*</span> ��д���� �磺thinkart/</td>
    </tr>
  <tr>
    <td height="45" colspan="2" align="center" bgcolor="#F8F8F9"><input type="submit" name="Submit" value=" �������ȡ���� " /></td>
  </tr>
</table></td>
  </tr>
  <tr align="left">
    <td valign="top"></td>
  </tr>
  <tr align="left">
    <td height="45" align="center" valign="middle">ϵͳ�汾��:<a href="http://www.sjmp5.com/LLFenxi/" target="_blank"> <%=keystr%></a></td>
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
    <td height="60" colspan="3" align="center" bgcolor="#F8F8F8"><h2>ͳ�ƴ���</h2></td>
  </tr>
  <tr>
    <td width="145" align="right" bgcolor="#F8F8F8">JSͳ�ƴ���&nbsp;</td>
    <td width="373" bgcolor="#FFFFFF"><textarea name="textfield4" cols="55" rows="6"><script src='<%=rs("sjmp5_config_name")%>/<%=rs("sjmp5_config_url")%>get.asp' language='JavaScript' charset='gb2312'></script></textarea></td>
    <td width="232" bgcolor="#FFFFFF"><p>֧��ͳ��HTML�Ⱦ�̬ҳ�档</p>
    <p><strong>����ʹ��JSͳ�ƣ�</strong>��Ϊ�����㣡</p></td>
  </tr>
  <tr>
    <td height="25" colspan="3" bgcolor="#F8F8F8">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#F8F8F8">ASP����ʽͳ�ƴ���&nbsp;</td>
    <td bgcolor="#FFFFFF"><textarea name="textfield5" cols="55" rows="6">
��Ŀ¼�ã�&lt;!-- #include file=&quot;<%=rs("sjmp5_config_url")%>jl_inc.asp&quot; --&gt;
	
WAPͳ���ã�&lt;!-- #include file=&quot;<%=rs("sjmp5_config_url")%>jl_wap.asp&quot; --&gt;
    </textarea></td>
    <td bgcolor="#FFFFFF">ֻ����ASP�����ļ���<br />
      ASP��վ�Ŀ��á�<br />
      ASP�����WAP��վ����ʹ�á�<br />
    <span class="STYLE8">��֧��ͳ��HTML�Ⱦ�̬ҳ�棡</span></td>
  </tr>
  <tr>
    <td height="50" colspan="3" align="left" bgcolor="#F8F8F8"><br />
      ����ע��<br />
      <br />
      <strong>һ��JSͳ�ƴ���</strong><br />
    <br />
    1���ŵ㣺����ͳ�ƾ�̬ҳ��<br />
    2��ȱ�㣺���û����������JAVA����ʱ���޷�ͳ�Ƹ��û������Ǿ������ͳ��ϵͳ�����ڵ�һ��ȱ�ݡ�<br />
    <hr align="left"   height="1">
    <br />
    <strong>����ASP����ʽͳ�ƴ���</strong><br />
    <br />
    1���ŵ㣺�����з�����վ���û��޴�����...�¸�~~~�����Լ�¼&quot;֩��&quot;������ץȡҳ��,����һĿ��Ȼ.<br />
2��ȱ�㣺�޷�ͳ�ƣȣԣ̵ͣȾ�̬ҳ�棬��ASP���˽���û�����ʹ��!<br />
<br /></td>
  </tr>
  
  <tr>
    <td height="45" colspan="3" align="center" bgcolor="#F8F8F8"><a href="?action=edit">�������ɴ���</a></td>
  </tr><%if trim(request("action"))="edit" then%>
  <tr>
    <td height="45" colspan="3" align="center" bgcolor="#F8F8F8"><form id="form2" name="form2" method="post" action="?action=edit_setup">

<table width="760" border="0" align="center" cellpadding="1" cellspacing="5">
  <tr align="left">

    <td align="left" valign="top"><table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#eeeeee">��������ͳ�ƴ���</td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="left" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>

  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">��վ����&nbsp;&nbsp;</td>
    <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="title" type="text" id="title" value="<%=rs("sjmp5_config_title")%>" size="40" />
      <span class="STYLE6">*</span> ��д���� �磺THINKART</td>
  </tr>
  <tr>
    <td width="110" height="25" align="right" bgcolor="#FFFFFF">��վ����&nbsp;&nbsp;</td>
    <td width="631" height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="url" type="text" id="url" value="<%=rs("sjmp5_config_name")%>" size="40" /> 
      <span class="STYLE6">*</span> ��д���� �磺http://www.thinkart.cn</td>
    </tr>
	  <tr>
    <td width="110" height="25" align="right" bgcolor="#FFFFFF">����ϵͳĿ¼&nbsp;&nbsp;</td>
    <td height="25" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;
      <input name="tj_url" type="text" id="tj_url" value="<%=rs("sjmp5_config_url")%>" size="40" /> 
      <span class="STYLE6">*</span> ��д���� �磺thinkart/</td>
    </tr>
  <tr>
    <td height="45" colspan="2" align="center" bgcolor="#F8F8F9"><input type="submit" name="Submit" value=" ������ &gt;&gt; �������ɴ��� " /></td>
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
    <td height="45" colspan="3" align="center" bgcolor="#F8F8F8">ϵͳ�汾��:<a href="http://www.sjmp5.com/LLFenxi/" target="_blank"> <%=keystr%> </a></td>
  </tr>
</table>
<%
end if
%>



<p>&nbsp;</p>
</body>
</html>
