

<!--#include file="config.asp"-->
<%
if session("sjmp5_admin") = "" and session("sjmp5_flag") = "" then
Response.redirect "login.asp"    
end if   
%>
<%if trim(request("action"))="edit" then
response.write "<a href=?action=del>删除来源记录</a>  | <a href=?action=del_lyhtml>清空来源页面排名</a>| <a href=?action=del_ip>清空IP数据库</a>| <a href=?action=del_mdb>初始化数据库</a> | <a href=index.asp>返回首页</a>"
end if


if trim(request("action"))="del_ip" then
response.write "确定清空IP记录吗？"
response.write "<a href=?action=del_ip_ser>确定</a> |   <a href=index.asp>返回首页</a>"
end if






if trim(request("action"))="del" then
response.write "确定删除记录吗？将会清空[来源记录]!!!"
response.write "<a href=?action=del_jl>确定</a> |   <a href=index.asp>返回首页</a>"
end if

if trim(request("action"))="del_lyhtml" then
response.write "确定清空 来源页面排名 吗？"
response.write "<a href=?action=del_lyhtml_ser>确定</a> |   <a href=index.asp>返回首页</a>"
end if

if trim(request("action"))="del_mdb" then
response.write "确定初始化数据库吗？将会清空所有数据!!!"
response.write "<a href=?action=del_setup>确定</a> |   <a href=index.asp>返回首页</a>"
end if

if trim(request("action"))="del_lyhtml_ser" then
exec="delete * from sjmp5_lyhtml"
conn2.execute(exec)
exec="delete * from sjmp5_html"
conn2.execute(exec)
exec="delete * from sjmp5_url"
conn2.execute(exec)
conn2.close
response.write "删除成功！"
response.write "初始化成功！"
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
'=====================压缩数据库====作者:fokid=====================
Function CompactDB(dbPath, boolIs97)
 On Error Resume Next
' Dim fso, Engine, strDBPath,JET_3X
 strDBPath = left(dbPath,instrrev(DBPath,"\"))
 Set fso = CreateObject(Objfso)
 If Err Then
    Err.Clear
    CompactDB = Lang.item("g_110") & vbCrLf
    Exit Function
 End If
 If fso.FileExists(dbPath) Then
    fso.CopyFile dbpath,strDBPath & "temp.mdb"
    Set Engine = CreateObject("JRO.JetEngine")

    If boolIs97 = "True" Then
    Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;" _
   & "Jet OLEDB:Engine Type=" & JET_3X
  Else
   Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb"
  End If
  fso.CopyFile strDBPath & "temp1.mdb",dbpath
  fso.DeleteFile(strDBPath & "temp.mdb")
  fso.DeleteFile(strDBPath & "temp1.mdb")
  Set fso = Nothing
  Set Engine = Nothing
  Response.Write "压缩成功!"
 Else
  Response.Write "<a href=sjmp5_ysmdb.asp>压缩失败!再来一次!</a>"
 End If
End Function
response.write "<a href=index.asp>返回首页</a>"
end if


if trim(request("action"))="del_ip_ser" then
exec="delete * from sjmp5_ip"
conn2.execute(exec)
exec="delete * from sjmp5_ip_total"
conn2.execute(exec)
conn2.close
response.write "删除成功！"
response.write "初始化成功！"
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
'=====================压缩数据库====作者:fokid=====================
Function CompactDB(dbPath, boolIs97)
 On Error Resume Next
' Dim fso, Engine, strDBPath,JET_3X
 strDBPath = left(dbPath,instrrev(DBPath,"\"))
 Set fso = CreateObject(Objfso)
 If Err Then
    Err.Clear
    CompactDB = Lang.item("g_110") & vbCrLf
    Exit Function
 End If
 If fso.FileExists(dbPath) Then
    fso.CopyFile dbpath,strDBPath & "temp.mdb"
    Set Engine = CreateObject("JRO.JetEngine")

    If boolIs97 = "True" Then
    Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;" _
   & "Jet OLEDB:Engine Type=" & JET_3X
  Else
   Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb"
  End If
  fso.CopyFile strDBPath & "temp1.mdb",dbpath
  fso.DeleteFile(strDBPath & "temp.mdb")
  fso.DeleteFile(strDBPath & "temp1.mdb")
  Set fso = Nothing
  Set Engine = Nothing
  Response.Write "压缩成功!"
 Else
  Response.Write "<a href=sjmp5_ysmdb.asp>压缩失败!再来一次!</a>"
 End If
End Function
response.write "<a href=index.asp>返回首页</a>"
end if




if trim(request("action"))="del_jl" then
exec="delete * from sjmp5_jl"
conn2.execute(exec)
conn2.close
response.write "删除成功！"
response.write "初始化成功！"
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
'=====================压缩数据库====作者:fokid=====================
Function CompactDB(dbPath, boolIs97)
 On Error Resume Next
' Dim fso, Engine, strDBPath,JET_3X
 strDBPath = left(dbPath,instrrev(DBPath,"\"))
 Set fso = CreateObject(Objfso)
 If Err Then
    Err.Clear
    CompactDB = Lang.item("g_110") & vbCrLf
    Exit Function
 End If
 If fso.FileExists(dbPath) Then
    fso.CopyFile dbpath,strDBPath & "temp.mdb"
    Set Engine = CreateObject("JRO.JetEngine")

    If boolIs97 = "True" Then
    Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;" _
   & "Jet OLEDB:Engine Type=" & JET_3X
  Else
   Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb"
  End If
  fso.CopyFile strDBPath & "temp1.mdb",dbpath
  fso.DeleteFile(strDBPath & "temp.mdb")
  fso.DeleteFile(strDBPath & "temp1.mdb")
  Set fso = Nothing
  Set Engine = Nothing
  Response.Write "压缩成功!"
 Else
  Response.Write "<a href=sjmp5_ysmdb.asp>压缩失败!再来一次!</a>"
 End If
End Function
response.write "<a href=index.asp>返回首页</a>"
end if
if trim(request("action"))="del_setup" then
exec="delete * from sjmp5_JL"
conn2.execute(exec)
exec="delete * from sjmp5_URL"
conn2.execute(exec)
exec="delete * from sjmp5_IP"
conn2.execute(exec)
exec="delete * from sjmp5_ip_total"
conn2.execute(exec)
exec="delete * from sjmp5_lyhtml"
conn2.execute(exec)
exec="delete * from sjmp5_html"
conn2.execute(exec)
exec="delete * from sjmp5_keyword"
conn2.execute(exec)
exec="delete * from sjmp5_keyword_total"
conn2.execute(exec)
exec="delete * from sjmp5_member"
conn2.execute(exec)
exec="delete * from sjmp5_config"
conn2.execute(exec)
conn2.close
response.write "初始化成功！"
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
'=====================压缩数据库====作者:fokid=====================
Function CompactDB(dbPath, boolIs97)
 On Error Resume Next
' Dim fso, Engine, strDBPath,JET_3X
 strDBPath = left(dbPath,instrrev(DBPath,"\"))
 Set fso = CreateObject(Objfso)
 If Err Then
    Err.Clear
    CompactDB = Lang.item("g_110") & vbCrLf
    Exit Function
 End If
 If fso.FileExists(dbPath) Then
    fso.CopyFile dbpath,strDBPath & "temp.mdb"
    Set Engine = CreateObject("JRO.JetEngine")

    If boolIs97 = "True" Then
    Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;" _
   & "Jet OLEDB:Engine Type=" & JET_3X
  Else
   Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb"
  End If
  fso.CopyFile strDBPath & "temp1.mdb",dbpath
  fso.DeleteFile(strDBPath & "temp.mdb")
  fso.DeleteFile(strDBPath & "temp1.mdb")
  Set fso = Nothing
  Set Engine = Nothing
  Response.Write "压缩成功!"
 Else
  Response.Write "<a href=sjmp5_ysmdb.asp>压缩失败!再来一次!</a>"
 End If
End Function
response.write "请重新获取统计代码! <a href=index.asp>返回首页</a>"
end if
%>