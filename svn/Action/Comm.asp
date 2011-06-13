<%
'全站全局参数
Dim WebSiteInfo
'//---------------------------- 设置全局缓存 -----------------------------
If Not Cache("WebSiteName").ready Then
	Call GetWebSiteInfo()
	For Each item In WebSiteInfo
		If Not Cache(item).ready Then Cache(item)=WebSiteInfo(item)
	Next
End If

'//---------------------------------------------------------
'全局变量方法
'//---------------------------------------------------------
Sub GetWebSiteInfo
	Dim v_D,v_rs
	Set v_D = Server.CreateObject("Scripting.Dictionary")
	Set v_rs=Jasp.ado(Conn).exec("Select [Key],[InfoValue] From [WebSiteInfo]").Get()

	If Not v_rs.length=0 Then
		For i=0 To v_rs.length-1
			Dim v_Temp : v_Temp=v_rs.slice(i,i+1).[0].Key
			Call v_D.add(v_Temp,v_rs.slice(i,i+1).[0].InfoValue)
		Next
	End If
	Set WebSiteInfo = v_D
End Sub
%>