<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim newsid,upclassid,classtype,DBField,data_temp,data_temp_num
classtype=Easp.R("classtype",0)
newsid=Easp.R("newsid",1)
upclassid=Easp.R("upclassid",1)

Select Case classtype
Case "class1"
	DBField="id,title"
	data_temp=table_readdate(conn,"","news",DBField,"(class1id="&upclassid&")","order by addtime desc")
	data_temp_num=ArrayisEmpty(data_temp)
End Select

If Not newsid=0 Then
	Dim data_news,data_news_num
	DBField="id,title,content,edittime"
	data_news=table_readdate(conn,"","news",DBField,"(id="&newsid&")","")
	data_news_num=ArrayisEmpty(data_news)
End If
%>
<style>
 .index_menu {
	color:#9c9c9c;
	text-decoration:none;
	font-weight:bolder;
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
    <td width="937"><br /><img name="index_r5_c1" src="images/inner_bg.jpg" width="937" height="133" border="0" id="index_r5_c1" alt="" /></td>
  </tr>
  <tr>
   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="937" style="margin-top:10px;">
	  <tr>
	   <td width="125" valign="top"><div style=" background-image:url(images/inner_menu_con_bg.jpg); width:202px;">
	   <div class="inner_menu_title">列表</div>
	   <div class="inner_menu_con"><ul>
<%
For i=0 To data_temp_num
%>
<li><span onClick="location.href='inner.asp?newsid=<%=data_temp(0,i)%>&upclassid=<%=upclassid%>&classtype=<%=classtype%>';"><%=data_temp(1,i)%></span></li>
<%
Next
%>
</ul></div><div style="background-image:url(images/inner_menu_con_b.jpg); height:20px;"></div>
	   </div></td>
	   <td valign="top" style="padding-left:10px;">
	   <div style="background-image:url(images/inner_con_title_bg.jpg); height:37px; line-height:37px; width:717px;"></div>
	   <div style="background-image:url(images/inner_con_bg.jpg); width:717px;">
	   	   					<div style=" overflow:auto;width:700px; padding-top:20px; padding-left:10px;">
<%
If Not data_news_num=-1 And Not newsid=0 Then
Response.Write(data_news(2,0))
Else
Response.Write("...")
End If
%>
					</div>
	   </div><div style="background-image:url(images/inner_con_b_bg.jpg); height:15px; width:717px;"></div>
	   </td>
	  </tr>
	</table></td>
  </tr>
</table>
<table width="937" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="78" align="center" background="images/index_r17_c1.jpg">德威实业&nbsp;&nbsp; |&nbsp;&nbsp; 德威装饰&nbsp; |&nbsp;&nbsp; 德威房产<br />
      沪ICP备0810721号 Copyright（C）2008 DeWei Co., Ltd. All Rights Reserved.<br /></td>
  </tr>
</table>
</div>
</body>
<!--#include file="lib/foot.asp" -->