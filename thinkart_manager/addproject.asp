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
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">新建项目</td>
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
              <td width="120" height="35" class="tabCard">+ 新建项目</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <form action="process_add_project.asp" method="post" name="form1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" class="inputTable">项目类型：</td>
          <td height="30" class="inputTable"><select name="pj_type" class="setOpt" id="pj_type">
            <option>请选择...</option>
            <option value="1">网站设计————[系统ID = 1]</option>
            <option value="2">平面设计————[系统ID = 2]</option>
            <option value="3">商业摄影————[系统ID = 3]</option>
            <option value="4">印刷制作————[系统ID = 4]</option>
            <option value="5">其它项目————[系统ID = 5]</option>
          </select></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">合同日期：</td>
          <td height="30" class="inputTable"><input name="pj_start" type="text" class="setTextInput" id="pj_start" value="<%=date()%>" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">完成日期：</td>
          <td height="30" class="inputTable"><input name="pj_end" type="text" class="setTextInput" id="pj_end" value="<%=date()%>" /></td>
        </tr>
        <tr>
          <td width="100" align="right" class="inputTable">项目名称：</td>
          <td height="30" class="inputTable"><input name="pj_name" type="text" class="setTextInput" id="pj_name" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">项目描述：</td>
          <td height="30" class="inputTable"><input name="pj_desc" type="text" class="setTextInput" id="pj_desc" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">项目金额：</td>
          <td height="30" class="inputTable"><input name="pj_price" type="text" class="setTextInput" id="pj_price" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">项目成本：</td>
          <td height="30" class="inputTable"><input name="pj_pay" type="text" class="setTextInput" id="pj_pay" /></td>
        </tr>
        <tr>
          <td align="right" valign="top" class="inputTable">备注：</td>
          <td height="30" class="inputTable"><textarea name="pj_memo" class="setTextArea" id="pj_memo"></textarea></td>
        </tr>
      </table>      
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="50" class="bottomBorder1px">&nbsp;</td>
          <td height="30" class="bottomBorder1px"><input name="create_pj" type="button" class="setButtom" id="create_pj" value="创建" />
          <input name="reset_pj" type="button" class="setButtom" id="reset_pj" value="返回" onclick="history.back(-1);" /></td>
        </tr>
    </table>
      </form>    
    <br /></td>
  </tr>
</table>
</body>
</html>
