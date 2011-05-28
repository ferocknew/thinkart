<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<%
search_key=request("search_key")
search=replace(replace(replace(replace(replace(replace(request("search"),"'",""),"#",""),Chr(34),""),"?","")," ",""),"=","")
if search<>"" then
	if isdate(request("search")) then 
	else 
		response.write "日期格式不正确" 
		response.end()
	end if
else
search=date()
end if
%>
<!--#include file="config.asp"-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../WebSystem/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../WebSystem/css/font_link.css" rel="stylesheet" type="text/css" />
<title>关键字排名 >><%=keystr%></title>
<SCRIPT src="images/date.js" type=text/javascript></SCRIPT>
</head>
<body>
<!-- #include file="sjmp5_top.asp" -->
<div class="content_ctrlbar text_deepGray12_b">
  <table style="float:left;" border="0" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <tr>
      <td><FORM style="background:none;" name=searchForm action=? >
              按日期查看: <INPUT 
name=search id=time_end value="<%=search%>" size=11 readonly> 
              <IMG src="images/date.gif" width="36" height="19" align="absmiddle" class=dtm onClick="date_init(this,'time_end')" onMouseOver="this.src='images/btn_on_cal.gif'" onMouseOut="this.src='images/btn_off_cal.gif'"> &nbsp;
  <INPUT class=button type=submit value=" 查看 "> <input type="hidden" name="search_key" value="<%=search_key%>" /></FORM></td>
    </tr>
  </table>
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
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="5">

  <tr align="left">
    <td width="50%" align="left" valign="top">	
	<%if request("search_key")<>"" then%>
<table class="flowTable" width="100%" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <th class="text_white12_b" height="30" colspan="2" align="center">关键字:<font color="#339933"><b><%=search_key%></b></font></th>
  </tr>
<%
exec="select * from sjmp5_keyword where sjmp5_keyword_name='"&search_key&"' and sjmp5_keyword_date=#"&search&"# "
set rs=server.createobject("adodb.recordset")
'response.write exec
'response.End()
rs.open exec,conn2,1,1
if rs.bof and rs.eof then
response.write "<tr><td height=25 colspan=2 align=center bgcolor=#FFFFFF>&nbsp;没有数据记录!</td></tr>"
else
key_id=200
%>
<%if rs("sjmp5_keyword_baidu")>0 then%>
  <tr>
    <td width="60" height="25" align="center">百度:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_baidu")/rs("sjmp5_keyword_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_baidu")/rs("sjmp5_keyword_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_baidu")%>次)
	</td>
  </tr><%end if 
  if rs("sjmp5_keyword_google")>0 then%>
  <tr>
    <td width="60" height="25" align="center">谷歌:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_google")/rs("sjmp5_keyword_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_google")/rs("sjmp5_keyword_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_google")%>次)</td>
    </tr><%end if 
	if rs("sjmp5_keyword_soso")>0 then%>
  <tr>
    <td width="60" height="25" align="center">搜搜:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_soso")/rs("sjmp5_keyword_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_soso")/rs("sjmp5_keyword_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_soso")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_sogou")>0 then%>
  <tr>
    <td width="60" height="25" align="center">搜狗:</td>
    <td width="376" height="25" align="left"><img src='images/smallbg.jpg' width='<%=fix(rs("sjmp5_keyword_sogou")/rs("sjmp5_keyword_hits")*key_id)%>'  height='10'>&nbsp;<%=fix(rs("sjmp5_keyword_sogou")/rs("sjmp5_keyword_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_sogou")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_yahoo")>0 then%>
  <tr>
    <td width="60" height="25" align="center">雅虎:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_yahoo")/rs("sjmp5_keyword_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_yahoo")/rs("sjmp5_keyword_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_yahoo")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_youdao")>0 then%>
  <tr>
    <td width="60" height="25" align="center">有道:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_youdao")/rs("sjmp5_keyword_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_youdao")/rs("sjmp5_keyword_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_youdao")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_msn")>0 then%>
  <tr>
    <td width="60" height="25" align="center">MSN:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_msn")/rs("sjmp5_keyword_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_msn")/rs("sjmp5_keyword_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_msn")%>次)</td>
  </tr><%end if 
  if rs("sjmp5_keyword_qt")>0 then%>
  <tr>
    <td width="60" height="25" align="center">其它:</td>
    <td width="376" height="25" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_qt")/rs("sjmp5_keyword_hits")*key_id)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_qt")/rs("sjmp5_keyword_hits")*100)%>%&nbsp;(<%=rs("sjmp5_keyword_qt")%>次)</td>
  </tr>  
<%end if
end if
%>
</table>
<%end if%>
	</td>
    <td width="50%" align="right" valign="top">	
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" class="flowTable">
  <tr>
    <th class="text_white12_b" colspan="3" align="center">[ <%=search%> ] 关键字 排名</th>
  </tr>	
 <%
rs.close
 rs.open "select sum(sjmp5_keyword_hits) from sjmp5_keyword where sjmp5_keyword_date=#"&search&"# "
key_tj=rs(0)
rs.close
%>
  <%
  
exec="select * from sjmp5_keyword where sjmp5_keyword_date=#"&search&"# order by sjmp5_keyword_hits desc "
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1

  if rs.bof and rs.eof then
response.write "<tr><td height=25 colspan=3 align=center bgcolor=#FFFFFF> &nbsp;没有数据记录!</td></tr>"
else
do while not rs.eof
dim iikey
iikey=iikey+1
  %>
  <tr>
    <td width="40" height="25" align="left">&nbsp;<%=iikey%> &nbsp;</td>
    <td width="228" height="25" align="left">&nbsp;<a href='search_keyword.asp?search_key=<%=rs("sjmp5_keyword_name")%>&search=<%=search%>' title='受访次数:<%=rs("sjmp5_keyword_hits")%>' >
    <%=rs("sjmp5_keyword_name")%></a>   &nbsp;</td>
    <td width="188" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_keyword_hits")/key_tj*150)%> height=10>&nbsp;<%=fix(rs("sjmp5_keyword_hits")/key_tj*100)%>%&nbsp;(<font color="#339933"><%=rs("sjmp5_keyword_hits")%></font>)</td>
  </tr><%
rs.movenext 
loop
rs.close
%>
  <tr>
    <td height="28" colspan="3" align="center"><p><%=search%>  有 <font color="#339933">
<%
rs.open "select sum(sjmp5_keyword_tj) from sjmp5_keyword where sjmp5_keyword_date=#"&search&"# "
response.write rs(0)
rs.close
%>
</font> 个关键字</td><%end if%>
  </tr>
</table>
</td>
  </tr>
  <tr align="left">
    <td colspan="2" valign="top">
</td>
  </tr>
  <tr align="left">
    <td colspan="2" valign="top"><!-- #include file="sjmp5_foot.asp" --></td>
  </tr>
</table>
</body>
</html>
