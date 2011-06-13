<%
'Dim str : str="123"
'Cache("str")=str			设置缓存
'Dim n_str
'n_str=Cache("str")			读取缓存
'Cache("str").save			存到文件，只支持数字，字符串，还有数据集对象
'
Class JaspCache
	Public PREFIX,PREFIX_LENGTH,RemCount
	Public DicItems,Reloadtime,[Name],FilePath,FileType
	Private C_Value,Jasp_Fso,strSITEROOT

	Private Sub Class_Initialize() 'Class 开始 全局参数
		strSITEROOT="./"
		Set Jasp_Fso = new JaspFso
		FilePath="Cache"
		FileType=".cache"
		ReloadTime=1200
		Set DicItems = Server.CreateObject("Scripting.Dictionary")
		'PREFIX = "Cached:"
		'PREFIX_LENGTH = 7

		PREFIX = ""
		PREFIX_LENGTH = 0
	End Sub

	Private Sub Class_Terminate'结束过程
		Set DicItems=Nothing
		Set Jasp_Fso = Nothing
	End Sub

	'//-------------------------- 定义根目录 ------------------------------
	Public Property Let setRoot(ByVal strVar)
	  strSITEROOT = strVar
	End Property
	'//-------------------------- 定义全局时间 ------------------------------
	Public Property Let setReloadTime(ByVal strVar)
	  ReloadTime = strVar
	End Property

	Public Default Property Get Item(ByVal Key) '获取Cache内容
		If Not IsObject(DicItems(Key)) Then
			Set DicItems(Key)=new Cache_info
			DicItems(Key).setRoot=strSITEROOT
			DicItems(Key).setReloadTime=ReloadTime
			DicItems(Key).KeyName = Key
		End If
		Set Item = DicItems(Key)

	'	Dim App_temp
	'
	'	Application(key)(0) = Application(Key)(0) + 1
	'	Item=Application(Key)(2)
	End Property

	Public Property Let Item(ByVal Key, ByVal v) '保存Cache数据
		If IsNull(Key) Then Key = ""

		Set DicItems(Key)=new Cache_info
		DicItems(Key).setRoot=strSITEROOT
		DicItems(Key).setReloadTime=ReloadTime
		DicItems(Key).KeyName=Key
		DicItems(Key).Value=v
	End Property

	'缓存记数
	Public Function Count()
		Count=Application.Contents.Count
	End Function

	'缓存列表
	Public Function List()
		Set List=Application.Contents
	End Function

	'缓存文件列表
	Public Function Files()
		Dim FilesTemp,arrObj,StrTemp
		FilePath=strSITEROOT&FilePath
		FilesTemp=Split(Jasp_Fso.FileItem(FilePath),"|")
		ReDim arrObj(UBound(FilesTemp)-1)
		For i=1 To UBound(FilesTemp)
			StrTemp=Replace(FilesTemp(i),FileType,"")
			StrTemp=Right(StrTemp,Len(StrTemp)-1)
			arrObj(i-1)=StrTemp
		Next

		Files=arrObj
		Erase arrObj
	End Function
	' 清空没有使用的缓存
	Public Sub ClearUnused()
		Dim Key, Keys, KeyLength, KeyIndex
			For Each Key in Application.Contents
			IF (Left(Key, PREFIX_LENGTH) = PREFIX) Then
				IF (Application(Key)(0) = 0) Then
					Keys = Keys & VBNewLine & Key
				End IF
			End IF
		Next
		Keys = Split(Keys, VBNewLine)
		KeyLength = UBound(Keys)
		Application.Unlock
		For KeyIndex = 1 To KeyLength
			Application.Contents.Remove(Keys(KeyIndex))
		Next
		Application.Lock
	End Sub
	' 清空所有缓存
	Public Sub ClearAll()
		Dim Key, Keys, KeyLength, KeyIndex


		For Each Key in Application.Contents

			IF (Left(Key, PREFIX_LENGTH) = PREFIX) Then
				Keys = Keys & VBNewLine & Key
			End IF
		Next

		Keys = Split(Keys, VBNewLine)
		KeyLength = UBound(Keys)
		Application.Unlock
		For KeyIndex = 1 To KeyLength
			Application.Contents.Remove(Keys(KeyIndex))
		Next
		Application.Lock

	End Sub

	Public Sub ClearFiles() '清除所有文件缓存
		Dim Files
		FilePath=strSITEROOT&FilePath
		Files=Split(Jasp_Fso.FileItem(FilePath),"|")
		If Not Files(0)=0 Then
			For i=1 To Files(0)
				Jasp_Fso.DeleteFile(FilePath&"/"&Files(i))
			Next
		End If
	End Sub

End Class


'*************************************************
'Cache实体继承类
'*************************************************
Class Cache_Info

	Public [KeyName],CreatTime,OutTime,SaveType,ReloadTime,DefaultSaveType,FilePath,FileType,ErrCode,ErrMsg
	Private C_Value,App_temp,Jasp_Fso,FilePath_temp,strSITEROOT


	Private Sub Class_Initialize() 'Class 开始 全局参数0
		strSITEROOT="./"
		ErrCode=0
		ReloadTime=1200 '秒 默认20分钟
		DefaultSaveType="app"
		FilePath="Cache"
		FileType=".cache"
		Set Jasp_Fso = new JaspFso
	End Sub

	Private Sub Class_Terminate
		Set Rs_temp=Nothing
		Set Jasp_Fso = Nothing
	End Sub

	'//-------------------------- 定义根目录 ------------------------------
	Public Property Let setRoot(ByVal strVar)
	  strSITEROOT = strVar
	End Property

	'//-------------------------- 定义全局时间 ------------------------------
	Public Property Let setReloadTime(ByVal strVar)
	  ReloadTime = strVar
	End Property
	'*************************************************
	'获取内容
	'*************************************************
	Public Default Property get [Value]()
		If Not Jasp_Fso.FolderExists(strSITEROOT&FilePath) Then Jasp_Fso.CreateFolder(strSITEROOT&FilePath) '检查路径

		FilePath_temp=strSITEROOT&FilePath&"/_"&KeyName&FileType '文件路径
		Dim app : app = Easp.GetApp(Me.KeyName)

		If IsArray(app) Then
			If UBound(app) = 4 Then
				If IsDate(app(2)) Then
					If IsObject(app(0)) Then
						Set [Value] = app(0)
					Else
						[Value] = app(0)
						If IsNull([Value]) Then Exit Property
					End If
				End If
			End If
		End If
	End Property

	'*************************************************
	'存储内容
	'*************************************************
	Public Property Let [Value](ByVal v)
		Select Case TypeName(v)
			Case "Object"
				Set C_Value=v
			Case "Recordset"
				If v.eof And v.bof Then '如果记录集为空则直接返回 Empty 对象
					C_Value=Empty
				Else
					If Not Jasp_Fso.FolderExists(strSITEROOT&FilePath) Then Jasp_Fso.CreateFolder(strSITEROOT&FilePath) '检查路径

					FilePath_temp=strSITEROOT&FilePath&"/_"&KeyName&FileType '文件路径

					If Jasp_Fso.FileExists(FilePath_temp) Then Jasp_Fso.DeleteFile(FilePath_temp) '删除过期文件
					v.Save Server.MapPath(FilePath_temp), adPersistXML '如果定义记录集，则直接刷新记录文件
					Set Rs_temp=Server.CreateObject("Adodb.Recordset")
					Rs_temp.Open(Server.MapPath(FilePath_temp))
					C_Value=Rs_temp.GetRows()
				End If
			Case "Dictionary"
				Response.Write("Dictionary Can't be cache!")
				Response.End()
			Case Else
				C_Value=v
		End Select

		Dim App_temp(4)
		App_temp(0) = C_Value '对象本身
		App_temp(1) = 0 '访问次数
		App_temp(2) = Now() '创建时间
		App_temp(3) = Now()+(1/24/60/60)*ReloadTime '过期时间
		App_temp(4) = DefaultSaveType'保存方式

		Application.Unlock
		Application(KeyName) = App_temp
		Application.Lock

		Erase App_temp'销毁数组
	End Property

	'*************************************************
	'缓存到文件
	'*************************************************
	Public Sub Save()
		If Not Jasp_Fso.FolderExists(strSITEROOT&FilePath) Then Jasp_Fso.CreateFolder(strSITEROOT&FilePath) '检查路径
		If Not TypeName(Jasp_Fso)="Empty" Then
'			Response.Write(TypeName(Application(Me.KeyName)(0)))
'			Response.End()
			With Jasp_Fso
				Select Case TypeName(Application(Me.KeyName)(0))
				Case "object"
					Response.Write("Object can't save as file!")
					Response.End()
					Exit Sub
				Case "Variant()"
					Response.Write("Variant can't save as file!")
					Response.End()
					Exit Sub
				Case Else
					Dim v_Path : v_Path=strSITEROOT&FilePath&"/_"&Me.KeyName&FileType
					If .FileExists(v_Path) Then Call .DeleteFile(v_Path)
					.CreateFile v_Path,Application(Me.KeyName)(0)
				End Select
			End With
		End If
	End Sub



	'*************************************************
	'移除缓存
	'*************************************************
	Public Sub clear
		If Not IsNull(Me.KeyName) Then Easp.RemoveApp Me.KeyName
	End Sub

	'*************************************************
	'缓存确认
	'*************************************************
	Public Function Ready()
		Dim app : app = Easp.GetApp(Me.KeyName)
		Ready = False
		If IsArray(app) Then
			If UBound(app) = 4 Then
				If IsDate(app(2)) Then
					Ready=isValid(app(2))
					Exit Function
				End If
			End If
		End If

		If Not Jasp_Fso.FolderExists(strSITEROOT&FilePath) Then Jasp_Fso.CreateFolder(strSITEROOT&FilePath) '检查路径

		FilePath_temp=strSITEROOT&FilePath&"/_"&KeyName&FileType '文件路径
		If Jasp_Fso.FileExists(FilePath_temp) Then
			Dim Ready_temp : Ready_temp=isValid(Jasp_Fso.GetFileInfo(FilePath_temp)(10))
			If Not Ready_temp Then
				Jasp_Fso.DeleteFile(FilePath_temp)
			Else
				On Error Resume Next
				Dim rs
				Set rs=Server.CreateObject("Adodb.Recordset")
				Err.Clear
				rs.Open(Server.MapPath(FilePath_temp))
				If Err.Number <> 0 Then
					Err.Clear
				On Error GoTo 0
					[Value]=Jasp_Fso.ReadFileContent(FilePath_temp)
				Else
					Set C_Value=rs.GetGows()
					Dim App_temp(4)
					App_temp(0) = C_Value '对象本身
					App_temp(1) = 0 '访问次数
					App_temp(2) = Jasp_Fso.GetFileInfo(FilePath_temp)(10) '创建时间
					App_temp(3) = Jasp_Fso.GetFileInfo(FilePath_temp)(10)+(1/24/60/60)*ReloadTime '过期时间
					App_temp(4) = "file"'保存方式

					Application.Unlock
					Application(KeyName) = App_temp
					Application.Lock
				End If

				Set rs=Nothing
			End If
			Ready=Ready_temp
		End If
	End Function

	'*************************************************
	'过期检测
	'*************************************************
	Private Function isValid(ByVal t)
		If IsDate(t) Then
			'isValid=(DateDiff("s",Now,t)>0)
			isValid=(DateDiff("s",t,Now)<ReloadTime)
		End If
	End Function

End Class

%>