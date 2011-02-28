<!--#include file="../lib/const.asp" -->
<!--#include file="conn_admin.asp" -->
<!--#include file="../lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!--#include file="lib/top_admin.asp" -->
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" class="helpTitle bottomDotted1px">网站设置</td>
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
                <td width="120" height="35" class="tabCard">+ 基本信息设置</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" align="right" class="inputTable">网站名称：</td>
          <td height="30" class="inputTable"><input name="textfield" type="text" class="setTextInput" id="sitename" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">公司名称：</td>
          <td height="30" class="inputTable"><input name="textfield2" type="text" class="setTextInput" id="comnam" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">LOGO：</td>
          <td height="30" class="inputTable"><input name="textfield3" type="text" class="setTextInput" id="site_logo" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">负责人：</td>
          <td height="30" class="inputTable"><input name="textfield4" type="text" class="setTextInput" id="leader" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">ICP 备案号：</td>
          <td height="30" class="inputTable"><input name="textfield5" type="text" class="setTextInput" id="siteicp" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">网站地址：</td>
          <td height="30" class="inputTable"><input name="siteurl" type="text" class="setTextInput" id="siteurl" /></td>
        </tr>
        <tr style=" display:none">
          <td align="right" class="inputTable">公司简介：</td>
          <td height="30" class="inputTable"><textarea name="com_intro" id="com_intro" rows="15" cols="65"></textarea></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="50" class="bottomBorder1px">&nbsp;</td>
          <td height="30" class="bottomBorder1px"><input name="button" type="submit" class="setButtom" id="change_info" value="提交" /></td>
        </tr>
      </table>
      <br />
      <br />
      <div style="display:none;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="120" height="35" class="tabCard">+ 维护开关</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" align="right" class="inputTable">网站开关：</td>
          <td height="30" class="inputTable"><span class="bottomBorder1px">
            <input name="button3" type="submit" class="setButtom" id="button3" value="打开" />
            </span></td>
        </tr>
      </table></div></td>
  </tr>
</table>

</body>
<!--#include file="../lib/foot.asp" -->