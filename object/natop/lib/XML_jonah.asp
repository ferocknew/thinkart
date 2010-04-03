<%
'=================================================
' xml Edited by Jonah.Fu in GB2312
' Ver: 1.0.0.14
' UpdateDate: 2009-08-09 10:12
'Fix the CData bug
'=================================================

Class PXML
  Public XmlPath
  Private errorcode
  Private XMLMorntekDocument

Private Sub Class_Initialize()
 errorcode=-1
End Sub

Private Sub Class_Terminate()

End Sub

  '------------------------------------------------
  '函数名字：Open()
  'Open=0，XMLMorntekDocument就是一个成功装载XML文档的对象了。
  '------------------------------------------------
Public function Open()
on error resume next
dim strSourceFile,strError
Set XMLMorntekDocument = Server.CreateObject(getXMLDOM)
If Err Then
	errorcode=-18239123
	Err.clear
	exit function
end if
XMLMorntekDocument.async=False
strSourceFile = Server.MapPath(XmlPath)
XMLMorntekDocument.load(strSourceFile)
errorcode=XMLMorntekDocument.parseerror.errorcode
end function

'------------------------------------------------
'函数名字：Create()
'创建一个新的xml dom
'------------------------------------------------
Public function Create(top_nodename)
	On Error Resume Next
	dim strSourceFile,strError,tmpNode
	Set XMLMorntekDocument = Server.CreateObject(getXMLDOM)
	If Err Then
		errorcode=-18239123
		Err.clear
		Exit Function
	End If
	XMLMorntekDocument.preserveWhiteSpace = True
	XMLMorntekDocument.async = false

	Dim version
	'Set  version=XMLMorntekDocument.createProcessingInstruction("xml","   version='1.0'   encoding='utf-8'")
	'XMLMorntekDocument.appendChild(version)

	Dim root
	Set root = XMLMorntekDocument.CreateNode("element",top_nodename,"")
	XMLMorntekDocument.appendChild(root)
'	Response.Write(objDom.xml)
end function

  '------------------------------------------------
  '函数名字：OpenXML()
  'Open=0，XMLMorntekDocument就是一个成功装载XML文档的对象了。
  '------------------------------------------------
Public function OpenXML(xmlStr)
	on error resume next
	dim strSourceFile,strError
	Set XMLMorntekDocument = Server.CreateObject(getXMLDOM)
	If Err Then
		errorcode=-18239123
		Err.clear
	exit function
	end if
	XMLMorntekDocument.async = false
	XMLMorntekDocument.load(xmlStr)
	errorcode=XMLMorntekDocument.parseerror.errorcode
end function

  '------------------------------------------------
  '函数名字：getError()
  '------------------------------------------------
Public function getError()
	getError=errorcode
End Function
  '------------------------------------------------
  '函数名字：XMLRoot()
  '------------------------------------------------
  Public function XMLRoot()
  Set XMLRoot=XMLMorntekDocument.DocumentElement
  End Function

  '------------------------------------------------
  '函数名字：XMLBoot()
  '------------------------------------------------
  Public function XMLBoot()
  Set XMLBoot=XMLMorntekDocument
  End Function

'------------------------------------------------
'函数名字：RespXml()
'直接页面输出xml
'------------------------------------------------
Public function RespXml()
Response.Write(XMLMorntekDocument.xml)
End Function

'------------------------------------------------
'函数名字：CloseXml()
'------------------------------------------------
Public function CloseXml()
If IsObject(XMLMorntekDocument) Then	Set XMLMorntekDocument=Nothing
End Function

'//--创建XML声明 （需要调试）
Private Function ProcessingInstruction
Dim objPi
Set objPi = XMLMorntekDocument.createProcessingInstruction("xml", "version="&chr(34)&"1.0"&chr(34)&" encoding="&chr(34)&"UTF-8"&chr(34))
'//--把xml申明追加到xml文档
XMLMorntekDocument.insertBefore objPi, XMLMorntekDocument.childNodes(0)
End Function

'//============================================================
'<!--新增一个节点-->
' sNode STRING 节点名称
' rNode OBJECT 增加节点的上级节点引用
'=============================================================
Public Function AddNode(sNode,rNode)
	Dim TmpNode
	Set TmpNode = XMLMorntekDocument.createElement(sNode)
	rNode.appendChild TmpNode
	'Set AddNode = TmpNode
End Function

'//============================================================
'<!--新增节点内容-->
' FStr STRING Text内容
'cdBool True 判断转义
' oNode OBJECT 增加节点的上级节点引用
'=============================================================
Public Function AddText(cdBool,FStr,oNode)
If cdBool="1" Then
oNode.appendChild(XMLMorntekDocument.createCDataSection(FStr))
Else
oNode.appendChild(XMLMorntekDocument.createTextNode(FStr))
End If
End Function

'<!--新增一个属性-->
' sName STRING 属性名称
' sValue STRING 属性值
' oNode OBJECT 增加属性的对象
'=============================================================
Public Function AddAttribute(sName,sValue,oNode)
	If IsNull(sValue)  Then  sValue=""
	'If sValue=Nothing Then sValue=""
	'response.write Len(sValue)
	'sValue=""
	oNode.setAttribute sName,sValue
End Function

'<!--删除一个节点-->
' sName STRING 节点对像
'=============================================================
Public Function DelNode(sName,FaName)
FaName.removeChild sName
End Function


'<!--保存文件-->
' sName STRING 属性名称
' sValue STRING 属性值
' oNode OBJECT 增加属性的对象
'=============================================================
Public Function SaveDom(do_path)
XMLMorntekDocument.save do_path
End Function
'------------------------------------------------
'SelectXmlNodeText(elementname)
'获得当个 elementname 元素
'------------------------------------------------
Public function SelectXmlNodeText(elementname)
  on error resume next
  dim temp
  temp=XMLMorntekDocument.getElementsByTagName(elementname).item(0).text
  selectXmlNodeText= temp
  if err then selectXmlNodeText=0
end Function

'------------------------------------------------
'XMLRootSelectNodes(elementname)
'获得当个 elementname 元素的NodeList
'------------------------------------------------
Public function XMLRootSelectNodes(elementname)
Set XMLRootSelectNodes=XMLMorntekDocument.DocumentElement.SelectNodes(elementname)
End Function

'------------------------------------------------
'XMLRootSelectSingleNode(elementname)
'获得当个 elementname 元素的NodeList
'------------------------------------------------
Public function XMLRootSelectSingleNode(elementname)
Set XMLRootSelectSingleNode=XMLMorntekDocument.DocumentElement.SelectSingleNode(elementname)
End Function

  '------------------------------------------------
  'SelectXmlNode(elementname,itemID)
  '获得当个 elementname 元素
  '------------------------------------------------
  Public function SelectXmlNode(elementname,itemID)
      dim temp
      set temp=XMLMorntekDocument.getElementsByTagName(elementname).item(itemID)
      set SelectXmlNode= temp
  end function

    '------------------------------------------------
  'GetXmlNodeLength(elementname)
  '获得当个 elementname 元素的Length值
  '------------------------------------------------
  Public function GetXmlNodeLength(elementname)
      on error resume next
      dim XmlLength
      XmlLength=XMLMorntekDocument.getElementsByTagName(elementname).length
      GetXmlNodeLength= XmlLength
      if err then GetXmlNodeLength=0
  end function

  '------------------------------------------------
  'GetAttributes(elementname,nodeName,ID)
  '获得当个 elementname 元素的attributes值
  '------------------------------------------------
  Public function GetAttributes(elementname,nodeName,itemID)
	Dim XmlAttributes,i
	Set XmlAttributes=XMLMorntekDocument.getElementsByTagName(elementname).item(itemID).attributes
	For i=0 To XmlAttributes.length-1
	If XmlAttributes(i).name=nodeName Then
	GetAttributes=XmlAttributes(i).value
	Exit Function
	End If
	Next
	GetAttributes = 0
  End Function

  '------------------------------------------------
  'SelectXmlNodeItemText(elementname,ID)
  '获得当个某 elementname 元素的Length值
  '------------------------------------------------
  Public function SelectXmlNodeItemText(elementname,ID)
      on error resume next
      dim temp
      temp=XMLMorntekDocument.getElementsByTagName(elementname).item(ID).text
      SelectXmlNodeItemText= temp
      if err then SelectXmlNodeItemText=""
  end function

  '------------------------------------------------
  'WriteXmlNodeItemText(elementname,ID)
  '写入当个某 elementname 元素的text值
  '------------------------------------------------
  Public function WriteXmlNodeItemText(elementname,ID,str)
      on error resume next
      WriteXmlNodeItemText=0
      dim temp,temp1
      set temp=XMLMorntekDocument.getElementsByTagName(elementname).item(ID)
      temp.childNodes(0).text=str
	  XMLMorntekDocument.save Server.MapPath(XmlPath)
      if err then WriteXmlNodeItemText=err.Description
  end function

  '------------------------------------------------
  'IsXmlNode(elementname)
  '检测是否存在 elementname 元素
  'True代表存在,False代表不存在
  '------------------------------------------------
  Public function IsXmlNode(elementname)
   dim Temp
   IsXmlNode=True
   On Error Resume Next
   Temp=XMLMorntekDocument.getElementsByTagName(elementname).item(0).text
   if err>0 then
    err.clear
    IsXmlNode=False
   end if
  End Function
End Class


'*************************************
'判断服务器Microsoft.XMLDOM
'*************************************
Function getXMLDOM
	On Error Resume Next
	Dim Temp
	getXMLDOM="Microsoft.XMLDOM"
	Err = 0
	Dim TmpObj
	Set TmpObj = Server.CreateObject(getXMLDOM)
	Temp = Err
    IF Temp = 1 OR Temp = -2147221005 Then
		getXMLDOM="Msxml2.DOMDocument.5.0"
	End IF
	Err.Clear
	Set TmpObj = Nothing
	Err = 0
End Function
'*************************************
'判断服务器MSXML2.ServerXMLHTTP
'*************************************
Function getXMLHTTP
	On Error Resume Next
	Dim Temp
	getXMLHTTP="MSXML2.ServerXMLHTTP"
	Err = 0
	Dim TmpObj
	Set TmpObj = Server.CreateObject(getXMLHTTP)
	Temp = Err
    IF Temp = 1 OR Temp = -2147221005 Then
		getXMLHTTP="Msxml2.ServerXMLHTTP.5.0"
	End IF
	Err.Clear
	Set TmpObj = Nothing
	Err = 0
end Function
'*************************************
'远程读取XML的类操作
'*************************************

Class LoadWebXmlHttp 'new xmlhttp object
Public XmlUrl 'xml的URL路径
Public xmlcode 'xml编码
Public errorcode '错误
Private xmlhttp 'xmlhttp对象
Private errorcode_readyState '报错
Private errorcode_status '报错

Private Sub listfirst
'默认编码为"utf-8"
If xmlcode="" Then xmlcode="x-www-form-urlencoded"
End Sub

  '------------------------------------------------
  '函数名字：open()
  '------------------------------------------------

Public Function open()
listfirst()
Set xmlhttp=Server.CreateObject(getXMLHTTP)
Dim getResponse
xmlhttp.Open "POST", XmlUrl, False
xmlhttp.setRequestHeader "Content-Type", "application/"&xmlcode&""
xmlhttp.Send()
errorcode_readyState=xmlhttp.readyState
errorcode_status=xmlhttp.status

On Error Resume Next

If (xmlhttp.readyState <> 4) or (xmlhttp.Status <> 200) Then
errorcode=True
getxml=""
Exit Function
Else
errorcode=False
End If

End Function

  '------------------------------------------------
  '函数名字：GEtopen()
  '------------------------------------------------

Public Function Getopen()
listfirst()
Set xmlhttp=Server.CreateObject(getXMLHTTP)
Dim getResponse
xmlhttp.Open "GET", XmlUrl, False
xmlhttp.setRequestHeader "Content-Type", "application/"&xmlcode&""
xmlhttp.Send()
errorcode_readyState=xmlhttp.readyState
errorcode_status=xmlhttp.status

On Error Resume Next

If (xmlhttp.readyState <> 4) or (xmlhttp.Status <> 200) Then
errorcode=True
getxml=""
Exit Function
Else
errorcode=False
End If

End Function

  '------------------------------------------------
  '函数名字：getxml(pathurl,aData)
  '------------------------------------------------

Public Function getxml(pathurl,aData)
listfirst()
Set xmlhttp=Server.CreateObject(getXMLHTTP)
Dim getResponse
xmlhttp.Open "POST", pathurl, False
xmlhttp.setRequestHeader "Content-Type", "application/"&xmlcode&""
xmlhttp.send(aData)
errorcode_readyState=xmlhttp.readyState
errorcode_status=xmlhttp.status

On Error Resume Next

If (xmlhttp.readyState <> 4) or (xmlhttp.Status <> 200) Then
errorcode=True
getxml=""
Exit Function
Else
errorcode=False
End If

getxml=xmlhttp.Responsebody
End Function
'------------------------------------------------
'函数名字：getreadyState()
'------------------------------------------------
Public function getreadyState()
	getreadyState=errorcode_readyState
End Function

'------------------------------------------------
'函数名字：getstatus()
'------------------------------------------------
Public function getstatus()
	getstatus=errorcode_status
End Function

'------------------------------------------------
'函数名字：Responsebody()
'------------------------------------------------
Public function Responsebody()
	Responsebody=xmlhttp.Responsebody
End Function

'------------------------------------------------
'函数名字：xmldom()
'------------------------------------------------
Public function xmldom()
	Set xmldom=xmlhttp.Responsexml
End Function

'------------------------------------------------
'函数名字：xmlxml()
'------------------------------------------------
Public function xmlxml()
xmlxml=xmlhttp.Responsexml.xml
End Function

'------------------------------------------------
'函数名字：Closexmlhttp()
'------------------------------------------------
Public function Closexmlhttp()
If IsObject(xmlhttp) Then	Set xmlhttp=Nothing
End Function

End Class
%>