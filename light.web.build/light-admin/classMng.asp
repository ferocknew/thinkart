<%Session.CodePage=65001%>
<!--#include file="inc_checkLogin.asp"-->
<!--#include file="inc_conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script>
function chkSubmit(){
	var class_level = document.getElementById('class_level').value;
	var class_name = document.getElementById('class_name').value;
	if(class_name == ''){
	alert("请输入分类名称！");	
	}else{
	form1.submit();	
	}
	
	
}
</script>

<!--#include file="inc_menu.asp"-->
<br />
<%
class_type = trim(request("class_type"))
class_follow = trim(request("class_follow"))
class_level = trim(request("class_level"))
class_name = trim(request("class_name"))
%>

<%
if class_type <> "" and class_follow <>"" and class_level <> "" and class_name <>""  then
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * from light_class where (id is null)"
rs.OPEN sql,Conn,1,3
rs.addnew
rs("class_type")= class_type
rs("class_follow")= class_follow
rs("class_level")= class_level
rs("class_name")= class_name
rs.update
rs.close
set rs=nothing
end if
%>

<%
delid = request("delid")
if delid <> "" then
	sql_d = "select * from light_class where class_level = 2 and class_follow = "&delid&""
	set rs_d = conn.execute(sql_d)
	if not rs_d.eof then
	%>
    <script>alert("该分类下含有子分类,请先删除子分类再行操作！")</script>
	<%
	else
	rs_d.close
	set rs_d = nothing
	conn.execute("delete from light_class where id = "&delid&"")
	end if
end if

'——————————————————————————————————————————————————————————————————
delid2 = request("delid2")
if delid2 <> "" then
	sql_d2 = "select * from light_class where class_level = 3 and class_follow = "&delid2&""
	set rs_d2 = conn.execute(sql_d2)
	if not rs_d2.eof then
	%>
    <script>alert("该分类下含有子分类,请先删除子分类再行操作！")</script>
	<%
	else
	rs_d2.close
	set rs_d2 = nothing
	conn.execute("delete from light_class where id = "&delid2&"")
	end if
end if
'——————————————————————————————————————————————————————————————————
delid3 = request("delid3")
if delid3 <> "" then
conn.execute("delete from light_class where id = "&delid3&"")
end if
'——————————————————————————————————————————————————————————————————
%>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" class="text_boldTitle bottom_line">结构管理</td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="250" height="400" valign="top" class="right_line"><br />
      <form id="form1" name="form1" method="post" action="classMng.asp">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" bgcolor="#eeeeee" class="four_border_line">&nbsp;分类添加
            <input name="class_type" type="text" id="class_type" value="1" size="3" readonly="readonly" />
            <input name="class_follow" type="text" id="class_follow" value="<%if class_follow <> "" then%><%=class_follow%><%else%>0<%end if%>" size="3" readonly="readonly" /></td>
          </tr>
          <tr>
            <td height="30" bgcolor="#eeeeee" class="four_border_line">&nbsp;层级:
              <input name="class_level" type="text" id="class_level" value="<%if class_level <> "" then%><%=class_level%><%else%>1<%end if%>" size="16" readonly="readonly" />
            <input type="button" name="button2" id="button2" value="根" onClick="document.getElementById('class_level').value = 1;document.getElementById('class_follow').value = 0" /></td>
          </tr>
          <tr>
            <td height="30" bgcolor="#eeeeee" class="four_border_line">&nbsp;名称:
              <input name="class_name" type="text" id="class_name" size="16" />
            <input type="button" name="button" id="button" value="添" onClick="chkSubmit();" /></td>
          </tr>
        </table>
    </form></td>
    <td height="40" valign="top" class="text_chn_normal">
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "select * from light_class where class_type = 1 and class_level = 1 order by id desc"
rs.open sql,Conn,1,1
%>    
<br />
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="25%" height="25" align="center" bgcolor="#FFFFCC">一级</td>
        <td width="25%" align="center" bgcolor="#FFFFCC">二级</td>
        <td width="25%" align="center" bgcolor="#FFFFCC">三级</td>
        <td width="25%" align="center" bgcolor="#FFFFCC">操作</td>
      </tr>
    </table>
        <%while not rs.eof%>
      <%
        Set rs2 = Server.CreateObject("ADODB.Recordset")
        sql2 = "select * from light_class where class_type = 1 and class_level = 2 and class_follow = "&rs("id")&" order by id desc"
        rs2.open sql2,Conn,1,1
        %>    
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr onMouseOver="this.bgColor = '#cccccc';" onMouseOut="this.bgColor='#ffffff';">
          <td width="25%" height="25" align="center" class="bottom_line" onClick="document.getElementById('class_follow').value='<%=rs("id")%>';document.getElementById('class_level').value=2;" style="cursor:pointer;"><%=rs("class_name")%></td>
          <td width="25%" align="center" class="bottom_line">&nbsp;</td>
          <td width="25%" align="center" class="bottom_line">&nbsp;</td>
          <td width="25%" align="center" class="bottom_line" onClick="{if(confirm('确定删除吗?')){window.location='classMng.asp?delid=<%=rs("id")%>';return true;}return false;}" style="cursor:pointer;">删除</td>
        </tr>
    </table>
    <%while not rs2.eof%>
	  <%
        Set rs3 = Server.CreateObject("ADODB.Recordset")
        sql3 = "select * from light_class where class_type = 1 and class_level = 3 and class_follow = "&rs2("id")&" order by id desc"
        rs3.open sql3,Conn,1,1
        %>    
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr onMouseOver="this.bgColor = '#cccccc';" onMouseOut="this.bgColor='#ffffff';">
          <td width="25%" height="25" align="center" class="bottom_line">&nbsp;</td>
          <td width="25%" align="center" class="bottom_line" onClick="document.getElementById('class_follow').value='<%=rs2("id")%>';document.getElementById('class_level').value=3;" style="cursor:pointer;"><%=rs2("class_name")%></td>
          <td width="25%" align="center" class="bottom_line">&nbsp;</td>
          <td width="25%" align="center" class="bottom_line" onClick="{if(confirm('确定删除吗?')){window.location='classMng.asp?delid2=<%=rs2("id")%>';return true;}return false;}" style="cursor:pointer;">删除</td>
        </tr>
      </table>
      <%while not rs3.eof%>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr onMouseOver="this.bgColor = '#cccccc';" onMouseOut="this.bgColor='#ffffff';">
          <td width="25%" height="25" align="center" class="bottom_line">&nbsp;</td>
          <td width="25%" align="center" class="bottom_line">&nbsp;</td>
          <td width="25%" align="center" class="bottom_line" style="cursor:pointer;"><%=rs3("class_name")%></td>
          <td width="25%" align="center" class="bottom_line" onClick="{if(confirm('确定删除吗?')){window.location='classMng.asp?delid3=<%=rs3("id")%>';return true;}return false;}" style="cursor:pointer;">删除</td>
        </tr>
      </table>
      <%rs3.movenext
	  wend
	  rs3.close
	  set rs3 = nothing%>
	  <%
	  rs2.movenext
	  wend
	  rs2.close
	  set rs2 = nothing
	  %>
    <%rs.movenext
		wend
		rs.close
		set rs = nothing%>    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
