<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim class_id,DBField
class2id=Easp.RQ("class2id",1)
If class2id="" Then class2id=91
class_id=61 '产品列表ID


DBField="id,class_name"
tablename="class2"
data_temp_class2=table_readdate(conn,"",tablename,DBField,"","order by orderid")
data_temp_class2_num=ArrayisEmpty(data_temp_class2)

DBField="id,class_name,upclassid"
tablename="class3"
data_temp_class3=table_readdate(conn,"",tablename,DBField,"(upclassid="&class2id&")","order by orderid")
data_temp_class3_num=ArrayisEmpty(data_temp_class3)

data_pro_upshow=table_readdate(conn,"","products","ID,name,img","(upshow=1)","order by addtime")
data_pro_upshow_num=ArrayisEmpty(data_pro_upshow)

%>
<!-- Html Body -->
<style type="text/css">
<!--
.STYLE1 {color: #6490b4}
.level li { float:left;}
-->
</style>
<div id="content">
	<div id="header">
		<div id="logo"> </div>
		<!-- #logo-->
		<!--#include file="http://www.anpaichina.com/products.asp?class2id=95" -->
	</div>
	<!-- #header-->
	<div id="main">
		<div id="about-exhibition"> </div>
		<!-- #exhibition-->
		<div id="services-main">
			<div id="services-left-nav">
				<h2>产品介绍</h2>
				<ul>
				<%
				If Not data_temp_class2_num=-1 Then
				For i=0 To data_temp_class2_num
				%>
				<li <%If data_temp_class2(0,i)=Cdbl(class2id) Then Response.Write("id='libg'")%>><a href="products.asp?class2id=<%=data_temp_class2(0,i)%>" style="color:#ccc; text-decoration:none;"><%=data_temp_class2(1,i)%></a></li>
				<%
				Next
				End If
				%>
				</ul><form method="post" action="products-2.asp?act=sch" name="Search-pro">
				<input type="text" name="lastname" value="产品规格搜索" style="color:#CCCCCC;" onBlur="this.style.color='#CCCCCC'" onFocus="this.style.color='#000000'">
				<button height="20">搜索</button></form>
				<div class="dzcp">------- 定制产品 -------</div>
			</div>
			<!-- #left-nav-->
			<div id="services-text">
				<h1>产品介绍</h1>
				<div class="toppic">
<!--<%
				If Not data_pro_upshow_num=-1 Then
				For i=0 To data_pro_upshow_num
				%>
				<a href="ajax-show.asp?act=show-pro&proid=<%=data_pro_upshow(0,i)%>" class="pro-upshow"><img src="<%=data_pro_upshow(2,i)%>" title="<%=data_pro_upshow(1,i)%>"></a>
				<%
				If i=3 Then Exit For
				Next
				End If
				%>-->
				</div><p>&nbsp;</p><div class="marquee level" direction="right" speed="30" step="1" pause="1000" style="width:700px; overflow:hidden; margin-left:25px;"><ul>
				<%
				select case class2id
				case 96
				%>
				<li>
				<img src="files/images/2 (2).jpg" height="80" width="813"/></li><li>
				<img src="files/images/2 (2).jpg" height="80" width="813"/></li>
				<%
				case 95
				%>
				<li>
				<img src="files/images/1 (2).jpg" height="80" width="1000"/></li><li>
				<img src="files/images/1 (2).jpg" height="80" width="1000"/></li>
				<%
				case 98
				%>
				<li>
				<img src="files/images/4.jpg" height="80" width="777"/></li><li>
				<img src="files/images/4.jpg" height="80" width="777"/></li>
				<%
				case 97
				%>
				<li>
				<img src="files/images/3 (2).jpg" height="80" width="853"/></li><li>
				<img src="files/images/3 (2).jpg" height="80" width="853"/></li>
				<%
				end select
				%>
				</ul></div>
				<p>&nbsp;</p>
				<table class="tab" width="677" border="0" align="right" cellpadding="0" cellspacing="2" id="products-table">
<%
If Not data_temp_class3_num=-1 Then
For i=0 To data_temp_class3_num
%>
					<tr>
						<td width="50%" <%if i mod 4 =0 then%>bgcolor="#2f3138"<%End If%>><span class="STYLE1"><a href="products-2.asp?class2id=<%=data_temp_class3(2,i)%>&proclassid=<%=data_temp_class3(0,i)%>">&gt; 
						<%
						Response.Write(data_temp_class3(1,i))
						i=i+1
						%></a></span></td>
						<td width="50%" <%If i Mod 4 =1 Then%> bgcolor="#2f3138" <%End If%>><%If i<=data_temp_class3_num Then%><span class="STYLE1"><a href="products-2.asp?proclassid=<%=data_temp_class3(0,i)%>">&gt; <%Response.Write(data_temp_class3(1,i))%></a></span><%End If%></td>
					</tr>
<%
Next
End If
%>
				</table>
				<p>&nbsp;</p>
			</div>
			<!-- #services-text-->
		</div>
		<!-- #about-main-->
	</div>
	<!-- #main-->
	<div id="footer"> Copyright©2010 antop(Shanghai)  All RightsReserved. </div>
	<!-- #footer-->
</div>
<!-- #content-->
<!--#include file="lib/foot.asp" -->
<script>
$(".toppic>a").fancybox({
'autoDimensions':false,
'autoScale':false,
'type':'iframe',
'width':630,
'height':800
})
</script>