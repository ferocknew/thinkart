<%@language="vbscript" codepage="65001"%>
<%
Session.codepage=65001
%>
<!--#include file="easp.asp" -->
<!--#include file="XML_jonah.asp" -->
<!--#include file="function_jonah.asp" -->
<%
Dim act_do
act_do=Easp.RQ("act",0)

Select Case act_do
Case "save_mail"
	Dim post_name,post_company,post_tel,post_add,Conn
	post_name=Easp.RF("name",0)
	post_company=Easp.RF("company",0)
	post_tel=Easp.RF("tel",0)
	post_add=Easp.RF("add",0)

	Set mydb = New EasyAsp_db
	mydb.dbConn = mydb.OpenConn(1,"db.mdb","")
	mydb.Exec("INSERT INTO message (post_name,post_com,post_tel,post_add) VALUES ('"&post_name&"', '"&post_company&"','"&post_tel&"','"&post_add&"')")
	Response.Write("我们已经收到您的记录")


End Select
%>