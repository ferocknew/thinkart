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
<!--#include file="inc_pageClass.asp"-->
<!--#include file="inc_nav.asp"-->

<%
del_id = request("del_id")
if del_id <> "" then
sql = "delete from tm_contract where id = "&del_id&""
conn.execute(sql)
end if
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_contract order by id desc"
rs.OPEN sql,Conn,1,1
%>

<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="center" class="bottomBorder1px"><br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" align="left" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="120" height="35" class="tabCard">+ 合同列表</td>
                  </tr>
                </table></td>
                <td height="25" align="right" class="bottomBorder1px"><input name="create_pj5" type="button" class="setOptButtom" id="create_pj" value="新建" onclick="javascript:document.location='addcontract.asp';" /></td>
              </tr>
            </table>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="tableHead">
                <td width="100" height="30" align="center" class="inputTable">合同类别</td>
                <td width="200" align="center" class="inputTable">合同编号</td>
                <td align="center" class="inputTable">合同名称</td>
                <td width="100" align="center" class="inputTable">操作</td>
              </tr>
              <%while not rs.eof%>
              <tr>
                <td height="30" align="center" class="inputTable"><%if rs("cont_type") = 0 then %>网站设计<%else%>平面设计<%end if%></td>
                <td align="center" class="inputTable"><%=rs("cont_num")%></td>
                <td align="center" class="inputTable"><%=rs("cont_name")%></td>
                <td align="center" class="inputTable"><input name="create_pj4" type="button" class="setOptButtom" id="create_pj4" value="删除" onclick="javascript:if(confirm('确认删除该合同？'))location.href='listcontract.asp?del_id=<%=rs("id")%>'" /></td>
              </tr>
              <%rs.movenext
			  wend
			  rs.close
			  set rs = nothing%>
            </table></td>
        </tr>
    </table>
    <br /></td>
  </tr>
</table>
</body>
</html>