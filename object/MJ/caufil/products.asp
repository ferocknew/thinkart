<!--#include file="../lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="../lib/header_commad.asp" -->
<%
Dim userCookies
userCookies=Easp.GetCookie(CookieName&":index_userid")
Dim pages,classid,profilter,profilterid
profilte=Easp.RQ("profilte",0) '搜索条件
profilteid=Easp.RQ("profilteid",1) '搜索结果
PageNum=Easp.RQ("page",1) '当前页码

class3id=Easp.RQ("classid",1)
if class3id="" Then class3id=68
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
	.PageNum=PageNum			'页码
	.PageSize=pageSize			'每页记录条数
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菁夫人服饰</title>
<script type="text/javascript" src="../lib/js/jquery.min.js"></script>
<script type="text/javascript" src="../lib/js/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="../lib/js/fancybox/jquery.mousewheel.pack.js"></script>
<link href="files/css/style.css" rel="stylesheet" type="text/css" />
<link href="../lib/js/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">&nbsp;
	<div id="menu">
		<ul>
			<li><a href="index.html"><img src="files/images/menu_home1.gif" border="0" /></a></li>
			<li><a href="brand.html"><img src="files/images/menu_brand1.gif" border="0" /></a></li>
			<li><a href="products.html"><img src="files/images/menu_products2.gif" border="0" /></a></li>
			<li><a href="../join2.asp"><img src="files/images/menu_join1.gif" border="0" /></a></li>
			<li><a href="../contact.asp"><img src="files/images/menu_contact1.gif" border="0" /></a></li>
		</ul>
	</div>
	<div id="banner"><img src="files/images/banner_brand.jpg" /></div>
	<div id="homeContent">
		<div id="navigationProducts">
			<ul>
				<li class="naviList2" id="season_class1">季节分类</li>
				<li click_hidden="class1"><a href="?profilte=Season&profilteid=1" class="navigationProducts">春装</a></li>
				<li click_hidden="class1"><a href="?profilte=Season&profilteid=2" class="navigationProducts">夏装</a></li>
				<li click_hidden="class1"><a href="?profilte=Season&profilteid=3" class="navigationProducts">秋装</a></li>
				<li click_hidden="class1"><a href="?profilte=Season&profilteid=4" class="navigationProducts">冬装</a></li>
				<li class="naviList2" id="season_class2">功能分类</li>
				<li click_hidden="class2"><a href="?profilte=prostyle&profilteid=2" class="navigationProducts">上衣</a></li>
				<li click_hidden="class2"><a href="?profilte=prostyle&profilteid=4" class="navigationProducts">裤子</a></li>
				<li click_hidden="class2"><a href="?profilte=prostyle&profilteid=5" class="navigationProducts">裙子</a></li>
				<li class="naviList2"  id="season_class3">年份分类</li>
				<li click_hidden="class3"><a href="?profilte=proyear&profilteid=2008" class="navigationProducts">2008</a></li>
				<li click_hidden="class3"><a href="?profilte=proyear&profilteid=2009" class="navigationProducts">2009</a></li>
				<li click_hidden="class3"><a href="?profilte=proyear&profilteid=2010" class="navigationProducts">2010</a></li>
			</ul>
		</div>
		<div id="contentProducts">
			<div class="productsTitle">季节分类  &gt; 春装</div>
			<div id="products_fancybox">
<%
if not isempty(DataTemp) then
for i=0 To rs.length-1
%>
			  <a href="../fancybox.asp?id=<%=rs.slice(i,i+1).[0].id%>" fancybox="1"><div class="productsItem" style=" background:url(<%=rs.slice(i,i+1).[0].img%>) center no-repeat;"><div class="productsInfo"><%=rs.slice(i,i+1).[0].name%><span style="float:right;"></span></div><!--div class="productsNew">New</div--></div></a>
<%
Next
Set rs=Nothing
end if
%>
<div style="text-align:right; color:#000;"><a style="text-align:center;" href="<%=pagedown%>"><img src="../jarfect/files/images/pageup_a.gif" border="0" /></a> | <a href="<%=pageup%>"><img src="../jarfect/files/images/pagedown_a.gif" border="0"/></a></div>
			</div>
		</div>
	</div>
	<div id="footer">copyright © 2010 Caufil all right reserved.</div>
</div>
<script>
$("a[href='#']").attr("href","javascript:void(0);");
var _$products_fancybox = $("#products_fancybox");
$("a[fancybox='1']", _$products_fancybox).fancybox({
'padding': 0,
'autoDimensions': true,
'autoScale': true,
'type': 'iframe',
'width':600,
'height':550
});
$("#season_class1").bind("click", function(e){
	$(this).nextAll("li[click_hidden='class1']").slideToggle();
	$(this).toggleClass("naviList").toggleClass("naviList2");
	
});
$("#season_class2").bind("click", function(e){
	$(this).nextAll("li[click_hidden='class2']").slideToggle();
	$(this).toggleClass("naviList").toggleClass("naviList2");
	
});
$("#season_class3").bind("click", function(e){
	$(this).nextAll("li[click_hidden='class3']").slideToggle();
	$(this).toggleClass("naviList").toggleClass("naviList2");
	
});
</script>
<!--#include file="../lib/foot.asp" -->