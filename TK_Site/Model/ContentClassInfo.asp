<%
'ݷ
Class ContentClassInfo
	Private ccid
	Public Property Let Id(value)
		ccid = value
	End Property 
	Public Property Get Id()
		Id = ccid
	End Property
	
	Private ccclassName
	Public Property Let ClassName(value)
	    ccclassName = value
	End Property
    Public Property Get ClassName()
		ClassName = ccclassName
    End Property
	
	Private ccupClassId
	Public Property Let UpClassId(value)
		ccupClassId = value
	End Property
	Public Property Get UpClassId()
		UpClassId = ccupClassId
	End Property
	
	Private ccorder
	Public Property Let Order(value)
		ccorder = value
	End Property
	Public Property Get Order()
		Order = ccorder
	End Property
	
	Private ccshow2hide
	Public Property Let Show2hide(value)
		ccshow2hide = value
	End Property
	Public Property Get Show2hide()
		Show2hide = ccshow2hide
	End Property
	
	Private cClassType
	Public Property Let ClassType(value)
		cClassType = value
	End Property
	Public Property Get ClassType()
		ClassType = cClassType
	End Property
	
	Private cLV
	Public Property Let LV(value)
		cLV = value
	End Property
	Public Property Get LV()
		LV = cLV
	End Property
	
	Private cStyle
	Public Property Let Style(value)
		cStyle = value
	End Property
	Public Property Get Style()
		Style = cStyle
	End Property
End Class
%>
