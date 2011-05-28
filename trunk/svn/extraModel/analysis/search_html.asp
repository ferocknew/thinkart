<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 

<!--#include file="config.asp"-->
<%
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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../WebSystem/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../WebSystem/css/font_link.css" rel="stylesheet" type="text/css" />
<title><%=keystr%>  >> 受访页面排名</title>
<SCRIPT src="images/date.js" type=text/javascript></SCRIPT>
</head>
<body>
<!--#include file="sjmp5_top.asp"-->
<div class="content_ctrlbar text_deepGray12_b">
  <table style="float:left;" border="0" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <tr>
      <td><FORM style="background:none;" name=searchForm action=? >
              按日期查看: <INPUT 
name=search id=time_end value="<%=search%>" size=11 readonly> 
              <IMG 
src="images/date.gif" width="36" height="19" align="absmiddle" class=dtm 
onclick="date_init(this,'time_end')" 
onmouseover="this.src='images/btn_on_cal.gif'" 
onmouseout="this.src='images/btn_off_cal.gif'"> &nbsp;
  <INPUT class=button type=submit value=" 查看 "> </FORM></td>
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
<span style="float:right;"cellpadding="0" cellspacing="0" class="link_deepGray12_b">
    <!--#include file="search_tj_inc.asp"-->
  </span>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="flowTable">
  <tr>
    <th class="text_white12_b" height="30" colspan="3" align="center"><b>受访页面排行榜</b>( <%=search%>有<font color="#339933">
<%
rs.close
rs.open "select sum(sjmp5_html_tj) from sjmp5_html where sjmp5_html_date=#"&search&"# "
response.write rs(0)
rs.close
rs.open "select sum(sjmp5_html_hits) from sjmp5_html where sjmp5_html_date=#"&search&"# "
key_tj=rs(0)
rs.close
%>

</font> 页受访问 ) </td>
  </tr><%
exec="select top 10 * from sjmp5_html where sjmp5_html_date=#"&search&"# order by sjmp5_html_hits desc"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
  page=request.QueryString("page")
   if IsNumeric(page) then
            page=cint(page)
            if page<1 then page=1 
         else 
            page=1 
         end if
  everypage=pagekeyfenxi          
  rs.pagesize=everypage
  if rs.bof and rs.eof then
  response.write "<tr><td colspan=3 align=left bgcolor=#FFFFFF>没有数据记录!</td></tr>"
  else
  page_count=rs.pagecount
  rs.AbsolutePage=page
  do while not rs.eof and j<rs.pagesize
dim iimember
iimember=iimember+1
  %>
  <tr>
    <td width="39" height="25" align="left">&nbsp;<%=iimember%></td>
    <td width="278" height="25" align="left">&nbsp;&nbsp;<a href="<%=rs("sjmp5_html_url")%>" title='<%=rs("sjmp5_html_url")%>'  target="_blank">
    <%=rs("sjmp5_html_url")%></a></td>
    <td width="160" align="left"><img src="images/smallbg.jpg" width=<%=fix(rs("sjmp5_html_hits")/key_tj*150)%> height=10>&nbsp;<%=fix(rs("sjmp5_html_hits")/key_tj*100)%>%&nbsp;&nbsp;(<font color="#339933"><%=rs("sjmp5_html_hits")%></font>次)&nbsp;</td>
  </tr><%
   j=j+1
  rs.movenext
  loop
%>
<%end if%>
</table>
<div style="float:left;" class="page_style text_deepGray12_b link_deepGray12_b">
  <%
if page=1 then
   else
 Response.Write"<a href=?search="&search&"&page=1>首页</a>&nbsp;"
 Response.Write"<a href=?search="&search&"&page="&page-1&"><img src='../../WebSystem/images/btm_prevPage.gif' align='top' /></a>"
 end if
 %>
  <%for j=page-4 to page-1%>
  <%if j>0 then%>
  <a href="?search=<%=search%>&amp;page=<%=j%>"><%=j%></a>&nbsp;&nbsp;
  <%end if%>
  <%next%>
  <%
 for j=page to page+4
%>
  <% if j<=page_count then%>
  <%if j=page then%>
  <span class="text_gray12_b"><%=j%>&nbsp;</span>
  <%else%>
  <a href="?search=<%=search%>&amp;page=<%=j%>"><%=j%></a>
  <%end if%>
  <%end if%>
  <%next%>
  <%if page<page_count then%>
  <a href='?search=<%=search%>&amp;page=<%=page+1%>'><img src="../../WebSystem/images/btm_nextPage.gif" align="top" /></a> &nbsp;<a href='?search=<%=search%>&amp;page=<%=page_count%>'>尾页</a>
  <%else
end if%>
</div>
<!-- #include file="sjmp5_FOOT.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
conn2.close
set conn2=nothing
%>
