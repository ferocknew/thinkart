<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<%
Dim act,menu_title,menu_id
act=SafeRequest("act",0)
Select Case act
Case "save_top_menu"
	menu_title=Easp.RF("top_menu_val",0)
	conn.execute("insert into top_menu(title,DateTimes) values("""&menu_title&""","""&Now()&""")")
	Easp.RR("top_menu.asp")

Case "edit_top_menu"
	menu_title=Easp.RF("top_menu_val",0)
	menu_id=Easp.R("id",1)
	conn.execute("UPDATE top_menu SET title='"&menu_title&"' where (id="&menu_id&")")
	Easp.RR("top_menu.asp")
End Select


Call CloseDB()
%>