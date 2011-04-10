<!--#include file="../Model/ContentClassInfo.asp"-->
<%
Class ContentClassService

	Public Sub InsertContentClass(objContentClass)
		strInsertSql="insert into ContentClass select top 1 '" &InputReplace(objContentClass.ClassName) &_
			"' as ClassName, "& InputReplace(objContentClass.UpClassId) &" as UpClassId, iif((select max([Order]) from ContentClass where upclassid="& InputReplace(objContentClass.UpClassId) &")="",1,(select max([Order]) from ContentClass where upclassid="& InputReplace(objContentClass.UpClassId) &")+1) as [Order], "& InputReplace(objContentClass.Show2hide) &" as Show2hide, "& InputReplace(objContentClass.ClassType) &" as ClassType from SiteInfo"
			'response.Write(strInsertSql)
			'response.End()
		DB.ExecuteNonQuery(strInsertSql)
	End Sub
	
	Public Sub DeleteContentClass(id)
		strDeleteSql="delete from ContentClass where Id="& id
		DB.ExecuteNonQuery(strDeleteSql)
	End Sub
	
	Public Sub UpdateContentClass(objContentClass)
		strUpdateSql="update ContentClass set ClassName='"& InputReplace(objContentClass.ClassName)  &"' where Id="& InputReplace(objContentClass.Id)
			'response.Write(strUpdateSql)
			'response.End()
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Sub UpdateContentClassOrder(objContentClass)
		oldOrder=""
		symbol=""
		yu1=""
		yu2=""
		strUpdateSql="select [Order],(select max([Order]) from ContentClass where UpClassId in (select UpClassId from ContentClass where Id="& InputReplace(objContentClass.Id) &")) as maxOrder from ContentClass where Id="& InputReplace(objContentClass.Id)
		Set rs=DB.ExecuteQuery(strUpdateSql)
		oldOrder=rs("Order")
		maxOrder=rs("maxOrder")
		If CInt(oldOrder) > CInt(objContentClass.Order) Then
			symbol="+"
			yu1=">="
			yu2="<"
		Else
			symbol="-"
			yu1="<="
			yu2=">"
		End If
		newOrder=CInt(objContentClass.Order)+CInt(oldOrder)
		If newOrder<1 Then newOrder=1 End If
		If newOrder>maxOrder Then newOrder=maxOrder End If
		If Not rs.Eof Then oldOrder = rs("Order") End If
		strUpdateSql="Update ContentClass Set [Order]=[Order]"& symbol &"1 Where UpClassId in (Select UpClassId From ContentClass Where Id="& InputReplace(objContentClass.Id) &") and [Order] "& yu1 &" "& newOrder &" and [Order] "& yu2 &" "& oldOrder
		DB.ExecuteNonQuery(strUpdateSql)
		strUpdateSql="update ContentClass set [Order]="& newOrder &" where Id="& InputReplace(objContentClass.Id)
		DB.ExecuteNonQuery(strUpdateSql)
	End Sub
	
	Public Function GetAllContentClass(classtype)
		strSelectSql = ""
		If classtype <> "" then
			strSelectSql="select *,switch(upclassid=0,1,upclassid in (Select id from contentclass where upclassid=0),2,upclassid not in (Select id from contentclass where upclassid=0) and upclassid <> 0,3) as LV,iif(id in (select upclassid from ContentClass group by upclassid),'open','none') as Style from ContentClass where Show2hide = true and classtype = "&InputReplace(classtype)&" Order by UpClassId,[Order]"
		Else
			strSelectSql="select *,switch(upclassid=0,1,upclassid in (Select id from contentclass where upclassid=0),2,upclassid not in (Select id from contentclass where upclassid=0) and upclassid <> 0,3) as LV,iif(id in (select upclassid from ContentClass group by upclassid),'open','none') as Style from ContentClass where Show2hide = true Order by UpClassId,[Order]"
		End If
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
	
	Public Function GetContentClassById(id)
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