<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<%
'conn.execute("alter table class1 add Content text")
'SQL="Create table top_menu(id COUNTER(1, 1) CONSTRAINT PK_TVIPLevel26 PRIMARY KEY,title varchar(250), content MEMO,DateTimes DATETIME,next_class varchar(250))"
'conn.execute(SQL)
If Not chktable("top_menu",conn) Then
Response.Write(1)
Else
Response.Write(2)
End If
%>
<!--#include file="../lib/foot.asp" -->