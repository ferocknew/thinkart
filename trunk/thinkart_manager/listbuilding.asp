<!--#include file="files/inc/const.asp" -->
<!--#include file="inc_conn.asp" -->
<!--#include file="files/inc/inc-code.asp" -->
<!--#include file="files/inc/inc-html.asp" -->
<!-- Html Body -->
<!--#include file="inc_pageClass.asp"-->
<!--#include file="inc_nav.asp"-->
<%
del_id = request("del_id")
if del_id <> "" then
sql = "delete from tm_building where id = "&del_id&""
conn.execute(sql)
end if
%>

<%
ok_id = request("ok_id")
if ok_id <> "" then
sql = "update tm_building set processok = 1 where id = "&ok_id&""
conn.execute(sql)
end if
%>


<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "select * from tm_building order by id desc"
rs.OPEN sql,Conn,1,1
%>

<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+楼宇列表</td>
            </tr>
          </table></td>
          <td height="25" align="right" class="bottomBorder1px"><input name="create_pj5" type="button" class="setOptButtom" id="create_pj" value="新建" onClick="javascript:document.location='addbuilding.asp';" /></td>
        </tr>
      </table>
      <br />
      <form action="" method="post" name="form1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="tableHead">
            <td width="60" height="30" align="center" class="inputTable">等级</td>
            <td width="80" align="center" class="inputTable">区域</td>
            <td width="150" align="center" class="inputTable">楼宇名称</td>
            <td width="300" align="center" class="inputTable">联系地址</td>
            <td align="center" class="inputTable">详细情况</td>
            <td width="100" align="center" class="inputTable">操作</td>
          </tr>
          <%
	'******************分页********************
	'调用分页函数来实现分项功能
	pagesize	= FI("PageSize",20)
	page		= FI("Page", 1)

	Set pageObj = new PageClass

	pageObj.pagesize	= pagesize
	pageObj.page		= page

	pageObj.GetPage(rs)
	If  pageObj.EndofPage(rs) Then
	Else
	i = 1
	While Not pageObj.EndofPage(rs)
	%>
          <tr>
            <td height="30" align="center" class="inputTable <%if rs("processok")=1 then%>navBarOver<%end if%>"><%=rs("budlv")%></td>
            <td align="center" class="inputTable <%if rs("processok")=1 then%>navBarOver<%end if%>"><%=rs("budarea")%></td>
            <td align="center" class="inputTable <%if rs("processok")=1 then%>navBarOver<%end if%>"><%=rs("budname")%></td>
            <td align="center" class="inputTable <%if rs("processok")=1 then%>navBarOver<%end if%>"><%=rs("budaddress")%></td>
            <td align="center" class="inputTable <%if rs("processok")=1 then%>navBarOver<%end if%>"><%=rs("budinfo")%></td>
            <td align="center" class="inputTable <%if rs("processok")=1 then%>navBarOver<%end if%>"><span class="bottomBorder1px">
              <input name="create_pj4" type="button" class="setOptButtom" id="create_pj4" value="删除" onClick="javascript:if(confirm('确认删除该记录？'))location.href='listbuilding.asp?del_id=<%=rs("id")%>'" />
              <input name="make_ok" type="button" class="setOptButtom" id="create_pj2" value="搞定！" onClick="javascript:if(confirm('确认搞定该楼了？'))location.href='listbuilding.asp?ok_id=<%=rs("id")%>'" <%if rs("processok") = 1 then%>disabled<%end if%> />
            </span></td>
          </tr>
          <%
	i = i + 1
	rs.Movenext
	Wend
	strpagechar = PageObj.ShowNavBar(rs)
	End If
	rs.close
	set rs=nothing
	Set pageObj = Nothing
	%>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="50" align="center" class="bottomBorder1px"> &nbsp;
               <% response.Write ""&strpagechar %></td>
          </tr>
        </table>
      </form>
      <br /></td>
  </tr>
</table>
<!--#include file="files/inc/inc-foot.asp" -->