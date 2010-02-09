<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<!--#include file="lib/header_html.asp"-->
<!--#include file="lib/top_admin.asp" -->
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="200" class="rightBorder1px" style="cursor:default;">&nbsp;</td>
    <td width="10">&nbsp;</td>
    <td height="30" valign="top"><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 产品基本信息</td>
            </tr>
          </table></td>
          <td height="25" align="right" class="bottomBorder1px">&nbsp;</td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="tableHead">
          <td width="200" height="25">当前产品图</td>
          <td width="300">添加产品图</td>
          <td>产品属性</td>
        </tr>
        <tr>
          <td height="200" valign="top" class="rightDotted1px"><br />
            <br />
            <table width="170" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="170" align="center" class="roundBorder">图片</td>
            </tr>
          </table>
            <table width="170" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="25" align="center">1 2 3 4 5 6</td>
              </tr>
          </table></td>
          <td valign="top" class="rightDotted1px"><br />
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="35"><input name="fileField" type="file" class="setFileInput" id="fileField" /></td>
              <td width="40" align="center"><img src="files/images/del.png" width="16" height="16" /></td>
              </tr>
            <tr>
              <td height="35"><input name="fileField2" type="file" class="setFileInput" id="fileField2" /></td>
              <td align="center"><img src="files/images/del.png" width="16" height="16" /></td>
              </tr>
            <tr>
              <td height="35"><input name="fileField3" type="file" class="setFileInput" id="fileField3" /></td>
              <td align="center"><img src="files/images/del.png" width="16" height="16" /></td>
              </tr>
            <tr>
              <td height="35"><input name="fileField6" type="file" class="setFileInput" id="fileField6" /></td>
              <td align="center"><img src="files/images/del.png" width="16" height="16" /></td>
            </tr>
            <tr>
              <td height="35"><input name="fileField4" type="file" class="setFileInput" id="fileField4" /></td>
              <td align="center"><img src="files/images/del.png" width="16" height="16" /></td>
              </tr>
            <tr>
              <td height="35"><input name="fileField5" type="file" class="setFileInput" id="fileField5" /></td>
              <td align="center"><img src="files/images/del.png" width="16" height="16" /></td>
              </tr>
          </table></td>
          <td valign="top"><br />
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="50%" height="30" align="center" class="bottomDotted1px"><input name="textfield" type="text" class="setSTextInput" id="textfield" value="属性" /></td>
              <td align="center" class="bottomDotted1px"><input name="textfield2" type="text" class="setSTextInput" id="textfield2" value="值" /></td>
            </tr>
            <tr>
              <td height="30" align="center" class="bottomDotted1px"><input name="textfield3" type="text" class="setSTextInput" id="textfield3" value="属性" /></td>
              <td align="center" class="bottomDotted1px"><input name="textfield7" type="text" class="setSTextInput" id="textfield7" value="值" /></td>
            </tr>
            <tr>
              <td height="30" align="center" class="bottomDotted1px"><input name="textfield4" type="text" class="setSTextInput" id="textfield4" value="属性" /></td>
              <td align="center" class="bottomDotted1px"><input name="textfield8" type="text" class="setSTextInput" id="textfield8" value="值" /></td>
            </tr>
            <tr>
              <td height="30" align="center" class="bottomDotted1px"><input name="textfield5" type="text" class="setSTextInput" id="textfield5" value="属性" /></td>
              <td align="center" class="bottomDotted1px"><input name="textfield9" type="text" class="setSTextInput" id="textfield9" value="值" /></td>
            </tr>
            <tr>
              <td height="30" align="center" class="bottomDotted1px"><input name="textfield11" type="text" class="setSTextInput" id="textfield11" value="属性" /></td>
              <td align="center" class="bottomDotted1px"><input name="textfield12" type="text" class="setSTextInput" id="textfield12" value="值" /></td>
            </tr>
            <tr>
              <td height="30" align="center" class="bottomDotted1px"><input name="textfield6" type="text" class="setSTextInput" id="textfield6" value="属性" /></td>
              <td align="center" class="bottomDotted1px"><input name="textfield10" type="text" class="setSTextInput" id="textfield10" value="值" /></td>
            </tr>
            <tr>
              <td height="25" colspan="2" align="center" class="bottomDotted1px"><span class="inputTable">
                <input name="button2" type="submit" class="setOptButtomLong" id="button2" value="保存属性" />
              </span></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" class="bottomBorder1px">&nbsp;</td>
        </tr>
    </table>
      <br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" class="bottomBorder1px"><table width="120" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="120" height="35" class="tabCard">+ 产品描述</td>
            </tr>
          </table></td>
          <td height="25" align="right" class="bottomBorder1px">&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="30" align="right" valign="top" class="inputTable">内容：</td>
          <td class="inputTable"><textarea name="textarea" cols="45" rows="5" class="setTextArea" id="textarea"></textarea></td>
        </tr>
        <tr>
          <td height="40" align="right">&nbsp;</td>
          <td><input name="button3" type="button" class="setButtom" id="button8" value="添 加" /></td>
        </tr>
      </table>
<br />
    <br /></td>
  </tr>
</table>
</body>
<!--#include file="../lib/foot.asp" -->