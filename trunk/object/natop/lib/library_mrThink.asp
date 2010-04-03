<%
'mrThink专用库
'------------------------- 施放网站缓存 -------------------------
Function FreeApplicationMemory
    On Error Resume Next
    Dim Thing,i
    i=0
    For Each Thing In Application.Contents
    	
        If Left(Thing, Len(CookieName)) = CookieName Then
       		i=i+1            
            If IsObject(Application.Contents(Thing)) Then
                Application.Contents(Thing).Close
                Set Application.Contents(Thing) = Nothing
                Application.Contents.Remove(Thing)
            ElseIf IsArray(Application.Contents(Thing)) Then
                Set Application.Contents(Thing) = Nothing
                Application.Contents.Remove(Thing)
            Else
                Application.Contents.Remove(Thing)
            End If
        End If
        
    Next
End Function
'------------------------- End Function -------------------------

'------------------------- 更新缓存信息 -------------------------
Function FreeMemory
    Call reloadcache
End Function
'------------------------- 施放网站缓存 -------------------------
%>