<!--#include file="files/inc/const.asp" -->
<!--#include file="inc_conn.asp" -->
<!--#include file="files/inc/inc-code.asp" -->
<!--#include file="files/inc/inc-html.asp" -->
<!-- Html Body -->
<!--#include file="inc_pageClass.asp"-->
<!--#include file="inc_nav.asp"-->
<%
Dim cuslv_rs
cuslv_rs=Easp.RQ("cuslv",1) '0 "未设定",1 "无意向",2 "一般般",3 "有意向"

del_id = request("del_id")
if del_id <> "" then
sql = "delete from tm_customer where id = "&del_id&""
conn.execute(sql)
end if

setlv = request("setlv")
recId = request("recId")
if setlv <> "" then
sql = "update tm_customer set cuslv = "&setlv&" where id = "&recId&""
conn.execute(sql)
end if

If cuslv_rs="-1" Then
sql = "select * from tm_customer order by id desc"
Else
sql = "select * from tm_customer where cuslv="&cuslv_rs&" order by id desc"
End If

Set rs = Server.CreateObject("ADODB.Recordset")
rs.OPEN sql,Conn,1,1
%>
<style>
#top-tab a.show-tab{ font-size:13px; font-weight:normal; color:#666;}
</style>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 客户列表</td>
            </tr>
          </table></td>
          <td height="25" align="right" class="bottomBorder1px">
          <input name="create_pj5" type="button" class="setOptButtom" id="create_pj" value="新建" onClick="javascript:document.location='addcustomer.asp';" /></td>
        </tr>
      </table>
      <br />
      <form action="" method="post" name="form1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="top-tab">
          <tr>
            <td width="130"><table width="120" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="120" height="35" class="<%
								If cuslv_rs=0 Then
				Easp.W ("tabCard")
				Else
				Easp.W ("tabCard_un")
				End If
				%>">+ <a href="?cuslv=0" class="show-tab">未设定</a></td>
              </tr>
            </table></td>
            <td width="130"><table width="120" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="120" height="35" class="<%
								If cuslv_rs=1 Then
				Easp.W ("tabCard")
				Else
				Easp.W ("tabCard_un")
				End If
				%>">+ <a href="?cuslv=1" class="show-tab">无意</a></td>
              </tr>
            </table></td>
            <td width="130"><table width="120" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="120" height="35" class="<%
								If cuslv_rs=2 Then
				Easp.W ("tabCard")
				Else
				Easp.W ("tabCard_un")
				End If
				%>">+ <a href="?cuslv=2" class="show-tab">一般般</a>	</td>
              </tr>
            </table></td>
            <td width="130"><table width="120" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="120" height="35" class="<%
				If cuslv_rs=3 Then
				Easp.W ("tabCard")
				Else
				Easp.W ("tabCard_un")
				End If
				%>">+ <a href="?cuslv=3" class="show-tab">有意向</a></td>
              </tr>
            </table></td>
            <td><table width="120" border="0" cellspacing="0" cellpadding="0">
            	<tr>
            		<td width="120" height="35" class="<%
				If cuslv_rs="-1" Then
				Easp.W ("tabCard")
				Else
				Easp.W ("tabCard_un")
				End If
				%>">+ <a href="?cuslv=-1" class="show-tab">所有</a></td>
            		</tr>
            	</table></td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="tableHead">
            <td width="60" align="center" class="inputTable">录入人</td>
            <td width="80" align="center" class="inputTable">录入时间</td>
            <td width="150" align="center" class="inputTable">楼宇名称</td>
            <td width="250" height="30" align="center" class="inputTable">公司名称</td>
            <td align="center" class="inputTable">联系地址</td>
            <td width="80" align="center" class="inputTable">职务</td>
            <td width="100" align="center" class="inputTable">备注</td>
            <td width="120" align="center" class="inputTable">意向情况</td>
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

if rs("cuslv") = 0 then status = "未设定"
if rs("cuslv") = 1 then status = "无意向"
if rs("cuslv") = 2 then status = "一般般"
if rs("cuslv") = 3 then status = "有意向"
%>
          <tr>
            <td align="center" class="inputTable"><%=rs("infoadder")%></td>
            <td align="center" class="inputTable"><%=rs("addtime")%></td>
            <td align="center" class="inputTable"><%=rs("builder")%></td>
            <td height="30" align="center" class="inputTable" onClick="javascript:document.location='editcustomer.asp?edit_id=<%=rs("id")%>';" style="cursor:pointer;"><%=rs("cpyname")%></td>
            <td align="center" class="inputTable"><%=rs("address")%></td>
            <td align="center" class="inputTable"><%=rs("perlevel")%></td>
            <td align="center" class="inputTable"><a href="#" title="<%=rs("memo")%>&#13;<%=rs("contact")%>___[<%=rs("phonenum")%>]">查看详细</a></td>
            <td align="center" class="inputTable">&nbsp;<%=status%></td>
            <td align="center" class="inputTable"><span class="bottomBorder1px">
              <input name="create_pj4" type="button" class="setOptButtom" id="create_pj4" value="删除" onClick="javascript:if(confirm('确认删除该记录？'))location.href='listcustomer.asp?del_id=<%=rs("id")%>'" />
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
          <td height="50" align="center" class="bottomBorder1px"><% response.Write ""&strpagechar %></td>
        </tr>
    </table>
      </form>
    <br /></td>
  </tr>
</table>
<!--#include file="files/inc/inc-foot.asp" -->