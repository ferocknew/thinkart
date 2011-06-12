<%
' Dim Application(2)
' Application(0) Counter ������
' Application(1) dateTime ����ʱ��
' Application(2) Content ��������
Class JaspCache

Public PREFIX,PREFIX_LENGTH
Public RemCount

Public DicItems,Reloadtime,[Name],FilePath,FileType
Private C_Value,Jasp_Fso

Private Sub Class_Initialize() 'Class ��ʼ ȫ�ֲ���
	Set Jasp_Fso = new JaspFso
	FilePath="/_Cache"
	FileType=".cache"
	Set DicItems = Server.CreateObject("Scripting.Dictionary")
	'PREFIX = "Cached:"
	'PREFIX_LENGTH = 7

	PREFIX = ""
	PREFIX_LENGTH = 0
End Sub
Private Sub Class_Terminate'��������
	Set DicItems=Nothing
	Set Jasp_Fso = Nothing
End Sub

Public Default Property Get Item(ByVal Key) '��ȡCache����
	If Not IsObject(DicItems(Key)) Then
		Set DicItems(Key)=new Cache_info
		DicItems(Key).KeyName = Key
	End If
	Set Item = DicItems(Key)

'	Dim App_temp
'
'	Application(key)(0) = Application(Key)(0) + 1
'	Item=Application(Key)(2)
End Property

Public Property Let Item(ByVal Key, ByVal v) '����Cache����
	If IsNull(Key) Then Key = ""

	Set DicItems(Key)=new Cache_info
	DicItems(Key).KeyName=Key
	DicItems(Key).Value=v
End Property

'�������
Public Function Count()
	Count=Application.Contents.Count
End Function

'�����б�
Public Function List()
	Set List=Application.Contents
End Function

'�����ļ��б�
Public Function Files()
	Dim FilesTemp,arrObj,StrTemp

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
' ���û��ʹ�õĻ���
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
' ������л���
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

Public Sub ClearFiles() '��������ļ�����
	Dim Files
	Files=Split(Jasp_Fso.FileItem(FilePath),"|")
	If Not Files(0)=0 Then
		For i=1 To Files(0)
			Jasp_Fso.DeleteFile(FilePath&"/"&Files(i))
		Next
	End If
End Sub

End Class


'*************************************************
'Cacheʵ��̳���
'*************************************************
Class Cache_Info

Public [KeyName],CreatTime,OutTime,SaveType,ReloadTime,DefaultSaveType,FilePath,FileType,ErrCode,ErrMsg
Private C_Value,App_temp,Jasp_Fso,FilePath_temp


Private Sub Class_Initialize() 'Class ��ʼ ȫ�ֲ���0
	ErrCode=0
	ReloadTime=1200 '�� Ĭ��20����
	DefaultSaveType="app"
	FilePath="/_Cache"
	FileType=".cache"
	Set Jasp_Fso = new JaspFso
	If Not Jasp_Fso.FolderExists(FilePath) Then Jasp_Fso.CreateFolder(FilePath) '���·��
End Sub

Private Sub Class_Terminate
	Set Rs_temp=Nothing
	Set Jasp_Fso = Nothing
End Sub

'*************************************************
'��ȡ����
'*************************************************
Public Default Property get [Value]()
	FilePath_temp=FilePath&"/_"&KeyName&FileType '�ļ�·��
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
'�洢����
'*************************************************
Public Property Let [Value](ByVal v)
	Select Case TypeName(v)
		Case "Object"
			Set C_Value=v
		Case "Recordset"
			If v.eof And v.bof Then '�����¼��Ϊ����ֱ�ӷ��� Empty ����
				C_Value=Empty
			Else
				FilePath_temp=FilePath&"/_"&KeyName&FileType '�ļ�·��

				If Jasp_Fso.FileExists(FilePath_temp) Then Jasp_Fso.DeleteFile(FilePath_temp) 'ɾ�������ļ�
				v.Save Server.MapPath(FilePath_temp), adPersistXML '��������¼������ֱ��ˢ�¼�¼�ļ�
				Set Rs_temp=Server.CreateObject("Adodb.Recordset")
				Rs_temp.Open(Server.MapPath(FilePath_temp))
				C_Value=Rs_temp.GetRows()
			End If
		Case Else
			C_Value=v
	End Select

	Dim App_temp(4)
	App_temp(0) = C_Value '������
	App_temp(1) = 0 '���ʴ���
	App_temp(2) = Now() '����ʱ��
	App_temp(3) = Now()+(1/24/60/60)*ReloadTime '����ʱ��
	App_temp(4) = DefaultSaveType'���淽ʽ

	Application.Unlock
	Application(KeyName) = App_temp
	Application.Lock

	Erase App_temp'��������
End Property

'*************************************************
'���浽�ļ�
'*************************************************
Public Sub Save()
	If TypeName(Jasp_Fso)="Empty" Then
		With Jasp_Fso
			Select Case TypeName(Application(Me.KeyName)(0))
			Case "object"
				Exit Sub
			Case Else
				.CreateFile FilePath&"/_"&Me.KeyName&FileType,Application(Me.KeyName)(0)
			End Select
		End With
	End If
End Sub

'*************************************************
'�Ƴ�����
'*************************************************
Public Sub clear
	If Not IsNull(Me.KeyName) Then Easp.RemoveApp Me.KeyName
End Sub

'*************************************************
'����ȷ��
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

	FilePath_temp=FilePath&"/_"&KeyName&FileType '�ļ�·��
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
				App_temp(0) = C_Value '������
				App_temp(1) = 0 '���ʴ���
				App_temp(2) = Jasp_Fso.GetFileInfo(FilePath_temp)(10) '����ʱ��
				App_temp(3) = Jasp_Fso.GetFileInfo(FilePath_temp)(10)+(1/24/60/60)*ReloadTime '����ʱ��
				App_temp(4) = "file"'���淽ʽ

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
'���ڼ��
'*************************************************
Private Function isValid(ByVal t)
	If IsDate(t) Then
		'isValid=(DateDiff("s",Now,t)>0)
		isValid=(DateDiff("s",t,Now)<ReloadTime)
	End If
End Function

End Class

%>