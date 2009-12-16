<%
'mrThink专用库
'------------------------- 施放网站缓存 -------------------------
Function FreeApplicationMemory
    On Error Resume Next
    Response.Write "释放网站缓存数据列表：<div style='padding:5px 5px 5px 10px;'>"
    Dim Thing,i
    i=0
    For Each Thing In Application.Contents
    	
        If Left(Thing, Len(CookieName)) = CookieName Then
       		i=i+1
        	if i<30 then
            	Response.Write "<span style='color:#666'>" & thing & "</span><br/>"
            elseif i<31 then
            	Response.Write "<span style='color:#666'>...</span><br/>"
            end if
            
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
    response.Write "<br/><span style='color:#666'>共清理了 " & i & " 个缓存数据</span><br/>"
    response.Write "</div>"
End Function
'------------------------- End Function -------------------------

'------------------------- 更新缓存信息 -------------------------
Function FreeMemory
    Call reloadcache
End Function
'------------------------- 施放网站缓存 -------------------------
%>