<%
on error resume next
dim db,conn,myconn
db="data/database.mdb"
Set Conn = Server.CreateObject("ADODB.Connection")
myconn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
Conn.Open MyConn
If Err Then
err.Clear
Set Conn = Nothing
Response.Write "���ݿ����ӳ������������ִ���"
Response.End
End If
%>
