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
  '�������֣�Open()
  'Open=0��XMLMorntekDocument����һ���ɹ�װ��XML�ĵ��Ķ����ˡ�
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
'�������֣�Create()
'����һ���µ�xml dom
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
  '�������֣�OpenXML()
  'Open=0��XMLMorntekDocument����һ���ɹ�װ��XML�ĵ��Ķ����ˡ�
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
  '�������֣�getError()
  '------------------------------------------------
Public function getError()
	getError=errorcode
End Function
  '------------------------------------------------
  '�������֣�XMLRoot()
  '------------------------------------------------
  Public function XMLRoot()
  Set XMLRoot=XMLMorntekDocument.DocumentElement
  End Function

  '------------------------------------------------
  '�������֣�XMLBoot()
  '------------------------------------------------
  Public function XMLBoot()
  Set XMLBoot=XMLMorntekDocument
  End Function

'------------------------------------------------
'�������֣�RespXml()
'ֱ��ҳ�����xml
'------------------------------------------------
Public function RespXml()
Response.Write(XMLMorntekDocument.xml)
End Function

'------------------------------------------------
'�������֣�CloseXml()
'------------------------------------------------
Public function CloseXml()
If IsObject(XMLMorntekDocument) Then	Set XMLMorntekDocument=Nothing
End Function

'//--����XML���� ����Ҫ���ԣ�
Private Function ProcessingInstruction
Dim objPi
Set objPi = XMLMorntekDocument.createProcessingInstruction("xml", "version="&chr(34)&"1.0"&chr(34)&" encoding="&chr(34)&"UTF-8"&chr(34))
'//--��xml����׷�ӵ�xml�ĵ�
XMLMorntekDocument.insertBefore objPi, XMLMorntekDocument.childNodes(0)
End Function

'//============================================================
'<!--����һ���ڵ�-->
' sNode STRING �ڵ�����
' rNode OBJECT ���ӽڵ���ϼ��ڵ�����
'=============================================================
Public Function AddNode(sNode,rNode)
	Dim TmpNode
	Set TmpNode = XMLMorntekDocument.createElement(sNode)
	rNode.appendChild TmpNode
	Set AddNode = TmpNode
End Function

'//============================================================
'<!--�����ڵ�����-->
' FStr STRING Text����
'cdBool True �ж�ת��
' oNode OBJECT ���ӽڵ���ϼ��ڵ�����
'=============================================================
Public Function AddText(FStr,cdBool,oNode)
Dim tmpText
If cdBool="1" Then
Set tmpText = XMLMorntekDocument.createCDataSection(FStr)
Else
Set tmpText = XMLMorntekDocument.createTextNode(FStr)
End If
oNode.appendChild tmpText
End Function

'<!--����һ������-->
' sName STRING ��������
' sValue STRING ����ֵ
' oNode OBJECT �������ԵĶ���
'=============================================================
Public Function AddAttribute(sName,sValue,oNode)
	If IsNull(sValue)  Then  sValue=""
	'If sValue=Nothing Then sValue=""
	'response.write Len(sValue)
	'sValue=""
	oNode.setAttribute sName,sValue
End Function

'<!--ɾ��һ���ڵ�-->
' sName STRING �ڵ����
'=============================================================
Public Function DelNode(sName,FaName)
FaName.removeChild sName
End Function


'<!--�����ļ�-->
' sName STRING ��������
' sValue STRING ����ֵ
' oNode OBJECT �������ԵĶ���
'=============================================================
Public Function SaveDom(do_path)
XMLMorntekDocument.save do_path
End Function
'------------------------------------------------
'SelectXmlNodeText(elementname)
'��õ��� elementname Ԫ��
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
'��õ��� elementname Ԫ�ص�NodeList
'------------------------------------------------
Public function XMLRootSelectNodes(elementname)
Set XMLRootSelectNodes=XMLMorntekDocument.DocumentElement.SelectNodes(elementname)
End Function

'------------------------------------------------
'XMLRootSelectSingleNode(elementname)
'��õ��� elementname Ԫ�ص�NodeList
'------------------------------------------------
Public function XMLRootSelectSingleNode(elementname)
Set XMLRootSelectSingleNode=XMLMorntekDocument.DocumentElement.SelectSingleNode(elementname)
End Function

  '------------------------------------------------
  'SelectXmlNode(elementname,itemID)
  '��õ��� elementname Ԫ��
  '------------------------------------------------
  Public function SelectXmlNode(elementname,itemID)
      dim temp
      set temp=XMLMorntekDocument.getElementsByTagName(elementname).item(itemID)
      set SelectXmlNode= temp
  end function

    '------------------------------------------------
  'GetXmlNodeLength(elementname)
  '��õ��� elementname Ԫ�ص�Lengthֵ
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
  '��õ��� elementname Ԫ�ص�attributesֵ
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
  '��õ���ĳ elementname Ԫ�ص�Lengthֵ
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
  'д�뵱��ĳ elementname Ԫ�ص�textֵ
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
  '����Ƿ���� elementname Ԫ��
  'True�������,False��������
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
'�жϷ�����Microsoft.XMLDOM
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
'�жϷ�����MSXML2.ServerXMLHTTP
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
'Զ�̶�ȡXML�������
'*************************************

Class LoadWebXmlHttp 'new xmlhttp object
Public XmlUrl 'xml��URL·��
Public xmlcode 'xml����
Public errorcode '����
Private xmlhttp 'xmlhttp����
Private errorcode_readyState '����
Private errorcode_status '����

Private Sub listfirst
'Ĭ�ϱ���Ϊ"utf-8"
If xmlcode="" Then xmlcode="x-www-form-urlencoded"
End Sub

  '------------------------------------------------
  '�������֣�open()
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
  '�������֣�GEtopen()
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
  '�������֣�getxml(pathurl,aData)
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
'�������֣�getreadyState()
'------------------------------------------------
Public function getreadyState()
	getreadyState=errorcode_readyState
End Function

'------------------------------------------------
'�������֣�getstatus()
'------------------------------------------------
Public function getstatus()
	getstatus=errorcode_status
End Function

'------------------------------------------------
'�������֣�Responsebody()
'------------------------------------------------
Public function Responsebody()
	Responsebody=xmlhttp.Responsebody
End Function

'------------------------------------------------
'�������֣�xmldom()
'------------------------------------------------
Public function xmldom()
	Set xmldom=xmlhttp.Responsexml
End Function

'------------------------------------------------
'�������֣�xmlxml()
'------------------------------------------------
Public function xmlxml()
xmlxml=xmlhttp.Responsexml.xml
End Function

'------------------------------------------------
'�������֣�Closexmlhttp()
'------------------------------------------------
Public function Closexmlhttp()
If IsObject(xmlhttp) Then	Set xmlhttp=Nothing
End Function

End Class
%>