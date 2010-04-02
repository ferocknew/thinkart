<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
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
tag = request("tag")
%>
<%
edit_id = request("edit_id")
if edit_id = "" then response.redirect "listcustomer.asp"
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "select * from tm_customer where id ="&edit_id&""
rs.OPEN sql,Conn,1,1
infoadder = rs("infoadder")
subtype = rs("subtype")
builder = rs("builder")
cpyname = rs("cpyname")
address = rs("address")
contact = rs("contact")
perlevel = rs("perlevel")
phonenum = rs("phonenum")
cuslv = rs("cuslv")
securityinfo = rs("securityinfo")
memo = rs("memo")
othercontact = rs("othercontact")
rs.close
set rs = nothing
%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">编辑客户</td>
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
          <td width="140" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 编辑客户</td>
            </tr>
          </table></td>
          <td height="25" class="bottomBorder1px"><%if tag<>"" then%>
            <span class="textMsg">*编辑成功，点击 [返回] 进入客户列表</span>
            <%end if%></td>
        </tr>
      </table>
      <br />
      <form action="process_edit_customer.asp?edit_id=<%=edit_id%>" method="post" name="form1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" class="inputTable">添加人：</td>
          <td height="30" class="inputTable"><input name="infoadder" type="text" class="setTextInput" id="infoadder" value="<%=infoadder%>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">行业：</td>
          <td height="30" class="inputTable"><select name="subtype" class="setOpt" id="subtype">
            <option value="其它" <%if subtype = "其它" then%>selected<%end if%>>其它</option>
            <option value="IT" <%if subtype = "IT" then%>selected<%end if%>>IT</option>
            <option value="广告" <%if subtype = "广告" then%>selected<%end if%>>广告</option>
            <option value="物流" <%if subtype = "物流" then%>selected<%end if%>>物流</option>
            <option value="食品" <%if subtype = "食品" then%>selected<%end if%>>食品</option>
          </select></td>
        </tr>
        <tr>
          <td width="100" align="right" class="inputTable">楼宇名称：</td>
          <td height="30" class="inputTable"><input name="builder" type="text" class="setTextInput" id="builder" value="<%=builder%>" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">公司名称：</td>
          <td height="30" class="inputTable"><input name="cpyname" type="text" class="setTextInput" id="cpyname" value="<%=cpyname%>" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">公司地址：</td>
          <td height="30" class="inputTable"><input name="address" type="text" class="setTextInput" id="address" value="<%=address%>" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">联系人：</td>
          <td height="30" class="inputTable"><input name="contact" type="text" class="setTextInput" id="contact" value="<%=contact%>" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">职务：</td>
          <td height="30" class="inputTable"><input name="perlevel" type="text" class="setTextInput" id="perlevel" value="<%=perlevel%>" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">联系电话：</td>
          <td height="30" class="inputTable"><input name="phonenum" type="text" class="setTextInput" id="phonenum" value="<%=phonenum%>" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">其它联系方式：</td>
          <td height="30" class="inputTable"><textarea name="othercontact" class="setTextArea" id="othercontact"><%=othercontact%></textarea></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">保安情况：</td>
          <td height="30" class="inputTable"><select name="securityinfo" class="setOpt" id="securityinfo">
            <option value="松散" <%if securityinfo = "松散" then%>selected<%end if%>>松散</option>
            <option value="一般" <%if securityinfo = "一般" then%>selected<%end if%>>一般</option>
            <option value="很严格" <%if securityinfo = "很严格" then%>selected<%end if%>>很严格</option>
          </select></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">意向情况：</td>
          <td height="30" class="inputTable"><select name="cuslv" class="setOpt" id="cuslv">
            <option value="0" <%if cuslv = 0 then%>selected<%end if%>>未设定</option>
            <option value="1" <%if cuslv = 1 then%>selected<%end if%>>无意向</option>
            <option value="2" <%if cuslv = 2 then%>selected<%end if%>>一般般</option>
            <option value="3" <%if cuslv = 3 then%>selected<%end if%>>有意向</option>
          </select></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">备注：</td>
          <td height="30" class="inputTable"><textarea name="memo" class="setTextArea" id="memo"><%=memo%></textarea></td>
        </tr>
        </table>      
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="50" class="bottomBorder1px">&nbsp;</td>
          <td height="30" class="bottomBorder1px"><input name="create_custm" type="button" class="setButtom" id="create_custm" value="编辑" />
          <input name="reset_pj" type="button" class="setButtom" id="reset_pj" value="返回" onclick="document.location='listcustomer.asp';" /></td>
        </tr>
    </table>
      </form>    
    <br /></td>
  </tr>
</table>
</body>
</html>
