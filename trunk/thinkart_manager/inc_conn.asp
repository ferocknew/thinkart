<%
on error resume next
Dim db,conn,myconn
db="data/database.mdb"
Set Conn = Server.CreateObject("ADODB.Connection")
myconn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
Conn.Open MyConn
If Err Then
err.Clear
Set Conn = Nothing
Response.Write "数据库连接出错，请检查连接字串。"
Response.End
End If
%>
<script Language="JScript" runat="server">
//*************************************
//关闭数据库
//*************************************
	function CloseDB(){
		try{
		  	Conn.close();
			Conn = null;
		}catch(e){}
	}
</script>