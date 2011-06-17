<%
Class Tpl_Admin
	Private Tpl,v_D
	'//--------------------------初始函数-------------------------------
	Private Sub Class_Initialize()
		Set v_D = Server.CreateObject("Scripting.Dictionary")
		Set Tpl=New JaspTpl
	End Sub
	'//--------------------------析构函数-------------------------------
	Private Sub Class_Terminate()
		Set v_D=Nothing
		Set Tpl=Nothing
	End Sub
	'//-------------------------- 主方法 -------------------------------
	'//-- 管理员操作
	Public Sub AdminAction(ByVal v_as)
		Select Case v_as
			Case "save"
				Call Tpl_Admin_Save()
			Case Else
				Call Tpl_Admin_Edit("admin_edit.tpl")
		End Select
	End Sub

	'//-- 网站操作
	Public Sub WebSiteSetAction(ByVal v_as)
		Select Case v_as
			Case "save"
				Call Tpl_WebSiteSet_Save()
			Case Else
				Call Tpl_WebSiteSet_Edit("admin_WebSiteSet.tpl")
		End Select
	End Sub

	'//-- 内容分类操作
	Public Sub classMConn(ByVal v_as)
		Select Case v_as
			Case "save"
				Response.Write("1")
			Case Else
				Call Tpl_ClassMConn("admin_ClassSet.tpl")
		End Select
	End Sub

	Public Sub contentAction(ByVal v_as)
		Select Case v_as
			Case "add"
				Call Tpl_contentAdd("admin_ConnAdd.tpl")
			Case "save"
				Response.Write("1")
			Case Else
				Call Tpl_contentAction("admin_ConnList.tpl")
		End Select
	End Sub
	'//-------------------------- 新闻操作sub集 -------------------------------
	'//-- 新闻列表页面
	Private Sub Tpl_contentAction(ByVal FilePath)
		'设置模板调用路径（模板存储位置，相对调用文件的所在目录）
		Tpl.setTemplatePath="../../templates/Admin/"
		'设置模板调用文件
		Tpl.setTemplateFile=FilePath


		Tpl.display()
	End Sub

	'//-- 新闻添加页面
	Private Sub Tpl_contentAdd(ByVal FilePath)
		'设置模板调用路径（模板存储位置，相对调用文件的所在目录）
		Tpl.setTemplatePath="../../templates/Admin/"
		'设置模板调用文件
		Tpl.setTemplateFile=FilePath


		Tpl.display()
	End Sub
	'//-------------------------- 新闻操作sub集 End -------------------------------

	'//-------------------------- 内容分类操作sub集 -------------------------------
	Private Sub Tpl_ClassMConn(ByVal FilePath)
		'设置模板调用路径（模板存储位置，相对调用文件的所在目录）
		Tpl.setTemplatePath="../../templates/Admin/"
		'设置模板调用文件
		Tpl.setTemplateFile=FilePath
		Dim ClassObj : Set ClassObj=newClass("ClassCon","../../App_Code/")

		Dim list_DataType : list_DataType="ClassName,MDate,MDateInt"
		Dim Arr_GetList : Arr_GetList=ClassObj.getMasterList(list_DataType)
		Tpl.d("data[name=list]")=Array(Arr_GetList,list_DataType)


		Tpl.display()
	End Sub
	'//-------------------------- 内容分类操作sub集 End -------------------------------

	'//-------------------------- 管理员操作sub集 -------------------------------
	'//-- 管理员信息呈现
	Private Sub Tpl_Admin_Edit(ByVal FilePath)
		'设置模板调用路径（模板存储位置，相对调用文件的所在目录）
		Tpl.setTemplatePath="../../templates/Admin/"
		'设置模板调用文件
		Tpl.setTemplateFile=FilePath
		Tpl.d("AdminName")=Cache("AdminName")
		Tpl.d("AdminCDate")=FormatDT(Cache("AdminCDate"),"{Y}年{M}月{D}日")
		Tpl.d("AdminType")=Cache("AdminType")

		Tpl.display()
	End Sub

	'//-- 管理员信息编辑
	Private Sub Tpl_Admin_Save()
		Dim v_AdminName,v_AdminPassWord,v_AdminType,v_SQL

		v_AdminName=Trim(Easp.RF("AdminName",0)):Call v_D.add("AdminName",v_AdminName)
		v_AdminType=Easp.RF("AdminType",1):Call v_D.add("AdminType",v_AdminType)
		'密码修改必须有内容
		v_AdminPassWord=SHA1(Trim(Easp.RF("AdminPassWord",0)))
		If Not v_AdminPassWord="" Then Call v_D.add("AdminPassWord",v_AdminPassWord)

		For Each i In v_D
			v_SQL="UPDATE [WebSiteInfo] SET InfoValue = '" & CheckStr(v_D(i)) & "' WHERE Key = '"&i&"'"
			Conn.Execute(v_SQL)
			'Cache(i).clear
			Cache(i)=v_D(i)
		Next

		'Call RefushCache(false) '只刷新删除以后的缓存
		Call AlertBack("保存成功！")
	End Sub
	'//-------------------------- 管理员操作sub集 End -------------------------------

	'//-------------------------- 网站设置sub集 -------------------------------
	'//-- 网站设置呈现
	Private Sub Tpl_WebSiteSet_Edit(ByVal FilePath)
		'Call RefushCache(true)
		'设置模板调用路径（模板存储位置，相对调用文件的所在目录）
		Tpl.setTemplatePath="../../templates/Admin/"
		'设置模板调用文件
		Tpl.setTemplateFile=FilePath
		Tpl.d("WebSiteName")=Cache("WebSiteName")
		Tpl.d("WebSiteKeywords")=Cache("WebSiteKeywords")
		Tpl.d("WebSiteDescription")=Cache("WebSiteDescription")
		Tpl.d("WebSiteCopyright")=Cache("WebSiteCopyright")
		Tpl.d("WebSiteICP")=Cache("WebSiteICP")
		Tpl.d("WebSiteEditorWidth")=Cache("WebSiteEditorWidth")
		Tpl.d("WebSiteNotice")=Cache("WebSiteNotice")
		Tpl.d("WebSiteSwitch")=Cache("WebSiteSwitch")
		Tpl.d("WebSiteLog")=Cache("WebSiteLog")
		Tpl.d("WebSiteOffPage")=Cache("WebSiteOffPage")

		Tpl.display()
	End Sub

	'//-- 网站信息保存
	Private Sub Tpl_WebSiteSet_Save()
		Dim v_WebSiteName,v_WebSiteKeywords,v_WebSiteDescription,v_WebSiteCopyright,v_WebSiteICP,v_WebSiteEditorWidth,v_WebSiteNotice,v_WebSiteSwitch,v_WebSiteLog,v_WebSiteOffPage
		Dim v_SQL

		v_WebSiteName=Trim(Easp.RF("WebSiteName",0)):Call v_D.add("WebSiteName",v_WebSiteName)
		v_WebSiteKeywords=Trim(Easp.RF("WebSiteKeywords",0)):Call v_D.add("WebSiteKeywords",v_WebSiteKeywords)
		v_WebSiteDescription=Trim(Easp.RF("WebSiteDescription",0)):Call v_D.add("WebSiteDescription",v_WebSiteDescription)
		v_WebSiteCopyright=Trim(Easp.RF("WebSiteCopyright",0)):Call v_D.add("WebSiteCopyright",v_WebSiteCopyright)
		v_WebSiteICP=Trim(Easp.RF("WebSiteICP",0)):Call v_D.add("WebSiteICP",v_WebSiteICP)
		v_WebSiteEditorWidth=Trim(Easp.RF("WebSiteEditorWidth",0)):Call v_D.add("WebSiteEditorWidth",v_WebSiteEditorWidth)
		v_WebSiteNotice=Trim(Easp.RF("WebSiteNotice",0)):Call v_D.add("WebSiteNotice",v_WebSiteNotice)
		v_WebSiteSwitch=Easp.RF("WebSiteSwitch",1):Call v_D.add("WebSiteSwitch",v_WebSiteSwitch)
		v_WebSiteLog=Easp.RF("WebSiteLog",1):Call v_D.add("WebSiteLog",v_WebSiteLog)
		v_WebSiteOffPage=Trim(Easp.RF("WebSiteOffPage",0)):Call v_D.add("WebSiteOffPage",v_WebSiteOffPage)

		For Each i In v_D
			v_SQL="UPDATE [WebSiteInfo] SET InfoValue = '" & CheckStr(v_D(i)) & "' WHERE Key = '"&i&"'"
			Conn.Execute(v_SQL)
			'Cache(i).clear
			Cache(i)=v_D(i)
		Next

		Call AlertBack("保存成功！")
	End Sub
	'//-------------------------- 网站设置sub集 End -------------------------------



	'//-------------------------- 通用方法 -------------------------------
	Private Sub AlertBack(ByVal AlertWords)
		Dim v_Temp : v_Temp=Split(Request.ServerVariables("HTTP_REFERER"),"/")
		Dim v_Back : v_Back=v_Temp(UBound(v_Temp))
		Response.Write("<meta http-equiv='Content-Type' content='text/html;' charset='utf-8' />")
		Response.Write("<script>alert('"&AlertWords&"');window.location.href='"&v_Back&"'</script>")
	End Sub
End Class
%>