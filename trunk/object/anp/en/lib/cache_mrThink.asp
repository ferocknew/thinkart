<%
'***************mrThink ���洦��*******************
' Update:2009-12-16
'**************************************************
'-------------------------mrThink ��������--------------------------
Dim site_Infos,site_name,com_name,intro_abstract,site_logo,site_leader,site_icp,site_url,site_com_intro
Dim memoryCache,site_version,site_UpdateDate

'һЩ��ʼ����ֵ
site_version = "0.0.01" '��ǰ mrThink �汾��
site_UpdateDate = "2009-12-16"'mrThink ���¸���ʱ��
memoryCache = false 'ȫ�ڴ�cache
'-------------------------End--------------------------

'------------------------- ��վ������Ϣ���� -------------------------
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
		site_name = site_Infos(0, 0) 'վ������
		com_name = site_Infos(1, 0) '��˾����
		intro_abstract= site_Infos(2, 0) '��˾ժҪ
		site_logo= site_Infos(3, 0) '��˾logo
		site_leader=site_Infos(4, 0) '��˾ ������
		site_icp=site_Infos(5, 0) '��˾ ICP����
		site_url=site_Infos(6, 0) '��վ��ַ
		site_com_intro=site_Infos(7, 0) '��վ���
	End If
End Sub
'------------------------- End Sub --------------------------

'------------------------- ���¼��ػ��� -------------------------
Sub reloadcache
    getInfo(2)
End Sub
'------------------------- End Sub --------------------------

%>