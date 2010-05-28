<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<%
Dim userCookies
userCookies=Easp.GetCookie(CookieName&":index_userid")
Dim pages,classid,profilter,profilterid
profilte=Easp.RQ("profilte",0) '搜索条件
profilteid=Easp.RQ("profilteid",1) '搜索结果
PageNum=Easp.RQ("page",1) '当前页码

class3id=Easp.RQ("classid",1)
if class3id="" Then class3id=67
DBField="id,name,img,Price,PriceVip"
TabName="products"
pageSize=8

Dim ors,SQL
If profilte="" Then
	SQL="Select "&DBField&" from ["&TabName&"] where (class2id="&class3id&")"
	conSQL="Select Count(id) from ["&TabName&"] where (class2id="&class3id&")"
Else
	Select Case profilte
	Case "proyear"
		SQL="Select "&DBField&" from ["&TabName&"] where (class2id="&class3id&") and ("&profilte&"='"&profilteid&"')"
		conSQL="Select Count(id) from ["&TabName&"] where (class2id="&class3id&") and ("&profilte&"='"&profilteid&"')"
	Case Else
		SQL="Select "&DBField&" from ["&TabName&"] where (class2id="&class3id&") and ("&profilte&"="&profilteid&")"
		conSQL="Select Count(id) from ["&TabName&"] where (class2id="&class3id&") and ("&profilte&"="&profilteid&")"
	End Select
End If

DataTempNum=conn.execute(conSQL)(0)

Maxpage=Int(DataTempNum/pageSize) '最大页码
If CInt(PageNum)>Maxpage Then PageNum=Maxpage '页码上限
If CInt(PageNum)<1 Then PageNum=1 '页码下限

If Easp.RQ("page",1)="" Then
	pageup="?page=2&"&Request.ServerVariables("QUERY_STRING")
	pagedown="?"&Request.ServerVariables("QUERY_STRING")
	PageNum=1
else
	pageup="?page="&PageNum+1&"&"&delQUERY(0)
	pagedown="?page="&PageNum-1&"&"&delQUERY(0)
end if

Set ors=new Cls_ShowoPage '创建对象
With ors
	.PageNum=PageNum		'页码
	.PageSize=pageSize		'每页记录条数
	.Conn=conn					'得到数据库连接对象
	.RecSql=conSQL				'统计用SQL语句
	.exeuSql=SQL				'执行的SQL语句
	.Order=0						'排序(0顺序1降序),注意要和下面sql里面主键ID的排序对应
End With

'DataTempNum=ors.RecCount()		'记录总数
DataTemp=ors.ResultSet()		'返回ResultSet

JsonDBField=Split(DBField,",")
if not isempty(DataTemp) then set rs=Jexs.VBRows2Obj(DataTemp,JsonDBField,5,1) '产品数据
%>
<!-- Html Body -->
<div id="logo"> </div>
<div id="container">
	<div id="navigation">
		<div id="naviLeft">
			<ul>
				<li> <a href="?classid=67" class="naviLeft">运动休闲</a> </li>
				<li> <a href="?classid=67" class="naviLeft">时尚休闲</a> </li>
				<li> <a href="?classid=67" class="naviLeft">时尚职业</a> </li>
			</ul>
			<div id="naviSelect">
				<select name="select" id="select" onChange="window.location.href='?profilte=Season&profilteid='+this.value">
					<option value="0">按季节分类</option>
					<option value="1">春季</option>
					<option value="2">夏季</option>
					<option value="3">秋季</option>
					<option value="4">冬季</option>
				</select>
				<select name="select" id="select" onChange="window.location.href='?profilte=prostyle&profilteid='+this.value">
					<option value="0">按功能分类</option>
					<option value="1">外套</option>
					<option value="2">上衣</option>
					<option value="3">连衣裙</option>
				</select>
				<select name="select2" id="select2" onChange="window.location.href='?profilte=proyear&profilteid='+this.value">
					<option value="0">按年份分类</option>
					<option value="2010">2010年</option>
					<option value="2009">2009年</option>
					<option value="2008">2008年</option>
					<option value="2007">2007年</option>
					<option value="2006">2006年</option>
				</select>
			</div>
		</div>
	</div>
	<!--#include file="files/inc/inner-menu.asp" -->
	<div id="content"> <img src="files/images/title_products.gif" />
		<hr/>
		<h1>时尚休闲系列</h1>
		<div id="products_fancybox">
		<%
		if not isempty(DataTemp) then
		for i=0 To rs.length-1
		%>
		<a href="fancybox.asp?id=<%=rs.slice(i,i+1).[0].id%>"><div class="products" style="background:url(<%=rs.slice(i,i+1).[0].img%>);"><div class="prductMouseOn" id="priceBlock" style="color:#fff;display:none;"><%=rs.slice(i,i+1).[0].name%><h2>
		<%
		if not userCookies="" Then	 Response.Write("￥"&rs.slice(i,i+1).[0].Price)
		%></h2></div></div></a>
		<%
		Next
		Set rs=Nothing
		end if
		%>
			<!--
		<a href="fancybox.asp"><div class="products" style="background:url(files/images/img_01.jpg);"> </div></a>
		<a href="fancybox.asp"><div class="products" style="background:url(files/images/img_02.jpg);"> </div></a>
		<div class="products" style="background:url(files/images/img_03.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_04.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_05.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_06.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_08.jpg);" href="fancybox.asp"> </div>
		<div class="products" style="background:url(files/images/img_05.jpg);" href="fancybox.asp"> </div>-->
		</div>
		<p>&nbsp; </p>
		<div class="contentEnd"><br/><br/> <a href="<%=pageup%>"><img src="files/images/button_next.gif" border="0" align="right" /></a><a href="<%=pagedown%>"><img src="files/images/button_last.gif" border="0" align="right" /></a> </div>
	</div>
	<!--#include file="files/inc/inner-foot-a.asp" -->
</div>
<!--#include file="lib/foot.asp" -->