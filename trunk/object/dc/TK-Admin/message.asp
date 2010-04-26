<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<!--#include file="lib/header_html.asp"-->
<!--#include file="lib/top_admin.asp" -->
<%
Dim DBField,data_temp,data_temp_num
DBField="id,title,content,name,email"
data_temp=table_readdate(conn,"","message",DBField,"","order by addtime")
data_temp_num=ArrayisEmpty(data_temp)
%>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">留言管理</td>
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
              <td width="120" height="35" class="tabCard">+ 留言管理</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tableHead">
          <td width="100" height="30" align="center" class="inputTable">昵称</td>
          <td align="center" class="inputTable">留言标题</td>
          <td align="center" class="inputTable">留言内容</td>
          <td align="center" class="inputTable">邮件地址</td>
          <td align="center" class="inputTable">操作</td>
        </tr>
<%
For i=0 To data_temp_num
%>
        <tr>
          <td height="30" align="center" class="inputTable"><%=data_temp(3,i)%></td>
          <td align="center" class="inputTable"><%=data_temp(1,i)%></td>
          <td align="center" class="inputTable"><%=data_temp(2,i)%></td>
          <td align="center" class="inputTable"><%=data_temp(4,i)%></td>
          <td align="center" class="inputTable"><input name="button2" type="submit" class="setOptButtomLong" id="button2" value="回复留言" /></td>
        </tr>
		<%
		Next
		%>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="120" height="35" class="tabCard">+ 留言回复</td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="30" align="right" valign="top" class="inputTable">回复内容：</td>
          <td class="inputTable"><textarea name="textarea" cols="45" rows="5" class="setTextArea" id="textarea"></textarea></td>
        </tr>
        <tr>
          <td height="40" align="right">&nbsp;</td>
          <td>
            <input name="button3" type="button" class="setButtom" id="button8" value="回 复" />
         </td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
<%
DBField=Null:data_temp=Null:data_temp_num=Null
%>
<!--#include file="../lib/foot-admin.asp" -->