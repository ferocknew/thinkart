<%
'΢
Class BlogInfo
	Private bid
	Public Property Let Id(value)
		bid = value
	End Property 
	Public Property Get Id()
		Id = bid
	End Property
	
	Private bmicroBlogName
	Public Property Let MicroBlogName(value)
	    bmicroBlogName = value
	End Property
    Public Property Get MicroBlogName()
		MicroBlogName = bmicroBlogName
    End Property
	
	Private busername
	Public Property Let Username(value)
		busername = value
	End Property
	Public Property Get Username()
		Username = busername
	End Property
	
	Private bpassword
	Public Property Let Password(value)
		bpassword = value
	End Property
	Public Property Get Password()
		Password = bpassword
	End Property
End Class
%>
