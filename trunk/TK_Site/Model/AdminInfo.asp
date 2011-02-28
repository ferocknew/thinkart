<%
Class AdminInfo
	Private uid
	Public Property Let Id(value)
		uid = value
	End Property 
	Public Property Get Id()
		Id = uid
	End Property
	
	Private uUserName
	Public Property Let UserName(value)
	    uUserName = value
	End Property
    Public Property Get UserName()
		UserName = uUserName
    End Property
	
	Private uPassword
	Public Property Let Password(value)
		uPassword = value
	End Property
	Public Property Get Password()
		Password = uPassword
	End Property
	
	Private uTrueName
	Public Property Let TrueName(value)
		uTrueName = value
	End Property
	Public Property Get TrueName()
		TrueName = uTrueName
	End Property
	
	Private uAddTime
	Public Property Let AddTime(value)
		uAddTime = value
	End Property
	Public Property Get AddTime()
		AddTime = uAddTime
	End Property
	
	Private uUserState
	Public Property Let UserState(value)
		uUserState = value
	End Property
	Public Property Get UserState()
		UserState = uUserState
	End Property
End Class
%>
