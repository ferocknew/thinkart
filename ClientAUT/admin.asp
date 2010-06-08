<!--#include file="lib/lib-const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/lib-Head.asp" -->
<!--#include file="lib/lib-Html.asp" -->
<%
Dim act
act=Easp.RQ("act",0)

If act="adduser" Then
	username=makePassword(12)
	SQL="INSERT INTO [user] ([username]) VALUES ('"&username&"')"
	conn.execute(SQL)
	Jasp.js("alert('添加成功！');")
End If

Set rs=Jasp.ado(conn).exec("SELECT [ID],[username] FROM [user]").Get()
%>
<input type="button" value="生成客户ID" id="adduser" /><input value="显示列表" type="button" id="show_list" />
<ul>
	<%
	If Not  rs.length=0 Then
	For i=0 To rs.length-1
	%>
	<li><%=rs.slice(i,i+1).[0].id%>. <%=rs.slice(i,i+1).[0].username%><li/>
	<%
	Next
	End If
	%>
<ul/>
<!--#include file="inc/inc-foot.asp" -->
<script type="text/javascript">
$("#adduser").click(function(){window.location.href="?act=adduser"});
$("#show_list").click(function(){window.location.href="?"});
</script>
