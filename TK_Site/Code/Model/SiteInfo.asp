<%
'վϢ
Class SiteInfo
	Private sid
	Public Property Let Id(value)
		sid = value
	End Property 
	Public Property Get Id()
		Id = sid
	End Property
	
	Private ssiteName
	Public Property Let SiteName(value)
	    ssiteName = value
	End Property
    Public Property Get SiteName()
		SiteName = ssiteName
    End Property
	
	Private sicpNum
	Public Property Let IcpNum(value)
		sicpNum = value
	End Property
	Public Property Get IcpNum()
		IcpNum = sicpNum
	End Property
	
	Private sseoKeywords
	Public Property Let SeoKeywords(value)
		sseoKeywords = value
	End Property
	Public Property Get SeoKeywords()
		SeoKeywords = sseoKeywords
	End Property
	
	Private sseoDesc
	Public Property Let SeoDesc(value)
		sseoDesc = value
	End Property
	Public Property Get SeoDesc()
		SeoDesc = sseoDesc
	End Property
	
	Private ssiteCopyright
	Public Property Let SiteCopyright(value)
		ssiteCopyright = value
	End Property
	Public Property Get SiteCopyright()
		SiteCopyright = ssiteCopyright
	End Property
	
	Private sadminPath
	Public Property Let AdminPath(value)
		sadminPath = value
	End Property
	Public Property Get AdminPath()
		AdminPath = sadminPath
	End Property
	
	Private ssiteOff
	Public Property Let SiteOff(value)
		ssiteOff = value
	End Property
	Public Property Get SiteOff()
		SiteOff = ssiteOff
	End Property
End Class
%>
