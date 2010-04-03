<!--#include file="../lib/const.asp" -->
<!--#include file="conn_admin.asp" -->
<!--#include file="../lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!--#include file="lib/top_admin.asp" -->
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td width="10" align="right" valign="top" class="rightDotted1px"></td>
    <td width="250" align="right" valign="top" class="rightDotted1px">
    <div class="rightDotted1px_div">
    <div class="treeLv1">第一层菜单</div>
    <div class="treeLv2">第二层菜单</div>
    <div class="treeLv2">第二层菜单</div>
    <div class="treeLv2">第二层菜单</div>
    <div class="treeLv2">第二层菜单</div>
    <div class="treeLv1">第一层菜单</div>
    <div class="treeLv2">第二层菜单</div>
    <div class="treeLv3">第三层菜单</div>
    <div class="treeLv3">第三层菜单</div>
    <div class="treeLv3">第三层菜单</div>
    <div class="treeLv3">第三层菜单</div></div></td>
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
          <td height="30" class="inputTable" id="from_class">当前未选择</td>
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
          <td height="30" class="inputTable"><textarea name="pj_memo2" id="pj_memo2" rows="15" cols="65"></textarea></td>
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