<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim DBField,data_con,data_con_num
DBField="id,title"
data_con=table_readdate(conn,"","news",DBField,"(class1id=59)","")
data_con_num=ArrayisEmpty(data_con)
If data_con_num>10 Then data_con_num=10
%>
<style>
 a.index_menu {
	color:#000;
	text-decoration:none;
	font-weight:normal;
	}
</style>
<!-- Html Body -->
<div class="html_body_div">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="937">
  <tr>
    <td><img name="index_r1_c1" src="images/index_r1_c1.jpg" width="228" height="80" border="0" id="index_r1_c1" alt="" /></td>
    <td width="434" height="80">&nbsp;</td>
    <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="128">
      <tr>
        <td width="128" height="19">&nbsp;</td>
      </tr>
      <tr>
        <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="128">
          <tr>
            <td><img name="index_r2_c6" src="images/index_r2_c6.jpg" width="62" height="21" border="0" id="index_r2_c6" alt="" /></td>
            <td><img name="index_r2_c7" src="images/index_r2_c7.jpg" width="66" height="21" border="0" id="index_r2_c7" alt="" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="128" height="40">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--#include file="lib/inc/top_menu.asp" -->
<table width="937" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="937"><br /><div id="inner_bg_div" style="height:133px; width:937px;"></div></td>
  </tr>
  <tr>
   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="937">
	  <tr>
	   <td valign="top"><table align="left" border="0" cellpadding="0" cellspacing="0" width="718">
		  <tr>
		   <td style="padding-top:8px; padding-bottom:20px"><img name="index_r6_c1" src="images/index_top1.jpg" width="715" height="312" border="0" id="index_r6_c1" alt="" /></td>
		  </tr>
		  <tr>
		   <td width="575" height="278" valign="top" style="padding-top:50px; padding-left:10px; background-image:url(images/index_con.jpg); background-repeat:no-repeat;">
		   <table width="100%" border="0" cellspacing="0" cellpadding="0" style="color:#868885;">
	<tr>
		<td><table width="440" border="0" cellspacing="0" cellpadding="0" style="line-height:20px;">
			<tr>
				<td width="98" valign="top"><img src="images/index_hk.jpg" height="75" /></td>
				<td width="110" valign="top"><span class="index_con_title">香港广场</span><br />
					关于香港广场的简介...</td>
				<td width="98" valign="top"><img src="images/index_hk.jpg" width="88" height="75" /></td>
				<td height="100" valign="top"><span class="index_con_title">香港广场</span><br />
					关于香港广场的简介...</td>

			</tr>
			<tr>
				<td width="98" valign="top"><img src="images/index_wd.jpg" width="88" height="75" /></td>
				<td width="110" valign="top"><span class="index_con_title">维多利亚商务楼</span><br />
					关于维多利亚商务楼的简介...</td>
				<td width="98" valign="top"><img src="images/index_wd.jpg" width="88" height="75" /></td>
				<td height="100" valign="top"><span class="index_con_title">维多利亚商务楼</span><br />
					关于维多利亚商务楼的简介...</td>

			</tr>
		</table></td>
		<td valign="top"><table width="255" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><img src="images/index_sh.jpg" width="124" height="99" /></td>
				<td style="padding-left:25px; line-height:20px;"><span class="index_con_title">虹桥万博花园</span><br />
					关于虹桥万博花园的简介...</td>
			</tr>
		</table>
		<div style="color:#c77800; cursor:pointer; text-align:right; padding-right:20px; height:30px; line-height:30px; font-weight:bolder;" onClick="location.href='inner.asp?newsid=23&upclassid=59&classtype=class1';">查看更多</div></td>
	</tr>
</table>

		   </td>
		  </tr>
		</table></td>
	   <td valign="top"><table align="left" border="0" cellpadding="0" cellspacing="0" width="215">
		  <tr>
		   <td><img name="index_r6_c5" src="images/index_r6_c5.jpg" width="215" height="45" border="0" id="index_r6_c5" alt="" /></td>
		  </tr>
		  <tr>
		    <td height="150" valign="top" background="images/index_r7_c5.jpg"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
		      <tr>
		        <td height="100" valign="top" style="color:#888888; padding-left:10px;"><ul style="margin:0px; padding:0px; line-height:25px;"><li>定金的支付（购入金额的约5%）</li><li>购入意向书的签订</li><li>首付款的支付（金额的30%）</li><li>预售销售合同的签订</li><li>至公证局登记预销售合同并公证（约15~30日）</li></ul></td>
		        </tr>
		      </table></td>
		    </tr>
		  <tr>
		    <td><img name="index_r9_c5" src="images/index_r9_c5.jpg" width="215" height="17" border="0" id="index_r9_c5" alt="" /></td>
		    </tr>
		  <tr>
		   <td><img name="index_r10_c5" src="images/index_r10_c5.jpg" width="215" height="45" border="0" id="index_r10_c5" alt="" /></td>
		  </tr>
		  <tr>
		    <td height="150" valign="top" background="images/index_r11_c5.jpg"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
		      <tr>
		        <td height="100" valign="top"><img src="images/index_liucheng.jpg" width="183" height="161" /></td>
		        </tr>
		      </table></td>
		    </tr>
		  <tr>
		    <td><img name="index_r14_c5" src="images/index_r14_c5.jpg" width="215" height="26" border="0" id="index_r14_c5" alt="" /></td>
		    </tr>
		  <tr>
		    <td><img name="index_r15_c5" src="images/index_r15_c5.jpg" width="215" height="155" border="0" id="index_r15_c5" alt="" /></td>
		    </tr>
		  </table></td>
	  </tr>
	</table></td>
  </tr>
</table>
<table width="937" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="78" align="center" background="images/index_r17_c1.jpg">德威实业&nbsp;&nbsp; |&nbsp;&nbsp; 德威装饰&nbsp; |&nbsp;&nbsp; 德崴房产<br />
      沪ICP备0810721号 Copyright（C）2008 DeWei Co., Ltd. All Rights Reserved.<br /></td>
  </tr>
</table>
</div>
</body>
<!--#include file="lib/foot.asp" -->