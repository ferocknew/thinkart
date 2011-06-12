<%Session.CodePage=65001%>
<!--#include file="inc_checkLogin.asp"-->
<!--#include file="inc_conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="xheditor/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="xheditor/xheditor-1.1.7-zh-cn.min.js"></script>
<script type="text/javascript">
$(pageInit);
function pageInit()
{
	$('#c_content').xheditor({upLinkUrl:"inc_upload.asp",upLinkExt:"zip,rar,txt",upImgUrl:"inc_upload.asp",upImgExt:"jpg,jpeg,gif,png",upFlashUrl:"inc_upload.asp",upFlashExt:"swf",upMediaUrl:"inc_upload.asp",upMediaExt:"wmv,avi,wma,mp3,mid",shortcuts:{'ctrl+enter':submitForm}});
}

function submitForm(){$('#form1').submit();}

function selectClass(className,classId){
	var c_class = document.getElementById('c_class').value = className;
	var c_class_id = document.getElementById('c_class_id').value = classId;	
}

</script>
</head>
<body>

<!--#include file="inc_menu.asp"-->
<br />

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" class="text_boldTitle bottom_line">内容添加/编辑</td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="250" height="400" valign="top" class="right_line">
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "select * from light_class where class_type = 1 and class_level = 1 order by id desc"
rs.open sql,Conn,1,1
%>    
<br />
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" align="center" bgcolor="#FFFFCC">内容结构树</td>
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
          <td height="25" class="bottom_line" style="cursor:pointer;" onClick="selectClass('<%=rs("class_name")%>','<%=rs("id")%>');">【LV1】<%=rs("class_name")%></td>
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
          <td height="25" class="bottom_line" onClick="selectClass('<%=rs2("class_name")%>','<%=rs2("id")%>');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;【LV2】<%=rs2("class_name")%></td>
        </tr>
      </table>
      <%while not rs3.eof%>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr onMouseOver="this.bgColor = '#cccccc';" onMouseOut="this.bgColor='#ffffff';">
          <td height="25" class="bottom_line" onClick="selectClass('<%=rs3("class_name")%>','<%=rs3("id")%>');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;【LV3】<%=rs3("class_name")%></td>
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
		set rs = nothing%>        
    </td>
    <td height="40" valign="top" class="text_chn_normal">
<%
c_title = trim(request("c_title"))
c_edittime = trim(request("c_edittime"))
c_abstract = trim(request("c_abstract"))
c_filename = trim(request("c_filename"))
c_content = request("c_content")
c_class = trim(request("c_class"))
c_class_id = trim(request("c_class_id"))
%>

<%
if c_title <> "" and c_edittime <>"" and c_class <> "" and c_class_id <>""  then
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * from light_content where (id is null)"
rs.OPEN sql,Conn,1,3
rs.addnew
rs("c_title")= c_title
rs("c_edittime")= c_edittime
rs("c_abstract")= c_abstract
rs("c_filename")= c_filename
rs("c_content")= c_content
rs("c_follow_class_name")= c_class
rs("c_follow_class_id")= c_class_id
rs.update
rs.close
set rs=nothing
%>
<script>alert("内容添加成功！"); document.location = 'contentMng.asp'</script>
<%end if%>
    
    <form id="form1" method="post" action="">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="right" class="bottom_line">所属分类：</td>
        <td class="bottom_line"><input name="c_class" type="text" id="c_class" size="20" readonly="readonly" />
          <input name="c_class_id" type="text" id="c_class_id" size="5" readonly="readonly" /></td>
      </tr>
      <tr>
        <td height="30" align="right" class="bottom_line">标题：</td>
        <td class="bottom_line"><input name="c_title" type="text" id="c_title" size="60" /></td>
      </tr>
      <tr>
        <td height="30" align="right" class="bottom_line">添加时间：</td>
        <td class="bottom_line"><input name="c_edittime" type="text" id="c_edittime" value="<%=now()%>" size="30" readonly="readonly" /></td>
      </tr>
      <tr>
        <td width="100" height="80" align="right" class="bottom_line">简述：</td>
        <td class="bottom_line"><textarea name="c_abstract" cols="80" rows="3" id="c_abstract"></textarea></td>
      </tr>
      <tr>
        <td height="30" align="right" class="bottom_line">引用静态文件：</td>
        <td class="bottom_line"><input name="c_filename" type="text" id="c_filename" size="60" /></td>
      </tr>
      <tr>
        <td height="350" align="right" class="bottom_line">内容：</td>
        <td class="bottom_line">
<textarea id="c_content" name="c_content" rows="20" cols="80" style="width: 80%"></textarea>        
        </td>
      </tr>
      <tr>
        <td height="30" align="right" class="bottom_line">&nbsp;</td>
        <td class="bottom_line"><input type="submit" name="save" value="好了，现在就添加！" />
          <input type="reset" name="reset" value="重新填写！" /></td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
