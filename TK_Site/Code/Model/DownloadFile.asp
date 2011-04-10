<%
'
Class DownloadFile
	Private cid
	Public Property Let Id(value)
		cid = value
	End Property 
	Public Property Get Id()
		Id = cid
	End Property
	
	Private cShowName
	Public Property Let ShowName(value)
	    cShowName = value
	End Property
    Public Property Get ShowName()
		ShowName = cShowName
    End Property
	
	Private cFileName
	Public Property Let FileName(value)
		cFileName = value
	End Property
	Public Property Get FileName()
		FileName = cFileName
	End Property
	
	Private cKeyWords
	Public Property Let KeyWords(value)
		cKeyWords = value
	End Property
	Public Property Get KeyWords()
		KeyWords = cKeyWords
	End Property
	
	Private cAbstract
	Public Property Let Abstract(value)
		cAbstract = value
	End Property
	Public Property Get Abstract()
		Abstract = cAbstract
	End Property
	
	Private cClassID
	Public Property Let ClassID(value)
		cClassID = value
	End Property
	Public Property Get ClassID()
		ClassID = cClassID
	End Property
	
	Private cClassName
	Public Property Let ClassName(value)
		cClassName = value
	End Property
	Public Property Get ClassName()
		ClassName = cClassName
	End Property
	
	Private cClassType
	Public Property Let ClassType(value)
		cClassType = value
	End Property
	Public Property Get ClassType()
		ClassType = cClassType
	End Property
End Class
%>
