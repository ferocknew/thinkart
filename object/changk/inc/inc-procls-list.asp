<%
Dim proClassID:proClassID=60
Dim proClass_3ID:proClass_3ID=68

Set proClassRs=Jasp.ado(conn).exec("select [id],[class_name] from [class2] where ([upclassid]="&proClassID&")").get()

Dim proClassStyle:proClassStyle="unselProduct"
%>
<div id="productList">
<ul>
<!--li class="onselProduct">S165 A/W/S215 A/W</li>
<li class="onselProductSub">S165 A/W/S215 A/W</li-->
<%
if not proClassRs.length=0 then
for i=0 to proClassRs.length-1

If ClassType="class2" And Int(classid)=proClassRs.slice(i,i+1).[0].id Then
proClassStyle="onselProduct"
Else
proClassStyle="unselProduct"
End If
%>
<li class="<%=proClassStyle%>" classid="<%=proClassRs.slice(i,i+1).[0].id%>" url="inner.asp?classtype=class2&classid=<%=proClassRs.slice(i,i+1).[0].id%>"><%=proClassRs.slice(i,i+1).[0].class_name%></li>
<%
next
end if
%>
</ul>
</div>
<%
proClassRs=null
%>
<script>
$(function(){
	$("#productList li").css("cursor","pointer");
	$("#productList li").click(function(){
		window.location.href=$(this).attr("url");
	});
});
</script>