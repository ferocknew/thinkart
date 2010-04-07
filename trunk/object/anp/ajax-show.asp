<!--#include file="lib/const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="lib/header_commad.asp" -->
<%
Dim act
act=Easp.RQ("act",0)
If act ="" Then Response.End()

Select Case act
Case "show-pro"
	Dim pro_id
	pro_id=Easp.RQ("proid",1)

	DBField="id,name,content"
    data_temp=table_readdate(conn,"","products",DBField,"(id="&pro_id&")","")
	data_temp_num=ArrayisEmpty(data_temp)
    If data_temp_num=-1 Then
        Response.End()
    End If
End Select

%>
<!-- Html Body -->
<style>
*{ margin:0px; padding:0px;}
</style>
<body>
<div style="background-color:#FFF;"><%=data_temp(2,0)%></div>
<!-- #content-->
<!--#include file="lib/foot.asp" -->