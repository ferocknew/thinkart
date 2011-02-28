<!--#include file="../Model/ContentClassInfo.asp"-->
<%
Class ContentClassService

	Public Sub InsertContentClass(objContentClass,classLevelId)
		strInsertSql="insert into ContentClass (ClassName,UpClassId,[Order],Show2hide,ClassType) values ('" &InputReplace(objContentClass.ClassName) &_
			"',"& InputReplace(objContentClass.UpClassId) &",'"& InputReplace(objContentClass.Order) &"',"& InputReplace(objContentClass.Show2hide) &","& InputReplace(objContentClass.ClassType) &")"
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteContentClass(id)
		strDeleteSql="delete from ContentClass where Id="& id
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateContentClass(objContentClass)
		strUpdateSql="update ContentClass set ClassName='"& InputReplace(objContentClass.ClassName)  &"',UpClassId="& InputReplace(objContentClass.UpClassId) &_
			",[Order]='"& InputReplace(objContentClass.Order) &"',Show2hide="& InputReplace(objContentClass.Show2hide) &",ClassType="& InputReplace(objContentClass.ClassType) &" where Id="& InputReplace(objContentClass.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllContentClass(classtype)
		strSelectSql="select *,switch(upclassid=0,1,upclassid in (Select id from contentclass where upclassid=0),2,upclassid not in (Select id from contentclass where upclassid=0) and upclassid <> 0,3) as LV,iif(id in (select upclassid from ContentClass group by upclassid),'open','none') as Style from ContentClass where Show2hide = true and classtype = "&InputReplace(classtype)&" Order by UpClassId,[Order]"
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set dic=Server.CreateObject("Scripting.Dictionary")
		While not rs.eof
			Set ContentClass=CreateContentClass(rs)
			dic.Add ContentClass.Id,ContentClass
			rs.MoveNext
		wend
		rs.Close
		Set rs=nothing
		Set GetAllContentClass=dic
	End Function
	
	Public Function GetContentClassById(id,classLevelId)
		strSelectSql="select * from ContentClass where Id="&InputReplace(id)
		Set rs=DB.ExecuteQuery(strSelectSql)
		Set ContentClass=CreateContentClass(rs)
		rs.Close
		Set rs=nothing
		Set GetContentClassById=ContentClass
	End Function
	
	Private Function CreateContentClass(rs)
		Set ContentClass=new ContentClassInfo
		If Not rs.Eof Then
			ContentClass.Id=OutputReplace(rs("Id"))
			ContentClass.ClassName=OutputReplace(rs("ClassName"))
			ContentClass.UpClassId=OutputReplace(rs("UpClassId"))
			ContentClass.Order=OutputReplace(rs("Order"))
			ContentClass.Show2hide=OutputReplace(rs("Show2hide"))
			ContentClass.ClassType=OutputReplace(rs("ClassType"))
			ContentClass.LV=OutputReplace(rs("LV"))
			ContentClass.Style=OutputReplace(rs("Style"))
		End If
		Set CreateContentClass=ContentClass
	End Function
	
End Class

Set ContentClassDao = new ContentClassService
%>