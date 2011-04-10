<%
Class DBHelper
	Private conn
	Private Sub Class_Initialize
        strConn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../DataBase/db.mdb") 
		Set conn=Server.CreateObject("ADODB.Connection" )
		conn.Open(strConn)
	End Sub
	Private Sub Class_Terminate
        conn.Close()
		Set conn=nothing
    End Sub
	Public Function ExecuteQuery(strSql)
		Set rs=Server.CreateObject("ADODB.RecordSet")
		rs.Open strSql,conn,1,1
		Set ExecuteQuery=rs
	End Function
	Public Sub ExecuteNonQuery(strSql)
		conn.Execute(strSql)
	End Sub 
End Class
Set DB=new DBHelper

Function InputReplace(str)
	If IsNull(str) Then str="" End If
	InputReplace = Replace(Cstr(str),"'","&acute;")
End Function
Function OutputReplace(str)
	If IsNull(str) Then str="" End If
	OutputReplace = Replace(Cstr(str),"&acute;","'")
End Function
%>