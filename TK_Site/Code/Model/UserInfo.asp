<%
Class UserInfo
	Private uid
	Public Property Let Id(value)
		uid = value
	End Property 
	Public Property Get Id()
		Id = uid
	End Property
	
	Private uuserName
	Public Property Let UserName(value)
	    uuserName = value
	End Property
    Public Property Get UserName()
		UserName = uuserName
    End Property
	
	Private upassword
	Public Property Let Password(value)
		upassword = value
	End Property
	Public Property Get Password()
		Password = upassword
	End Property
	
	Private upower
	Public Property Let Power(value)
		upower = value
	End Property
	Public Property Get Power()
		Power = upower
	End Property
	
	Private uUserState
	Public Property Let UserState(value)
		uUserState = value
	End Property
	Public Property Get UserState()
		UserState = uUserState
	End Property
	
	Private uUserType
	Public Property Let UserType(value)
		uUserType = value
	End Property
	Public Property Get UserType()
		UserType = uUserType
	End Property
End Class
%>
