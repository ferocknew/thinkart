<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="checklogin.asp"-->
<link href="files/css/style.css" rel="stylesheet" type="text/css" />
<link href="files/css/jquery.hiAlerts.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="files/js/jquery-1.3.2.min.js"></script>
<script language="javascript" src="files/js/jquery.hiAlerts-min.js"></script>
<script language="javascript" src="files/js/common.js"></script>
<script language="javascript">
	function swContNum(actVal){
	  $("#cont_num").val(actVal);
	}
</script>
</head>
<body>
<!--#include file="inc_conn.asp"-->
<!--#include file="inc_nav.asp"-->
<br />
<%
actYear = year(date())
actMonth = month(date())
cutTag = "_"

sql = "select top 1 * from tm_contract where cont_type = 0 order by id desc"
set rs = conn.execute(sql)

if rs.eof then
actNum = 1
else
actNum = clng(right(rs("cont_num"),1))+1
rs.close
set rs = nothing
end if

actContNum_web = "WEB" & actYear & actMonth & cutTag & actNum
%>

<%
actYear = year(date())
actMonth = month(date())
cutTag = "_"

sql = "select top 1 * from tm_contract where cont_type = 1 order by id desc"
set rs = conn.execute(sql)

if rs.eof then
actNum = 1
else
actNum = clng(right(rs("cont_num"),1))+1
rs.close
set rs = nothing
end if

actContNum_grp = "GRP" & actYear & actMonth & cutTag & actNum
%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">添加合同</td>
      </tr>
      <tr>
        <td class="helpContent bottomDotted1px"><p>&nbsp;</p></td>
      </tr>
    </table></td>
    <td width="20" class="rightBorder1px">&nbsp;</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 添加合同</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <form action="process_add_contract.asp" method="post" name="form1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" class="inputTable">合同类别：</td>
          <td height="30" align="left" class="inputTable"><input name="cont_type" type="radio" id="radio" value="0" checked="checked" onclick="swContNum('<%=actContNum_web%>');" />
            网页设计
              <input type="radio" name="cont_type" id="radio2" value="1" onclick="swContNum('<%=actContNum_grp%>');" />
平面设计</td>
        </tr>
        <tr>
          <td align="right" class="inputTable">合同编号：</td>
          <td height="30" class="inputTable"><input name="cont_num" type="text" class="setTextInput" id="cont_num" value="<%=actContNum_web%>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td width="100" align="right" class="inputTable">合同名称：</td>
          <td height="30" class="inputTable"><input name="cont_name" type="text" class="setTextInput" id="cont_name" /></td>
        </tr>
        </table>      
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="50" class="bottomBorder1px">&nbsp;</td>
          <td height="30" class="bottomBorder1px"><input name="create_cont" type="button" class="setButtom" id="create_cont" value="添加" />
          <input name="reset_pj" type="button" class="setButtom" id="reset_pj" value="返回" onclick="history.back(-1);" /></td>
        </tr>
    </table>
      </form>    
    <br /></td>
  </tr>
</table>
</body>
</html>
