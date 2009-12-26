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
          <td height="50" class="helpTitle bottomDotted1px">分类管理</td>
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
                <td width="120" height="35" class="tabCard">+ 分类管理</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" class="bottomBorder1px"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30" align="center" cl>一级：[ <span id="class1_name">当前未选择</span> ]</td>
                <td align="center">二级：[ 当前未选择 ]</td>
                <td align="center">三级：[ 当前未选择 ]</td>
              </tr>
              <tr>
                <td align="center" cl><select name="class1" size="1" multiple="multiple" class="optList" id="class1" next_class="class2">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                  </select></td>
                <td align="center"><select name="class2" size="1" multiple="multiple" class="optList" id="class2" next_class="class3">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                  </select></td>
                <td align="center"><select name="class3" size="1" multiple="multiple" class="optList" id="class3" next_class="">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                  </select></td>
              </tr>
              <tr>
                <td height="50" align="center"><input name="add_class1_input" type="text" class="setClassInput" id="add_class1_input" value="" />
                  <input name="add_class1" type="submit" class="setShortBut" id="add_class1" value="添" />
                  <input name="del_class1" type="submit" class="setShortButRed" id="del_class1" value="删" /></td>
                <td align="center"><input name="textfield2" type="text" class="setClassInput" id="textfield2" value="" />
                  <input name="change_info3" type="submit" class="setShortBut" id="change_info4" value="添" />
                  <input name="change_info5" type="submit" class="setShortButRed" id="change_info" value="删" /></td>
                <td align="center"><input name="textfield3" type="text" class="setClassInput" id="textfield3" value="" />
                  <input name="change_info4" type="submit" class="setShortBut" id="change_info6" value="添" />
                  <input name="change_info6" type="submit" class="setShortButRed" id="change_info5" value="删" /></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
<!--#include file="../lib/foot.asp" -->