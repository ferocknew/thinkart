<!--#include file="lib/lib-const.asp" --><!--#include file="conn.asp" --><!--#include file="lib/lib-Head.asp" --><!--#include file="lib/lib-Html.asp" -->
<%
Dim username:username=Easp.RQ("username",0)
userid=0
If Not username="" Then
	Set rs=Jasp.ado(conn).exec("select [id] from [user] where [username]='"&username&"'").Get()
	If Not rs.length=0 Then userid=rs.[0].id
End If

Dim act:act=Easp.RQ("act",0)
If act="saveimg" Then
	Dim uploadfile:uploadfile=Trim(Easp.RF("uploadfile",0))
	Dim userid:userid=Easp.RF("userid",1)

	If uploadfile="" Then
		Call Jasp.js("alert('请先上传对应的图片！');history.back()")
		Response.End()
	End If

	If userid=0 Then
		Call Jasp.js("alert('用户ID错误！');history.back()")
		Response.End()
	End If

	SQL="INSERT INTO [upload] ([filesPath],[userID]) VALUES ('"&uploadfile&"',"&userid&")"
	conn.execute(SQL)

	Call Jasp.js("alert('添加成功');window.location.href ='inner.asp?username="&Easp.RF("username",0)&"';")
	Response.End()
End If

If Not userid=0 Then
	Set rs=Jasp.ado(conn).exec("select [filesPath],[userID] from [upload] where ([userID]="&userid&")").Get()
End If
%>
<div class="inner-title">
    <div style="float:left">
        <img src="files/images/logo.gif" />
    </div>
    <div style="float:right; line-height:58px; padding-right:10px;">
        <a href="admin.asp">管理</a>
    </div>
</div>
<div class="inner-body">
    <div class="inner-body-div">
        <br/>
		<form method="post" name="saveimg" action="?act=saveimg">
        <div class="inner-body-upload">
            <img src="files/images/upload.gif" />&nbsp;<input name="uploadfile" type="text" class="upload" id="input_upfiles" /><input type="submit" value="递 交" />
			<input type="hidden" name="userid" id="userid" value="<%=userid%>">
			<input type="hidden" name="username" id="username" value="<%=username%>">
        </div></form>
		<%
		if userid=0 Then
		%>
        <div class="inner-body-img">
            图片
        </div>
        <div class="inner-body-config">
            <a href="#" style="color:#999">删除</a>
        </div>
		<%
		else
			for i=0 to rs.length-1
		%>
		<div class="inner-body-img"><img src="<%=rs.slice(i,i+1).[0].filesPath%>" width="686" height="444" /></div>
        <div class="inner-body-config">
            <a href="#" style="color:#999">删除</a>
        </div>
		<%
			next
		end if
		%>
		<br /><br /><br />
    </div>
</div>
<div class="fixed" id="fixed">
    POWER BY THINKART
</div>
<div id="html_temp" style="display:none;">
    <a href="upfile.asp">fancybox</a>
</div>
</body>
</html>
<script>
    var myDate = new Date()
    var _$fancyboxA = $("#html_temp > a");
    _$fancyboxA.attr("href", "upfile.asp?" + myDate.getTime());
    _$fancyboxA.fancybox({
        'type': 'iframe',
        'width': 300,
        'height': 60,
    });
    $("#input_upfiles").focus(function(){
        $("#html_temp > a").trigger("click");
    })
</script>
<!--#include file="inc/inc-foot.asp" -->
