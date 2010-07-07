<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<!--#include file="lib/header_html.asp" -->
<!-- Html Body -->
<%
Dim classtype,classid,PageNum
classtype=Easp.RQ("classtype",0)
classid=Easp.RQ("classid",1)
SQL=""
conSQL=""

PageNum=Easp.RQ("PageNum",1) '当前页码
If PageNum="" Then
	pagedown="?PageNum=2&"&Request.ServerVariables("QUERY_STRING")
	pageup="?"&Request.ServerVariables("QUERY_STRING")
	PageNum=1
else
	pagedown="?PageNum="&PageNum+1&"&"&delQUERY(0)
	pageup="?PageNum="&PageNum-1&"&"&delQUERY(0)
end if


Dim pageSize:pageSize=9


DBField="id,name,img"
if not classtype="" then
	Select case classtype
	case "class2"
		conSQL="select count(id) from [products] where (class2id="&classid&")"
		SQL="select [id],[name],[img] from [products] where (class2id="&classid&") order by id desc"
	case "class3"
		conSQL="select count(id) from [products] where (class3id="&classid&")"
		SQL="select [id],[name],[img] from [products] where (class3id="&classid&") order by id desc"
		case "search"
		Dim textarea:textarea=Easp.RF("textarea",0)
		if textarea=""  then
			Jasp.js("alert('请输入查询内容！');history.back()")
			Response.End()
		end if

		conSQL="select count(id) from [products] where (name like '%"&trim(textarea)&"%')"
		SQL="select [id],[name],[img] from [products] where (name like '%"&trim(textarea)&"%') order by id desc"
	end select
else
	conSQL="select count(id) from [products]"
	SQL="select [id],[name],[img] from [products] order by id desc"
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

DataTempNum=conn.execute(conSQL)(0)
DataTemp=ors.ResultSet()		'返回ResultSet

JsonDBField=Split(DBField,",")

if not isempty(DataTemp) then set proRs=Jasp.VBRows2Obj(DataTemp,JsonDBField,3,1) '产品数据
'Set proRs=Jasp.ado(conn).exec(SQL).get()
%>
<div id="innerFrame">
	<!--#include file="inc/inc-html-top.asp" -->
	<div id="innerBanner"></div>
	<!-- #innerBanner-->
	<div id="innerContent">
		<div id="leftSide">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><img src="files/images/productTitle.jpg" width="220" height="50" /></td>
				</tr>
			</table>
		<!--#include file="inc/inc-procls-list.asp" -->
		</div>
		<div id="rightSide">
			<div id="rightTitle">&nbsp;&nbsp; 产品中心</div>
			<%
			if not proRs.length=0 then
			for i=0 to proRs.length-1
			%>
			<div id="productObj">
				<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td height="30" align="center"><%=proRs.slice(i,i+1).[0].name%></td>
					</tr>
					<tr>
						<td align="center"><img src="<%=proRs.slice(i,i+1).[0].img%>" width="140" height="140" /></td>
					</tr>
					<tr>
						<td height="40" align="center"><a href="products.asp?id=<%=proRs.slice(i,i+1).[0].id%>"><img src="files/images/button_viewDetail.jpg" width="79" height="24" border="0" /></a></td>
					</tr>
				</table>
			</div>
			<%
			next
			end if
			%>
			<div class="contentEnd"> <a href="<%=pageup%>">&lt;上一页</a> &nbsp; <a href="<%=pagedown%>">下一页&gt;</a> 共<%=DataTempNum%>个产品</div>
        </div>
	</div>
	<!-- #innerContent-->

</div>
<div id="copyRight">COPYRIGHT @ 2010 - DESIGN BY THINKART 2010 ALL RIGHT RESERVED</div>
<!--#include file="lib/foot.asp" -->
<script>
	$(function(){
		$("a[href='#']").attr("href","javascript:void(0);");
		$("#bannerRight").transition({
			duration : 3000,
			images : ['files/images/index-banner_1.jpg', 'files/images/index-banner_2.jpg','files/images/index-banner_3.jpg'],
			type : 'fade'
		});
	});
</script>