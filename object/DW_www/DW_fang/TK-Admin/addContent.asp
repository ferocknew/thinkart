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
        <td height="50" class="helpTitle bottomDotted1px">内容添加</td>
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
    <td width="150" align="center" class="rightDotted1px">层级结构树</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 内容添加</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" class="inputTable">所属分类：</td>
          <td height="30" class="inputTable">当前未选择</td>
        </tr>
        <tr>
          <td align="right" class="inputTable">内容标题：</td>
          <td height="30" class="inputTable"><input name="pj_start2" type="text" class="setTextInput" id="pj_start2" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">创建日期：</td>
          <td height="30" class="inputTable"><input name="pj_start" type="text" class="setTextInput" id="pj_start" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">内容摘要：</td>
          <td height="30" class="inputTable"><input name="pj_end" type="text" class="setTextInput" id="pj_end" /></td>
        </tr>
        <tr>
          <td width="100" align="right" valign="top" class="inputTable">正文：</td>
          <td height="30" class="inputTable"><input name="pj_memo2" type="text" class="setTextArea" id="pj_memo2" /></td>
        </tr>
        <tr>
          <td align="right" valign="top" class="inputTable">搜索标签：</td>
          <td height="30" class="inputTable"><input name="pj_end2" type="text" class="setTextInput" id="pj_end2" /></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="50" class="bottomBorder1px">&nbsp;</td>
          <td height="30" class="bottomBorder1px"><input name="create_pj" type="button" class="setButtom" id="create_pj" value="创建" />
            <input name="reset_pj" type="reset" class="setButtom" id="reset_pj" value="重置" /></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
<!--#include file="../lib/foot.asp" -->