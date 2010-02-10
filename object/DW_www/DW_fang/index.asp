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
<table align="center" border="0" cellpadding="0" cellspacing="0" width="790">
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
<table width="790" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="790"><img name="index_r5_c1" src="images/index_r5_c1.jpg" width="790" height="137" border="0" id="index_r5_c1" alt="" /></td>
  </tr>
  <tr>
   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="790">
	  <tr>
	   <td valign="top"><table align="left" border="0" cellpadding="0" cellspacing="0" width="575">
		  <tr>
		   <td><img name="index_r6_c1" src="images/index_r6_c1.jpg" width="575" height="325" border="0" id="index_r6_c1" alt="" /></td>
		  </tr>
		  <tr>
		   <td width="575" height="286" valign="top" background="images/index_r13_c1.jpg"><br />
		     <br />
		     <br />
		     <br />
		     <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
		       <tr>
		       <td height="200" valign="top">
			   <ul>
<%
For i=0 To data_con_num
%>
<li><a class="index_menu" href="inner.asp?newsid=<%=data_con(0,i)%>&upclassid=57&classtype=class1"><%=data_con(1,i)%></a></li>
<%
Next
%>
</ul>
			   </td>
		       </tr>
		     </table></td>
		  </tr>
		</table></td>
	   <td valign="top"><table align="left" border="0" cellpadding="0" cellspacing="0" width="215">
		  <tr>
		   <td><img name="index_r6_c5" src="images/index_r6_c5.jpg" width="215" height="45" border="0" id="index_r6_c5" alt="" /></td>
		  </tr>
		  <tr>
		    <td height="150" valign="top" background="images/index_r7_c5.jpg"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
		      <tr>
		        <td height="100" valign="top">文字信息</td>
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
		        <td height="100" valign="top">文字信息</td>
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
<table width="790" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="78" align="center" background="images/index_r17_c1.jpg">德威实业&nbsp;&nbsp; |&nbsp;&nbsp; 德威装饰&nbsp; |&nbsp;&nbsp; 德威房产<br />
      沪ICP备0810721号 Copyright（C）2008 DeWei Co., Ltd. All Rights Reserved.<br /></td>
  </tr>
</table>
</body>
<!--#include file="lib/foot.asp" -->