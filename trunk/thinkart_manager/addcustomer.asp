<!--#include file="files/inc/const.asp" -->
<!--#include file="inc_conn.asp" -->
<!--#include file="files/inc/inc-code.asp" -->
<!--#include file="files/inc/inc-html.asp" -->
<!-- Html Body -->
<!--#include file="inc_pageClass.asp"-->
<!--#include file="inc_nav.asp"-->
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" valign="top" class="opArea"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50" class="helpTitle bottomDotted1px">添加客户</td>
      </tr>
      <tr>
        <td class="helpContent bottomDotted1px"><p>&nbsp;</p></td>
      </tr>
    </table></td>
    <td width="20" class="rightBorder1px">&nbsp;</td>
    <td width="20">&nbsp;</td>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 添加客户</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <form action="process_add_customer.asp" method="post" name="form1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" class="inputTable">添加人：</td>
          <td height="30" class="inputTable"><input name="infoadder" type="text" class="setTextInput" id="infoadder" value="<%=session("username")%>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">行业：</td>
          <td height="30" class="inputTable"><select name="subtype" class="setOpt" id="subtype">
            <option value="1" selected="selected">其它</option>
            <option value="2">IT</option>
            <option value="3">广告</option>
            <option value="4">物流</option>
            <option value="5">食品</option>
          </select></td>
        </tr>
        <tr>
          <td width="100" align="right" class="inputTable">楼宇名称：</td>
          <td height="30" class="inputTable"><input name="builder" type="text" class="setTextInput" id="builder" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">公司名称：</td>
          <td height="30" class="inputTable"><input name="cpyname" type="text" class="setTextInput" id="cpyname" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">公司地址：</td>
          <td height="30" class="inputTable"><input name="address" type="text" class="setTextInput" id="address" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">联系人：</td>
          <td height="30" class="inputTable"><input name="contact" type="text" class="setTextInput" id="contact" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">职务：</td>
          <td height="30" class="inputTable"><input name="perlevel" type="text" class="setTextInput" id="perlevel" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">联系电话：</td>
          <td height="30" class="inputTable"><input name="phonenum" type="text" class="setTextInput" id="phonenum" /></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">其它联系方式：</td>
          <td height="30" class="inputTable"><textarea name="othercontact" class="setTextArea" id="othercontact"></textarea></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">保安情况：</td>
          <td height="30" class="inputTable"><select name="securityinfo" class="setOpt" id="securityinfo">
            <option value="松散">松散</option>
            <option value="一般" selected="selected">一般</option>
            <option value="很严格">很严格</option>
          </select></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">意向情况：</td>
          <td height="30" class="inputTable"><select name="cuslv" class="setOpt" id="cuslv">
            <option value="0">未设定</option>
            <option value="1" selected="selected">无意向</option>
            <option value="2">一般般</option>
            <option value="3">有意向</option>
          </select></td>
        </tr>
        <tr>
          <td align="right" class="inputTable">备注：</td>
          <td height="30" class="inputTable"><textarea name="memo" class="setTextArea" id="memo"></textarea></td>
        </tr>
        </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="50" class="bottomBorder1px">&nbsp;</td>
          <td height="30" class="bottomBorder1px"><input name="create_custm" type="button" class="setButtom" id="create_custm" value="添加" />
          <input name="reset_pj" type="button" class="setButtom" id="reset_pj" value="返回" onClick="history.back(-1);" /></td>
        </tr>
    </table>
      </form>
    <br /></td>
  </tr>
</table>
<!--#include file="files/inc/inc-foot.asp" -->