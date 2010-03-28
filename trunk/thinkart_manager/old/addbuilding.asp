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
        <td height="50" class="helpTitle bottomDotted1px">添加楼宇</td>
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
              <td width="120" height="35" class="tabCard">+ 添加楼宇</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <form action="process_add_building.asp" method="post" name="form1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" class="inputTable">区域：</td>
          <td height="30" class="inputTable"><select name="budarea" class="setOpt" id="budarea">
            <option selected="selected">请选择...</option>
            <option value="杨浦">杨浦</option>
            <option value="虹口">虹口</option>
            <option value="黄浦">黄浦</option>
            <option value="卢湾">卢湾</option>
            <option value="静安">静安</option>
            <option value="长宁">长宁</option>
            <option value="徐汇">徐汇</option>
            <option value="普陀">普陀</option>
            <option value="闸北">闸北</option>
            <option value="浦东">浦东</option>
            <option value="宝山">宝山</option>
            <option value="闵行">闵行</option>
            <option value="郊区">郊区</option>
            <option value="其它">其它</option>
            </select></td>
        </tr>
        <tr>
          <td width="100" align="right" class="inputTable">楼宇名称：</td>
          <td height="30" class="inputTable"><input name="budname" type="text" class="setTextInput" id="budname" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">地址：</td>
          <td height="30" class="inputTable"><input name="budaddress" type="text" class="setTextInput" id="budaddress" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">等级：</td>
          <td height="30" class="inputTable"><select name="budlv" class="setOpt" id="budlv">
            <option selected="selected">请选择...</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="C">C</option>
            <option value="N">N</option>
            <option value="A+N">A+N</option>
          </select></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">情况：</td>
          <td height="30" class="inputTable"><textarea name="budinfo" class="setTextArea" id="budinfo"></textarea></td>
        </tr>
        </table>      
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="50" class="bottomBorder1px">&nbsp;</td>
          <td height="30" class="bottomBorder1px"><input name="create_bulid" type="button" class="setButtom" id="create_bulid" value="添加" />
          <input name="reset_pj" type="button" class="setButtom" id="reset_pj" value="返回" onclick="history.back(-1);" /></td>
        </tr>
    </table>
      </form>    
    <br /></td>
  </tr>
</table>
</body>
</html>
