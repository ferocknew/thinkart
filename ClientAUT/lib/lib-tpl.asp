<%
Class Template

Private m_content,m_looptmp,tagData,loopdata,m_loop_content,m_Looptag,m_TplPath,m_SetTplPath
Private m_ClassName,m_Version,m_Copyright

Private Sub Class_Initialize()
  m_content="" : m_looptmp="" : m_loop_content="" : m_looptag=""
  m_TplPath="./" : m_SetTplPath=false
  Set tagData = Server.CreateObject("Scripting.Dictionary")
  Set loopData = Server.CreateObject("Scripting.Dictionary")
End Sub

Private Sub Class_Terminate()
  m_content="" : m_looptmp="" : m_loop_content="" : m_looptag=""
  m_TplPath="./" : m_SetTplPath=false
  Set tagData = Nothing : Set loopData = Nothing
End Sub

Public Property Get Version
  Version = m_Version
End Property

Public Property Get Copyright
  Copyright = m_Copyright
End Property

Rem 模板类的默认属性，判断模板中是否含有这个标签
Public Default Property Get Tag(tagname)
  Tag = InStr(m_content,"{$" & tagname & "$")>0
End Property

Rem 调用定义好的赋值函数，这个属性用来简化赋值操作
Public Property Let Tag(tagname,replaceString)
  Call Assign(tagname,replaceString)
End Property

Public Property Get TplPath
  TplPath = m_TplPath
End Property

Rem 设定模板文件的路径
Public Property Let TplPath(sTplPath)
  If sTplPath<>"" Then m_TplPath = sTplPath
  If Right(m_TplPath,1)<>"/" Then m_TplPath = m_TplPath & "/"
End Property

Private Function LoadFromFile(sFilePath,sCharset)
	LoadFromFile=false
	Dim oStream
	Set oStream=Server.CreateObject("ADODB.Stream")
	oStream.Type=2
	oStream.Mode=3
	oStream.Open()
	oStream.Charset=sCharset
	oStream.Position=oStream.Size
	oStream.LoadFromFile sFilePath
	LoadFromFile=oStream.ReadText
	oStream.Close
	Set oStream=Nothing
End Function

Private Function FileExist(filespec)
	On Error Resume Next
	FileExist=False
	Dim oFSO : Set oFSO = Server.CreateObject("Scripting.FileSystemObject")
	FileExist=oFSO.FileExists(filespec)
	Set oFSO=Nothing
End Function

Rem 获取循环块
Private Function GetTmpStr(tplstr,tagname,attname)
	Dim regEx,Matches,Match
	Set regEx = New RegExp
	regEx.Pattern = "<" & tagname & ".*?\s+name=[\""|\']?" & attname & "[\""|\']?.*?>([\s\S.]*?)<\/" & tagname & ">"
	regEx.Global = False
	regEx.IgnoreCase = True
	Set Matches = regEx.Execute(tplstr)
	For Each Match in Matches
	GetTmpStr=Match.Value
	Next
	Set regEx = Nothing
End Function

Rem 移除HTML标记
Private Function RemoveTag(tagString,tagname)
	Dim regex
	Set regex=New RegExp
	regEx.Pattern = "<[\/]?" & tagname & ".*?>"
	regEx.Global = True
	regEx.IgnoreCase = True
	RemoveTag = regEx.Replace(tagString,"")
	Set regex=nothing
End Function

Rem 移除空白行
Private Function RemoveSpace(tagString)
	Dim regex
	Set regex=New RegExp
	regEx.Pattern = "\n\s*\r"
	regEx.Global = True
	regEx.IgnoreCase = True
	RemoveSpace = regEx.Replace(tagString,"")
	Set regex=nothing
End Function

Rem 读取模板文件，同时处理嵌套模板，进行模板的合并
Public Function LoadTpl(tplfile)
	tplfile=Server.MapPath(tplfile)
	If Not FileExist(tplfile) Then
		Response.Write "Load template file faild!"
		Response.End
		Exit Function
	End If
	m_content=LoadFromFile(tplfile,"utf-8")
	Dim regEx,Matches,Match,fname,sContent
	Set regEx = New RegExp
	regEx.Pattern = "\{\$include\:(.*?)\$\}"
	regEx.Global = True
	regEx.IgnoreCase = True
	Set Matches = regEx.Execute(m_content)
	For Each Match in Matches
		fname=Match.SubMatches(0)
		fname=Server.MapPath(m_TplPath & fname)
		If FileExist(fname) Then
			sContent=LoadFromFile(fname,"utf-8")
			m_content=replace(m_content,Match.value,sContent)
		End If
	Next
	Set regEx = Nothing
End Function

Rem 赋值替换函数
Public Function Assign(tagname,replaceString)
	If tagname="" Then Exit Function
	Rem 如果是循环标签
	tagname=Trim(tagname)
	If InStr(tagname,"/")>0 and InStr(tagname,"/")<Len(tagname) Then
		Rem 获取循环标签名称
		m_curLooptag=Left(tagname,InStrRev(tagname,"/")-1)
	If m_Looptag="" Then
		Rem 如果是第一次检测到循环标签，设置循环所需变量初始值
		m_looptag=m_curLooptag : m_loop_content=""
		m_looptmp=GetTmpStr(m_content,"loop",m_Looptag)
	Else
		If m_LoopTag<>m_curLooptag Then
			Rem 如果循环标签改变，初始循环变量
			m_content=replace(m_content,m_looptmp,m_loop_content)
			m_looptag=m_curLooptag : m_loop_content=""
			m_looptmp=GetTmpStr(m_content,"loop",m_Looptag)
		End If
	End If
	If Not(loopData.Exists(tagname)) Then loopData.Add tagname,replaceString
	Else
		Rem 普通标签
		tagData.Add tagname,replaceString
	End If
End Function

Rem 执行块内替换
Public Function Flush()
	If loopdata.count>0 then
		Dim i
		chgtmp=RemoveTag(m_looptmp,"loop")
		arrtag=loopData.keys
		arrval=loopData.items
		For i=0 To loopData.count-1
			chgtmp=replace(chgtmp,"{$" & arrtag(i) & "$}",arrval(i))
		Next
		Rem 将块内数据保存到变量中
		m_loop_content=m_loop_content & chgtmp
		loopdata.RemoveAll
	End if
End Function

Rem 构建，完成模板的最后替换
Public Function Bulid()
	m_content=replace(m_content,m_looptmp,m_loop_content)
	arrtag=tagData.keys
	arrval=tagData.items
	For i=0 To tagData.count-1
		m_content=replace(m_content,"{$" & arrtag(i) & "$}",arrval(i))
	Next
	m_Content=RemoveSpace(m_Content)
	Response.Write m_Content
End Function

End Class
%>