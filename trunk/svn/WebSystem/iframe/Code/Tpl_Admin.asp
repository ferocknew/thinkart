<%
Class Tpl_Admin
	Private Tpl
	'//--------------------------初始函数-------------------------------
	Private Sub Class_Initialize()
		Set Tpl=New JaspTpl
	End Sub
	'//--------------------------析构函数-------------------------------
	Private Sub Class_Terminate()
		Set Tpl=Nothing
	End Sub
	'//-------------------------- 主方法 -------------------------------
	Public Sub action(ByVal v_as)
		Select Case v_as
			Case "save"
				Call Tpl_Admin_Save()
			Case Else
				Tpl_Admin_Edit("admin_edit.tpl")
		End Select
	End Sub

	'//-------------------------- 管理员信息呈现 -------------------------------
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

	'//-------------------------- 管理员信息编辑 -------------------------------
	Private Sub Tpl_Admin_Save()
		Dim v_AdminName,v_AdminPassWord,v_AdminType,v_SQL
		Dim v_D : Set v_D = Server.CreateObject("Scripting.Dictionary")

		v_AdminName=Easp.RF("AdminName",0):Call v_D.add("AdminName",v_AdminName)
		v_AdminType=Easp.RF("AdminType",1):Call v_D.add("AdminType",v_AdminType)
		'密码修改必须有内容
		v_AdminPassWord=SHA1(Easp.RF("AdminPassWord",0))
		If Not v_AdminPassWord="" Then Call v_D.add("AdminPassWord",v_AdminPassWord)

		For Each i In v_D
			v_SQL="UPDATE [WebSiteInfo] SET InfoValue = '" & v_D(i) & "' WHERE Key = '"&i&"'"
			Conn.Execute(v_SQL)
			Cache(i).clear
		Next

		Set v_D=Nothing

		Call RefushCache(false) '只刷新删除以后的缓存
		Dim v_Temp : v_Temp=Split(Request.ServerVariables("HTTP_REFERER"),"/")
		Dim v_Back : v_Back=v_Temp(UBound(v_Temp))
		Response.Write("<meta http-equiv='Content-Type' content='text/html;' charset='utf-8' />")
		Response.Write("<script>alert('保存成功！');window.location.href='"&v_Back&"'</script>")
	End Sub
End Class
%>