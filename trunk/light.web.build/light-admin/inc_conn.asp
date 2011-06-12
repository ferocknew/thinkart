<script Language="JScript" runat="server">
function createConnection(IsSqlDataBase,strPath,SqlUsername,SqlPassword,SqlDatabaseName,SqlLocalName){
		try{
			Conn = Server.CreateObject("ADODB.Connection");
			if(IsSqlDataBase=="0"){
				Conn.connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath(strPath);
			}else{
				Conn.connectionString = "Provider = Sqloledb; User ID = "+ SqlUsername+"; Password = " + SqlPassword +"; Initial Catalog = " +SqlDatabaseName + "; Data Source = " +SqlLocalName+ ";"

			}
			Conn.open();
		}catch(e){
		    Response.Write('<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />数据库连接出错，请检查连接字串!');
		    Response.End
		}
	}
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
<%
Const AccessFile="../data/light_web_db.mdb"
Call createConnection(0,AccessFile)
%>