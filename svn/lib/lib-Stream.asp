<%
'Dim s
'Set s = New Stream
'	With s
'	Response.Write(.LoadFile("1.txt"))
'	.SaveToFile "response.write 123", "2.asp"
'	Response.Write(.GetHttpPage("http://www.evio.name/default.asp")(1))
'	End With
'Set s = Nothing
Class JaspStream
	Private c_Stream, c_Cset, c_httpXml
	Private errorcode

	'设置编码
	Public property LET Cset(ByVal values)
		c_Cset = values
	End property
	Public property Get Cset()
		Cset = c_Cset
	End property


	Private Sub Class_Initialize()
		errorcode=0
       	Set c_Stream = Server.CreateObject("Adodb." & "Stream")
		Set c_httpXml = Server.CreateObject("Microsoft.XMLHTTP")
			c_Cset = "UTF-8"
    End Sub

    Private Sub Class_Terminate()
		Set c_Stream = Nothing
		Set c_httpXml = Nothing
    End Sub

	Private Function BytesToStr(ByVal body)
		With c_Stream
			.Type = 1 '设置返回数据类型为二进制
			.Mode = 3 '打开模式为读写
			.Open
			.Write body '将指定的数据装入对像中 body为内容
			.Position = 0 '指定对像内数据的当前指针
			.Type = 2 '设置返回数据类型为文本
			.Charset = Cset '设定字符集类型
			BytesToStr = .ReadText '取对象内的文本
			.Close
		End With
	End Function

	Public Function LoadFile(ByVal File)
        On Error Resume Next
        LoadFile = "error"
        With c_Stream
            .Type = 2
            .Mode = 3
            .Open
            .Charset = Cset
            .Position = c_Stream.Size
            .LoadFromFile Server.MapPath(File)
            If Err Then
                .Close
                Err.Clear
                Exit Function
            End If
            LoadFile = .ReadText
            .Close
        End With
    End Function

	Public Function SaveToFile(ByVal strBody, ByVal File)
		Dim RText
		RText = Array(0, "保存文件失败")
		With c_Stream
			.Type = 2
			.Open
			.Charset = Cset
			.Position = c_Stream.Size
			.WriteText = strBody
			On Error Resume Next
			.SaveToFile Server.MapPath(File), 2
			If Err Then
				RText = Array(Err.Number, Err.Description)
				SaveToFile = RText
				Err.Clear
				Exit Function
			End If
			.Close
		End With
		RText = Array(1, "保存文件成功")
		SaveToFile = RText
	End Function

	Public Function GetHttpPage(ByVal Url, ByVal Types)
		If IsNull(Types) Or Trim(Types) = "" Or Not IsNumeric(Types) Then Exit Function
		Dim Rtext
		Rtext = Array(0, "")
		With c_httpXml
			.open "GET", Url, false
			.send()
			If Err Then
				Rtext = Array(Err.Number, Err.Description)
				GetHttpPage = RText
				Err.Clear
				Exit Function
			End If
			If TypeName(.responseBody) = "Empty" Or TypeName(.responseBody) = "Null" Or Len(.responseBody) = 0 Then
				Rtext = Array(-1, "文件为空")
			Else
				Select Case  Int(Types)
				Case 0
					Rtext = Array(0, BytesToStr(.responseBody))
				Case 2
					Rtext=Array(0,.responseText)
				Case 3
					Rtext=Array(0,.Responsexml.xml)
				Case Else
					Rtext = Array(0, .responseBody)
				End Select
			End If
			GetHttpPage = Rtext
		End With
	End Function

	Public Function SaveToLocal(ByVal Url, ByVal FilePath)
		Dim ImgContent, RText
		RText = Array(0, "")
		ImgContent = GetHttpPage(Url, 1)
		If Int(ImgContent(0)) = 0 Then
			With c_Stream
				.Type = 1 '以二进制模式打开
				.Open
				.Write ImgContent(1)
				On Error Resume Next
				.SaveToFile Server.MapPath(FilePath), 2 '-将缓冲的内容写入文件
				If Err Then
					Rtext = Array(Err.Number, Err.Description)
					SaveToLocal = RText
					Err.Clear
					Exit Function
				End If
				.Cancel()
				.Close()
			End With
			RText = Array(0, "保存文件成功")
		Else
			RText = Array(-1, "保存文件失败")
		End If
		SaveToLocal = RText
	End Function

	'--------------------------------- 文件转字符串 ---------------------------------------
	Public Function FileToStr(ByVal FileName)
		Set baseM=new base64
		'判断文件是否存在
		Set fso=new FsoSystem
		fso.PathType=2
		FileGet=fso.CheckFile(FileName)
		Set fso=Nothing
		If Not FileGet Then
			errorcode=-1
			Exit Function
		End If

		With c_Stream
			.Type = 1
			.Mode = 3
			.Open
			.Position = 0
			.LoadFromFile(FileName)
			FileToStr=baseM.encode(.Read)
			.Cancel()
			.Close()
		End With
		Set baseM=Nothing
	End Function

	'--------------------------------- 字符串存储到文件 ---------------------------------------
	Public Function StrToFile(ByVal Str,ByVal FileName)
		Set baseM=new base64
		With c_Stream
			.Type = 1
			.Mode = 3
			.Open
			.Position = 0
			.write(baseM.decode(Str))
			Call .SaveToFile(Server.MapPath(FileName),2)
			.Cancel()
			.Close()
		End With
		Set baseM=Nothing
	End Function
End Class

'=====================base64 encode/decode==============
class base64
  Private objXmlDom
  Private objXmlNode

  Private Sub Class_Initialize()
      Set objXmlDom = Server.CreateObject(getXMLDOM)
  end sub

  Private Sub Class_Terminate()
	  Set objXmlDom =nothing
  end sub

  public function encode(AnsiCode)
    encode=""
	Set objXmlNode = objXmlDom.createElement("file")
	objXmlNode.datatype = "bin.base64"
    objXmlNode.nodeTypedvalue = AnsiCode
    encode = objXmlNode.text
	Set objXmlNode =nothing
  end function

  public function decode(base64Code)
    decode=""
	Set objXmlNode = objXmlDom.createElement("file")
	objXmlNode.datatype = "bin.base64"
	objXmlNode.text = base64Code
    decode = objXmlNode.nodeTypedvalue
 	Set objXmlNode =nothing
  end function
end class
%>
