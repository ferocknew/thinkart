<!--#include file="../Model/SiteInfo.asp"-->
<%
Class SiteInfoService

	Public Sub InsertSiteInfo(objSiteInfo)
		strInsertSql="insert into SiteInfo (SiteName,IcpNum,SeoKeywords,SeoDesc,SiteCopyright,AdminPath,SiteOff) values ('" &InputReplace(objSiteInfo.SiteName) &_
			"','"& InputReplace(objSiteInfo.IcpNum) &"','"& InputReplace(objSiteInfo.SeoKeywords) &"','"& InputReplace(objSiteInfo.SeoDesc) &"','"& InputReplace(objSiteInfo.SiteCopyright) &"','"&_
			InputReplace(objSiteInfo.AdminPath) &"','"& InputReplace(objSiteInfo.SiteOff) &"')"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	'Public Sub DeleteSiteInfo(id)
	'	strDeleteSql="delete from SiteInfo where Id="& id
	'	DB.ExecuteNonQuery(strDeleteSql)
	'End Sub
	
	Public Sub UpdateSiteInfo(objSiteInfo)
		strUpdateSql="update SiteInfo set SiteName='"& InputReplace(objSiteInfo.SiteName)  &"',IcpNum='"& InputReplace(objSiteInfo.IcpNum) &_
			"',SeoKeywords='"& InputReplace(objSiteInfo.SeoKeywords) &"',SeoDesc='"& InputReplace(objSiteInfo.SeoDesc) &"',SiteCopyright='"& InputReplace(objSiteInfo.SiteCopyright) &_
			"',AdminPath='"& InputReplace(objSiteInfo.AdminPath) &"',SiteOff='"& InputReplace(objSiteInfo.SiteOff) &"' where Id="& InputReplace(objSiteInfo.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	'Public Function GetAllSiteInfo()
	'	strSelectSql="select * from SiteInfo"
	'	Set rs=DB.ExecuteQuery(strSelectSql)
	'	Set dic=Server.CreateObject("Scripting.Dictionary")
	'	While not rs.eof
	'		Set SiteInfo=CreateSiteInfo(rs) 
	'		dic.Add SiteInfo.Id,SiteInfo
	'		rs.MoveNext
	'	wend
	'	rs.Close
	'	Set rs=nothing
	'	Set GetAllSiteInfo=dic
	'End Function
	Public Function GetSiteInfoById(id)
		strSelectSql="select * from SiteInfo where Id="&InputReplace(id)
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set SiteInfo=CreateSiteInfo(rs)
		rs.Close
		Set rs=nothing 
		Set GetSiteInfoById=SiteInfo
		
	End Function
	
	Private Function CreateSiteInfo(rs)
		Set SiteInfo=new SiteInfo
		If Not rs.Eof Then
			SiteInfo.Id=OutputReplace(rs("Id"))
			SiteInfo.SiteName=OutputReplace(rs("SiteName"))
			SiteInfo.IcpNum=OutputReplace(rs("IcpNum"))
			SiteInfo.SeoKeywords=OutputReplace(rs("SeoKeywords"))
			SiteInfo.SeoDesc=OutputReplace(rs("SeoDesc"))
			SiteInfo.SiteCopyright=OutputReplace(rs("SiteCopyright"))
			SiteInfo.AdminPath=OutputReplace(rs("AdminPath"))
			SiteInfo.SiteOff=OutputReplace(rs("SiteOff"))
		End If
		Set CreateSiteInfo=SiteInfo
	End Function
	
End Class

Set SiteInfoDao = new SiteInfoService
%>


