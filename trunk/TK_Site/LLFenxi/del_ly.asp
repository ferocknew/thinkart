

<!--#include file="config.asp"-->
<%
if session("sjmp5_admin") = "" and session("sjmp5_flag") = "" then
Response.redirect "login.asp"    
end if   
%>
<%if trim(request("action"))="edit" then
response.write "<a href=?action=del>ɾ����Դ��¼</a>  | <a href=?action=del_lyhtml>�����Դҳ������</a>| <a href=?action=del_ip>���IP���ݿ�</a>| <a href=?action=del_mdb>��ʼ�����ݿ�</a> | <a href=index.asp>������ҳ</a>"
end if


if trim(request("action"))="del_ip" then
response.write "ȷ�����IP��¼��"
response.write "<a href=?action=del_ip_ser>ȷ��</a> |   <a href=index.asp>������ҳ</a>"
end if






if trim(request("action"))="del" then
response.write "ȷ��ɾ����¼�𣿽������[��Դ��¼]!!!"
response.write "<a href=?action=del_jl>ȷ��</a> |   <a href=index.asp>������ҳ</a>"
end if

if trim(request("action"))="del_lyhtml" then
response.write "ȷ����� ��Դҳ������ ��"
response.write "<a href=?action=del_lyhtml_ser>ȷ��</a> |   <a href=index.asp>������ҳ</a>"
end if

if trim(request("action"))="del_mdb" then
response.write "ȷ����ʼ�����ݿ��𣿽��������������!!!"
response.write "<a href=?action=del_setup>ȷ��</a> |   <a href=index.asp>������ҳ</a>"
end if

if trim(request("action"))="del_lyhtml_ser" then
exec="delete * from sjmp5_lyhtml"
conn2.execute(exec)
exec="delete * from sjmp5_html"
conn2.execute(exec)
exec="delete * from sjmp5_url"
conn2.execute(exec)
conn2.close
response.write "ɾ���ɹ���"
response.write "��ʼ���ɹ���"
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
'=====================ѹ�����ݿ�====����:fokid=====================
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
  Response.Write "ѹ���ɹ�!"
 Else
  Response.Write "<a href=sjmp5_ysmdb.asp>ѹ��ʧ��!����һ��!</a>"
 End If
End Function
response.write "<a href=index.asp>������ҳ</a>"
end if


if trim(request("action"))="del_ip_ser" then
exec="delete * from sjmp5_ip"
conn2.execute(exec)
exec="delete * from sjmp5_ip_total"
conn2.execute(exec)
conn2.close
response.write "ɾ���ɹ���"
response.write "��ʼ���ɹ���"
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
'=====================ѹ�����ݿ�====����:fokid=====================
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
  Response.Write "ѹ���ɹ�!"
 Else
  Response.Write "<a href=sjmp5_ysmdb.asp>ѹ��ʧ��!����һ��!</a>"
 End If
End Function
response.write "<a href=index.asp>������ҳ</a>"
end if




if trim(request("action"))="del_jl" then
exec="delete * from sjmp5_jl"
conn2.execute(exec)
conn2.close
response.write "ɾ���ɹ���"
response.write "��ʼ���ɹ���"
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
'=====================ѹ�����ݿ�====����:fokid=====================
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
  Response.Write "ѹ���ɹ�!"
 Else
  Response.Write "<a href=sjmp5_ysmdb.asp>ѹ��ʧ��!����һ��!</a>"
 End If
End Function
response.write "<a href=index.asp>������ҳ</a>"
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
response.write "��ʼ���ɹ���"
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
'=====================ѹ�����ݿ�====����:fokid=====================
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
  Response.Write "ѹ���ɹ�!"
 Else
  Response.Write "<a href=sjmp5_ysmdb.asp>ѹ��ʧ��!����һ��!</a>"
 End If
End Function
response.write "�����»�ȡͳ�ƴ���! <a href=index.asp>������ҳ</a>"
end if
%>