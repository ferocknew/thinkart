<!--#include file="mdb.asp"--> 
<%
Response.Expires = -1  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
DIm Objfso
Objfso = "Scripting.FileSystemObject"
Call Compact
Sub Compact
  Response.Write CompactDB(Server.Mappath(sjmp5_mdb),false)
End Sub
Function CompactDB(dbPath, boolIs97)
 On Error Resume Next
 Dim fso, Engine, strDBPath,JET_3X
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
%>
