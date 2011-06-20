<%
Class JaspTpl
Private objFSO,objSTREAM,objEXP,tplXML,adoConn
Private strRootPath,strCharset,strTagHead,strRootXMLNode,strBlockDataAtr
Private intStartTime,intDebugModule,intSetHtml,intAbsPath , intExecuteTpl
Private strTemplatePath,strTemplateFilePath
Private strTemplateHtml,strResultHtml
Private dicBlock,dicLabel
Private strDateDiffTimeInterval,strTemplateCacheName,strTemplatePagePath,strTemplateCachePath,intTemplateCacheType,intTemplateCacheTime
Private strAppCacheName,strFileCachePath

	'//类初始化
	Private Sub Class_Initialize()
		intStartTime = Timer()
		'常用
		strCharset      = "utf-8"       '编码设置
		strTagHead      = "$"'"tpl:"
		strTemplatePath = "/templates/" '模板存放目录
		strRootXMLNode  = "//template"  '模板根节点名称
		strBlockDataAtr = "name"        '块赋值辅助的属性
		intDebugModule  = 0             '调试模式，默认是0
		intSetHtml      = 0				'默认从文件中读取html，=1表示是从setHtml中取得模板
		intAbsPath      = 0				'输出结果是否使用绝对路径 (0不用,1用)
		intExecuteTpl   = 1				'是否支持执行IF，ASP转换，如果代码里面没有IF，ASP，建议关闭提高效率

		strDateDiffTimeInterval = "s"         '表示相隔时间的类型：d日 h时 n分钟 s秒
		intTemplateCacheType    = 0           '缓存类型:1,模板内存缓存 2,模板文件缓存 3,结果内存缓存 4,结果文件缓存
		intTemplateCacheTime    = 10          '缓存时间,单位是上面设置的时间单位
		strTemplateCachePath    = "/cache/"   '缓存目录

		'设置使用到的对象
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		Set objEXP = New RegExp : objEXP.Global = True : objEXP.IgnoreCase = True
		Set objSTREAM = adodbStream()'流对象
		Set tplXML = xmlDom(Right(strRootXMLNode,Len(strRootXMLNode)-2))

		'使用到的字典对象
		Set dicLabel  = Dicary() '储值
		Set dicBlock  = Dicary()
	End Sub

	'//类退出
	Private Sub Class_Terminate()
		'注销对象
		Set objFSO    = Nothing
		Set objEXP    = Nothing
		Set objSTREAM = Nothing
		Set tplXML    = Nothing
		Set dicLabel  = Nothing
		Set dicBlock  = Nothing
		If IsObject(adoConn) Then Set adoConn = Nothing
	End Sub

	'//设置站点根目录路径
	Public Property Let setRootPath(ByVal strVal)
		strRootPath = strVal
	End Property

	'//设置使用字符编码
	Public Property Let setCharset(ByVal strVal)
		strCharset = strVal
	End Property

	'//设置单标签头
	Public Property Let setTagHead(ByVal strVal)
		strTagHead = Lcase(Trim(strVal))
	End Property

	'//设置使用绝对路径
	Public Property Let setAbsPath(ByVal intVal)
		intAbsPath = intVal
	End Property

	'//设置模板存放路径
	Public Property Let setTemplatePath(ByVal strVal)
		strTemplatePath = strVal
	End Property

	'//设置模板文件路径
	Public Property Let setTemplateFile(ByVal strVal)
		strTemplatePagePath = strVal
		strTemplateFilePath = getMapPath(strRootPath & strTemplatePath & strTemplatePagePath)

		'文件缓存路径
		strFileCachePath = strRootPath & strTemplateCachePath & strTemplatePath
		strFileCachePath = getMapPath(expReplace(strFileCachePath,"(\\|\/)+","/"))
		call autoCreateFolder(strFileCachePath)'自动生成路径
		strFileCachePath = expReplace(strFileCachePath &"/"& strTemplateCacheName,"(\\|\/)+","/") & "_" & strTemplatePagePath
		'内存缓存的名称
		strAppCacheName  = strTemplateCacheName & "_" & intTemplateCacheTime & "_" & intTemplateCacheType & "_" & strTemplatePagePath

		'设置路径后立即加载模板
		call loadCacheTemplate()
	End Property

	Public Property Let setHtml(ByVal strVar)
		intSetHtml = 1'直接设置模板,缓存失效
		strTemplateHtml = strVar
		call loadCacheTemplate()
	End Property

	'参数1: 缓存的名字,每个页面不能相同
	'参数2: 0=都不缓存,1=内存缓存,2=文件缓存(缓存会缓存数据跟模板,开启缓存必须要有一个缓存名字)
	'参数3: 缓存时间，单位是默认是秒
	Public Property Let setCache(ByVal strVal)
		If strVal = "0" Then intTemplateCacheType = 0 : Exit Property End If
		Dim arr : arr = expSplit(strVal,"\s*,\s*")
		Select Case Ubound(arr,1)
		Case 0
			strTemplateCacheName = arr(0)
		Case 1
			strTemplateCacheName = arr(0)
			intTemplateCacheType = CInt(arr(1))
		Case 2
			strTemplateCacheName = arr(0)
			intTemplateCacheType = CInt(arr(1))
			intTemplateCacheTime = CInt(arr(2))
		Case 3
			strTemplateCacheName = arr(0)
			intTemplateCacheType = CInt(arr(1))
			intTemplateCacheTime = CInt(arr(2))
			strTemplateCachePath = arr(3)
		End Select
		If intTemplateCacheTime <= 0 Then
			intTemplateCacheType = 0
		End If
	End Property

	'//设置节点属性
	Public Property Let setAttr(ByVal strPath,ByVal strVal)
		setLabelAttr Lcase(strPath),strVal
	End Property

	'//设置数据库连接
	Public Property Let conn(ByVal objVal)
		'On error resume next
		Set adoConn = objVal
		If adoConn.State = 0 Then adoConn.Open()
		If Err.Number<>0 Then
		Err.Clear : Set adoConn = Nothing
		call errRaise("数据库打开出错,请检查数据库连接")
		End If
	End Property

	'赋值
	Public Property Let d(ByVal strTag,ByVal strVal)
		Dim i,ary : ary = expSplit(strTag,"\s*,\s*")
		For i = 0 To Ubound(ary)'多标签赋值
			strTag = Lcase(ary(i))
			If strTag = strTagHead Then
				Select Case TypeName(strVal)
				Case "Recordset"'记录集
					If strVal.State And Not strVal.eof Then
						Set dicLabel = rsToDic(strVal,dicLabel)
					End If
				Case "Dictionary"'字典传递
					'Set dicLabel = strVal
					Set dicLabel = rsToDic(strVal,dicLabel) '2011.03.10
				Case "Variant()"'如果传递的是数组
					If Ubound(strVal) = 1 Then
						Select Case TypeName(strVal(0))
						Case "Recordset"
							If strVal(0).State And Not strVal(0).eof Then
								Set dicLabel = rsToDic(strVal(0),dicLabel)
							End If
						Case "Variant()"
							Set dicLabel = rsToDic(strVal(0),dicLabel)
						End Select
						Dim aryField : aryField = expSplit(strVal(1),"\s*,\s*")'字段序列
						If TypeName(aryField)="Variant()" Then Set dicLabel = redimField(dicLabel,aryField)'重命名字段
					End If
				End Select
			Else'普通赋值,支持字典，普通数据(字段值、字符串、数字等)
				Select Case TypeName(strVal)
				Case "Dictionary","Recordset"
					Set dicLabel(strTag) = strVal '2011.03.12 修复块标签记录集赋值无效
					'Set dicLabel = rsToDic(strVal,dicLabel) '2011.03.10
				Case Else
					dicLabel(strTag) = strVal
				End Select
			End If
		Next
	End Property

	'生成静态页面(路径,页面名称)
	Public Property Let create(ByVal param)
		Dim strFilePath,strContents
		If TypeName(param) = "Variant()" Then'传递数组
			Select Case Ubound(param)
			Case 0'Array(createpath+pagename)
				strFilePath = param(0)
				strContents = getHtml
			Case 1'Array(createpath+pagename,content)
				strFilePath = param(0)
				strContents = param(1)
			Case Else'Array(createpath+pagename,content,charset)
				strFilePath = param(0)
				strContents = param(1)
				strCharset  = param(2)
			End Select
		Else '文件路径+文件名
			strFilePath = param
			strContents = getHtml
		End If
		Call saveFile(getMapPath(strFilePath) , strContents , strCharset)
	End Property

	'//获取属性
	Public Property Get getAttr(ByVal strPath)
		Dim i,ary,node
			ary = selectLabelNode(Lcase(strPath))'选择标签节点
		If IsArray(ary) = False Then Exit Property

		Select Case Lcase(ary(3))
		Case ":body"
			Set node = tplXML.selectNodes(ary(4) & "/body")
		Case ":empty",":null",":eof"
			Set node = tplXML.selectNodes(ary(4) & "/null")
		Case ":html"
			Set node = tplXML.selectNodes(ary(4) & "/html")
		Case Else
			If Len(ary(2)) Then
				Set node = tplXML.selectNodes(ary(4)&"/@"&ary(2))
			Else'如果没有属性路径就返回节点的所有属性
				Set node = tplXML.selectNodes(ary(4))
				Redim tagAttr(node.Length)
				For i = 0 to node.Length - 1
					Set tagAttr(i) = getBlockAttr(node(i))
				Next
				getAttr = tagAttr
				Exit Property
			End If
		End Select

		If IsObject(node) Then
			If node.Length Then
				Redim tagAttr(node.Length)
				For i = 0 to node.Length - 1
					tagAttr(i) = node(i).nodeTypedValue
				Next

				'如果只有一个结果，就返回这个结果
				If Ubound(tagAttr) = 1 Then
					getAttr = tagAttr(0)
				Else'如果有多个结果就返回数组
					getAttr = tagAttr
				End If
			End If
			Set node = Nothing
		End If
	End Property

	'获得标签所有的值
	Public Property Get getLabelValues(ByVal strVal)
		If Lcase(strVal) = Lcase(strTagHead) Then'如果返回所有值对象
			Set getLabelValues = dicLabel
		Else
			If IsObject(dicLabel(strVal)) Then
				Set getLabelValues = dicLabel(strVal)
			Else
				getLabelValues = dicLabel(strVal)
			End IF
		End If
	End Property

	'//输出部分
	Public Property Get getHtml
		Dim node
		Set node = tplXML.selectSingleNode(strRootXMLNode) '从根目录开始遍历模板标签节点

		Select Case intTemplateCacheType
		Case 3'结果内存缓存
			Dim cacheName : cacheName = strAppCacheName & "getHtml"
			If cacheTimeOut(cacheName,1,intTemplateCacheTime) = 0 Then
				strResultHtml = getCacheValue(cacheName,1)
			Else
				strResultHtml = analysisTemplate(node,strTemplateHtml,strTagHead,dicLabel)
				setCacheValue cacheName,strResultHtml,1'设置内存缓存
			End If
		Case 4'结果文件缓存
			'检查文件是否存在:缓存不存在=-1,超时>0,没有超时=0
			If cacheTimeOut(strFileCachePath & ".html",2,intTemplateCacheTime) = 0 Then
				strResultHtml = readFile(getMapPath(strFileCachePath & ".html") , strCharset)
			Else
				strResultHtml = analysisTemplate(node,strTemplateHtml,strTagHead,dicLabel)
				setCacheValue getMapPath(strFileCachePath & ".html"),strResultHtml,2'设置文件缓存
			End If
		Case Else
			strResultHtml = analysisTemplate(node,strTemplateHtml,strTagHead,dicLabel)
		End Select
		Set node = Nothing
		'返回执行时间
		strResultHtml = expReplace(strResultHtml,"\{runtime\s*\/?\}|(\<\!--runtime--\>)(.*?)\1" , "<"&"!--runtime-->"&RunTimer()&"<"&"!--runtime-->" )

		getHtml = strResultHtml
	End Property

	'//输出模板部分
	Public Property Get display
		Response.Write(getHtml)
	End Property

	'//日期格式化
	Public Property Get dateFormat(ByVal strDate,ByVal strFormat)
		Dim return : return = strFormat
		Dim ccDate
		If IsDate(strDate)=False Then dateFormat = strDate : Exit Property

		'下面开始进行日期的转换
		ccDate = FormatDateTime(strDate, vbGeneralDate )
		'显示方式
		Select Case(strFormat)
			Case "0" : 'vbGeneralDate 0 显示日期和/或时间。如果有日期部分，则将该部分显示为短日期格式。如果有时间部分，则将该部分显示为长时间格式。如果都存在，则显示所有部分。
			return = FormatDateTime(strDate, 0 )
			Case "1" : 'vbLongDate 1 使用计算机区域设置中指定的长日期格式显示日期
			return = FormatDateTime(strDate, 1 )
			Case "2" : 'vbShortDate 2 使用计算机区域设置中指定的短日期格式显示日期
			return = FormatDateTime(strDate, 2 )
			Case "3" : 'vbLongTime 3 使用计算机区域设置中指定的时间格式显示时间
			return = FormatDateTime(strDate, 3 )
			Case "4" : 'vbShortTime 4 使用 24 小时格式 (hh:mm) 显示时间
			return = FormatDateTime(strDate, 4 )
			Case Else
			With objEXP
				'年月日是小写，时分秒是大写
				.IgnoreCase = False
				.Global = True
				.Pattern = "yyyy" : return = .Replace(return, Year(ccDate))
				.Pattern = "yy"   : return = .Replace(return, Right(Year(ccDate),2))
				.Pattern = "mm"   : return = .Replace(return, Right("0" & Month(ccDate),2))
				.Pattern = "m"    : return = .Replace(return, Month(ccDate))
				.Pattern = "dd"   : return = .Replace(return, Right("0" & Day(ccDate),2))
				.Pattern = "d"    : return = .Replace(return, Day(ccDate))
				.Pattern = "HH"   : return = .Replace(return, Right("0" & Hour(ccDate),2))
				.Pattern = "H"    : return = .Replace(return, Hour(ccDate))
				.Pattern = "MM"   : return = .Replace(return, Right("0" & Minute(ccDate),2))
				.Pattern = "M"    : return = .Replace(return, Minute(ccDate))
				.Pattern = "SS"   : return = .Replace(return, Right("0" & Second(ccDate),2))
				.Pattern = "S"    : return = .Replace(return, Second(ccDate))
				.Pattern = "w|W"  : return = .Replace(return, Right(weekdayname(weekday(ccDate)),1))
				.IgnoreCase = True
			End With
		End Select

		dateFormat = return
	End Property

	'返回页面执行时间
	Public Property Get RunTimer
	RunTimer = FormatNumber(Timer() - intStartTime,4,True,False,True)
	End Property
	'私有函数部分----------------------
	'//字典对象
	Public Function Dicary()
	  Set Dicary = Server.CreateObject("Scripting.Dictionary")
	End Function

	'xmlDom对象
	Private Function xmlDom(ByVal root)
		Set xmlDom = Server.CreateObject(getXMLDOM)
			xmlDom.async = False''.async'选项设置成'False'，是为了告诉浏览器中的XML解析器：一边读取XML文档，一边进行数据显示
		If Len(root)>0 Then
			'创建一个节点对象
			xmlDom.appendChild(xmlDom.CreateElement(root))
			'添加xml头部
			Dim head
			Set head = xmlDom.createProcessingInstruction("xml","version=""1.0"" encoding="""&strCharset&"""")
				xmlDom.insertBefore head,xmlDom.childNodes(0)
		End If
	End Function

	'//流对象
	Private Function adodbStream()
		Set adodbStream = Server.CreateObject("Adodb.Stream")
		With adodbStream
			.Type = 2
			.Mode = 3
			.Open
			.Charset = strCharset
			.Position = .Size
			.Close
		End With
	End Function

	'//FSO 读取文件
	Private Function readFile(ByVal strFilePath,ByVal strCharset)
		If objFSO.FileExists(getMapPath(strFilePath)) = False Then
			readFile = Empty
			Exit Function
		End If
		'打开流
		With objSTREAM
			.Open
			.LoadFromFile strFilePath
			readFile = .ReadText
			.Close
		End With
	End Function

	'//FSO 保存文件
	Private Function saveFile(ByVal strPath,ByVal strContent,ByVal strCharset)
		Dim Matches : strPath = expReplace(strPath,"(\/|\\)+","\")
		Set Matches = expMatch(strPath,"(.*?)([^\\]*\.\w{2,5})?$")'分离文件路径和文件名

		If Matches.Count = 2 Then
		Dim strFilePath,strFileName,strCreatePath
			strFilePath = Matches(0).SubMatches(0) '文件路径
			strFileName = Matches(0).SubMatches(1) '文件名

			strCreatePath = expReplace( strFilePath & "\" & iif(Len(strFileName),strFileName,"index.html") ,"(\/|\\)+","\")

			'自动创建目录,生成页面
			If autoCreateFolder(strFilePath) Then
				On error resume next
				'打开流
				With objSTREAM
					.Charset = strCharset
					.Open
					.WriteText(strContent)
					.SaveToFile strCreatePath,2
					.Flush
					.Close
				End With

				If Err.Number <> 0 Then
				saveFile = False : Err.Clear
				call errRaise("页面生成失败,请检查路径或者权限")
				Else
				saveFile = True
				End If
			End If
		Else
			call errRaise("路径不合法，请检查路径")
		End If
	End Function

	'//FSO自动生成文件夹路径
	Private Function autoCreateFolder(ByVal strPath)
		On error resume next
		Dim path : path = Replace(Trim(strPath),"/","\")
		If objFSO.FolderExists(path) Then'//看看是否已经存在目录
			autoCreateFolder = True
			Exit Function
		Else
			Dim i , folder
			path = Split(path,"\")
			For i = 0 To Ubound(path)
				folder = folder & path(i) & "\"
				If Not objFSO.folderExists(folder) Then
				objFSO.CreateFolder(folder)
				End If
			Next
			If Err.Number <> 0 Then
				autoCreateFolder = False : Err.Clear
				call errRaise("自动创建路径["&strPath&"]失败")
			Else
			autoCreateFolder = True
			End If
		End If
	End Function

	'?
	Private Function iif(ByVal a,ByVal b,ByVal c)
	  If a Then iif = b Else iif = c End IF
	End Function

	'在 a中找到 b的match,如果没有找到返回Empty
	Private Function expMatch(ByVal a,ByVal b)
		objEXP.Pattern = b : Set expMatch = objEXP.Execute(a)
	End Function

	'转义正则字符
	Private Function expEncode(ByVal sText)
		Dim i,ary : ary = Split(". * + ? | ( ) { } ^ $ :"," ")
		sText = Replace(sText, "\" , "\\")
		For i = 0 to Ubound(ary)
			sText = Replace(sText, ary(i) , "\"&ary(i))
		Next
		expEncode = sText
	End Function

	'正则替换expReplace
	Private Function expReplace(ByVal a,ByVal b,ByVal c)
		objEXP.IgnoreCase = True
		objEXP.Global = True
		objEXP.Pattern = b
		expReplace = objEXP.Replace(a, c)
	End Function

	'ASP的正则expSplit
	Private Function expSplit(ByVal a,ByVal b)
		Dim Match, SplitStr : SplitStr = a
		Dim Sp : Sp = "#taihom.com@"
			For Each Match in expMatch(a,b)
				SplitStr = Replace( SplitStr , Match.value , Sp ,1,-1,0)
			Next
		expSplit = Split( SplitStr, Sp)
	End Function

	'getMapPath'判断路径是否是绝对路径，不是的话返回绝对路径
	Private Function getMapPath(ByVal strPath)
		strPath = expReplace(strPath,"(\/|\\)+", "\")
		If Instr(strPath,":\")=0 Then strPath = Server.MapPath(strPath)
		getMapPath = strPath
	End Function

	'功能:返回指定数组的维数。
	Private Function getArrayDimension(ByVal aryVal)
		On error resume next
		getArrayDimension = -1
		If Not IsArray(aryVal) Then
			Exit Function
		Else
			Dim i,iDo
			For i = 1 To 4
				iDo = UBound(aryVal, i)
				If Err Then
					Err.Clear
					Exit Function
				Else
					getArrayDimension = i
				End If
			Next
		End If
	End Function

	'加载或者缓存模板
	Private Sub loadCacheTemplate
		'缓存类型 0=不缓存,1=模板内存缓存,2=模板文件缓存,3=结果内存缓存,4=结果文件缓存
		Dim isLoad : isLoad = 0
		If intTemplateCacheType = 0 Then'不缓存
			call load() : isLoad = 1
			Exit Sub
		ElseIf Instr("1,3",intTemplateCacheType) Then'1=模板内存缓存,3=结果内存缓存
			If cacheTimeOut(strAppCacheName,1,intTemplateCacheTime) = 0 Then
				strTemplateHtml = getCacheValue(strAppCacheName,1)
				Set tplXML = getCacheValue("tplXML",1)
			Else
				call load() : isLoad = 1
				setCacheValue strAppCacheName,strTemplateHtml,1
				setCacheValue "tplXML",tplXML,1
			End If
		ElseIf Instr("2,4",intTemplateCacheType) Then'2=模板文件缓存,4=结果文件缓存
			'检查文件是否存在:缓存不存在=-1,超时>0,没有超时=0
			If cacheTimeOut(strFileCachePath & ".xml",2,intTemplateCacheTime) = 0 Then
			Set tplXML = XMLDOM("")
				tplXML.load(strFileCachePath & ".xml")
				strTemplateHtml = tplXML.selectSingleNode(strRootXMLNode).lastchild.data
			Else
				call load() : isLoad = 1
				tplXML.Save(strFileCachePath & ".xml")
			End If
		ElseIf Instr("3,4",intTemplateCacheType) Then '3=结果内存缓存,'4=结果文件缓存
			If isLoad = 0 Then call load()'加载模板
			call getHtml()
		End If
	End Sub

	Private Sub load()'读取模板文件
		If intSetHtml = 0 Then'如果是从文件中读取模板
		strTemplateHtml = loadInclude(readFile(strTemplateFilePath,strCharset),strTemplateFilePath)'
		End If
		strTemplateHtml = expReplace(expReplace(strTemplateHtml,"\<\!\-\-\s*\{","{"),"\}\s*\-\-\>","}")
		'使用绝对路径
		strTemplateHtml = iif(cbool(intAbsPath),absPath(strTemplateHtml),strTemplateHtml)
		'编译模板，并且用XML存储模板标签节点
		Dim xmlRoot
		Set xmlRoot = tplXML.selectSingleNode(strRootXMLNode)
			compileTemplate Array(strTemplateHtml,strTagHead),xmlRoot
			xmlRoot.appendChild(tplXML.createCDATASection(strTemplateHtml))
			strTemplateHtml = xmlRoot.lastchild.data
	End Sub

	'模板的include支持
	Private Function loadInclude(ByVal strHtml,ByVal strPath)
		Dim incPath,html : html = strHtml
		Dim Match,Matches
		For Each Match in expMatch(strHtml,"\{include\s*(?:\()?['""]\s*(.*?)['""](?:\))?\}")
			incPath = getMapPath(strRootPath & strTemplatePath & Match.SubMatches(0))
			If strPath <> incPath Then
			html = Replace(html,Match.value,loadInclude(readFile(incPath,strCharset),incPath),1,-1,0)
			Else
			html = Replace(html,Match.value,"",1,-1,0)
			End If
		Next
		loadInclude = html
	End Function

	'编译模板
	'参数：模板内容,标签头,XML节点路径
	Private Sub compileTemplate(ByVal aryVal,ByVal nodeDOM)
		If Len(aryVal(1))=0 Then Exit Sub End If
		Dim Match,Matches,strPattern
		Dim arrayTags(10) '定义一个数组，把模板的标签参数保存调用
			strPattern = "\{("&expEncode(Lcase(aryVal(1)))&")([a-zA-Z0-9:_]+)?\s*?([\s\S]*?)\/?\}[\n|\s|\t]*?(?:[\n]*?([\s\S]*?)[\n|\s|\t]*?(\{/\1\2\}))?"
		'解析标签
		For Each Match in expMatch(aryVal(0),strPattern)
			arrayTags(0) = Lcase(Match.SubMatches(0)) ' 标签头
			arrayTags(1) = Lcase(Match.SubMatches(1)) ' 标签名称
			arrayTags(2) = Match.SubMatches(2) ' 标签属性
			arrayTags(3) = Match.SubMatches(3) ' 闭合部分的内容
			arrayTags(4) = ""                  ' empty标签
			arrayTags(5) = arrayTags(3)        ' 仅循环体部分,不包含empty
			arrayTags(6) = iif(Len(Match.SubMatches(4))+Len(Match.SubMatches(3)),1,0) ' 如果是闭合标签，并且有模板内容，闭合标签才有效
			arrayTags(7) = Match.Value '模板内容

			'如果是有结束标签,表示这个是一个闭合标签
			If arrayTags(6) Then
			Dim closeTags : closeTags = getCloseBlock(Array(arrayTags(3),arrayTags(1)))
				arrayTags(4) = closeTags(0)    ' empty标签
				arrayTags(5) = closeTags(1)    ' 仅循环体部分,不包含empty
				arrayTags(8) = expReplace( getBlockAttr(nodeDOM)("nodepath") & "/" & arrayTags(1),"^\/","")'节点路径
			End If

			'创建节点
			nodeDOM.appendChild(getTemplateNode(arrayTags))
		Next
	End Sub

	'解析模板,返回结果标签
	'模板输出的思路是，遍历模板标签节点，根据编译的节点信息来输出值
	Private Function analysisTemplate(ByVal node,ByVal strHtml,ByVal strHead,ByVal dic)
		Dim html
			html = strHtml'
			html = analysisBlockLabel(html,node.childNodes,strHead,dic)'循环以及嵌套循环标签
			html = returnLabelValues(html,strHead,dic,1)'单标签
			If intExecuteTpl>0 Then'是否开启IF判断
			html = executeTemplate(returnIfLabel(html,strHead,dic))
			End If
		analysisTemplate = html
	End Function

	'解析标签，获取值
	'参数：代码、节点、标签前缀、字典数据(用来支持标签值的调用)
	Private Function analysisBlockLabel(ByVal strHtml,ByVal node,ByVal strHead,ByVal objDIC)
		If Len(strHtml) = 0 Then Exit Function End If
		'由于是从根节点开始遍历，所以不用考虑多个标签相同的情况，所以只要遍历根结点的子节点就可以了
		Dim html : html = strHtml
		Dim i
		For i = 0 To node.Length - 1
		'遍历所有子节点,遇到循环就递归调用
			If node(i).childNodes.Length > 3 Then

				Dim dicData : Set dicData = Dicary()
				Dim aryLabel : aryLabel = getLabelNode(node(i))'提取节点值

				'获取节点路径
				If Len(aryLabel(5)(strBlockDataAtr)) Then
					dicData("path") = aryLabel(5)("nodepath") & "["&strBlockDataAtr&"=" & aryLabel(5)(strBlockDataAtr) &"]"
				Else
					dicData("path") = aryLabel(5)("nodepath")
				End If
				'根据节点路径获得值
				If dicLabel.Exists(dicData("path")) Then'根据节点路径尝试找值
					If IsObject(dicLabel(dicData("path"))) Then
					Set dicData("data") = dicLabel(dicData("path"))
					Else
						dicData("data") = dicLabel(dicData("path"))
					End If
				Else'如果没有赋值,就根据节点设置的获得值
					Dim sql,conn,rs
						sql = aryLabel(5)("sql")
						conn= aryLabel(5)("conn")
						sql  = expReplace(sql,"^(\w+)\((?:\w+)\s*,\s*(?:\w+)\)$","$1(aryLabel(0),aryLabel(5))")'动态SQL赋值

						If Right(sql,25) = "(aryLabel(0),aryLabel(5))" Then
						sql  = Eval(sql)
						End If

						sql  = returnLabelValues(sql,strHead,objDIC,0)'获取Sql
						conn = returnLabelValues(conn,strHead,objDIC,0)'获取CONN

					If Len(sql) > 6 Then'如果SQL不为空
						'On error resume next
						If Len(conn) > 2 Then
							Set conn = Eval(conn)
						Else
							Set conn = adoConn
						End If
						If conn.State = 0 Then conn.Open() End If '如果数据库是关闭的就打开
						Set dicData("data") = conn.execute(sql)
					End If
				End If

				dicData("tagHead") = aryLabel(0)&"."

				'获得处理值,返回的数据只有两种情况,一种格式数组，一种是其他格式
				Set dicData = getBlockData(dicData)
					'dicData("field") '如果需要重定义字段名
					'dicData("dr") '设置有dr函数
					'dicData("eof") = 1 表示没有数据
					'dicData("returndata") 返回的数据
					'dicData("data") 原来的数据

				'数据准备结束
				If Not dicData.Exists("dr") Then'如果没有设置渲染块
				dicData("dr") = expReplace(aryLabel(5)("dr"),"\s*([a-zA-Z0-9]+)\(([a-zA-Z0-9]+)\)\s*","$1(dicRS)")'数据渲染
				End If

				'数据处理
				Dim returnData : returnData = dicData("returndata")
				Dim returnHtml : returnHtml = ""
				Dim dicRS , k : k = 0
				If dicData("eof") Then'如果没有数据
					returnHtml = returnLabelValues(aryLabel(4),strHead,objDIC,1)
				Else'如果有数据
					Select Case TypeName(returnData)
					Case "Variant()"'统一返回数组
						For k = 0 To Ubound(returnData)
							'获取字段值
							Set dicRS = returnData(k) : dicRS("i") = k + 1
							'重命名字段
							If TypeName(dicData("field"))="Variant()" Then Set dicRS = redimField(dicRS,dicData("field"))
							'数据重定义或渲染
							If Right(dicData("dr"),7)="(dicRS)" Then Eval(dicData("dr"))
							'返回块的值
							returnHtml = returnHtml &_
							analysisBlockLabel(returnLabelValues(aryLabel(3),dicData("tagHead"),dicRS,1),node(i).childNodes,dicData("tagHead"),dicRS)'递归循环
							returnHtml = returnIfLabel(returnHtml,dicData("tagHead"),dicRS)'搞定IF比较值
						Next
						'returnHtml = dicData("blockHtml")
					Case Else'其他类型
						returnHtml = returnData
					End Select
				End If

				'标签替换
				html = Replace(html,aryLabel(2),returnHtml,1,-1,0)
				Set dicData = Nothing
			End If
		Next
		analysisBlockLabel = html
	End Function

	'获得块的值以及类型
	'传递数据，返回一维数据，元素一定要是字典数据否则不能处理
	Private Function getBlockData(ByVal dicData)
		'检测块值的类型
		Dim aryTemp,aryData,dic,rs,returnData
		Dim recIndex,fldIndex
		Select Case TypeName(dicData("data"))
		Case "Recordset"'如果块传值是记录集
			Set rs = dicData("data")
			If rs.Eof Then
				dicData("eof") = 1
			Else
				aryTemp = rs.getRows()
				reDim aryData(Ubound(aryTemp,2),Ubound(aryTemp,1))
				reDim returnData(Ubound(aryTemp,2))

				For recIndex = 0 To UBound(aryTemp,2)'行
					Set dic = Dicary()
					For fldIndex = 0 To UBound(aryTemp)'字段
						'aryData(recIndex,fldIndex) = aryTemp(fldIndex,recIndex)&""
						dic(Lcase(rs.Fields(fldIndex).Name)) = aryTemp(fldIndex,recIndex)&""
						dic(fldIndex) = aryTemp(fldIndex,recIndex)&""
					Next
					Set returnData(recIndex) = dic'返回数组
				Next
			End If
		Case "Variant()"'如果传递的是数组
			If Ubound(dicData("data")) = 1 Then
				dicData("field") = expSplit(dicData("data")(1),"\s*,\s*")'字段序列
				Select Case TypeName(dicData("data")(0))
				Case "Recordset"'数据集
					Set rs  = dicData("data")(0)
					If rs.Eof Then
						dicData("eof") = 1
					Else
						aryTemp = rs.getRows
						reDim aryData(Ubound(aryTemp,2),Ubound(aryTemp))
						reDim returnData(Ubound(aryTemp,2))
						For recIndex = 0 To UBound(aryTemp,2)'行
							Set dic = Dicary()
							For fldIndex = 0 To UBound(aryTemp)'字段
								'aryData(recIndex,fldIndex) = aryTemp(fldIndex,recIndex)&""
								dic(Lcase(rs.Fields(fldIndex).Name)) = aryTemp(fldIndex,recIndex)&""
								dic(fldIndex) = aryTemp(fldIndex,recIndex)&""
							Next
							Set returnData(recIndex) = dic'返回数组
						Next
					End If
				Case "Variant()"'数组
					aryTemp  = dicData("data")(0)
					Dim arycount : arycount = getArrayDimension(aryTemp)
					If arycount = 1 Then'如果是一维数组
						If Ubound(aryTemp) = 0 Then
							dicData("eof") = 1
						Else
							reDim returnData(0)
							Set dic = Dicary()
							For fldIndex = 0 To UBound(aryTemp) '字段
								dic(fldIndex) = aryTemp(fldIndex)&""
							Next
							Set returnData(0) = dic
						End If
					ElseIf arycount = 2 Then'二维数组
						If Ubound(aryTemp,1)=0 Then
							dicData("eof") = 1
						Else
							reDim returnData(Ubound(aryTemp,2))
							For recIndex = 0 To Ubound(aryTemp,2)
								Set dic = Dicary()
								For fldIndex = 0 To Ubound(aryTemp,1)'二级循环数据赋值
									dic(fldIndex) = aryTemp(fldIndex,recIndex)&""'字段下标 '修改二维数组支持
								Next
								Set returnData(recIndex) = dic'返回数组
							Next
						End If
					Else
						returnData  = Null
					End If
				Case Else'
					returnData = aryTemp
				End Select
			End If
		Case "Dictionary"'如果传递的是字典
			If dicData("data").Count = 0 Then
				dicData("eof") = 1
			Else
				reDim returnData(0)
				Set returnData(0) = dicData("data")
			End If
		Case Else'其他数据类型，主要是 字符、数字等可以直接输出的类型
			returnData = dicData("data")
		End Select
		'设置返回值函数
		dicData("returndata") = returnData

		Set getBlockData = dicData
	End Function

	'格式化值输出,参数：值，属性
	Private Function formatValues(ByVal strVal,ByVal dicAttr)
		Dim return : return = strVal
		Dim key,val
		For Each key In dicAttr''遍历节点属性节点,根据节点的属性返回值
			val = returnLabelValues(dicAttr(key),strTagHead,dicLabel,0)
			Select Case (Lcase(key))
			Case "dateformat":'日期格式化
				return = dateFormat(return,val)
			Case "len","length"
				return = iif(Len(val),Left(return,val),return)
			Case "return"
				Dim str,i : val = Split(Lcase(val),",")
				For i=0 To Ubound(val)
					Select Case val(i)
					Case "urlencode":'返回URLEncode
						return = Server.URLEncode(return)
					Case "htmlencode":
						return = Server.HTMLEncode(return)
					Case "htmldecode":
						return = Replace(return, "&" , Chr(38))
						return = Replace(return, """", Chr(34))
						return = Replace(return, "<" , Chr(60))
						return = Replace(return, ">" , Chr(62))
						return = Replace(return, " " , Chr(32))
					Case "clearhtml","removehtml":'清除html格式
						return = expReplace(return,"<[^>]*>", "")
					Case "clearspace":
						return = expReplace(return,"[\n\t\r|]|(\s+|&nbsp;|　)+", "")
					Case "clearformat":'清除所有格式
						return = expReplace(return,"<[^>]*>|[\n\t\r|]|(\s+|&nbsp;|　)+", "")
					End Select
					str = str & return
				Next
				return = str
			End Select
		Next
		formatValues = return
	End Function

	'重定义字段数据
	Private Function redimField(ByVal dicData,aryField)
		Dim i
		For i = 0 To Ubound(aryField)
			If dicData.Exists(i) Then dicData(Lcase(aryField(i))) = dicData(i)
		Next
		Set redimField = dicData
	End Function

	'记录集转为字典
	Private Function rsToDic(ByVal data,ByVal dic)
		Dim i
		Select Case TypeName(data)
		Case "Recordset"'数据集
			For i = 0 To data.Fields.Count-1 '字段序列
				dic(Lcase(data.Fields(i).Name)) = data(i)&""'字段名
				dic(i) = data(i)&""'字段下标
			Next
		Case "Variant()"'数组
			For i = 0 To Ubound(data) '字段序列
				dic(i) = data(i)&""'字段下标
			Next
		Case "Dictionary"'字典叠加
			For Each i In data
				dic(Lcase(i)) = data(i) & ""
			Next
		End Select
		Set rsToDic = dic
	End Function

	'executeTemplate
	Private Function executeTemplate(ByVal strHtml)
		Dim html : html = strHtml
		Dim Matchs'是用IF可能会造成js判断被替换的情况，例如 function fn(){if ...这样的情况的时候就会，如果断开一行写就没问题，这个希望大家注意
		'感谢 智者千虑  liaoyizhi@gmail.com(QQ89053889)提醒可能会发生的这个情况
		Set Matchs = expMatch(html,"\{(?:if)\s+([^}]*?)?\}")
		If Matchs.Count Then
			html = expReplace(html,"\{(?:if)\s+([^}]*?)?\}","<"&"%If $1 Then%"&">")
			html = expReplace(html,"\{(?:elseif|ef)\s+([^}]*?)?\}","<"&"%ElseIf $1 Then%"&">")
			html = expReplace(html,"\{(?:else\s+if)\s+([^}]*?)?\}","<"&"%Else If $1 Then%"&">")
			html = expReplace(html,"\{else\s*\}","<"&"%Else%"&">")
			html = expReplace(html,"\{/if\}","<"&"%End If%"&">")
		End If
		'....Exe.cute(html)
		'执行ASP代码
		html = expReplace(html,"<%\s*=\s*","<"&"%Response.Write ")'2011.04.04修复
		Set Matchs = expMatch(html,"\<"&"%([\s\S]*?)%"&"\>")
		If Matchs.Count Then'ASP代码支持，还不是那么完美,如果要解决，就要在下面的代码里面做处理
		Dim tmp : tmp = expSplit(html,"\<"&"%([\s\S]*?)%"&"\>")
			Dim i
			Dim htm : htm = "Dim str : str = """"" & vbcrlf
			For i = 0 To Ubound(tmp)
				tmp(i) = Replace(Replace(tmp(i),"<"&"%","&lt;%"),"%"&">","%&gt;")
				htm = htm & "str = str & tmp("&i&")" & vbcrlf
				If i <= (Matchs.Count - 1) Then htm = htm & Matchs(i).SubMatches(0) & vbcrlf
			Next
			Execute(htm)
			'html = str
		End If
		Set Matchs = Nothing
			executeTemplate = html
	End Function

	'IF
	Private Function returnIfLabel(ByVal strHtml,ByVal strHead,ByVal dicRS)
		Dim html : html = strHtml
		Dim Match
		For Each Match in expMatch(strHtml,"\{(?:if|elseif|ef)\s+([^}]*?)?\}")
			html = Replace(html,Match.value,returnLabelValues(Match.value,strHead,dicRS,0))
		Next
		returnIfLabel = html
	End Function

	''标签属性值替换输出
	Private Function returnLabelValues(ByVal strVal,ByVal strHead,ByVal dicObj,ByVal key)
		Dim return,html : html = strVal
		Dim val,Match
		Dim Pattern(2)
			Pattern(0) = "\((?:" & expEncode(Lcase(strHead)) &"){1}([a-zA-Z0-9\/_]+)((?:\[@?(?:\w+=.*?)?\])?\.?(?:\w+)?(?:\:\w+)?)?(\s+[^)][\s\S]*?)?\s*\)"'()标签
			Pattern(1) = "\{(?:" & expEncode(Lcase(strHead)) &"){1}([a-zA-Z0-9\/_]+)((?:\[@?(?:\w+=.*?)?\])?\.?(?:\w+)?(?:\:\w+)?)?(\s+[^}][\s\S]*?)?\s*\}"'{}标签
			'(0)'标签名  (1)'路径  (2)'属性
		For Each Match in expMatch(strVal,Pattern(key))
			If Len(Match.SubMatches(1)) Then'如果是通过路径获取属性
				return = getAttr(Match.SubMatches(0)&Match.SubMatches(1))
			Else
				return = dicObj(Lcase(Match.SubMatches(0)))
			End If

			If Len(Match.SubMatches(2))>1 Then
				return = formatValues(return,getBlockAttr(Match.SubMatches(2)))
			End If

			html = Replace(html,Match.Value,return,1,-1,0)

		Next
		returnLabelValues = html
	End Function

	'返回一个标签节点的信息
	Private Function getLabelNode(ByVal node)
		Dim aryLabel(6)
			aryLabel(0) = node.nodeName '节点名称
		If node.childNodes.Length < 3 Then
			aryLabel(1) = node.childNodes(0).nodeTypedValue '0=strAttr
			aryLabel(2) = node.childNodes(1).nodeTypedValue '1=strHtml
		End If
		If node.childNodes.Length > 3 Then
			aryLabel(1) = node.childNodes(0).nodeTypedValue '0=strAttr
			aryLabel(2) = node.childNodes(1).nodeTypedValue '1=strHtml
			aryLabel(3) = node.childNodes(2).nodeTypedValue '2=strBody
			aryLabel(4) = node.childNodes(3).nodeTypedValue '3=strEmpty
		End If
		Set aryLabel(5) = getBlockAttr(node)'标签节点的所有属性
		getLabelNode = aryLabel
	End Function

	'创建一个模板节点
	Private Function getTemplateNode(ByVal arrayTags)
		'XML操作部分
		Dim subNode0,subNode1,subNode2,subNode3,subNode4,subNode5
		Set subNode0 = tplXML.CreateElement(Lcase(Trim(arrayTags(1))))
		Set subNode1 = tplXML.CreateElement("attr") : subNode1.appendChild(tplXML.createCDATASection(arrayTags(2)))'标签属性
		Set subNode2 = tplXML.CreateElement("html") : subNode2.appendChild(tplXML.createCDATASection(arrayTags(7)))'模板内容
		Set subNode3 = tplXML.CreateElement("body") : subNode3.appendChild(tplXML.createCDATASection(arrayTags(5)))'循环体部分
		Set subNode4 = tplXML.CreateElement("null") : subNode4.appendChild(tplXML.createCDATASection(arrayTags(4)))'empty标签

		'设置节点的属性
		Dim keys,tagAttr
		Set tagAttr = getBlockAttr(arrayTags(2))'提取属性部分，名=值

		'添加子节点
		subNode0.appendChild(subNode1)
		subNode0.appendChild(subNode2)

		If arrayTags(6) Then'如果是闭合标签
			subNode0.appendChild(subNode3)
			subNode0.appendChild(subNode4)
			subNode0.SetAttribute "nodepath" , arrayTags(8) '辅助路径属性

			If Len(arrayTags(2))>1 Then
				Dim strSql
					strSql = expReplace(tagAttr("sql"),"^(\w+)\(\s*(\w+)\s*,\s*(\w+)\s*\)$","$1(Tags,tagAttr)")'找SQL
					IF Right(strSql,14) = "(Tags,tagAttr)" Then
					strSql = Eval(strSql)
					End If
				subNode0.SetAttribute "sql" , strSql'SQL属性
			End If

			'递归调用，这里是实现嵌套循环的关键
			compileTemplate Array(arrayTags(3),arrayTags(0)),subNode0
		End If

		'添加属性到节点中
		For Each keys in tagAttr
			subNode0.SetAttribute keys,tagAttr(keys)
		Next

		Set getTemplateNode = subNode0
	End Function

	'分离EMPTY和循环体(代码,标签头)
	Private Function getCloseBlock(ByVal aryTags)
		Dim ary(1)
		If Len(aryTags(0))>0 Then
			Dim Match,strSubPattern
				strSubPattern = "\{((?:empty|null|eof|nodata)\:"&aryTags(1)&")\s*?(?:[\s\S.]*?)\/?\}(?:([\s\S.]*?)\{/\1\})"
			Set Match = expMatch(aryTags(0),strSubPattern)

			If Match.Count Then'如果有 empty 标签
				ary(0) = Match(0).SubMatches(1) 'empty标签
				ary(1) = expReplace(aryTags(0),strSubPattern,"") '循环体部分
			Else
				ary(1) = aryTags(0)
			End If
			Set Match = Nothing
		End If
		getCloseBlock = ary
	End Function

	'获得属性列表,返回名值的字典对象
	Private Function getBlockAttr(ByVal val)
		Dim i
		Dim Match,Matches,dicAttr
		Set dicAttr = Dicary()'定义字段对象
		'返回一个标签节点的所有属性
		If TypeName(val) = "IXMLDOMElement" Then
			For i = 0 To val.attributes.Length - 1
				dicAttr(val.attributes(i).nodeName) = val.attributes(i).nodeTypedValue
			Next
		Else'存储名值对象
			Set Matches = expMatch( val ,"([a-zA-Z0-9]+)\s*=\s*(['|""])([\s\S.]*?)\2")
			For Each Match in Matches'0=属性,2=属性值
				dicAttr(Lcase(Trim(Match.SubMatches(0)))) = Match.SubMatches(2)
			Next
			Set Matches = Nothing
		End If
		Set getBlockAttr = dicAttr
	End Function

	'选择一个带路径的节点,返回解析分解后的路径
	Private Function selectLabelNode(ByVal strPath)
		Dim Match,Matches : strPath = Lcase(Trim(strPath))'标签转换成小写
		Set Matches = expMatch( strPath ,"([a-zA-Z0-9\/]+)(\[@?((\w+)=(.*?))?\])?\.?(\w+)?(\:(body|empty|html|null|eof))?")
		'传入参数示例：tag[attr=2].attr2:body
		If Matches.Count Then
		Dim ary(5)
			ary(0) = Matches(0).SubMatches(0) 'tag
			ary(1) = Matches(0).SubMatches(2) 'attr=2
			ary(2) = Matches(0).SubMatches(5) 'attr2
			ary(3) = Matches(0).SubMatches(6) ':body|:empty|:html

		Dim nodesPath'指定辅助路径
			nodesPath = strRootXMLNode & "/" & ary(0)
			If Len(Matches(0).SubMatches(1))>4 Then
			nodesPath = nodesPath & "[@" &ary(1)& "]"
			End If

			ary(4) = nodesPath'选择的路径

		selectLabelNode = ary
		Else
		selectLabelNode = Null
		End If
		Set Matches = Nothing
	End Function

	'设置节点属性
	Private Function setLabelAttr(ByVal strPath,ByVal strVal)
		Dim ary,node,i,ii
			strPath = Split(strPath,",")
		For ii = 0 To Ubound(strPath)
			ary = selectLabelNode(strPath(ii))'选择标签节点
			If IsArray(ary) = False Then Exit Function
			Select Case Lcase(ary(3))
			Case ":body"
				Set node = tplXML.selectNodes(ary(4) & "/body")
					For i = 0 to node.Length - 1
						node(i).childNodes(0).nodeValue = strVal
					Next
			Case ":empty",":null",":eof"
				Set node = tplXML.selectNodes(ary(4) & "/null")
					For i = 0 to node.Length - 1
						node(i).childNodes(0).nodeValue = strVal
					Next
			Case ":html"
				Set node = tplXML.selectNodes(ary(4) & "/html")
					For i = 0 to node.Length - 1
						node(i).childNodes(0).nodeValue = strVal
					Next
			Case Else
				If Len(ary(2)) Then
					Set node = tplXML.selectNodes(ary(4))
					For i = 0 to node.Length - 1
					node(i).setAttribute ary(2),strVal
					Next
				End If
			End Select
		Next
	End Function

	'输出结果输出模板的绝对路径
	Private Function absPath(ByVal strCode)
	Dim html : html = strCode
	Dim Matches,Match
	Dim spath
		Set Matches = expMatch(html,"(?:href|src)=(['""|])(?!(\/|\{|\(|\.\/|http:\/\/|https:\/\/|javascript:|#))(.+?)\1")
		For Each Match in Matches
		html = Replace( html , Match.value , Replace(Match.value,Match.SubMatches(2), relPath(Match.SubMatches(2)) ,1,-1,0) ,1,-1,0)
		Next
		Set Matches = Nothing
		absPath = html
	End Function

	'替换相对路径，主要是模板资源路径要正确
	'根据模板路径把../逐层替换到对应的目录
	Private Function relPath(ByVal strPath)
	Dim tpldir,src,spath
	Dim Matches
		strPath= expReplace(strPath,"(\/|\\)+", "/")

		Set Matches = expMatch(strPath,"^(\.\.\/)+")
		If Matches.Count=0 Then
			relPath = expReplace(strTemplatePath,"(\/|\\)+", "/") & strPath
			Set Matches = Nothing
			Exit Function
		End If

		'模板的全路径
		spath = Split(expReplace(strTemplatePath,"(\/|\\)+", "/"),"/")

	Dim i,n
		n = expMatch(Matches(0).Value,"(\.\.\/)").Count'看有多少个../
		For i=0 To Ubound(spath) - 1 - n
		src = src & spath(i) & "/"
		Next
		'把../替换成正确的目录
		relPath = Replace(strPath,Matches(0).value,src ,1,-1,0)
		Set Matches = Nothing
	End Function

	'查询模板的缓存是否过期？缓存不存在=-1,超时>0,没有超时=0
	Private Function cacheTimeOut(ByVal strName,ByVal intType,ByVal intCacheTime)
		Dim intCache : intCache = -1
		If intTemplateCacheTime < 1 Then
			cacheTimeOut = -1
			Exit Function
		End If

		Select Case intType
		Case 1'1=内存缓存'检查内存缓存是否过期
			intCache = appCacheTimeOut(strName,intCacheTime)
		Case 2'2=文件缓存'文件缓存是否超时:>0超时 -1=文件不存在 0 = 没有超时
			intCache = fileCacheTimeOut(strName,intCacheTime)
		Case Else'>0超时
			intCache = 1
		End Select
		cacheTimeOut = intCache
	End Function

	'设置缓存
	Private Sub setCacheValue(ByVal strName,ByVal appValue,ByVal intCacheType)
		Select Case intCacheType
		Case 1'1=内存缓存
			setAppCacheValue strName,appValue
		Case 2'2=文件缓存
			saveFile strName,appValue,strCharset
		End Select
	End Sub

	'读取缓存
	Private Function getCacheValue(ByVal strName,ByVal intCacheType)
		Dim return
		Select Case intCacheType
		Case 1'1=内存缓存
			'检查内存缓存是否过期
			If IsObject(getAppCacheValue(strName)) Then
			Set getCacheValue = getAppCacheValue(strName)
			Else
				getCacheValue = getAppCacheValue(strName)
			End If
			Exit Function
		Case 2'2=文件缓存
			return = readFile(strName,strCharset)
		Case Else
			return = Empty
		End Select
		getCacheValue = return
	End Function

	''检查缓存是否过期：-1没有这个缓存，>0过期时间，=0没有过期
	Private Function appCacheTimeOut(ByVal strName,ByVal intTime)
		Dim cacheData
			cacheData = Application(strName)
		If Not IsArray(cacheData)   Then appCacheTimeOut = -1 : Exit Function End If
		If Not IsDate(cacheData(1)) Then appCacheTimeOut = -1 : Exit Function End If

		appCacheTimeOut = DateDiff(strDateDiffTimeInterval,CDate(cacheData(1)),Now())
		If appCacheTimeOut < CInt(intTime) Then '如果没有超时
			appCacheTimeOut = 0
		Else
			Application.Lock()
			Application.Contents.Remove(strName)
			Application.UnLock()
		End If
	End Function

	'文件缓存是否超时:>0超时 -1=文件不存在 0 = 没有超时
	Private Function fileCacheTimeOut(ByVal strFilePath,ByVal intTime)
		strFilePath = getMapPath(strFilePath)
		'如果有缓存就读取缓存，没有就加载模板后建立缓存
		If objFSO.FileExists(strFilePath) Then'如果能读取到文件
			Dim Files : Set Files = objFSO.GetFile(strFilePath)
			'检测文件缓存是否过期
			fileCacheTimeOut = DateDiff(strDateDiffTimeInterval, FormatDateTime(Files.DateLastModified,0),Now())
			If fileCacheTimeOut < Cint(intTime) Then'如果没有超时
				fileCacheTimeOut = 0
			End If
			Set Files = Nothing
		Else
			fileCacheTimeOut = -1
		End If
	End Function

	'设置内存缓存设置缓存=================
	Private Sub setApplication(ByVal appName,ByVal appValue)
		Application.Lock()
		If IsObject(appValue) Then
		Set Application(appName) = appValue
		Else
		Application(appName) = appValue
		End If
		Application.UnLock()
	End Sub

	'设置缓存=================
	Private Sub setAppCacheValue(ByVal strCacheName,ByVal cacheValue)
		Dim cacheData(3)
		If IsObject(cacheValue) Then
		Set cacheData(0) = cacheValue
		Else
			cacheData(0) = cacheValue
		End If
			cacheData(1) = Now()
			cacheData(2) = 0'计数器
		setApplication strCacheName,cacheData
	End Sub

	'获取缓存,值计数器++
	Private Function getAppCacheValue(ByVal strCacheName)
		Dim cacheData
			cacheData = Application(strCacheName)
		If IsArray(cacheData) Then
			If IsObject(cacheData(0)) Then
			Set getAppCacheValue = cacheData(0)
			Else
			getAppCacheValue = cacheData(0)
			End If
			cacheData(1) = Now()
			cacheData(2) = cacheData(2) + 1'计数器
			setApplication strCacheName,cacheData
		Else
			getAppCacheValue = Empty
		End If
	End Function

	'获取缓存计数器数值，-1 不存在
	Private Function getAppCacheNum(ByVal strCacheName)
		Dim cacheData
			cacheData = Application(strCacheName)
		If IsArray(cacheData) Then
			getAppCacheNum = cacheData(2)
		Else
			getAppCacheNum = -1
		End If
	End Function

	'抛出错误
	Private Sub errRaise(ByVal strVal)
		If intDebugModule Then'如果开启错误提示
			Response.Write(strVal)
			Response.End()
		End If
	End Sub

	Public Function getXMLDOM
		On Error Resume Next
		Dim Temp,v_Temp
		'getXMLDOM="Microsoft.XMLDOM"
		v_Temp=Array("Microsoft.XMLDOM","MSXML2.DOMDocument","MSXML2.DOMDocument.3.0","MSXML2.DOMDocument.4.0","MSXML2.DOMDocument.5.0")
		Err = 0
		Dim TmpObj
		For i=0 To UBound(v_Temp)
			Set TmpObj = Server.CreateObject(v_Temp(i))
			'Temp = Err
			Set TmpObj=Nothing
			If Err = 0 Then
				getXMLDOM=v_Temp(i)
			Else
				Exit For
			End If
		Next

'		IF Temp = 1 OR Temp = -2147221005 Then
'			getXMLDOM="Msxml2.DOMDocument.5.0"
'		End IF
'		Err.Clear
		Set TmpObj = Nothing
		Err = 0
	End Function
End Class
%>