<%
'
Class Message
	Private cid
	Public Property Let Id(value)
		cid = value
	End Property 
	Public Property Get Id()
		Id = cid
	End Property
	
	Private cPerson
	Public Property Let Person(value)
	    cPerson = value
	End Property
    Public Property Get Person()
		Person = cPerson
    End Property
	
	Private cPhone
	Public Property Let Phone(value)
		cPhone = value
	End Property
	Public Property Get Phone()
		Phone = cPhone
	End Property
	
	Private cEmail
	Public Property Let Email(value)
		cEmail = value
	End Property
	Public Property Get Email()
		Email = cEmail
	End Property
	
	Private cCompany
	Public Property Let Company(value)
		cCompany = value
	End Property
	Public Property Get Company()
		Company = cCompany
	End Property
	
	Private ccontent
	Public Property Let Content(value)
		ccontent = value
	End Property
	Public Property Get Content()
		Content = ccontent
	End Property
	
	Private cRemark
	Public Property Let Remark(value)
		cRemark = value
	End Property
	Public Property Get Remark()
		Remark = cRemark
	End Property
	
	Private cTemp1
	Public Property Let Temp1(value)
		cTemp1 = value
	End Property
	Public Property Get Temp1()
		Temp1 = cTemp1
	End Property
	
	Private cTemp2
	Public Property Let Temp2(value)
		cTemp2 = value
	End Property
	Public Property Get Temp2()
		Temp2 = cTemp2
	End Property
	
	Private cTemp3
	Public Property Let Temp3(value)
		cTemp3 = value
	End Property
	Public Property Get Temp3()
		Temp3 = cTemp3
	End Property
End Class
%>
