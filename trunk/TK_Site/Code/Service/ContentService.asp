<!--#include file="../Model/Content.asp"-->
<%
Class ContentService

	Public Sub InsertContent(objContent)
		strInsertSql="insert into Content (Title,Keywords,Abstract,Img,Content,Lasttime,SyncBlog,ClassID,CType) values ('"& InputReplace(objContent.Title) &"','"& InputReplace(objContent.Keywords) &"','"& InputReplace(objContent.Abstract) &"','"& InputReplace(objContent.Img) &"','"& InputReplace(objContent.Content) &"','"&_
			InputReplace(objContent.Lasttime) &"','"& InputReplace(objContent.SyncBlog) &"',"& InputReplace(objContent.ClassID) &","& InputReplace(objContent.CType) &")"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteContent(id)
		strDeleteSql="delete from Content where Id in ("& id &")"
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateContent(objContent)
		strUpdateSql="update Content set Title='"& InputReplace(objContent.Title)  &"',Keywords='"& InputReplace(objContent.Keywords) &_
			"',Abstract='"& InputReplace(objContent.Abstract) &"',Img='"& InputReplace(objContent.Img) &"',Content='"& InputReplace(objContent.Content) &_
			"',Lasttime='"& InputReplace(objContent.Lasttime) &"',SyncBlog='"& InputReplace(objContent.SyncBlog) &"',ClassID="& InputReplace(objContent.ClassID) &",CType="& InputReplace(objContent.CType)
		If objContent.Img<>"" Then strUpdateSql=strUpdateSql &",Img='"& InputReplace(objContent.Img) &"'" End If
		strUpdateSql=strUpdateSql &" where Id="& InputReplace(objContent.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllContent()
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=Content.ClassID) as ClassName,(select ClassType from ContentClass where ContentClass.ID=Content.ClassID) as ClassType from Content Order by Id Desc"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModContent=CreateContent(rs) 
			dic.Add ModContent.Id,ModContent
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetAllContent=dic
	End Function
	
	Public Function GetContentByObjContent(objContent)
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=Content.ClassID) as ClassName,(select ClassType from ContentClass where ContentClass.ID=Content.ClassID) as ClassType from Content where 1=1"
		If Not objContent.Id is null and objContent.Id = "" Then strSelectSql = strSelectSql& " and [Id]="& objContent.Id End If
		If Not objContent.Title is null and objContent.Title = "" Then strSelectSql = strSelectSql& " and [Title]="& objContent.Title End If
		If Not objContent.Keywords is null and objContent.Keywords = "" Then strSelectSql = strSelectSql& " and [Keywords]="& objContent.Keywords End If
		If Not objContent.Abstract is null and objContent.Abstract = "" Then strSelectSql = strSelectSql& " and [Abstract]="& objContent.Abstract End If
		If Not objContent.Content is null and objContent.Content = "" Then strSelectSql = strSelectSql& " and [Content]="& objContent.Content End If
		If Not objContent.SyncBlog is null and objContent.SyncBlog = "" Then strSelectSql = strSelectSql& " and [SyncBlog]="& objContent.SyncBlog End If
		If Not objContent.CType is null and objContent.CType = "" Then strSelectSql = strSelectSql& " and [CType]="& objContent.CType End If
		If Not objContent.Lasttime is null and objContent.Lasttime = "" Then strSelectSql = strSelectSql& " and [Lasttime]="& objContent.Lasttime End If
		If Not objContent.ClassID is null and objContent.ClassID = "" Then strSelectSql = strSelectSql& " and [ClassID]="& objContent.ClassID End If
		strSelectSql = strSelectSql& " Order by Id Desc"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ModContent=CreateContent(rs) 
			dic.Add ModContent.Id,ModContent
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetContentByObjContent=dic
	End Function
	
	Public Function GetContentById(id)
		strSelectSql="select *,(select ClassName from ContentClass where ContentClass.ID=Content.ClassID) as ClassName,(select ClassType from ContentClass where ContentClass.ID=Content.ClassID) as ClassType from Content where Id="&InputReplace(id)
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ModContent=CreateContent(rs)
		rs.Close
		Set rs=nothing 
		Set GetContentById=ModContent
	End Function
	
	Private Function CreateContent(rs)
		Set ModContent=new Content
		If Not rs.Eof Then
			ModContent.Id=OutputReplace(rs("Id"))
			ModContent.Title=OutputReplace(rs("Title"))
			ModContent.Keywords=OutputReplace(rs("Keywords"))
			ModContent.Abstract=OutputReplace(rs("Abstract"))
			ModContent.Img=OutputReplace(rs("Img"))
			ModContent.Content=OutputReplace(rs("Content"))
			ModContent.Lasttime=OutputReplace(rs("Lasttime"))
			ModContent.SyncBlog=OutputReplace(rs("SyncBlog"))
			ModContent.ClassID=OutputReplace(rs("ClassID"))
			ModContent.CType=OutputReplace(rs("CType"))
			ModContent.ClassName=OutputReplace(rs("ClassName"))
			ModContent.ClassType=OutputReplace(rs("ClassType"))
		End If
		Set CreateContent=ModContent
	End Function
	
End Class

Set ContentDao = new ContentService
%>


