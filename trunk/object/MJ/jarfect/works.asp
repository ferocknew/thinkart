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
if class3id="" Then class3id=69
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>菁菲-首页</title>
	<script type="text/javascript" src="../lib/js/jquery.min.js"></script>
	<script type="text/javascript" src="../lib/js/fancybox/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="../lib/js/fancybox/jquery.mousewheel.pack.js"></script>
	<script type="text/javascript" src="../lib/js/jquery.transitions.js"></script>
	<link href="../lib/js/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" />
	<link href="files/css/style.css" rel="stylesheet" type="text/css" />
	<link href="files/css/works.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
	<div id="container">

		<div class="header">
			<div class="logo">
				<h1>菁菲</h1>
				<h2>菁夫人旗下品牌</h2>
			</div><!-- .logo-->
			<div class="nav">
				<ul>
					<li><a href="index.html">企业首页<span>home</span></a></li>
					<li><a href="about.html">关于品牌<span>about</span></a></li>
					<li><a class="now" href="works.asp">新品发布<span>works</span></a></li>
					<li><a href="../join2.asp">加盟店铺<span>join us</span></a></li>
					<li><a href="../contact.asp">联系我们<span>contact</span></a></li>
				</ul>
			</div><!-- .nav-->
		</div><!-- .header-->

		<div class="banner">
			<ul class="banner_nav" style="display:none;">
				<li><a class="now" href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul><!-- .banner_nav--><!-- .price-->
			<div id="banner_img" style="height:421px; width:932px; border:#CCC solid 4px;"></div>
		</div><!--.banner-->

		<div class="contant">
		  <div class="sidebar">
				<h2>新品发布</h2>
				<ul>
				  <li class="bg2"><a href="#">按季节</a>
                    	<ul>
							<li><a href="?profilte=proyear&profilteid=2010">春季</a></li>
							<li><a href="?profilte=proyear&profilteid=2009">夏季</a></li>
							<li><a href="?profilte=proyear&profilteid=2008">秋季</a></li>
							<li><a href="?profilte=proyear&profilteid=2007">冬季</a></li>
						</ul>
                  </li>
					<li class="bg2"><a href="#">按功能</a>
                    	<ul>
							<li><a href="?profilte=proyear&profilteid=2010">上衣</a></li>
							<li><a href="?profilte=proyear&profilteid=2009">裙子</a></li>
							<li><a href="?profilte=proyear&profilteid=2008">裤子</a></li>
						</ul>
					</li>
					<li class="bg2"><a href="#">按年份</a>
						<ul>
							<li><a href="?profilte=proyear&profilteid=2010">2010</a></li>
							<li><a href="?profilte=proyear&profilteid=2009">2009</a></li>
							<li><a href="?profilte=proyear&profilteid=2008">2008</a></li>
							<li><a href="?profilte=proyear&profilteid=2007">2007</a></li>
						</ul>
					</li>
				</ul>
			</div><!-- .sidebar-->

			<div class="main" id="products_fancybox">
				<h1>新品上市</h1>
<%
if not isempty(DataTemp) then
for i=0 To rs.length-1
%>
				<div class="new"><a href="../fancybox.asp?id=<%=rs.slice(i,i+1).[0].id%>" fancybox="1"><div class="img"><p class="price" style="color:#fff; display: none;"><span class="left"><%=rs.slice(i,i+1).[0].name%></span></p>	<img src="<%=rs.slice(i,i+1).[0].img%>"></div></a><!-- .img-->	</div><!-- .new-->
<%
Next
Set rs=Nothing
end if
%>
<div style="color:#000; text-align:center;"><a href="<%=pagedown%>"><img src="files/images/pageup_1_a.gif" border="0"></a> | <a href="<%=pageup%>"><img src="files/images/pagedown_1_a.gif" border="0"/></a></div>
			</div><!-- .main--><!-- .main-->
		</div><!-- .contant-->

		<div class="footer">
			<p>©2010 菁菲</p>
		</div><!-- .footer-->

	</div><!-- #container-->
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

$(".new",_$products_fancybox).hover(function(){
	$(this).find("p").show();
},function(){
	$(this).find("p").hide();
})

$("#banner_img").transition({
duration : 3000,
images : ['files/images/index_banner_1.jpg', 'files/images/index_banner_2.jpg', 'files/images/index_banner_3.jpg','files/images/index_banner_4.jpg','files/images/index_banner_5.jpg'],
type : 'fade'
});

$(".bg2 a").click(function(){
	$(this).next().toggle("slow");
})
</script>
<!--#include file="../lib/foot.asp" -->