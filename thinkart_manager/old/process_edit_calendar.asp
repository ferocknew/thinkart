<%Session.CodePage=65001%>
<!--#include file="inc_conn.asp"-->

<%
edit_id = request("edit_id")
work_date = trim(request("work_date"))
work_detail = trim(request("work_detail"))
work_result = trim(request("work_result"))
%>

<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM tm_calendar where id= "&edit_id&""
rs.OPEN sql,Conn,1,3
rs("work_date")= work_date
rs("work_year")= year(work_date)
rs("work_month")= month(work_date)
rs("work_day")= day(work_date)
rs("work_detail")= work_detail
rs("work_result")= work_result
rs("work_people")= session("tname")
rs.update
rs.close
set rs=nothing
response.redirect "listcalendar.asp"
%>