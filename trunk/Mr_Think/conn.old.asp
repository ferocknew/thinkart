<%
Dim SqlNowString
Const fversion="0.01" '版本号
Const MsxmlVersion=".3.0" 'Msxml版本号

Const IsSqlDataBase = 0
If IsSqlDataBase = 1 Then
'必修改设置二：========================SQL数据库设置=============================================================
'sql数据库连接参数：数据库名(SqlDatabaseName)、用户密码(SqlPassword)、用户名(SqlUsername)、
'连接名(SqlLocalName)（本地用local，外地用IP）
Const SqlDatabaseName = ""
Const SqlPassword = ""
Const SqlUsername = ""
Const SqlLocalName = "(local)"
'================================================================================================================
SqlNowString = "GetDate()"
Else
'必修改设置三：========================Access数据库设置==========================================================
'免费用户第一次使用请修改本处数据库地址并相应修改data目录中数据库名称
MyDbPath="data/"
db = "Data.mdb"
'================================================================================================================
SqlNowString = "Now()"
End If
ConnectionDatabase '打开数据库

Sub ConnectionDatabase
	Dim ConnStr
	If IsSqlDataBase = 1 Then
		ConnStr = "Provider = Sqloledb; User ID = " & SqlUsername & "; Password = " & SqlPassword & "; Initial Catalog = " & SqlDatabaseName & "; Data Source = " & SqlLocalName & ";"
	Else
		ConnStr = "Provider = Microsoft.Jet.OLEDB.4.0;Data Source = " & Server.MapPath(MyDbPath & db)
	End If
	On Error Resume Next
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.open ConnStr
	If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "数据库连接出错，请检查连接字串。"'注释，需要把这几个字翻译成英文。
		Response.End
	End If
End Sub

Sub CloseDB '关闭数据库
    on error resume next
  	Conn.Close
	Set Conn=Nothing
End Sub
%>