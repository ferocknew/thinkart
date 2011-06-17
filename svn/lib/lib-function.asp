<%
'=================================================
' Ver: 1.0.0.12
' UpdateDate: 2010-02-05 14:41
'=================================================
'*************************************
'压缩数据库，connobject=conn
'*************************************
Sub AccessComp(connobject,AccessFile)
If Not  IsObject(connobject) Then Exit Sub
	connobject.close
	connobject=Null

	Set AccessFSO = Server.CreateObject("Scripting.FileSystemObject")
	Set AccessEngine = CreateObject("JRO.JetEngine")
	AccessEngine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.Mappath(AccessFile), "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.Mappath(AccessFile & ".temp")
	AccessFSO.CopyFile Server.Mappath(AccessFile & ".temp"), Server.Mappath(AccessFile)
	AccessFSO.DeleteFile(Server.Mappath(AccessFile & ".temp"))
	Set AccessFSO = Nothing
	Set AccessEngine = Nothing
End Sub
'*************************************
'判断 TableName 是否存在，connobject=conn
'*************************************
Function chktable(TableName,connobject)
   Dim tbs
   Set tbs=connobject.OpenSchema(20)
   tbs.Filter="TABLE_NAME='"&TableName&"' "
    If Not tbs.eof Then
    chktable=True
    Else
    chktable=False
    End If
    tbs.close:Set tbs=Nothing
End Function
'*************************************
'判断XML文件需求标签是否为空 返回True 和 False  xmlurl=xml地址,getcode=xml编码,item_name=节点名称
'*************************************
Function xmlIsEmpty(xmlurl,getcode,item_name)
Set xmldo=new PXML
xmldo.OpenXML(getxmlbody(xmlurl,getcode))
xmlIsEmpty_temp=xmldo.GetXmlNodeLength(item_name)
If xmlIsEmpty_temp=0 Then
xmlIsEmpty=True
Else
xmlIsEmpty=False
End If
xmldo.CloseXml():Set xmldo=Nothing
End Function
'*************************************
'从xml读取相关属性 xmlurl=xml地址,getcode=xml编码,item_name=节点名称,order_name=属性名称,order_index=属性序列
'*************************************
Function xmlGetAttributes(xmlurl,getcode,item_name,order_name,order_index)
Set xmldo=new PXML
xmldo.OpenXML(getxmlbody(xmlurl,getcode))
xmlGetAttributes=xmldo.GetAttributes(item_name,order_name,order_index)
xmldo.CloseXml():Set xmldo=Nothing
End Function
'*************************************
'从xml转换成数组 xmlurl=xml地址,getcode=xml编码,item_name=节点名称,
'*************************************
Function getxmltoA(xmlurl,getcode,item_name)
Set xmldo=new PXML
xmldo.OpenXML(getxmlbody(xmlurl,getcode))
upusernum=CInt(xmldo.GetXmlNodeLength(item_name))
upusernum_item=CInt(xmldo.XMLRootSelectNodes(item_name)(0).ChildNodes.length)
If upusernum=0 Then
	ReDim upuser(0,0)
Else
	ReDim upuser(upusernum_item,upusernum)
	For i=0 To upusernum_item-1
		For j=0 To upusernum-1
		upuser(i,j)=xmldo.XMLRootSelectNodes(item_name)(j).ChildNodes(i).text
		Next
	Next
End If
getxmltoA=upuser
'===============将xml转为数组===============
xmldo.CloseXml():Set xmldo=Nothing
End Function
'*************************************
'从xml读取xmlbody
'*************************************
Function getxmlbody(xmlurl,getcode)
Set xmlhttp=new LoadWebXmlHttp
xmlhttp.XmlUrl=xmlurl
xmlhttp.xmlcode=getcode
xmlhttp.open()

If Not xmlhttp.errorcode Then
	getxmlbody=xmlhttp.Responsebody()
Else
	getxmlbody=False
End If
xmlhttp.Closexmlhttp():Set xmlhttp=Nothing
End Function
'*************************************
'检测surl是否可以访问
'*************************************
Function urlChk(sUrl,TimeOut)
	on error resume Next
	urlChk= false
	Set xmlhttp=Server.CreateObject(getXMLHTTP)
	xmlhttp.open "GET",sUrl,False
	If IsNull(TimeOut) Then TimeOut=4000
	Call xmlHttp.setTimeouts(TimeOut,TimeOut,TimeOut,TimeOut)
	xmlHttp.send
	If Err Then
		urlChk= False
	Else
		If xmlHttp.Status = 200 then urlChk= True
	End If
	set xmlHttp=Nothing
	On Error goto 0
End Function
'*************************************
'GetRnd(bound)返回一个不重复的随机数字 bound：随机范围
'*************************************
Function GetRnd(bound)
DIM ranNum
Randomize()
ranNum=int(bound*rnd)
If Instr(Appeared,"["&ranNum&"]") Then '产生的随机数是否出现过
ranNum = getRnd(bound)
End If
Appeared = Appeared & "["&ranNum&"]" '记录已出现的随机数
GetRnd = ranNum
End Function
'*************************************
'计算随机整数 upperbound=上限，lowerbound=下限
'*************************************
Function rnd_sum(upperbound,lowerbound)
Randomize
rnd_sum=Int((upperbound - lowerbound + 1) * Rnd + lowerbound)
End Function
'####################
' 生成随机密码
'####################
Function makePassword(maxLen)
Dim strNewPass
Dim whatsNext, upper, lower, intCounter
Randomize
For intCounter = 1 To maxLen
whatsNext = Int((1 - 0 + 1) * Rnd + 0)
If whatsNext = 0 Then
'character
upper = 90
lower = 65
Else
upper = 57
lower = 48
End If
strNewPass = strNewPass & Chr(Int((upper - lower + 1) * Rnd + lower))
Next
makePassword = strNewPass
End Function

'*************************************
'获取本页地址栏
'*************************************
Function GetLocationURL()
Dim Url
Dim ServerPort,ServerName,ScriptName,QueryString
ServerName=Request.ServerVariables("SERVER_NAME")
ServerPort=Request.ServerVariables("SERVER_PORT")
ScriptName=Request.ServerVariables("SCRIPT_NAME")
QueryString=Request.ServerVariables("QUERY_STRING")
Url="http://"&ServerName
If ServerPort <> "80" Then Url = Url & ":" & ServerPort
Url=Url&ScriptName
If QueryString <>"" Then Url=Url&"?"& QueryString
GetLocationURL=Url
End Function

'*************************************
'获取本页地址栏目录 GetLocationURLdri(dir_num) dir_num=0为同级目录，dir_num=1为上级目录，此函数可能使For循环失效
'*************************************
Function GetLocationURLdri(dir_num)
If Not IsNumeric(dir_num) Then dir_num=0
Dim URLadr,URLadr_new,URLadr_xml
URLadr=GetLocationURL()
URLadr=Split(URLadr,"/")
For i=0 To UBound(URLadr,1)-1-dir_num
	URLadr_new=URLadr_new&URLadr(i)&"/"
Next
GetLocationURLdri=URLadr_new
End Function

'*************************************
'获取本页地址栏虚拟目录 GetLocationURLdriMap(dir_num) dir_num=0为同级目录，dir_num=1为上级目录
'*************************************
Function GetLocationURLdriMap(dir_num) 'dir_num=0为同级目录
If Not IsNumeric(dir_num) Then dir_num=0
Dim URLadr,URLadr_new,URLadr_xml
URLadr=GetLocationURL()
URLadr=Split(URLadr,"/")
For i=3 To UBound(URLadr,1)-1-dir_num
	URLadr_new=URLadr_new&"/"&URLadr(i)
Next
GetLocationURLdriMap=URLadr_new
End Function

'*************************************
'获取地址栏访问文件
'*************************************
Function GetLocationURLfile()
Dim URLadr,URLadr_new,URLadr_xml
URLadr=GetLocationURL()
URLadr=Split(URLadr,"/")
URLadr_new=URLadr(UBound(URLadr))
URLadr_file=Split(URLadr_new,"?")
GetLocationURLfile=URLadr_file(0)
End Function

'*************************************
'防止外部提交
'*************************************
function ChkPost()
  dim server_v1,server_v2
  chkpost=false
  server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
  server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
  If Mid(server_v1,8,Len(server_v2))<>server_v2 then
    chkpost=False
  else
   chkpost=True
  end If
 end function


'*************************************
'IP过滤
'*************************************
function MatchIP(IP)
 on error resume next
 MatchIP=false
 Dim SIp,SplitIP
 for each SIp in FilterIP
    SIp=replace(SIp,"*","\d*")
    SplitIP=split(SIp,".")
    Dim re, strMatchs,strIP
     Set re=new RegExp
      re.IgnoreCase =True
      re.Global=True
      re.Pattern="("&SplitIP(0)&"|)."&"("&SplitIP(1)&"|)."&"("&SplitIP(2)&"|)."&"("&SplitIP(3)&"|)"
     Set strMatchs=re.Execute(IP)
      strIP=strMatchs(0).SubMatches(0) & "." & strMatchs(0).SubMatches(1)& "." & strMatchs(0).SubMatches(2)& "." & strMatchs(0).SubMatches(3)
     if strIP=IP then MatchIP=true:exit function
     Set strMatchs=Nothing
     Set re=Nothing
 next
end function

'*************************************
'获得注册码
'*************************************
Function getcode()
	getcode= "<img src=""command/getcode.asp"" alt="""" style=""margin-right:40px;""/>"
End Function

'*************************************
'限制上传文件类型
'*************************************
Function IsvalidFile(File_Type)
	IsvalidFile = False
	Dim GName
	For Each GName in UP_FileType
		If File_Type = GName Then
			IsvalidFile = True
			Exit For
		End If
	Next
End Function

'*************************************
'检测是否只包含英文和数字
'*************************************
Function IsValidChars(str)
	Dim re,chkstr
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="[^_\.a-zA-Z\d]"
	IsValidChars=True
	chkstr=re.Replace(str,"")
	if chkstr<>str then IsValidChars=False
	set re=nothing
End Function

'*************************************
'检测是否只包含英文和数字
'*************************************
Function IsvalidValue(ArrayN,Str)
	IsvalidValue = false
	Dim GName
	For Each GName in ArrayN
		If Str = GName Then
			 IsvalidValue = true
			Exit For
		End If
	Next
End Function

'*************************************
'检测是否有效的数字
'*************************************
Function IsInteger(Para)
	IsInteger=False
	If Not (IsNull(Para) Or Trim(Para)="" Or Not IsNumeric(Para)) Then
		IsInteger=True
	End If
End Function

'*************************************
'用户名检测
'*************************************
Function IsValidUserName(byVal UserName)
    on error resume next
	Dim i,c
	Dim VUserName
	IsValidUserName = True
	For i = 1 To Len(UserName)
		c = Lcase(Mid(UserName, i, 1))
		If InStr("$!<>?#^%@~`&*();:+='"" 	", c) > 0 Then
				IsValidUserName = False
				Exit Function
		End IF
	Next
	For Each VUserName in Register_UserName
		If UserName = VUserName Then
			IsValidUserName = False
			Exit For
		End If
	Next
End Function

'*************************************
'检测是否有效的E-mail地址
'*************************************
Function IsValidEmail(Email)
	Dim names, name, i, c
	IsValidEmail = True
	Names = Split(email, "@")
	If UBound(names) <> 1 Then
   		IsValidEmail = False
   		Exit Function
	End If
	For Each name IN names
		If Len(name) <= 0 Then
     		IsValidEmail = False
     		Exit Function
   		End If
   		For i = 1 to Len(name)
     		c = Lcase(Mid(name, i, 1))
     		If InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 And Not IsNumeric(c) Then
       			IsValidEmail = false
       			Exit Function
     		End If
   		Next
   		If Left(name, 1) = "." or Right(name, 1) = "." Then
      		IsValidEmail = false
      		Exit Function
   		End If
	Next
	If InStr(names(1), ".") <= 0 Then
   		IsValidEmail = False
   		Exit Function
	End If
	i = Len(names(1)) - InStrRev(names(1), ".")
	If i <> 2 And i <> 3 Then
   		IsValidEmail = False
   		Exit Function
	End If
	If InStr(email, "..") > 0 Then
   		IsValidEmail = False
	End If
End Function

'*************************************
'加亮关键字
'*************************************
Function highlight(byVal strContent,byRef arrayWords)
	Dim intCounter,strTemp,intPos,intTagLength,intKeyWordLength,bUpdate
	if len(arrayWords)<1 then highlight=strContent:exit function
	For intPos = 1 to Len(strContent)
		bUpdate = False
		If Mid(strContent, intPos, 1) = "<" Then
			On Error Resume Next
			intTagLength = (InStr(intPos, strContent, ">", 1) - intPos)
			if err then
			  highlight=strContent
			  err.clear
			end if
			strTemp = strTemp & Mid(strContent, intPos, intTagLength)
			intPos = intPos + intTagLength
		End If
			If arrayWords <> "" Then
				intKeyWordLength = Len(arrayWords)
				If LCase(Mid(strContent, intPos, intKeyWordLength)) = LCase(arrayWords) Then
					strTemp = strTemp & "<span class=""high1"">" & Mid(strContent, intPos, intKeyWordLength) & "</span>"
					intPos = intPos + intKeyWordLength - 1
					bUpdate = True
				End If
			End If
		If bUpdate = False Then
			strTemp = strTemp & Mid(strContent, intPos, 1)
		End If
	Next
	highlight = strTemp
End Function

'*************************************
'过滤超链接
'*************************************
Function checkURL(ByVal ChkStr)
	Dim str:str=ChkStr
	str=Trim(str)
	If IsNull(str) Then
		checkURL = ""
		Exit Function
	End If
	Dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	re.Pattern="(d)(ocument\.cookie)"
    Str = re.replace(Str,"$1ocument cookie")
	re.Pattern="(d)(ocument\.write)"
    Str = re.replace(Str,"$1ocument write")
   	re.Pattern="(s)(cript:)"
    Str = re.replace(Str,"$1cri&#112;t ")
   	re.Pattern="(s)(cript)"
    Str = re.replace(Str,"$1cri&#112;t")
   	re.Pattern="(o)(bject)"
    Str = re.replace(Str,"$1bj&#101;ct")
   	re.Pattern="(a)(pplet)"
    Str = re.replace(Str,"$1ppl&#101;t")
   	re.Pattern="(e)(mbed)"
    Str = re.replace(Str,"$1mb&#101;d")
	Set re=Nothing
   	Str = Replace(Str, ">", "&gt;")
	Str = Replace(Str, "<", "&lt;")
	checkURL=Str
end function

'*************************************
'过滤文件名字
'*************************************
Function FixName(UpFileExt)
	If IsEmpty(UpFileExt) Then Exit Function
	FixName = Ucase(UpFileExt)
	FixName = Replace(FixName,Chr(0),"")
	FixName = Replace(FixName,".","")
	FixName = Replace(FixName,"ASP","")
	FixName = Replace(FixName,"ASA","")
	FixName = Replace(FixName,"ASPX","")
	FixName = Replace(FixName,"CER","")
	FixName = Replace(FixName,"CDX","")
	FixName = Replace(FixName,"HTR","")
End Function

'*************************************
'过滤特殊字符
'*************************************
Function CheckStr(byVal ChkStr)
	Dim Str:Str=ChkStr
	Str=Trim(Str)
	If IsNull(Str) Then
		CheckStr = ""
		Exit Function
	End If
    Str = Replace(Str, "&", "&amp;")
    Str = Replace(Str,"'","&#39;")
    Str = Replace(Str,"""","&#34;")
	Dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	re.Pattern="(w)(here)"
    Str = re.replace(Str,"$1h&#101;re")
	re.Pattern="(s)(elect)"
    Str = re.replace(Str,"$1el&#101;ct")
	re.Pattern="(i)(nsert)"
    Str = re.replace(Str,"$1ns&#101;rt")
	re.Pattern="(c)(reate)"
    Str = re.replace(Str,"$1r&#101;ate")
	re.Pattern="(d)(rop)"
    Str = re.replace(Str,"$1ro&#112;")
	re.Pattern="(a)(lter)"
    Str = re.replace(Str,"$1lt&#101;r")
	re.Pattern="(d)(elete)"
    Str = re.replace(Str,"$1el&#101;te")
	re.Pattern="(u)(pdate)"
    Str = re.replace(Str,"$1p&#100;ate")
	re.Pattern="(\s)(or)"
    Str = re.replace(Str,"$1o&#114;")
	Set re=Nothing
	CheckStr=Str
End Function

'*************************************
'恢复特殊字符
'*************************************
Function UnCheckStr(ByVal Str)
	If IsNull(Str) Then
		UnCheckStr = ""
		Exit Function
	End If
	    Str = Replace(Str,"&#39;","'")
        Str = Replace(Str,"&#34;","""")
		Dim re
		Set re=new RegExp
		re.IgnoreCase =True
		re.Global=True
		re.Pattern="(w)(h&#101;re)"
	    str = re.replace(str,"$1here")
		re.Pattern="(s)(el&#101;ct)"
	    str = re.replace(str,"$1elect")
		re.Pattern="(i)(ns&#101;rt)"
	    str = re.replace(str,"$1nsert")
		re.Pattern="(c)(r&#101;ate)"
	    str = re.replace(str,"$1reate")
		re.Pattern="(d)(ro&#112;)"
	    str = re.replace(str,"$1rop")
		re.Pattern="(a)(lt&#101;r)"
	    str = re.replace(str,"$1lter")
		re.Pattern="(d)(el&#101;te)"
	    str = re.replace(str,"$1elete")
		re.Pattern="(u)(p&#100;ate)"
	    str = re.replace(str,"$1pdate")
		re.Pattern="(\s)(o&#114;)"
	    Str = re.replace(Str,"$1or")
		Set re=Nothing
        Str = Replace(Str, "&amp;", "&")
    	UnCheckStr=Str
End Function


'*************************************
'转换xheditor
'*************************************
Function xheditorEncode(ByVal reString)
	Dim Str:Str=reString
	If Not IsNull(Str) Then
	    'Str = Replace(Str, CHR(9), "&nbsp;")
		Str = Replace(Str, CHR(13), "")
		Str = Replace(Str, CHR(10), "")
		xheditorEncode = Str
	End If
End Function

'*************************************
'转换HTML代码
'*************************************
Function HTMLEncode(ByVal reString)
	Dim Str:Str=reString
	If Not IsNull(Str) Then
   		Str = Replace(Str, ">", "&gt;")
		Str = Replace(Str, "<", "&lt;")
	    Str = Replace(Str, CHR(9), "&nbsp;")
	    Str = Replace(Str, CHR(39), "&#39;")
    	Str = Replace(Str, CHR(34), "&quot;")
		Str = Replace(Str, CHR(13), "")
		Str = Replace(Str, CHR(10), "<br/>")
		HTMLEncode = Str
	End If
End Function

'*************************************
'转换最新评论和日志HTML代码
'*************************************
Function CCEncode(ByVal reString)
	Dim Str:Str=reString
	If Not IsNull(Str) Then
   		Str = Replace(Str, ">", "&gt;")
		Str = Replace(Str, "<", "&lt;")
	    Str = Replace(Str, CHR(9), "&nbsp;")
	    Str = Replace(Str, CHR(39), "&#39;")
    	Str = Replace(Str, CHR(34), "&quot;")
		Str = Replace(Str, CHR(13), "")
		Str = Replace(Str, CHR(10), " ")
		CCEncode = Str
	End If
End Function

'*************************************
'反转换HTML代码
'*************************************
Function HTMLDecode(ByVal reString)
	Dim Str:Str=reString
	If Not IsNull(Str) Then
		Str = Replace(Str, "&gt;", ">")
		Str = Replace(Str, "&lt;", "<")
	    Str = Replace(Str, "&nbsp;", CHR(9))
		Str = Replace(Str, "&#160;&#160;&#160;&#160;", CHR(9))
		Str = Replace(Str, "&#39;", CHR(39))
		Str = Replace(Str, "&quot;", CHR(34))
		Str = Replace(Str, "", CHR(13))
		Str = Replace(Str, "<br/>", CHR(10))
		HTMLDecode = Str
	End If
End Function

'*************************************
'恢复&字符
'*************************************
function ClearHTML(ByVal reString)
	Dim Str:Str=reString
	If Not IsNull(Str) Then
        Str = Replace(Str, "&amp;", "&")
		ClearHTML = Str
	End If
End Function

'*************************************
'过滤textarea
'*************************************
Function UBBFilter(ByVal reString)
	Dim Str:Str=reString
	If Not IsNull(Str) Then
		Str = Replace(Str, "</textarea>", "<&#47textarea>")
		UBBFilter = Str
	End If
End Function

'*************************************
'过滤HTML代码
'*************************************
Function EditDeHTML(byVal Content)
	EditDeHTML=Content
	IF Not IsNull(EditDeHTML) Then
		EditDeHTML=UnCheckStr(EditDeHTML)
		EditDeHTML=Replace(EditDeHTML,"&","&amp;")
		EditDeHTML=Replace(EditDeHTML,"<","&lt;")
		EditDeHTML=Replace(EditDeHTML,">","&gt;")
		EditDeHTML=Replace(EditDeHTML,chr(34),"&quot;")
		EditDeHTML=Replace(EditDeHTML,chr(39),"&#39;")
	End IF
End Function

'*************************************
'日期转换函数
'*************************************
Function DateToStr(DateTime,ShowType)
	Dim DateMonth,DateDay,DateHour,DateMinute,DateWeek,DateSecond
	Dim FullWeekday,shortWeekday,Fullmonth,Shortmonth,TimeZone1,TimeZone2
	TimeZone1="+0800"
	TimeZone2="+08:00"
	FullWeekday=Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
	shortWeekday=Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
    Fullmonth=Array("January","February","March","April","May","June","July","August","September","October","November","December")
    Shortmonth=Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

	DateMonth=Month(DateTime)
	DateDay=Day(DateTime)
	DateHour=Hour(DateTime)
	DateMinute=Minute(DateTime)
	DateWeek=weekday(DateTime)
	DateSecond=Second(DateTime)
	If Len(DateMonth)<2 Then DateMonth="0"&DateMonth
	If Len(DateDay)<2 Then DateDay="0"&DateDay
	If Len(DateMinute)<2 Then DateMinute="0"&DateMinute
	Select Case ShowType
	Case "Y-m-d_CN"
		DateToStr=Year(DateTime)&"年"&DateMonth&"月"&DateDay&"日"
	Case "Y-m-d"
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay
	Case "Y-m-d H:I A"
		Dim DateAMPM
		If DateHour>12 Then
			DateHour=DateHour-12
			DateAMPM="PM"
		Else
			DateHour=DateHour
			DateAMPM="AM"
		End If
		If Len(DateHour)<2 Then DateHour="0"&DateHour
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay&" "&DateHour&":"&DateMinute&" "&DateAMPM
	Case "Y-m-d H:I:S"
		If Len(DateHour)<2 Then DateHour="0"&DateHour
		If Len(DateSecond)<2 Then DateSecond="0"&DateSecond
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay&" "&DateHour&":"&DateMinute&":"&DateSecond
	Case "YmdHIS"
		DateSecond=Second(DateTime)
		If Len(DateHour)<2 Then DateHour="0"&DateHour
		If Len(DateSecond)<2 Then DateSecond="0"&DateSecond
		DateToStr=Year(DateTime)&DateMonth&DateDay&DateHour&DateMinute&DateSecond
	Case "ym"
		DateToStr=Right(Year(DateTime),2)&DateMonth
	Case "d"
		DateToStr=DateDay
    Case "ymd"
        DateToStr=Right(Year(DateTime),4)&DateMonth&DateDay
    Case "mdy"
        Dim DayEnd
        select Case DateDay
         Case 1
          DayEnd="st"
         Case 2
          DayEnd="nd"
         Case 3
          DayEnd="rd"
         Case Else
          DayEnd="th"
        End Select
        DateToStr=Fullmonth(DateMonth-1)&" "&DateDay&DayEnd&" "&Right(Year(DateTime),4)
    Case "w,d m y H:I:S"
		DateSecond=Second(DateTime)
		If Len(DateHour)<2 Then DateHour="0"&DateHour
		If Len(DateSecond)<2 Then DateSecond="0"&DateSecond
        DateToStr=shortWeekday(DateWeek-1)&","&DateDay&" "& Left(Fullmonth(DateMonth-1),3) &" "&Right(Year(DateTime),4)&" "&DateHour&":"&DateMinute&":"&DateSecond&" "&TimeZone1
    Case "y-m-dTH:I:S"
		If Len(DateHour)<2 Then DateHour="0"&DateHour
		If Len(DateSecond)<2 Then DateSecond="0"&DateSecond
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay&"T"&DateHour&":"&DateMinute&":"&DateSecond&TimeZone2
	Case Else
		If Len(DateHour)<2 Then DateHour="0"&DateHour
		DateToStr=Year(DateTime)&"-"&DateMonth&"-"&DateDay&" "&DateHour&":"&DateMinute
	End Select
End Function

'==================================================================
'函数：FormatDT
'作者：Abo(wupwu@qq.com)
'日期：2008.09.07
'功能：日期时间格式化
'参数：DateTime,日期时间
'　　　Template,格式化模板
'返回：格式化后的字串
'备注：模板标签注释
'　　　{Y}:年
'　　　{y}:2位年
'　　　{M}:月
'　　　{m}:补位月，例：01,02
'　　　{ME}:英文月份
'　　　{Me}:英文月份缩写
'　　　{D}:日
'　　　{d}:补位日
'　　　{H}:时
'　　　{h}:补位时
'　　　{N}:分
'　　　{n}:补位分
'　　　{S}:秒
'　　　{s}:补位秒
'　　　{W}:星期几英文
'　　　{w}:星期几英文缩写
'修改记录：
'==================================================================

Function FormatDT(DateTime,Template)
    If (Not IsDate(DateTime)) or Template = "" Then
        FormatDT = Template
        Exit Function
    End If
    Dim dtmY,dtmM,dtmD,dtmH ,dtmN,dtmS,dtmW
    Dim arrFW,arrSW,arrFM,arrSM
    dtmY = Year(DateTime)
    dtmM = Month(DateTime)
    dtmD = Day(DateTime)
    dtmH  = Hour(DateTime)
    dtmN = Minute(DateTime)
    dtmS = Second(DateTime)
    dtmW = WeekDay(DateTime)
    arrFW = Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
    arrSW = Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")
    arrFM = Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
    arrSM = Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

    Template = Replace(Template,"{Y}",dtmY)
    Template = Replace(Template,"{y}",Right(dtmY,2))
    Template = Replace(Template,"{M}",dtmM)
    Template = Replace(Template,"{m}",Right("00"&dtmM,2))
    Template = Replace(Template,"{ME}",arrFM(dtmM-1))
    Template = Replace(Template,"{Me}",arrSM(dtmM-1))
    Template = Replace(Template,"{D}",dtmD)
    Template = Replace(Template,"{d}",Right("00"&dtmD,2))
    Template = Replace(Template,"{H}",dtmH )
    Template = Replace(Template,"{h}",Right("00"&dtmH ,2))
    Template = Replace(Template,"{N}",dtmN)
    Template = Replace(Template,"{n}",Right("00"&dtmN,2))
    Template = Replace(Template,"{S}",dtmS)
    Template = Replace(Template,"{s}",Right("00"&dtmS,2))
    Template = Replace(Template,"{W}",arrFW(dtmW-1))
    Template = Replace(Template,"{w}",arrSW(dtmW-1))
    FormatDT = Template
End Function
 '获得类似Js Date对象的valueOf效果
Function UDate(oldDate,TimeType) '字符型日期，时区
UDate=DateAdd("h",0-TimeType,oldDate)
UDate = DateDiff("s", "01/01/1970 00:00:00", UDate)
End Function

'反查 valueOf数据到Date格式

Function unUDate(intTimeStamp,TimeType) '整数型日期，时区
unUDate = DateAdd("s", intTimeStamp, "01/01/1970 00:00:00")
unUDate=DateAdd("h",TimeType,unUDate)
End Function

'日期格式化函数
'trDateTime = formatDate("%g:%i%a, %l %j%O %F, %Y", UDate(Now()))
'* %A - AM or PM
'* %a - am or pm
'* %m - Month with leading zeroes (01 - 12)
'* %n - Month without leading zeroes (1 - 12)
'* %F - Month name (January - December)
'* %M - Three letter month name (Jan - Dec)
'* $d - Day with leading zeroes (01 - 31)
'* %j - Day without leading zeroes (1 - 31)
'* %H - Hour with leading zeroes (12 hour)
'* %h - Hour with leading zeroes (24 hour)
'* %G - Hour without leading zeroes (12 hour)
'* %g - Hour without leading zeroes (24 hour)
'* %i - Minute with leading zeroes (01 to 60)
'* %I - Minute without leading zeroes (1 to 60)
'* %s - Second with leading zeroes (01 to 60)
'* %S - Second without leading zeroes (1 to 60)
'* %L - Number of day of week (1 to 7)
'* %l - Name of day of week (Sunday to Saturday)
'* %D - Three letter name of day of week (Sun to Sat)
'* %O - Ordinal suffix (st, nd rd, th)
'* %U - UNIX Timestamp
'* %Y - Four digit year (2003)
'* %y - Two digit year (03)

Function formatDate(format, intTimeStamp)
Dim unUDate, A
' Test to see if intTimeStamp looks valid. If not, they have passed a normal date
If Not (IsNumeric(intTimeStamp)) Then
	If IsDate(intTimeStamp) Then
		intTimeStamp = DateDiff("S", "01/01/1970 00:00:00", intTimeStamp)
	Else
		response.write "Date Invalid"
		Exit Function
	End If
End If

If (intTimeStamp=0) Then
	unUDate = Now()
Else
	unUDate = DateAdd("s", intTimeStamp, "01/01/1970 00:00:00")
End If

unUDate = Trim(unUDate)
Dim startM : startM = InStr(1, unUDate, "/", vbTextCompare) + 1
Dim startY : startY = InStr(startM, unUDate, "/", vbTextCompare) + 1
Dim startHour : startHour = InStr(startY, unUDate, " ", vbTextCompare) + 1
Dim startMin : startMin = InStr(startHour, unUDate, ":", vbTextCompare) + 1

Dim dateDay : dateDay = mid(unUDate, 1, 2)
Dim dateMonth : dateMonth = mid(unUDate, startM, 2)
Dim dateYear : dateYear = mid(unUDate, startY, 4)
Dim dateHour : dateHour = mid(unUDate, startHour, 2)
Dim dateMinute : dateMinute = mid(unUDate, startMin, 2)
Dim dateSecond : dateSecond = mid(unUDate, InStr(startMin, unUDate, ":", vbTextCompare) + 1, 2)

format = replace(format, "%Y", right(dateYear, 4))
format = replace(format, "%y", right(dateYear, 2))
format = replace(format, "%m", dateMonth)
format = replace(format, "%n", cint(dateMonth))
format = replace(format, "%F", monthname(cint(dateMonth)))
format = replace(format, "%M", left(monthname(cint(dateMonth)), 3))
format = replace(format, "%d", dateDay)
format = replace(format, "%j", cint(dateDay))
format = replace(format, "%h", mid(unUDate, startHour, 2))
format = replace(format, "%g", cint(mid(unUDate, startHour, 2)))

If (cint(dateHour) > 12) Then
	A = "PM"
Else
	A = "AM"
End If
format = replace(format, "%A", A)
format = replace(format, "%a", lcase(A))

If (A = "PM") Then format = replace(format, "%H", left("0" & dateHour - 12, 2))
format = replace(format, "%H", dateHour)
If (A = "PM") Then format = replace(format, "%G", left("0" & cint(dateHour) - 12, 2))
format = replace(format, "%G", cint(dateHour))
format = replace(format, "%i", dateMinute)
format = replace(format, "%I", cint(dateMinute))
format = replace(format, "%s", dateSecond)
format = replace(format, "%S", cint(dateSecond))
format = replace(format, "%L", WeekDay(unUDate))
format = replace(format, "%D", left(WeekDayName(WeekDay(unUDate)), 3))
format = replace(format, "%l", WeekDayName(WeekDay(unUDate)))
format = replace(format, "%U", intTimeStamp)
format = replace(format, "11%O", "11th")
format = replace(format, "1%O", "1st")
format = replace(format, "12%O", "12th")
format = replace(format, "2%O", "2nd")
format = replace(format, "13%O", "13th")
format = replace(format, "3%O", "3rd")
format = replace(format, "%O", "th")

formatDate = format
End Function

'*************************************
'分页函数
'*************************************
dim FirstShortCut,ShortCut
FirstShortCut=false
Function MultiPage(Numbers,Perpage,Curpage,Url_Add,aname,Style)
	CurPage=Int(Curpage)
	Numbers=Int(Numbers)
	Dim URL
	URL=Request.ServerVariables("Script_Name")&Url_Add
	MultiPage=""
	Dim Page,Offset,PageI
'	If Int(Numbers)>Int(PerPage) Then
		Page=9
		Offset=4
		Dim Pages,FromPage,ToPage
		If Numbers Mod Cint(Perpage)=0 Then
			Pages=Int(Numbers/Perpage)
		Else
			Pages=Int(Numbers/Perpage)+1
		End If
		FromPage=Curpage-Offset
		ToPage=Curpage+Page-Offset-1
		If Page>Pages Then
			FromPage=1
			ToPage=Pages
		Else
			If FromPage<1 Then
				Topage=Curpage+1-FromPage
				FromPage=1
				If (ToPage-FromPage)<Page And (ToPage-FromPage)<Pages Then ToPage=Page
			ElseIF Topage>Pages Then
				FromPage =Curpage-Pages +ToPage
				ToPage=Pages
				If (ToPage-FromPage)<Page And (ToPage-FromPage)<Pages Then FromPage=Pages-Page+1
			End If
		End If
		 MultiPage="<div class=""page"" style="""&Style&"""><ul>"
	   'if Curpage<>1 then MultiPage=MultiPage&"<li class=""PageL""><a href="""&Url&"page=1"" class=""PageLbutton"" title=""第一页""></a></li>"
		MultiPage=MultiPage&"<li class=""pageNumber"">"
		if Curpage<>1 then MultiPage=MultiPage&"<a href="""&Url&"page=1"" title=""第一页"" style=""text-decoration:none"">&lt;</a> | "
		if not FirstShortCut then ShortCut=" accesskey="",""" else ShortCut=""
		if Curpage<>1 then MultiPage=MultiPage&"<a href="""&Url&"page="&CurPage-1&""" title=""上一页"" style=""text-decoration:none;"""&ShortCut&"></a>"
		For PageI=FromPage TO ToPage
			If PageI<>CurPage Then
				MultiPage=MultiPage&"<a href="""&Url&"page="&PageI&aname&""">"&PageI&"</a> | "
			Else
				MultiPage=MultiPage&"<strong>"&PageI&"</strong>"
				if PageI<>Pages then MultiPage=MultiPage&" | "
			End If
		Next
		if not FirstShortCut then ShortCut=" accesskey="".""" else ShortCut=""
		if Curpage<>pages then MultiPage=MultiPage&"<a href="""&Url&"page="&CurPage+1&""" title=""下一页"" style=""text-decoration:none"""&ShortCut&"></a>"
		if Curpage<>pages then MultiPage=MultiPage&"<a href="""&Url&"page="&Pages&aname&""" title=""最后一页"" style=""text-decoration:none"">&gt;</a>"
		MultiPage=MultiPage&"</li>"
		'If Int(Pages)>Int(Page) Then
		'	MultiPage=MultiPage&"<li>...</li><li><a href="""&Url&"page="&Pages&aname&""">"&pages&"</a></li>"
		'End If
		'if Curpage<>pages then MultiPage=MultiPage&"<li class=""PageR""><a href="""&Url&"page="&Pages&aname&""" class=""PageRbutton"" title=""最后一页""></a></li>"
		MultiPage=MultiPage&"</ul></div>"
'	End If
FirstShortCut=true
End Function

'*************************************
'切割内容 - 按行分割
'*************************************
Function SplitLines(byVal Content,byVal ContentNums)
	Dim ts,i,l
	ContentNums=int(ContentNums)
	If IsNull(Content) Then Exit Function
	i=1
	ts = 0
	For i=1 to Len(Content)
      l=Lcase(Mid(Content,i,5))
      	If l="<br/>" Then
         	ts=ts+1
      	End If
      l=Lcase(Mid(Content,i,4))
      	If l="<br>" Then
         	ts=ts+1
      	End If
      l=Lcase(Mid(Content,i,3))
      	If l="<p>" Then
         	ts=ts+1
      	End If
	If ts>ContentNums Then Exit For
	Next
	If ts>ContentNums Then
    	Content=Left(Content,i-1)
	End If
	SplitLines=Content
End Function

'*************************************
'切割内容 - 按字符分割
'*************************************
Function CutStr(byVal Str,byVal StrLen)
	Dim l,t,c,i
	If IsNull(Str) Then CutStr="":Exit Function
	l=Len(str)
	StrLen=int(StrLen)
	t=0
	For i=1 To l
		c=Asc(Mid(str,i,1))
		If c<0 Or c>255 Then t=t+2 Else t=t+1
		IF t>=StrLen Then
			CutStr=left(Str,i)&"..."
			Exit For
		Else
			CutStr=Str
		End If
	Next
End Function

'*************************************
'Trackback Function
'*************************************
Function Trackback(trackback_url, url, title, excerpt, blog_name)
	Dim query_string, objXMLHTTP

	query_string = "title="&cutStr(Server.URLEncode(title),100)&"&url="&Server.URLEncode(url)&"&blog_name="&Server.URLEncode(blog_name)&"&excerpt="&cutStr(Server.URLEncode(excerpt), 252)
	Set objXMLHTTP = Server.CreateObject(getXMLHTTP)

	objXMLHTTP.Open "POST", trackback_url, false
	objXMLHTTP.setRequestHeader "Content-Type","application/x-www-Form-urlencoded"

	'HAndling timeout
	On Error Resume Next
	objXMLHTTP.Send query_string
    err.clear

	Set objXMLHTTP = Nothing
End Function


'*************************************
'删除引用标签
'*************************************
Function DelQuote(strContent)
	If IsNull(strContent) Then Exit Function
	Dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	re.Pattern="\[quote\](.[^\]]*?)\[\/quote\]"
	strContent= re.Replace(strContent,"")
	re.Pattern="\[quote=(.[^\]]*)\](.[^\]]*?)\[\/quote\]"
	strContent= re.Replace(strContent,"")
	Set re=Nothing
	DelQuote=strContent
End Function

'*************************************
'获取客户端IP
'*************************************
function getIP()
		 dim strIP,IP_Ary,strIP_list
		 strIP_list=Replace(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),"'","")

		 If InStr(strIP_list,",")<>0 Then
			IP_Ary = Split(strIP_list,",")
			strIP = IP_Ary(0)
		 Else
			strIP = strIP_list
		 End IF

		 If strIP=Empty Then strIP=Replace(Request.ServerVariables("REMOTE_ADDR"),"'","")
		 getIP=strIP
End Function


'*************************************
'获取客户端浏览器信息
'*************************************
function getBrowser(strUA)
	dim arrInfo,strType,temp1,temp2
	strType=""
	strUA=LCase(strUA)
	arrInfo=Array("Unkown","Unkown")
	'浏览器判断
'	Response.Write(strUA)
'	Response.End()
    if Instr(strUA,"mozilla")>0 then arrInfo(0)="Mozilla"
    if Instr(strUA,"icab")>0 then arrInfo(0)="iCab"
    if Instr(strUA,"lynx")>0 then arrInfo(0)="Lynx"
    if Instr(strUA,"links")>0 then arrInfo(0)="Links"
    if Instr(strUA,"elinks")>0 then arrInfo(0)="ELinks"
    if Instr(strUA,"jbrowser")>0 then arrInfo(0)="JBrowser"
    if Instr(strUA,"konqueror")>0 then arrInfo(0)="konqueror"
    if Instr(strUA,"wget")>0 then arrInfo(0)="wget"
    if Instr(strUA,"ask jeeves")>0 or Instr(strUA,"teoma")>0 then arrInfo(0)="Ask Jeeves/Teoma"
    if Instr(strUA,"wget")>0 then arrInfo(0)="wget"

	If Instr(strUA,"opera")>0 Then
	temp=Mid(strUA,(Instr(strUA,"version")+8),6)
    arrInfo(0)="opera["&temp&"]"
	End If

    if Instr(strUA,"gecko")>0 then
      strType="[Gecko]"
      arrInfo(0)="Mozilla"
      if Instr(strUA,"aol")>0 then arrInfo(0)="AOL"
      if Instr(strUA,"netscape")>0 then arrInfo(0)="Netscape"
      if Instr(strUA,"chimera")>0 then arrInfo(0)="Chimera"
      if Instr(strUA,"camino")>0 then arrInfo(0)="Camino"
      if Instr(strUA,"galeon")>0 then arrInfo(0)="Galeon"
      if Instr(strUA,"k-meleon")>0 then arrInfo(0)="K-Meleon"
		if Instr(strUA,"firefox")>0 Then
		arrInfo(0)="FireFox"
		temp=Mid(strUA,(Instr(strUA,"firefox")+8),5)
		End If
      arrInfo(0)=arrInfo(0)+strType&"["&temp&"]"
   end if

   if Instr(strUA,"bot")>0 or Instr(strUA,"crawl")>0 then
      strType="[Bot/Crawler]"
      arrInfo(0)=""
      if Instr(strUA,"grub")>0 then arrInfo(0)="Grub"
      if Instr(strUA,"googlebot")>0 then arrInfo(0)="GoogleBot"
      if Instr(strUA,"msnbot")>0 then arrInfo(0)="MSN Bot"
      if Instr(strUA,"slurp")>0 then arrInfo(0)="Yahoo! Slurp"
      arrInfo(0)=arrInfo(0)+strType
  end if

  if Instr(strUA,"applewebkit")>0 then
      strType="[webkit]"
      arrInfo(0)=""
      if Instr(strUA,"omniweb")>0 then arrInfo(0)="OmniWeb"
      if Instr(strUA,"safari")>0 Then
      arrInfo(0)="Safari"
	  temp=Mid(strUA,(Instr(strUA,"version")+8),5)
	  End If
	  if Instr(strUA,"chrome")>0 Then
	  arrInfo(0)="Chrome"
	  temp=Mid(strUA,(Instr(strUA,"chrome")+7),9)
	  End If

      arrInfo(0)=arrInfo(0)+strType&"["&temp&"]"
  end if

  if Instr(strUA,"msie")>0 then
      strType="[MSIE"
      temp1=mid(strUA,(Instr(strUA,"msie")+4),6)
      temp2=Instr(temp1,";")
      temp1=left(temp1,temp2-1)
      strType=strType & temp1 &"]"
      arrInfo(0)="Internet Explorer"
      if Instr(strUA,"msn")>0 then arrInfo(0)="MSN"
      if Instr(strUA,"aol")>0 then arrInfo(0)="AOL"
      if Instr(strUA,"webtv")>0 then arrInfo(0)="WebTV"
      if Instr(strUA,"myie2")>0 then arrInfo(0)="MyIE2"
      if Instr(strUA,"maxthon")>0 then arrInfo(0)="Maxthon"
      if Instr(strUA,"gosurf")>0 then arrInfo(0)="GoSurf"
      if Instr(strUA,"netcaptor")>0 then arrInfo(0)="NetCaptor"
      if Instr(strUA,"sleipnir")>0 then arrInfo(0)="Sleipnir"
      if Instr(strUA,"avant browser")>0 then arrInfo(0)="AvantBrowser"
      if Instr(strUA,"greenbrowser")>0 then arrInfo(0)="GreenBrowser"
      if Instr(strUA,"slimbrowser")>0 then arrInfo(0)="SlimBrowser"
      arrInfo(0)=arrInfo(0)+strType
   end if

 '操作系统判断
    if Instr(strUA,"windows")>0 then arrInfo(1)="Windows"
    if Instr(strUA,"windows ce")>0 then arrInfo(1)="Windows CE"
    if Instr(strUA,"windows 95")>0 then arrInfo(1)="Windows 95"
    if Instr(strUA,"win98")>0 then arrInfo(1)="Windows 98"
    if Instr(strUA,"windows 98")>0 then arrInfo(1)="Windows 98"
    if Instr(strUA,"windows 2000")>0 then arrInfo(1)="Windows 2000"
    if Instr(strUA,"windows xp")>0 then arrInfo(1)="Windows XP"

    if Instr(strUA,"windows nt")>0 then
      arrInfo(1)="Windows NT"
      if Instr(strUA,"windows nt 5.0")>0 then arrInfo(1)="Windows 2000"
      if Instr(strUA,"windows nt 5.1")>0 then arrInfo(1)="Windows XP"
      if Instr(strUA,"windows nt 5.2")>0 then arrInfo(1)="Windows 2003"
	  if Instr(strUA,"windows nt 6.0")>0 then arrInfo(1)="Windows Vista"
	  if Instr(strUA,"windows nt 6.1")>0 then arrInfo(1)="Windows 7"
    end if
    if Instr(strUA,"x11")>0 or Instr(strUA,"unix")>0 then arrInfo(1)="Unix"
    if Instr(strUA,"sunos")>0 or Instr(strUA,"sun os")>0 then arrInfo(1)="SUN OS"
    if Instr(strUA,"powerpc")>0 or Instr(strUA,"ppc")>0 then arrInfo(1)="PowerPC"
    if Instr(strUA,"macintosh")>0 then arrInfo(1)="Mac"
    if Instr(strUA,"mac osx")>0 then arrInfo(1)="MacOSX"
    if Instr(strUA,"freebsd")>0 then arrInfo(1)="FreeBSD"
    if Instr(strUA,"linux")>0 then arrInfo(1)="Linux"
    if Instr(strUA,"palmsource")>0 or Instr(strUA,"palmos")>0 then arrInfo(1)="PalmOS"
    if Instr(strUA,"wap ")>0 then arrInfo(1)="WAP"

 'arrInfo(0)=strUA
 getBrowser=arrInfo
end function

'*************************************
'计算随机数
'*************************************
Function randomStr(intLength)
    dim strSeed,seedLength,pos,str,i
    strSeed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
    seedLength=len(strSeed)
    str=""
    Randomize
    for i=1 to intLength
     str=str+mid(strSeed,int(seedLength*rnd)+1,1)
    next
    randomStr=str
End Function

'*************************************
'自动闭合UBB
'*************************************
function closeUBB(strContent)
  dim arrTags,i,OpenPos,ClosePos,re,strMatchs,j,Match
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
    arrTags=array("code","quote","list","color","align","font","size","b","i","u","html")
  for i=0 to ubound(arrTags)
   OpenPos=0
   ClosePos=0

   re.Pattern="\["+arrTags(i)+"(=[^\[\]]+|)\]"
   Set strMatchs=re.Execute(strContent)
   For Each Match in strMatchs
    OpenPos=OpenPos+1
   next
   re.Pattern="\[/"+arrTags(i)+"\]"
   Set strMatchs=re.Execute(strContent)
   For Each Match in strMatchs
    ClosePos=ClosePos+1
   next
   for j=1 to OpenPos-ClosePos
      strContent=strContent+"[/"+arrTags(i)+"]"
   next
  next
closeUBB=strContent
end function

'*************************************
'自动闭合HTML
'*************************************
function closeHTML(strContent)
  dim arrTags,i,OpenPos,ClosePos,re,strMatchs,j,Match
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
    arrTags=array("p","div","span","table","ul","font","b","u","i","h1","h2","h3","h4","h5","h6")
  for i=0 to ubound(arrTags)
   OpenPos=0
   ClosePos=0

   re.Pattern="\<"+arrTags(i)+"( [^\<\>]+|)\>"
   Set strMatchs=re.Execute(strContent)
   For Each Match in strMatchs
    OpenPos=OpenPos+1
   next
   re.Pattern="\</"+arrTags(i)+"\>"
   Set strMatchs=re.Execute(strContent)
   For Each Match in strMatchs
    ClosePos=ClosePos+1
   next
   for j=1 to OpenPos-ClosePos
      strContent=strContent+"</"+arrTags(i)+">"
   next
  next
closeHTML=strContent
end function

'*************************************
'读取文件
'*************************************
Function LoadFromFile(ByVal File)
    Dim objStream
    Dim RText
    RText=array(0,"")
    On Error Resume Next
    Set objStream = Server.CreateObject("ADODB.Stream")
    If Err Then
        RText=array(Err.Number,Err.Description)
        LoadFromFile=RText
        Err.Clear
        exit function
    End If
    With objStream
        .Type = 2
        .Mode = 3
        .Open
        .Charset = "utf-8"
        .Position = objStream.Size
        .LoadFromFile Server.MapPath(File)
        If Err.Number<>0 Then
	       RText=array(Err.Number,Err.Description)
		   LoadFromFile=RText
           Err.Clear
	       exit function
        End If
        RText=array(0,.ReadText)
        .Close
    End With
    LoadFromFile=RText
    Set objStream = Nothing
End Function

'*************************************
'保存文件
'*************************************
Function SaveToFile(ByVal strBody,ByVal File)
    Dim objStream
    Dim RText
    RText=array(0,"")
    On Error Resume Next
    Set objStream = Server.CreateObject("ADODB.Stream")
    If Err Then
        RText=array(Err.Number,Err.Description)
        Err.Clear
        exit function
    End If
    With objStream
        .Type = 2
        .Open
        .Charset = "utf-8"
        .Position = objStream.Size
        .WriteText = strBody
        .SaveToFile Server.MapPath(File),2
        .Close
    End With
    RText=array(0,"保存文件成功!")
    SaveToFile=RText
    Set objStream = Nothing
End Function

'*************************************
'数据库添加修改操作
'*************************************
Function DBQuest(table,DBArray,Action)
	dim AddCount,TempDB,i,v
	if Action<>"insert" or Action<>"update" then Action="insert"
	if Action="insert" then v=2 else v=3
	if not IsArray(DBArray) then
	DBQuest=-1
	exit function
	else
	Set TempDB=Server.CreateObject("ADODB.RecordSet")
	On Error Resume Next
	TempDB.Open table,Conn,1,v
	if err then
	DBQuest=-2
	exit function
	end if
	if Action="insert" then TempDB.addNew
	AddCount=UBound(DBArray,1)
	for i=0 to AddCount
	TempDB(DBArray(i)(0))=DBArray(i)(1)
	next
	TempDB.update
	TempDB.close
	set TempDB=nothing
	DBQuest=0
	end if
end Function

'*************************************
'检测系统组件是否安装
'*************************************
Function CheckObjInstalled(strClassString)
	On Error Resume Next
	Dim Temp
	Err = 0
	Dim TmpObj
	Set TmpObj = Server.CreateObject(strClassString)
	Temp = Err
	IF Temp = 0 OR Temp = -2147221477 Then
		CheckObjInstalled=true
	ElseIF Temp = 1 OR Temp = -2147221005 Then
		CheckObjInstalled=false
	End IF
	Err.Clear
	Set TmpObj = Nothing
	Err = 0
End Function

'*************************************
'检查插件是否成功安装
'*************************************
Function Checkplugins
   Dim PlugS,Plug,PlugItem
   Checkplugins=-1
    PlugS=Split(function_Plugin,"$*$")
    For Each Plug In PlugS
      PlugItem = Split(Plug,"%|%")
      If Getplugins=PlugItem(0) Then
        Checkplugins=PlugItem
        Exit Function
      End If
    Next
End Function


'*************************************
'垃圾关键字过滤
'*************************************
Function filterSpam(str,path)
  On Error Resume Next
	 filterSpam = False
     Dim spamXml,spamItem
     Set spamXml = Server.CreateObject(getXMLDOM)
       If Err Then
	       Err.clear
	       Exit Function
       End If
     spamXml.async = False
     spamXml.load(Server.MapPath(path))
     If spamXml.parseerror.errorcode=0 Then
       For Each spamItem In spamXml.selectNodes("//key")
       		If InStr(Lcase(str),Lcase(spamItem.text))<>0 Then
       		   filterSpam = True
       		   Exit Function
       		End If
       Next
     End If
     Set spamXml=Nothing
End Function

'*************************************
'生成XML头
'*************************************
Sub xmlheadResponse(coding)
If coding="" Then coding="GB2312"
Response.Buffer =True
Response.Charset = coding
Response.ContentType="text/xml"
Response.Expires=0
Response.ExpiresAbsolute =Now()
Response.CacheControl="no cache"
Response.Write("<?xml version=""1.0"" encoding="""&coding&"""?>")
End Sub

Sub xmlheadResponse_show()
Response.Buffer =True
Response.Charset = "utf-8"
Response.ContentType="text/xml"
Response.Expires=0
Response.ExpiresAbsolute =Now()
Response.CacheControl="no cache"

End Sub

'*************************************
'生成json头
'*************************************
Sub jsonheadResponse()
Response.Buffer =True
Response.Charset = "utf-8"
Response.ContentType="application/json"
Response.Expires=0
Response.ExpiresAbsolute =Now()
Response.CacheControl="no cache"
End Sub

'*************************************
'安全请求函数
'*************************************
Function SafeRequest(ParaName,ParaType)
       Dim ParaValue
       ParaValue=Request.QueryString(ParaName)
       If ParaType=1 Then
              If Not IsNumeric(ParaValue) Then
                     Response.write "<center>参数" & ParaName & "必须为数字型，请正确操作！</center>"
                     Response.End()
              End If
              ParaValue=CLng(Replace(ParaValue,"'","''"))
       Else
              ParaValue=Replace(ParaValue,"'","''")
       End if
       SafeRequest=ParaValue
End Function
'*************************************
'简单的读取数据库字段函数 connname=数据库名，top_num=记录数量，tablename=表名，fieldname=字段名，tiaojian=条件,order_value=排序
'*************************************
Function table_readdate(connname,top_num,tablename,fieldname,tiaojian,order_value)
Dim SQL,temprs
If Not IsObject(connname) Then Exit Function
If tiaojian="" Then
SQL="Select "&top_num&" "&fieldname&" From ["&tablename&"] "&order_value&""
Else
SQL="Select "&top_num&" "&fieldname&" From ["&tablename&"] where "&tiaojian&" "&order_value&""
End If
Set temprs=connname.execute(SQL)
If temprs.EOF Or temprs.BOF Then
	'ReDim table_readdate(0,0)
	table_readdate=Empty 'IIS7 不允许ReDim了，可以用IsEmpyt()判断
Else
	table_readdate=temprs.getrows()
End If
temprs.close:Set temprs=Nothing
End Function

'*************************************
'验证数组是否为空 空则为-1 非空则为0 & >
'*************************************
Function ArrayisEmpty(data_temp)
	Err.clear
	If IsEmpty(data_temp) Then
	ArrayisEmpty=-1
	Else
	ArrayisEmpty=UBound(data_temp,2)
	End If
End Function

'*************************************
'组织表格json数据
'*************************************
Function show_json(show_name,show_json_data)
Dim json_name,for_num
json_name=Split(show_name,",")
Set jsonTemp1=new Aien_Json
jsonTemp1.JsonType="array"

If UBound(show_json_data)>UBound(json_name) Then
	for_num=UBound(json_name)
Else
	for_num=UBound(show_json_data)
End If

For j=0 To UBound(show_json_data,2)
	Set json_temp=new Aien_Json
	json_temp.JsonType="object"
	For i=0 To for_num
		json_temp.addData json_name(i),show_json_data(i,j)
	Next
	jsonTemp1.addData j,json_temp
	Set json_temp=Nothing
Next

Set show_json=jsonTemp1
Set jsonTemp1=Nothing
End Function
'*************************************
'组织表格json数据
'*************************************
Sub show_err_json(err_words)
	Set json=new Aien_Json
	json.JsonType="object"
	json.addData "err",err_words 'err数据
	Call jsonheadResponse()
	Response.Write(json.getJson(json))
	Set json=Nothing
End Sub
'*************************************
'简单的获取记录数的方法 connname=数据库名，tablename=表名，fieldname=字段名
'*************************************
Function table_recordcount(connname,tablename,fieldname,tiaojian)
	Dim conn_temp,table_num
	Set conn_temp = Server.CreateObject("ADODB.RecordSet")
	If tiaojian="" Then
	conn_temp.open("select "&fieldname&" from "&tablename&""),connname,1,1
	Else
	conn_temp.open("select "&fieldname&" from "&tablename&" where "&tiaojian&""),connname,1,1
	End If
	table_num=conn_temp.recordcount
	conn_temp.close:Set conn_temp=Nothing
	table_recordcount=table_num
End Function

'*************************************
'错误显示
'*************************************
Sub ErrCodShow()
If Err.Number<>0 Then
Response.Clear
Response.Write("错误 Number："&Err.Number&"<br/>")
Response.Write("错误信息："&Err.Description&"<br/>")
Response.Write("出错文件："&Err.Source&"<br/>")
Response.End()
End If
End Sub

'*************************************
'getForm
'*************************************
Function getForm(element,ftype)
	Select case ftype
		Case "get"
			getForm=trim(request.QueryString(element))
		Case "post"
			getForm=trim(request.Form(element))
		Case "both"
			If isNul(request.QueryString(element)) then getForm=trim(request.Form(element)) else getForm=trim(request.QueryString(element))
	End Select
End Function

'//--------------- mvc调用Class ---------------
Function newClass(ClassName,DirPath)
	Set v_S=New JaspStream
	With(v_S)
		Dim v_Con : v_Con=.LoadFile(DirPath + Trim(ClassName) + ".Class")
		If(v_Con="error") Then
			Response.Write("Get class file err!")
			Response.End()
		End If
		On Error Resume Next
		Execute(v_Con)
		If Err Then
			Response.Write("<meta http-equiv='Content-Type' content='text/html;' charset='utf-8' />")
			Response.Write("Next is codeEditer Err Info:")
			Response.Write("<br />")
			Response.Write("Err Files From: '"+DirPath + Trim(ClassName) + ".Class'")
			Response.Write("<br />")
			Response.Write("Err.Number: "&Err)
			Response.Write("<br />")
			Response.Write("Err.Info: "+Err.Description)
			Response.Write("<br />")
			Response.Write("Err.File: "+Err.Source)
			Response.Write("<br />")
			Response.Write("Err.Line: "+Err.Line)
			Response.End()
		End If
		Err.clear
		On Error goto 0
	End With
	Set v_S=Nothing
	Execute("Set newClass = New " + ClassName)
End Function
%>
<script Language="JScript" runat="server">
//*************************************
//检测系统组件是否安装
//*************************************
	function CheckObjInstalled(strClassString){
		try{
			var TmpObj = Server.CreateObject(strClassString);
			return true;
		}catch(e){
			return false;
		}
	}

//*************************************
//判断服务器Microsoft.XMLDOM
//*************************************
	function getXMLDOM(){
		var xmldomversions = ['Microsoft.XMLDOM','MSXML2.DOMDocument','MSXML2.DOMDocument.3.0','MSXML2.DOMDocument.4.0','MSXML2.DOMDocument.5.0'];
		for (var i=0;i<xmldomversions.length;i++){
			try{
				var sc = Server.CreateObject(xmldomversions[i]);
				sc = null;
				return xmldomversions[i];
			}catch(e){}
		}
		return false;
	}

//*************************************
//判断服务器MSXML2.ServerXMLHTTP
//*************************************
	function getXMLHTTP(){
		var xmlhttpversions = ['Microsoft.XMLHTTP', 'MSXML2.XMLHTTP', 'MSXML2.XMLHTTP.3.0','MSXML2.XMLHTTP.4.0','MSXML2.XMLHTTP.5.0'];
		for (var i=0;i<xmlhttpversions.length;i++){
			try{
				var st = Server.CreateObject(xmlhttpversions[i]);
				st = null;
				return xmlhttpversions[i];
			}catch(e){}
		}
		return false;
	}
//删除页面请求参数
function delQUERY(itemid) {
	var httpRequest=String(Request.ServerVariables("QUERY_STRING")).split("&");
	httpRequest.splice(itemid,1);
	return httpRequest.join("&")

}
</script>