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
function trans_type(num)
if num = 1 then response.write "网站"
if num = 2 then response.write "平面"
if num = 3 then response.write "摄影"
if num = 4 then response.write "印刷制作"
if num = 5 then response.write "其它"
end function 
%>

<%
newpj_people = request("newpj_people")
detail_id = request("detail_id")
if newpj_people <> "" and detail_id <> "" then
sql = "update tm_project_detail set pj_people ='"&newpj_people&"' where id = "&detail_id&""
conn.execute(sql)
end if
%>

<%
dt_id = request("dt_id")
if dt_id <> "" then
sql = "select * from tm_project where id = "&dt_id&""
set rs = conn.execute(sql)
pj_type = rs("pj_type")
pj_start = rs("pj_start")
pj_end = rs("pj_end")
pj_name = rs("pj_name")
pj_desc = rs("pj_desc")
pj_price = rs("pj_price")
pj_pay = rs("pj_pay")
pj_memo = rs("pj_memo")
rs.close
set rs = nothing
end if
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_project_detail where dt_id = "&dt_id&" order by id desc"
rs.OPEN sql,Conn,1,1
%>

<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">项目信息</td>
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
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" align="left" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 项目详细信息</td>
            </tr>
          </table></td>
          <td height="25" align="right" class="bottomBorder1px"><input name="create_pj5" type="button" class="setOptButtomLong" id="create_pj" value="添加子任务" onclick="javascript:document.location='addprojectdetail.asp?dt_id=<%=dt_id%>';" /></td>
        </tr>
      </table>
    <br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td height="50" align="center" class="bottomBorder1px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="tableHead">
              <td width="25%" height="25">项目类型</td>
              <td width="25%">项目名称</td>
              <td width="25%">合同日期</td>
              <td width="25%">剩余时间</td>
            </tr>
            <tr class="rightBorder1px">
              <td height="25" align="center" class="rightBorder1px"><%=trans_type(pj_type)%></td>
              <td align="center" class="rightBorder1px"><%=pj_name%></td>
              <td align="center" class="rightBorder1px"><%=pj_start%></td>
              <td align="center"><%=pj_end%> ——— [<%response.write pj_end-date()%>]</td>
            </tr>
            <tr class="tableHead">
              <td height="25" colspan="2">项目描述</td>
              <td>项目金额</td>
              <td>项目成本</td>
            </tr>
            <tr class="rightBorder1px">
              <td height="25" colspan="2" align="center" class="rightBorder1px bottomDotted1px"><%=pj_desc%> -<a href="#" title="<%=pj_memo%>">[备]</a></td>
              <td align="center" class="rightBorder1px bottomDotted1px"><%=pj_price%></td>
              <td align="center" class=" bottomDotted1px"><%=pj_pay%></td>
            </tr>
          </table>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" align="left" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="120" height="35" class="tabCard">+ 详细任务列表</td>
                  </tr>
                </table></td>
                <td height="25" align="right" class="bottomBorder1px">&nbsp;</td>
              </tr>
            </table>
            <br />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="tableHead">
                <td width="100" align="center" class="inputTable">操作</td>
                <td width="100" height="30" align="center" class="inputTable">责任人</td>
                <td width="100" align="center" class="inputTable">任务名称</td>
                <td width="100" align="center" class="inputTable">任务描述</td>
                <td width="100" align="center" class="inputTable">截止时间</td>
                <td width="100" align="center" class="inputTable">接受状态</td>
                <td width="100" align="center" class="inputTable">是否完成</td>
              </tr>
              <%while not rs.eof%>
              <tr>
                <td align="center" class="inputTable"><input name="create_pj4" type="button" class="setOptButtom" id="create_pj4" value="删除" onclick="javascript:if(confirm('确认删除该项目？'))location.href='projectdetail.asp?del_id=<%=rs("id")%>&dt_id=<%=dt_id%>'" /><input name="create_pj" type="button" class="setOptButtom" id="create_pj4" value="分配" onclick="javascript:document.location='editprojectdetail.asp?edit_id=<%=rs("id")%>&dt_id=<%=dt_id%>';" /></td>
                <td height="30" align="center" class="inputTable"><%=rs("pj_people")%></td>
                <td align="center" class="inputTable"><%=rs("pj_name")%></td>
                <td align="center" class="inputTable" title="<%=rs("pj_desc")%>"><%=left(rs("pj_desc"),10)%>..</td>
                <td align="center" class="inputTable"><%=rs("pj_dline")%></td>
                <td align="center" class="inputTable">
                <%if rs("pj_apply") = 0 then%>
                	<%if session("tname") = rs("pj_people") then%>
                	<input name="set_apply" type="button" class="setOptButtomLong" id="create_pj3" value="标记为接受" onclick="javascript:if(confirm('确认接受？'))location.href='projectdetail.asp?apply_id=<%=rs("id")%>&dt_id=<%=dt_id%>'" /></td>
                	<%end if%>
				<%else%>
                已接受
                <%end if%>
                <td align="center" class="inputTable">
                <%if rs("pj_finish") = 0 then%>
                	<%if session("tname") = rs("pj_people") then%>
                	<input name="set_finish" type="button" class="setOptButtomLong" id="create_pj2" value="标记为完成" onclick="javascript:if(confirm('确认完成？'))location.href='projectdetail.asp?finish_id=<%=rs("id")%>&dt_id=<%=dt_id%>'" /></td>
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
