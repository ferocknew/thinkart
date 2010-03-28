<!--#include file="../lib/const.asp"-->
<!--#include file="conn_admin.asp"-->
<!--#include file="../lib/header_commad.asp"-->
<%
Dim act,menu_title,menu_id
act=SafeRequest("act",0)

Select Case act
	Case "save_menu"
		Dim title_menu,next_url_menu,orderid_menu,img_menu_menu,id_menu
		id_menu=Split(Easp.RF("id",0),",")
		title_menu=Split(Easp.RF("title",0),",")
		next_url_menu=Split(Easp.RF("next_url",0),",")
		orderid_menu=Split(Easp.RF("orderid",0),",")
		img_menu_menu=Split(Easp.RF("img_menu",0),",")

		For i=0 To UBound(id_menu)
		conn.execute("Update top_menu SET title='"&Trim(title_menu(i))&"', next_url='"&Trim(next_url_menu(i))&"', Datetimes='"&Now()&"', orderid="&Int(orderid_menu(i))&", img_menu='"&Trim(img_menu_menu(i))&"' where (id="&id_menu(i)&")")
		Next
		Call Easp.AlertUrl("记录已经更新！", "make_menu.asp")

	Case "add_friends" '友情链接
		Dim fr_title,fr_url,fr_img_url,fr_orderid
		fr_title=Trim(Easp.RF("title",0)) '名字
		fr_url=Trim(Easp.RF("url",0)) '链接
		'fr_orderid=Int(Trim(Easp.RF("orderid",0))) '索引
		fr_img_url=Trim(Easp.RF("img_url",0)) '图片连接，如果为空，只显示名字
		
		If table_recordcount(conn,"friends","id","")=0 Then
			fr_orderid=0
		Else
			Set rs=conn.execute("select max(orderid) as orderid from friends")
			fr_orderid=rs("orderid")+1
		End If

		conn.execute("INSERT INTO friends (title, url,datetimes,orderid,img_url) VALUES ('"&fr_title&"','"&fr_url&"','"&Now()&"','"&fr_orderid&"','"&fr_img_url&"')")
		Call Easp.AlertUrl("添加成功！", "friends.asp")

End Select
Call CloseDB()
%>