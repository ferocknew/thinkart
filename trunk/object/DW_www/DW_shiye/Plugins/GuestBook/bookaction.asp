<!--#include file="../../lib/plugins/plugins.asp" -->
<%
'=====================================
'
'=====================================
Dim note_name,note_tel,note_mail,note_const
note_name=Trim(Easp.RF("_name",0))
note_tel=Trim(Easp.RF("_tel-num",0))
note_mail=Trim(Easp.RF("_mail-adr",0))
note_content=Trim(Easp.RF("_const",0))

note_others="<[&&&**&&&]>"&note_tel

SQL="select * From message"
Set rs = Server.CreateObject("ADODB.RecordSet")
rs.open(SQL),conn,1,3
rs.addnew
rs("name")=note_name
rs("email")=note_mail
rs("content")=note_content
rs("others")=note_others
rs("addtime")=Now()
rs.update
rs.close:Set rs=Nothing
Response.Write("ok")
%>
