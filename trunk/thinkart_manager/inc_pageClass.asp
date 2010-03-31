<%
'*********************************************
'FILE: PageClass.asp
'DATE: 2002-2-16
'SCRIPT: Written  Modify by While
'COPYRIGHT: (C) While All Rights Reserved
'*********************************************
'====================================================================================================
' Class	: PageClass
' Description	: Class to separate a recordset of large number of records into pages of specified size
'====================================================================================================
Class PageClass

	public page, pagesize, getUrl

	public color1, color2

	public recordcount

	public sub GetPage(byref rs)
		rs.PageSize = pagesize
		if rs.PageCount >= page then rs.AbsolutePage = page
		CurRecord = 0
		recordcount = rs.recordcount

		color1 = "#C8D8F8"
		color2 = "#FFFFFF"
	end sub

	public function EndofPage(byref rs)
		EndofPage = rs.eof or CurRecord > pagesize
		CurRecord = CurRecord + 1
	end function

    public function ShowNavBar(byref rs)

		dim listFrom
		dim tmpReturn

		if rs.pageCount > 1 then

			tmpReturn = tmpReturn & "all " & rs.recordCount & " Rec: &nbsp;"

			listFrom = int((page - 1)/10) * 10
			if page > 10 then
				tmpReturn = tmpReturn & LinkToPage(listFrom - 10 + 1, "1-" & listFrom)
			end if

			Dim i
			for i = 1 to 10
				if (listFrom + i) <= rs.pageCount then
					tmpReturn = tmpReturn & LinkToPage (listFrom + i, listFrom + i)
				end if
			next

			if rs.pageCount > (listFrom + 10) then
				if listFrom + 11 = rs.pageCount then
					tmpReturn = tmpReturn & LinkToPage (listFrom + 11, listFrom + 11)
				else
					tmpReturn = tmpReturn & LinkToPage (listFrom + 11, listFrom + 11 & "-" & rs.pageCount)
				end if
			end if

			tmpReturn = tmpReturn & " - &nbsp;" & rs.pageCount & "&nbsp; page - &nbsp; "
			if page > 1 then
				tmpReturn = tmpReturn & LinkToPage( page - 1, "Prev")
			else
				tmpReturn = tmpReturn & "Prev&nbsp;"
			end if

			if not rs.EOF then
				tmpReturn = tmpReturn &"&nbsp;|&nbsp;&nbsp;"& LinkToPage (page + 1, "Next")
			else
				tmpReturn = tmpReturn & "| Next"
			end if

			tmpReturn = tmpReturn

		end if
		ShowNavBar = tmpReturn
    end function

	  public function ShowNavBar2(byref rs)

		dim listFrom
		dim tmpReturn

		if rs.pageCount > 1 then
			if page > 1 then
				tmpReturn = tmpReturn &"&nbsp;"& LinkToPage( page - 1, "Prev")
			else
				tmpReturn = tmpReturn & "&nbsp;Prev"
			end if

			if not rs.EOF and page<rs.pageCount then
				tmpReturn = tmpReturn &"&nbsp;"& LinkToPage (page + 1, "Next")
			else
				tmpReturn = tmpReturn & "&nbsp;Next"
			end if

			tmpReturn = tmpReturn

		end if
		ShowNavBar2 = tmpReturn
    end function

	public sub close()
		' nothing to do
	end sub

	public function bgcolor()

		if CurRecord mod 2 = 0 then
			bgcolor = color1
		else
			bgcolor = color2
		end if

	end function

	private CurRecord

    private function LinkToPage(gotopage, pagedesc)

		dim thisURL
		dim tmpReturnLTP

		if gotopage = page then
			tmpReturnLTP = tmpReturnLTP & "<b>" & pagedesc & "</b>&nbsp;"
		else
			thisURL = GetThisPage(true)
			if instr(thisURL, "?") = 0 then
				thisURL = thisURL & "?"
			else
				thisURL = thisURL & "&"
			end if
			tmpReturnLTP = tmpReturnLTP & "<a href=""" & thisURL & "Page=" & gotopage & getUrl &""">" & pagedesc & "</a>&nbsp;"
		end if
		LinkToPage = tmpReturnLTP
	end function

End Class

'====================================================================================================
' Function        : GetThisPage(String)
' Description     : Function used for PageClass
' Input(s)        : IgnorePage          = ignore this page
' Return          : String              = URL of this page
'====================================================================================================
function GetThisPage(IgnorePage)
	dim form_query, base, http, thispage
	form_query = GetFQ(IgnorePage)

	If Request.ServerVariables("HTTPS") = "on" then
		http = "https://"
	else
		http = "http://"
	end if

    base = http & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("URL")

	If form_query <> "" Then
		thispage = base & "?" & form_query
	Else
		thispage = base
	End If
	GetThisPage = thispage
End function

'====================================================================================================
' Function          : FI(String,String)
' Description		: Function used for PageClass
' Input(s)          : label                 = label of the form request to get
'                     default               = the default value to display if the label is not found in the form request
' Return			: String				= output string
'====================================================================================================
function FI(label, default)
	FI = Request(label)
	if FI = "" then
		FI = default
	else
		if isNumeric(FI) then
			FI = clng(FI)
		end if
	end if
end function

'====================================================================================================
' Function          : GetFQ(String)
' Description		: Function used for PageClass
' Input(s)          : IgnorePage          = ignore this page
' Return			: String              = all the querystring of the current page
'====================================================================================================
Function GetFQ(IgnorePage)
	' build a string for the form input if any
	' don't call this function directly, use GetThisPage() instead
	Dim query, i, key
	query = ""
	For i = 1 to Request.Form.Count
		query = AppendFQ(query, Request.Form.Key(i), Request.Form.Item(i), IgnorePage)
	Next
	For i = 1 to Request.QueryString.Count
		query = AppendFQ(query, Request.QueryString.Key(i), Request.QueryString.Item(i), IgnorePage)
	Next
	GetFQ = query
End Function

'====================================================================================================
' Function          : AppendFQ(String,String,String,String)
' Description		: Function used for PageClass
' Input(s)          : query				= original querystring
'                     key				= the new key to append
'                     item				= the new value to append
'                     IgnorePage		= ignore this page
' Return			: String			= result querystring
'====================================================================================================
Function AppendFQ(query, key, item, ignorePage)
	if (UCase(key) <> "PAGE" or not IgnorePage) and UCase(key) <> "ERR" and UCase(key) <> "MSG" then
		If query <> "" Then AppendFQ = query & "&"
		AppendFQ = AppendFQ & key & "=" & Server.URLEncode(item)
	else
	AppendFQ = query
	end if
End Function
%>