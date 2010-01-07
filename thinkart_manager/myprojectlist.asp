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
sql = "delete from tm_project_detail where id = "&del_id&""
conn.execute(sql)
end if

apply_id = request("apply_id")
if apply_id <> "" then
sql = "update tm_project_detail set pj_apply = 1 where id = "&apply_id&""
conn.execute(sql)
end if

finish_id = request("finish_id")
if finish_id <> "" then
sql = "update tm_project_detail set pj_finish = 1 where id = "&finish_id&""
conn.execute(sql)
sql = "update tm_project_detail set pj_apply = 1 where id = "&finish_id&""
conn.execute(sql)
end if
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_project_detail where pj_people = '"&session("tname")&"' order by id desc"
rs.OPEN sql,Conn,1,1
%>

<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">我的任务清单</td>
      </tr>
      <tr>
        <td class="helpContent bottomDotted1px"><p>完整的项目清单。<br />
            <br />
            *可以查看、编辑、项目详细资料<br />
*可以增加单个项目的历史进度节点。</p></td>
      </tr>
    </table></td>
    <td width="20" class="rightBorder1px">&nbsp;</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td height="50" align="center" class="bottomBorder1px"><br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" align="left" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="120" height="35" class="tabCard">+ 任务清单</td>
                  </tr>
                </table></td>
                <td height="25" align="right" class="bottomBorder1px">&nbsp;</td>
              </tr>
            </table>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="tableHead">
                <td width="100" height="30" align="center" class="inputTable">责任人</td>
                <td width="100" align="center" class="inputTable">所属项目</td>
                <td width="100" align="center" class="inputTable">任务名称</td>
                <td width="100" align="center" class="inputTable">任务描述</td>
                <td width="100" align="center" class="inputTable">截止时间</td>
                <td width="100" align="center" class="inputTable">接受状态</td>
                <td width="100" align="center" class="inputTable">是否完成</td>
              </tr>
              <%while not rs.eof%>
			  <%
              Set rsp = Server.CreateObject("ADODB.Recordset")
              sqlp = "SELECT * FROM tm_project where id = "&rs("dt_id")&""
              rsp.OPEN sqlp,Conn,1,1
			  lv1_pjname = rsp("pj_name")
			  rsp.close
			  set rsp = nothing
              %>
              <tr>
                <td height="30" align="center" class="inputTable"><%=rs("pj_people")%></td>
                <td align="center" class="inputTable"><%=lv1_pjname%></td>
                <td align="center" class="inputTable"><%=rs("pj_name")%></td>
                <td align="center" class="inputTable"><%=rs("pj_desc")%></td>
                <td align="center" class="inputTable"><%=rs("pj_dline")%></td>
                <td align="center" class="inputTable">
                <%if rs("pj_apply") = 0 then%>
                	<%if session("tname") = rs("pj_people") then%>
                	<input name="set_apply" type="button" class="setOptButtomLong" id="create_pj3" value="标记为接受" onclick="javascript:if(confirm('确认接受？'))location.href='myprojectlist.asp?apply_id=<%=rs("id")%>&dt_id=<%=dt_id%>'" /></td>
                	<%end if%>
				<%else%>
                已接受
                <%end if%>
                <td align="center" class="inputTable">
                <%if rs("pj_finish") = 0 then%>
                	<%if session("tname") = rs("pj_people") then%>
                	<input name="set_finish" type="button" class="setOptButtomLong" id="create_pj2" value="标记为完成" onclick="javascript:if(confirm('确认完成？'))location.href='myprojectlist.asp?finish_id=<%=rs("id")%>&dt_id=<%=dt_id%>'" /></td>
					<%end if%>
              	<%else%>
                已完成
                <%end if%>
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
