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
			Case "adminedit"
				Tpl_Admin_Edit("admin_edit.tpl")
			Case Else
				Response.Write("Tpl.Admin")
		End Select
	End Sub

	'//-------------------------- 管理员信息编辑 -------------------------------
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
End Class
%>