<%
'***************mrThink 缓存处理*******************
' Update:2009-12-16
'**************************************************
'-------------------------mrThink 基本参数--------------------------
Dim site_Infos,site_name,com_name,intro_abstract,site_logo,site_leader,site_icp,site_url,site_com_intro
Dim memoryCache,site_version,site_UpdateDate

'一些初始化的值
site_version = "0.0.01" '当前 mrThink 版本号
site_UpdateDate = "2009-12-16"'mrThink 最新更新时间
memoryCache = false '全内存cache
'-------------------------End--------------------------

'------------------------- 网站基本信息缓存 -------------------------
Sub getInfo(ByVal action)
	If Not IsArray(Application(CookieName&"_site_Infos")) Or action = 2 Then
		info_Field="site_name,com_name,intro_abstract,logo,leader,site_icp,site_url,com_intro"
		site_Infos=table_readdate(conn,"","info",info_Field,"id=1","")

		Err.clear
		If IsEmpty(site_Infos) Then
		Response.Write("Err:"&Err)
		Response.End()
		End If

		Application.Lock
        Application(CookieName&"_site_Infos") = site_Infos
        Application.UnLock
	Else
		site_Infos = Application(CookieName&"_site_Infos")
	End If

	If action<>2 Then
		site_name = site_Infos(0, 0) '站点名字
		com_name = site_Infos(1, 0) '公司名字
		intro_abstract= site_Infos(2, 0) '公司摘要
		site_logo= site_Infos(3, 0) '公司logo
		site_leader=site_Infos(4, 0) '公司 负责人
		site_icp=site_Infos(5, 0) '公司 ICP备案
		site_url=site_Infos(6, 0) '网站地址
		site_com_intro=site_Infos(7, 0) '网站简介
	End If
End Sub
'------------------------- End Sub --------------------------

'------------------------- 重新加载缓存 -------------------------
Sub reloadcache
    getInfo(2)
End Sub
'------------------------- End Sub --------------------------

%>