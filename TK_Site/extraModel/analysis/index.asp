<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="config.asp"-->
<%
search=replace(replace(replace(replace(replace(replace(request("search"),"'",""),"#",""),Chr(34),""),"?","")," ",""),"=","")
if search<>"" then
	if isdate(request("search")) then 
	else 
		response.write "日期格式错误" 
		response.end()
	end if
else
search=date()
end if
%>

<head>
<link href="../../WebSystem/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../WebSystem/css/font_link.css" rel="stylesheet" type="text/css" />
<title><%=keystr%></title>
<SCRIPT src="images/date.js" type=text/javascript></SCRIPT>
</head>

<body>
<!-- #include file="sjmp5_top.asp" -->
<div class="content_ctrlbar text_deepGray12_b">
  <table style="float:left;" border="0" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <tr>
      <td><FORM style="background:none;" name=searchForm action=? >
              按日期查看:
<INPUT 
name=search id=time_end value="<%=search%>" size=11 readonly> 
              <IMG 
src="images/date.gif" width="36" height="19" align="absmiddle" class=dtm 
onclick="date_init(this,'time_end')" 
onmouseover="this.src='images/btn_on_cal.gif'" 
onmouseout="this.src='images/btn_off_cal.gif'"> &nbsp;
<INPUT class=button type=submit value=" 查看 "> </FORM></td>
    </tr>
  </table>
  <span style="float:right;"cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <!--#include file="search_tj_inc.asp"-->
  </span>
</div>
<div class="flowContent text_deepGray12">

  <script language="javascript">
    function searchOrder()
    {
        listTable.filter['order_sn'] = Utils.trim(document.forms['searchForm'].elements['order_sn'].value);
        listTable.filter['consignee'] = Utils.trim(document.forms['searchForm'].elements['consignee'].value);
        listTable.filter['composite_status'] = document.forms['searchForm'].elements['status'].value;
		
		listTable.filter['time_start'] = Utils.trim(document.forms['searchForm'].elements['time_start'].value);
        listTable.filter['time_end'] = Utils.trim(document.forms['searchForm'].elements['time_end'].value);
		listTable.filter['time_type'] = Utils.trim(document.forms['searchForm'].elements['time_type'].value);
		
        listTable.filter['page'] = 1;
        listTable.loadList();
    }
	    function check()
		

		
    {
	
      var snArray = new Array();
      var eles = document.forms['listForm'].elements;
      for (var i=0; i<eles.length; i++)
      {
        if (eles[i].tagName == 'INPUT' && eles[i].type == 'checkbox' && eles[i].checked && eles[i].value != 'on')
        {
          snArray.push(eles[i].value);
        }
      }
      if (snArray.length == 0)
      {
        return false;
      }
      else
      {
        eles['order_id'].value = snArray.toString();
        return true;
      }
    }
	function date_init(obj,name)
{
	var D;
	
	var oInput	= document.getElementById(name);
	var sRetVal	= oInput.returnValue;

	if ( (sRetVal) && sRetVal.length > 0)
	{
		D = ParseUtcDate(sRetVal);
	}
	else
	{
		D = new Date();
	}

	InitCalendar( parent.ORG_DATE_FORMAT, parent.ORG_DATE_SEPARATOR, parent.ORG_DATE_START_DAY, null, null);
	
	LaunchCalendar(oInput, D);
}
	</script> 
<table width="100%" border="0" cellpadding="0" cellspacing="2">
  <tr>
    <td><table class="flowTable" width="100%" border="0" cellpadding="0" cellspacing="0">

        <th height="30" colspan="3" class="text_white12_b">链接来源统计 TOP 10 </th>
      </tr>
      <%
exec="select top 10 * from sjmp5_url where sjmp5_url_date=#"&search&"# order by sjmp5_url_hits desc,sjmp5_url_id asc"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  if rs.bof and rs.eof then
%>
      <tr>
        <td height="25" colspan="3" align="left">没有数据记录!</td>
      </tr>
      <%
else
do while not rs.eof
dim ii
ii=ii+1
  %>
      <tr>
        <td width="50" height="25" align="left"><%=ii%></td>
        <td width="333" align="left"><a href="search_lyhtml.asp?search_url=<%=rs("sjmp5_url_name")%>&search=<%=search%>"><%=rs("sjmp5_url_name")%></a>
</td>
        <td width="60" height="25" align="right"><font color="#339933"><%=rs("sjmp5_url_hits")%></font>次&nbsp;</td>
      </tr>
<%
rs.movenext 
loop
rs.close
%>
      <tr>
        <td style="background:#e6e6e6;" height="28" colspan="3" align="center" valign="middle"><p><a href="search_html_ly.asp?search=<%=search%>"><%=search%>记录访问：<font color="#339933">
            <%
rs.open "select sum(sjmp5_url_hits) from sjmp5_url where sjmp5_url_date=#"&search&"# "
response.write rs(0)
%>
              </font>次</a></p></td>
      </tr>
      <%end if%>
    </table></td>
    <td><table class="flowTable" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#dddddd">
      <tr>
        <th height="30" colspan="4" align="center" class="text_white12_b">独立IP请求记录 TOP 10 </th>
    </tr>
      <%
exec="select top 10 * from sjmp5_ip where sjmp5_ip_date=#"&search&"# order by sjmp5_ip_hits desc,sjmp5_ip_id asc "
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  if rs.bof and rs.eof then
%>
      <tr>
        <td height="25" colspan="4" align="left">&nbsp; 没有数据记录! </td>
      </tr>
      <%
else
do while not rs.eof
dim i
i=i+1
  %>
      <tr>
        <td width="49" height="25" align="left" valign="middle">&nbsp;<%=i%></td>
        <td width="110" align="left" valign="middle">&nbsp;&nbsp;<a href='sjmp5_ip_to_url.asp?ip=<%=rs("sjmp5_ip_ip")%>&amp;did=<%=date()%>' target='_blank' title='查看详情'> <%=rs("sjmp5_ip_ip")%></a></td>
        <td width="203" align="left" valign="middle">&nbsp;&nbsp;<%=rs("sjmp5_ip_lyurl")%></td>
        <td width="61" height="25" align="right" valign="middle"><font color="#339933"><%=rs("sjmp5_ip_hits")%></font>次&nbsp;</td>
      </tr>
<%
rs.movenext 
loop
rs.close
%>
      <tr>
        <td style="background:#e6e6e6;" height="28" colspan="4" align="center"><p><a href="search_ip.asp?search=<%=search%>"><%=search%>来访独立IP ：<font color="#339933"> <%
rs.open "select sum(sjmp5_ip_fxip) from sjmp5_ip where sjmp5_ip_date=#"&search&"# "
response.write rs(0)
%></font>个</a></p></td>
      </tr>
      <%end if%>
  </table></td>
  </tr>
  <tr>
    <td><table class="flowTable" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th class="text_white12_b" height="30" colspan="3" align="center">受访页面排名 TOP 10 </th>
    </tr>
      <%
exec="select top 10 * from sjmp5_html where sjmp5_html_date=#"&search&"# order by sjmp5_html_hits desc ,sjmp5_html_id asc"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  if rs.bof and rs.eof then 
%>
      <tr>
        <td height="25" colspan="3" align="left">&nbsp;没有数据记录!</td>
      </tr>
      <%else
do while not rs.eof
dim iimember
iimember=iimember+1
  %>
      <tr>
        <td width="49" height="25" align="left">&nbsp;<%=iimember%></td>
        <td width="334" height="25" align="left">&nbsp;&nbsp;<a href="<%=rs("sjmp5_html_url")%>" title="<%=rs("sjmp5_html_url")%>"  target="_blank"> <%=rs("sjmp5_html_url")%></a></td>
        <td width="60" align="right"><font color="#339933"><%=rs("sjmp5_html_hits")%></font>次&nbsp;</td>
      </tr>
<%
rs.movenext 
loop
rs.close
%>
      <tr>
        <td style="background:#e6e6e6;" height="28" colspan="3" align="center"><p><a href="search_html.asp?search=<%=search%>"><%=search%> 有 <font color="#339933">
<%
rs.open "select sum(sjmp5_html_tj) from sjmp5_html where sjmp5_html_date=#"&search&"# "
response.write rs(0)
%>
              </font> 页受访问</a></p></td>
      </tr>
      <%end if%>
  </table></td>
    <td><table class="flowTable" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th class="text_white12_b" height="30" colspan="3" align="center"> 关键字 排名 TOP 10 </th>
    </tr>
      <%
exec="select top 10 * from sjmp5_keyword where sjmp5_keyword_date=#"&search&"# order by sjmp5_keyword_hits desc,sjmp5_keyword_id asc "
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  if rs.bof and rs.eof then
%>
      <tr>
        <td height="25" colspan="3" align="left">&nbsp;没有数据记录! &nbsp; </td>
      </tr>
      <%
else
do while not rs.eof
dim iikey
iikey=iikey+1
  %>
      <tr>
        <td width="41" height="25" align="left">&nbsp;<%=iikey%> &nbsp;</td>
        <td width="325" height="25" align="left">&nbsp;&nbsp;<a href='search_keyword.asp?search_key=<%=rs("sjmp5_keyword_name")%>&amp;search=<%=search%>' title='关键字:[<%=rs("sjmp5_keyword_name")%>]'  target='_blank'> <%=rs("sjmp5_keyword_name")%></a> &nbsp;</td>
        <td width="60" align="right"><font color="#339933"><%=rs("sjmp5_keyword_hits")%></font>次&nbsp;</td>
      </tr>
<%
rs.movenext 
loop
rs.close
%>
      <tr>
        <td style="background:#e6e6e6;" height="28" colspan="3" align="center"><p><a href="search_keyword.asp?search=<%=search%>"><%=search%> 有 <font color="#339933">
            <%
rs.open "select sum(sjmp5_keyword_tj) from sjmp5_keyword where sjmp5_keyword_date=#"&search&"# "
response.write rs(0)
%>
        </font> 个关键字</a></p></td>
      </tr>
      <%end if%>
  </table></td>
  </tr>
</table>

  
  
  
  

<!-- #include file="sjmp5_foot.asp" -->
</div>

</body>
</html>
