<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<!--#include file="lib/header_html.asp"-->
<!--#include file="lib/top_admin.asp" -->
<script type="text/javascript">
$.getScript("lib/js/top_menu.js?"+new Date().format("yyyyMMddhhmmss"));
</script>
<%
Dim DBField,data_temp,data_temp_num
DBField="id,title,orderid,img_menu,power,next_url"
data_temp=table_readdate(conn,"","top_menu",DBField,"","order by orderid")
data_temp_num=ArrayisEmpty(data_temp)
%>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">导航设置</td>
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
    <td height="30" valign="top"><br /><form name="save_menu" method="post" action="#">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 导航设置</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tableHead">
          <td width="30" align="center" class="inputTable">编号</td>
          <td width="100" height="30" align="center" class="inputTable">导航名称</td>
          <td width="100" align="center" class="inputTable">链接URL</td>
          <td width="100" align="center" class="inputTable">索引</td>
          <td width="100" align="center" class="inputTable">导航图片</td>
          <td width="100" align="center" class="inputTable">链接</td>
        </tr>
		<%
		For i=0 To data_temp_num
		%>
        <tr>
          <td align="center" class="inputTable"><%=i+1%><input type="hidden" name="id" id="id" value="<%=data_temp(0,i)%>"></td>
          <td height="30" align="center" class="inputTable"><input name="textfield" type="text" class="setSTextInput" id="textfield" value="<%=data_temp(1,i)%>" <%If data_temp(4,i)=1 Then Response.Write("disabled=""disabled""")%> disabled="disabled" /></td>
          <td align="center" class="inputTable"><input name="textfield2" type="text" class="setSTextInput" id="textfield2" value="<%=data_temp(5,i)%>" /></td>
          <td align="center" class="inputTable"><input name="textfield3" type="text" class="setSTextInput" id="textfield3" value="<%=data_temp(2,i)%>" /></td>
          <td align="center" class="inputTable"><input name="textfield4" type="text" class="setSTextInput" id="textfield4" value="<%=data_temp(3,i)%>" /></td>
          <td align="center" class="inputTable"><a href="#"><img src="files/images/link.png" width="16" height="16" border="0" /></a></td>
        </tr>
		<%
		Next
		%>        
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="right" class="bottomBorder1px"><input name="button" type="submit" class="setOpt" id="button" value="保存设置" /></td>
        </tr>
    </table></form></td>
  </tr>
</table>
</body>
<%
DBField=Null
data_temp=Null
data_temp_num=Null
%>
<!--#include file="../lib/foot.asp" -->