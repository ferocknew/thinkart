<%
'全站全局参数
Dim WebSiteInfo,Conn
Set Conn=Jasp.adodb.connection(Jasp.parse("{""provider"":""access"",""dataSource"":""../Data/DB.mdb""}").Get())
Set WebSiteInfo=GetWebSiteInfo

'//---------------------------------------------------------
'全局变量方法
'//---------------------------------------------------------
Function GetWebSiteInfo
	Dim v_D,v_rs
	Set v_D = Server.CreateObject("Scripting.Dictionary")
	Set v_rs=Jasp.ado(Conn).exec("Select [Key],[InfoValue] From [WebSiteInfo]").Get()

	If Not v_rs.length=0 Then
		For i=0 To v_rs.length-1
			Dim v_Temp : v_Temp=v_rs.slice(i,i+1).[0].Key
			Call v_D.add(v_Temp,v_rs.slice(i,i+1).[0].InfoValue)
		Next
	End If
	Set GetWebSiteInfo = v_D
End Function
%>