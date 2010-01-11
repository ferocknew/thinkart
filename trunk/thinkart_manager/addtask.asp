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
</head>
<body>
<!--#include file="inc_conn.asp"-->
<!--#include file="inc_nav.asp"-->
<br />
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_user"
rs.OPEN sql,Conn,1,1
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">添加非项目任务</td>
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
              <td width="120" height="35" class="tabCard">+ 添加非项目任务</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <form action="process_add_task.asp" method="post" name="form1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" class="inputTable">责任人：</td>
          <td height="30" class="inputTable">
          <select name="pj_people" class="setOpt" id="pj_people">
            <option selected="selected" value="">请选择...</option>
            <%while not rs.eof%>
            <option value="<%=rs("tname")%>"><%=rs("tname")%></option>
            <%rs.movenext
			wend
			rs.close
			set rs = nothing%>
          </select></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">任务名称：</td>
          <td height="30" class="inputTable"><input name="pj_name" type="text" class="setTextInput" id="pj_name" /></td>
        </tr>
        <tr>
          <td align="right" valign="top" class="inputTable">任务描述：</td>
          <td height="30" class="inputTable"><textarea name="pj_desc" class="setTextArea" id="pj_desc"></textarea></td>
        </tr>
        <tr>
          <td width="100" align="right" class="inputTable">截止日期：</td>
          <td height="30" class="inputTable"><input name="pj_dline" type="text" class="setTextInput" id="pj_dline" value="<%=date()%>" /></td>
        </tr>
        </table>      
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="50" class="bottomBorder1px">&nbsp;</td>
          <td height="30" class="bottomBorder1px"><input name="create_dt" type="button" class="setButtom" id="create_dt" value="添加" />
          <input name="reset_pj" type="button" class="setButtom" id="reset_pj" value="返回" onclick="history.back(-1);" /></td>
        </tr>
    </table>
      </form>    
    <br /></td>
  </tr>
</table>
</body>
</html>
