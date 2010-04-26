<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<!--#include file="lib/header_html.asp"-->
<!--#include file="lib/top_admin.asp" -->
<%
Dim DBField,data_temp,data_temp_num
DBField="id,title,url,orderid,img_url"
data_temp=table_readdate(conn,"","friends",DBField,"","order by orderid")
data_temp_num=ArrayisEmpty(data_temp)
%>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">链接管理</td>
      </tr>
      <tr>
        <td class="helpContent bottomDotted1px">对网站注册用户进行统一管理，包括，增加，删除，修改和锁定用户的信息及账户</td>
      </tr>
      <tr>
        <td height="30" align="center" class="bottomDotted1px">操作说明</td>
      </tr>
      <tr>
        <td height="30" class=" helpContent bottomDotted1px">1.点击右侧，出现用户列表！</td>
      </tr>
    </table></td>
    <td width="20" class="rightBorder1px">&nbsp;</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 增加链接</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <form action="action_save.asp?act=add_friends" method="post" name="add_friends" id="add_friends">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr class="tableHead">
          <td width="30" align="center" class="inputTable">序号</td>
          <td width="180" height="30" align="center" class="inputTable">链接名称</td>
          <td width="180" align="center" class="inputTable">链接URL</td>
          <td width="180" align="center" class="inputTable">索引</td>
          <td width="180" align="center" class="inputTable">链接图片</td>
          <td align="center" class="inputTable">操作</td>
        </tr>
        <tr>
          <td align="center" class="inputTable">+</td>
          <td height="30" align="center" class="inputTable"><input name="title" type="text" class="setSTextInput" id="input_name" maxlength="200" /></td>
          <td align="center" class="inputTable"><input name="url" type="text" class="setSTextInput" id="input_url" value="http://" maxlength="200" /></td>
          <td align="center" class="inputTable"><input name="orderid" type="text" class="setSTextInput" id="orderid" maxlength="4" disabled="disabled" /></td>
          <td align="center" class="inputTable"><input name="img_url" type="text" class="setSTextInput" id="img_url" maxlength="200" /></td>
          <td align="center" class="inputTable"><input name="button2" type="submit" class="setOptButtom" id="button2" value="新 建"/></td>
        </tr>
      </table>
      </form>
      <br />
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 链接管理</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <%
	  For i=0 To data_temp_num
	  %>
        <tr>
          <td width="30" align="center" class="inputTable"><%=i%><input type="hidden" name="id" value="<%=data_temp(0,i)%>" /></td>
          <td width="180" height="30" align="center" class="inputTable"><%=data_temp(1,i)%></td>
          <td width="180" align="center" class="inputTable"><%=data_temp(2,i)%></td>
          <td width="180" align="center" class="inputTable"><%=data_temp(3,i)%></td>
          <td width="180" align="center" class="inputTable"><%=data_temp(4,i)%></td>
          <td align="center" class="inputTable"><input name="button" type="submit" class="setOptButtom del_friends" id="button" value="删 除" onclick="if(confirm('确认删除吗？')){window.location.href='action_save.asp?act=del_friends&id=<%=data_temp(0,i)%>'}return false;" /></td>
        </tr>
      <%Next%>      
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="right" class="bottomBorder1px">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
<%
DBField=Null:data_temp=Null:data_temp_num=Null
%>
<!--#include file="../lib/foot-admin.asp" -->
<script>
$(function(){
		   $("#add_friends").submit(function(){											
											 if($.trim($("#input_name").val())==""||$.trim($("#input_url").val())==""){alert("请填写相关内容！");return false;}
											 if(!$("#input_url").check().http()){alert("网址格式不正确");return false;}
											 });
		   });
</script>