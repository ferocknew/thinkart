<!--#include file="../Service/SiteInfoService.asp"-->
<%
Class SiteInfoAdapter

	Public Function InsertSiteInfo(objSiteInfo)
		InsertSiteInfo="插入失败！"
		SiteInfoDao.InsertSiteInfo(objSiteInfo)
		InsertSiteInfo="插入成功！"
	End Function
	
	Public Function DeleteSiteInfo(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			SiteInfoDao.DeleteSiteInfo(id)
			DeleteSiteInfo="删除成功！"
		Else
			DeleteSiteInfo="删除失败！"
		End If
	End Function
	
	Public Function UpdateSiteInfo(objSiteInfo)
		UpdateSiteInfo="修改失败！"
		
		SiteInfoDao.UpdateSiteInfo(objSiteInfo)
		UpdateSiteInfo="修改成功！"
	End Function
	
	Public Function GetAllSiteInfo()
		Set GetAllSiteInfo=SiteInfoDao.GetAllSiteInfo()
	End Function
	
	Public Function GetSiteInfoByObjSiteInfo(objSiteInfo)
		Set GetSiteInfoByObjSiteInfo=SiteInfoDao.GetSiteInfoByObjSiteInfo(objSiteInfo)
	End Function
	
	Public Function GetSiteInfoById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
			Set GetSiteInfoById = SiteInfoDao.GetSiteInfoById(id)
	End Function
	
End Class

Set SiteInfoManager = new SiteInfoAdapter
%>