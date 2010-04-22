<!--#include file="../lib/const.asp" -->
<!--#include file="conn_admin.asp" -->
<!--#include file="../lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!--#include file="lib/top_admin.asp" -->
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="10" align="right" valign="top" class="rightDotted1px"></td>
		<td width="250" align="right" valign="top" class="rightDotted1px"><div class="rightDotted1px_div">
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
				<div class="treeLv3">第三层菜单</div>
			</div></td>
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
					<td align="right" class="inputTable">产品名称：</td>
					<td height="30" class="inputTable"><input name="pj_start2" type="text" class="setTextInput" id="pj_start2" /></td>
				</tr>
				<tr>
					<td align="right" class="inputTable">产品缩写：</td>
					<td height="30" class="inputTable"><input name="pj_start" type="text" class="setTextInput" id="pj_start" /></td>
				</tr>
				<tr>
					<td align="right" class="inputTable">普通价格：</td>
					<td height="30" class="inputTable"><input name="ProPrice" type="text" class="setTextInput" id="ProPrice" value="0" /></td>
				</tr>
				<tr>
					<td align="right" class="inputTable">VIP价格：</td>
					<td height="30" class="inputTable"><input name="pj_start" type="text" class="setTextInput" id="pj_start" value="0" /></td>
				</tr>
								<tr>
					<td align="right" class="inputTable">属于季节：</td>
					<td height="30" class="inputTable"><select name="Season" class="setTextInput" id="Season">
					<option value="0">-- 季节分类 --</option>
					<option value="1">春季</option>
					<option value="2">夏季</option>
					<option value="3">秋季</option>
					<option value="4">冬季</option>
					</select></td>
				</tr>
								<tr>
					<td align="right" class="inputTable">服装功能：</td>
					<td height="30" class="inputTable"><select name="prostyle" class="setTextInput" id="prostyle">
					<option value="0">-- 功能分类--</option>
					<option value="1">外套</option>
					<option value="2">上衣</option>
					<option value="3">连衣裙</option>
					<option value="4">裤子</option>
					<option value="5">裙子</option>
					</select></td>
				</tr>
								<tr>
					<td align="right" class="inputTable">年份：</td>
					<td height="30" class="inputTable"><input name="proyear" type="text" class="setTextInput" id="proyear" /></td>
				</tr>
				<tr>
					<td align="right" class="inputTable">置顶图：</td>
					<td height="30" class="inputTable"><a href="upfile.asp" id="addpro-showup">
						<button class="setButtom">置顶</button>
						</a>
						<input name="img-show-top" id="img-show-top" type="text" class="setTextInput" style="margin-left:20px;" disabled="disabled"/></td>
				</tr>
				<tr>
					<td width="100" align="right" valign="top" class="inputTable">产品简介：</td>
					<td height="30" class="inputTable"><textarea name="pj_memo2" id="pj_memo2" rows="15" cols="65"></textarea></td>
				</tr>
				<tr style="display:none;">
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
<script>
var imgShowTop=$("#img-show-top");
$("#addpro-showup").fancybox({'autoDimensions':false,'autoScale':false,'type':'iframe','width':320,'height':40});
</script>