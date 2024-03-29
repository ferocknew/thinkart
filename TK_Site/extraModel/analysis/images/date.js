var _oCalPopUp;
var _oCalInput;
var _sCalMonths		=	new	Array
						(
							"1 月",
							"2 月",
							"3 月",
							"4 月",
							"5 月",
							"6 月",
							"7 月",
							"8 月",
							"9 月",
							"10 月",
							"11 月",
							"12 月"
						);
						
var _sCalLongMonths	=	new	Array
						(
							"January",
							"February",
							"March",
							"April",
							"May",
							"June",
							"July",
							"August",
							"September",
							"October",
							"November",
							"December"
						);
							
var _sCalDays		=	new Array
						(
							"日", 
							"一", 
							"二", 
							"三", 
							"四", 
							"五", 
							"六"
						);
						
var _sCalLongDays	= new Array
						( 
							"Sunday",  
							"Monday",  
							"Tuesday",  
							"Wednesday",  
							"Thursday",  
							"Friday",  
							"Saturday" 
						);
var _sDateFormats	= new Array
						(
							"M/d/yy",
							"M/d/yyyy",
							"MM/dd/yy",
							"MM/dd/yyyy",
							"d/M/yy",
							"d/M/yyyy",
							"dd/MM/yy",
							"dd/MM/yyyy",
							"yy/M/d",
							"yyyy/M/d",
							"yy/MM/dd",
							"yyyy/MM/dd"
						);
						
var _sTimeFormats	= new Array
						(
							"h:mm tt",
							"hh:mm tt",
							"H:mm",
							"HH:mm",
							"h:mm:ss tt",
							"hh:mm:ss tt",
							"H:mm:ss",
							"HH:mm:ss"
						);

var _iCalStartDay	= 0;//'2004-05-01';
var _dCalMinDate	= new Date(1800, 4, 1);
var _dCalMaxDate	= new Date(2100, 11, 31);
var _sCalSeperator	= "-";//ORG_DATE_SEPARATOR;
var _iCalFormat		=11;// ORG_DATE_FORMAT;
var _sShowWeekNumbers =0;// ORG_SHOW_WEEK_NUMBER;
var iShowWeekCalWidth = 170;
var iNoWeekCalWidth   = 150;
var iCalHeight        = 162;
function InitCalendar(iDateFormat, sSeperator, iStartDay, dMinDate, dMaxDate)
{
	_iCalFormat = iDateFormat;
	
	if (sSeperator)
	{
		_sCalSeperator = sSeperator;
	
		if (iStartDay)
		{
			_iCalStartDay = iStartDay;
			
			if (dMinDate)
			{
				_dCalMinDate = dMinDate;
				
				if (dMaxDate)
				{
					_dCalMaxDate = dMaxDate;
				}
			}
		}
	}
}
function LaunchCalendar(oInputElem, dInitDate)
{
	if ( isNaN(dInitDate) )
	{
		dInitDate = new Date();
	}
		
	_oCalInput = oInputElem;
	_oCalPopUp = window.createPopup();
	_oCalPopUp.document.body.innerHTML = DrawMonth(dInitDate, "parent.ReturnDate(this);", HILITE_NONE, null );
	var iCalWidth = _sShowWeekNumbers == "1" ? iShowWeekCalWidth : iNoWeekCalWidth;
		
	_oCalPopUp.show(0, 18, iCalWidth, iCalHeight, event.srcElement);
}
function SetDateValues(oInput)
{
	oInput.value = Trim(oInput.value);

	var s = oInput.value;
	
	if (s.length > 0)
	{
		var D = ParseDate(s, _iCalFormat);
		
		if (D)
		{
			oInput.value		= FormatDate(D);
			oInput.returnValue	= FormatUtcDate(D);
			return true;
		}
		else
		{
			oInput.select();
			return false;
		}
	}
	else
	{
		oInput.returnValue = "";
		return true;
	}
}
function GetFirstDayInCalendar(D)
{
	D.setDate(1);

	var i = D.getDay() - _iCalStartDay;

	if (i < 0)
	{
		i += 7;
	}

	if (i == 0)
	{
		return D;
	}

	D.setDate((i * -1) + 1);
	
	D.setHours(0);
	D.setMinutes(0);
	D.setSeconds(0);

	return D;
}
var HILITE_NONE = 0;
var HILITE_DAY = 1;
var HILITE_WEEK = 2;
function DrawMonth(D, sOnClick, hiliteCode, hiliteDay )
{ 
	// Determine hiliting range
	var dHiliteStart = null;
	var dHiliteEnd   = null;
	
	switch( hiliteCode )
		{
		case HILITE_DAY:
			dHiliteStart = new Date( hiliteDay );
			dHiliteEnd   = new Date( hiliteDay );
			break;
			
		case HILITE_WEEK:
			dHiliteStart = new GetFirstDayOfWeek( hiliteDay );   
			dHiliteEnd   = new GetLastDayOfWeek( hiliteDay ); 
			break;
			
		default:
			// Do nothing-- rather than let the user get an error, emulate HILITE_NONE.
			break;
	}
	if( dHiliteStart != null )
	{
		dHiliteStart.setMilliseconds( 0 );
		dHiliteStart.setSeconds( 0 );
		dHiliteStart.setMinutes( 0 );
		dHiliteStart.setHours( 0 );
	}
	if( dHiliteEnd != null )
	{
		dHiliteEnd.setMilliseconds( 999 );
		dHiliteEnd.setSeconds( 59 );
		dHiliteEnd.setMinutes( 59 );
		dHiliteEnd.setHours( 23 );
	}
	
	var tmpDate = new Date( D );
	tmpDate.setHours(0,0,0,0);
	
	var dToday		= new Date();
	
	dToday.setHours(0,0,0,0);
	
	var iToday		= dToday.valueOf();
	
	var dInitDate	= new Date(tmpDate.valueOf());
	var iInitMonth	= dInitDate.getMonth();
	tmpDate = GetFirstDayInCalendar(tmpDate);
	var s = "<table cellpadding='0' cellspacing='0' style='border-collapse: collapse;table-layout:fixed'><tr><td style='text-align:center;border:1px solid #7b9ebd;height:18px;filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#ffffff,EndColorStr=#cecfde);' colspan='";
	if( _sShowWeekNumbers == "1" )
	{
		// 7 days + 1 week number = 8 columns
		s += "8";
	}
	else
	{
		s += "7";
	}
	
	s+= "'><table cellpadding='0' cellspacing='0' style='table-layout:fixed'><tr height='18' style='font-family:verdana;font-size:8pt;cursor:hand;'>";
	var iValue = dInitDate.valueOf();
	if (tmpDate < _dCalMinDate)
	{
		s += "<td onclick='" + sOnClick + "' align='center' width='22' style='cursor: default;' nav='0'>&nbsp;</td>";
	}
	else
	{
		s += "<td onclick='" + sOnClick + "' align='center' width='22' d='" + iValue + "' nav='1' onmouseover='this.runtimeStyle.color = \"#e89f2e\";' onmouseout='this.runtimeStyle.color = \"\";'>&lt;</td>";
	}
	s += "<td onclick='" + sOnClick + "' align='center' width='104' d='" + iValue + "' nav='2' onmouseover='this.runtimeStyle.color = \"#e89f2e\";' onmouseout='this.runtimeStyle.color = \"\";'>" + _sCalMonths[iInitMonth] + " " + dInitDate.getFullYear() + " 年 </td>";
	var dLastDay = new Date(tmpDate.valueOf());
	dLastDay.setDate(dLastDay.getDate() + 42);
	if (dLastDay > _dCalMaxDate)
	{
		s += "<td onclick='" + sOnClick + "' align='center' width='22' style='cursor: default;' nav='0'>&nbsp;</td>";
	}
	else
	{
		s += "<td onclick='" + sOnClick + "' align='center' width='22' d='" + iValue + "' nav='1' onmouseover='this.runtimeStyle.color = \"#e89f2e\";' onmouseout='this.runtimeStyle.color = \"\";'>&gt;</td>";
	}
	s += "</tr></table></td></tr>";
	s += "<tr>";
	var i	= 0;
	var ii	= _iCalStartDay;;
	if( _sShowWeekNumbers == "1" )
	{
		s += "<td style='font-family:verdana;font-size:8pt;background-color:#eeeeee;text-align:center;border:1px solid #7b9ebd;width:20px;height:18px;cursor:default;' nav='0'></td>";
	}
	while (i < 7)
	{
		s += "<td style='font-family:verdana;font-size:8pt;background-color:#eeeeee;text-align:center;border:1px solid #7b9ebd;width:20px;height:18px;cursor:default;' nav='0'>" + _sCalDays[ii] + "</td>";
		i++;
		ii++;

		if (ii > 6)
		{
			ii = 0
		}
	}
	s += "</tr>";
	var iDate	= 0;
	var sStyle	= "";
	for (i = 0; i < 6; i++)
	{
		s += "<tr onmouseover='if(event.srcElement.noHl!=1){event.srcElement.runtimeStyle.color = \"#e89f2e\";}' onmouseout='if(event.srcElement.noHl!=1){event.srcElement.runtimeStyle.color = \"\";}'>";

		if( _sShowWeekNumbers == "1" )
		{
			var iWeekNumber = getWeekNumber( GetLastDayOfWeek( tmpDate ) );
			s += "<td noHl='1' style='cursor:default;font-family:verdana;font-size:8pt;color:#0000ff;text-align:center;background-color:#eeeeee;border:1px solid #7288ac;width:20px;height:18px;'>" + iWeekNumber + "</td>";
		}
		for(ii = 0; ii < 7; ii++)
		{
			iDate	= tmpDate.getDate();
			iValue	= tmpDate.valueOf();

			sStyle = "font-family:verdana;font-size:8pt;text-align:center;border:1px solid #7288ac;width:20px;height:18px;";
			
			if (iValue == iToday)
			{
				sStyle += "border:2px solid #e89f2e;";
			}
			var dayIsInThisMonth = ( tmpDate.getMonth() == iInitMonth );
			if( ( hiliteCode == HILITE_DAY || hiliteCode == HILITE_WEEK ) &&
  	            ( tmpDate.getTime( ) >= dHiliteStart.getTime( ) ) &&  ( tmpDate.getTime( ) <= dHiliteEnd.getTime( ) ) )
			{
				sStyle += "background-color:#cccccc;";
				if( !dayIsInThisMonth )
				{
					sStyle += "color:#ffffff;";
				}
			}
			else
			{
				if( !dayIsInThisMonth )
				{
					sStyle += "color:#cccccc;";
				}
			}
			if (tmpDate < _dCalMinDate || tmpDate > _dCalMaxDate)
			{
				s += "<td style='cursor:default;" + sStyle + "' nav='0'>&nbsp;</td>";
			}
			else if (tmpDate.getMonth() != iInitMonth)
			{
				s += "<td onclick='" + sOnClick + "' style='cursor:hand;" + sStyle + "' d='" + iValue + "'>" + iDate + "</td>";
			}
			else
			{
				s += "<td onclick='" + sOnClick + "' style='cursor:hand;" + sStyle + "' d='" + iValue + "'>" + iDate + "</td>";
			}
			tmpDate.setDate(iDate + 1);
		}
		s += "</tr>";
	}
	s += getTodayBarHtml((_sShowWeekNumbers == "1" ? "8" : "7"), sOnClick);
	s += "</table>";
	return s; 
}
function getTodayBarHtml(iColSpan, sOnClick)
{
	var dToday = new Date();
	
	var s = "<tr height='18'><td style='padding-top:1px;cursor:hand;border:1px solid #000000;font-family:verdana;font-size:8pt;text-align:Center;' colspan='";
	
	s += iColSpan; 
	s += "' onclick='" + sOnClick + "' d='" + dToday.valueOf() + "' onmouseover='runtimeStyle.color = \"#e89f2e\";' onmouseout='runtimeStyle.color = \"\";'><div style='height:16px;filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#ffffff,EndColorStr=#cecfde);'>";
	s += "今天: " + FormatDate(dToday);
	return s + "</div></td></tr>";
}
function getWeekNumber( oDate )
{
	var oYearStart = new Date( oDate.valueOf( ) );
	oYearStart.setMonth( 0, 1 );  // January is month 0
	oYearStart.setHours( 0, 0, 0, 0 );
	var iMSSinceYearStart = oDate.valueOf( ) - oYearStart.valueOf( );
	var fWeeksSinceYearStart = iMSSinceYearStart / 604800000;  // 1000 / 60 / 60 / 24 / 7;
	var iWeeksSinceYearStart = Math.ceil( fWeeksSinceYearStart );
	if( iWeeksSinceYearStart == 0 )
	{
		iWeeksSinceYearStart = 53;
	}
	return iWeeksSinceYearStart;
}
function DrawYear(D, sOnClick)
{
	var tmpDate = new Date( D );
	tmpDate.setMonth(0);
	tmpDate.setDate(1);
	var s = "<table cellpadding='0' cellspacing='0' width='";
	s += _sShowWeekNumbers == "1" ? iShowWeekCalWidth : iNoWeekCalWidth;
	s += "' style='border-collapse:collapse;table-layout:fixed'><tr><td style='font-family:verdana;font-size:8pt;text-align:center;border:1px solid #7b9ebd;height:18px;filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#ffffff,EndColorStr=#cecfde);' colspan='3'><table cellpadding='0' cellspacing='0' style='table-layout:fixed'><tr height='18' style='font-family:verdana;font-size:8pt;cursor:hand;'>";
	var iValue	= tmpDate.valueOf();
	var iYear	= tmpDate.getFullYear();
	if (iYear <= _dCalMinDate.getFullYear())
		s += "<td align='center' width='22' style='cursor:default;' nav='0'>&nbsp;</td>";
	else
		s += "<td onclick='" + sOnClick + "' align='center' width='22' d='" + iValue + "' nav='2' onmouseover='this.runtimeStyle.color = \"#e89f2e\";' onmouseout='this.runtimeStyle.color = \"\";'>&lt;</td>";
	s += "<td align='center' style='cursor:default;' nav='0'>" + iYear + " 年</td>";
	if (iYear >= _dCalMaxDate.getFullYear())
		s += "<td align='center' width='22' style='cursor:default;' nav='0'>&nbsp;</td>";
	else
		s += "<td onclick='" + sOnClick + "' align='center' width='22' d='" + iValue + "' nav='2' onmouseover='this.runtimeStyle.color = \"#e89f2e\";' onmouseout='this.runtimeStyle.color = \"\";'>&gt;</td>";
	s += "</tr></table></td></tr>";
	var iMonth = 0;
	for (i = 0; i < 4; i++)
	{
		s += "<tr style='height:" + (31 + (i % 2)) + "px;' onmouseover='event.srcElement.runtimeStyle.color = \"#e89f2e\";' onmouseout='event.srcElement.runtimeStyle.color = \"\";'>";
		for(ii = 0; ii < 3; ii++)
		{
			iMonth	= tmpDate.getMonth();
			iValue	= tmpDate.valueOf();

			s += "<td onclick='" + sOnClick + "' style='font-family:verdana;font-size:8pt;text-align:center;border:1px solid #7288ac;cursor:hand;' d='" + iValue + "' nav='1'>" + _sCalMonths[iMonth] + "</td>";
			tmpDate.setMonth(iMonth + 1);
		}
		s += "</tr>";
	}
	s += getTodayBarHtml(3, sOnClick);
	s += "</table>";
	return s;
}
function ReturnDate(o)
{
	var D = new Date(parseInt(o.d, 10));
	
	if (o.nav)
	{
		switch (parseInt(o.nav, 10))
		{
			case 1:

				var m = D.getMonth();
						
				var d = D.getDate();

				var a = new Array(31,28,31,30,31,30,31,31,30,31,30,31);

				if (D.getYear() % 4 == 0)
				{
					a[1] = 29;
				}
				if (o.innerHTML == "&lt;")
				{
					m--;
					
					if ((m > 0) && (d > a[m]))
					{						
						D.setDate(a[m]);
					}
					
					D.setMonth(m);
				}
				else if (o.innerHTML == "&gt;")
				{					
					m++;
					
					if ((m < 12) && (d > a[m]))
					{						
						D.setDate(a[m]);
					}
					
					D.setMonth(m);
				}
				_oCalPopUp.document.body.innerHTML = DrawMonth(D, "parent.ReturnDate(this);", HILITE_NONE, null);
				break;
			case 2:
				if (o.innerHTML == "&lt;")
				{
					D.setYear(D.getFullYear() - 1);
				}
				else if (o.innerHTML == "&gt;")
				{
					D.setYear(D.getFullYear() + 1);
				}
				_oCalPopUp.document.body.innerHTML = DrawYear(D, "parent.ReturnDate(this);");
				break;
		}
	}
	else
	{
		_oCalInput.value		= FormatDate(D);
		_oCalInput.returnValue	= FormatUtcDate(D);
		_oCalInput.fireEvent("onchange");
		_oCalPopUp.hide();
	}
}
function ParseDate(s)
{
	try
	{
		var a = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
		var S = "";
		var i;
		for (i = 0; i < s.length; i++)
		{
			switch (s.charAt(i))
			{
				case "/": S = "/"; break;
				case ".": S = "."; break;
				case "-": S = "-"; break;
			}
			if (S.length > 0)
			{
				break;
			}
		}
		var c;
		var iS = 0;
		for (i = 0; i < s.length; i++)
		{
			c = s.charAt(i);
			if (c != S && !IsValidNumber(c) )
			{
				throw  "You must enter a valid date." ;
			}
			if (c == S)
			{
				iS++;
			}
		}
		if (iS != 2)
		{
			throw  "You must enter a valid date." ;
		}
		var m, d, y;
		if (_iCalFormat < 4)
		{
			m = s.substring(0, s.indexOf(S));
			d = s.substring(m.length + 1, s.indexOf(S, m.length + 1));
			y = s.substr(m.length + d.length + 2);
		}
		else if (_iCalFormat > 3 && _iCalFormat < 8)
		{
			d = s.substring(0, s.indexOf(S));
			m = s.substring(d.length + 1, s.indexOf(S, d.length + 1));
			y = s.substr(m.length + d.length + 2);
		}
		else
		{
			y = s.substring(0, s.indexOf(S));
			m = s.substring(y.length + 1, s.indexOf(S, y.length + 1));
			d = s.substr(m.length + y.length + 2);
		}
		
		m = parseInt(m, 10) - 1;

		if (m < 0 || m > 11)
		{
			throw  "You must enter a valid date." ;
		}
		y = parseInt(PadYear(y), 10);
		
		if (y < _dCalMinDate.getFullYear() || y > _dCalMaxDate.getFullYear())
		{
			throw  "You must enter a valid date." ;
		}

		if (y % 4 == 0)
		{
			a[1] = 29;
		}
		d = parseInt(d, 10);

		if (d == 0 || d > a[m])
		{
			throw  "You must enter a valid date." ;
		}

		var D = new Date(y, m, d);

		if ((D < _dCalMinDate) || (D > _dCalMaxDate))
		{
			throw  "You must enter a valid date." ;
		}
		return D;
	}
	catch(e)
	{
		alert(e);
		return false;
	}
}
function ParseUtcDate(s)
{
	if (s.length > 10)
	{
		return new Date(parseInt(s.substr(0, 4), 10), (parseInt(s.substr(5, 2), 10) - 1), parseInt(s.substr(8, 2), 10), parseInt(s.substr(11, 2), 10), parseInt(s.substr(14, 2), 10), parseInt( s.substr( 17, 2), 10 ));
	}
	else
	{
		return new Date(parseInt(s.substr(0, 4), 10), (parseInt(s.substr(5, 2), 10) - 1), parseInt(s.substr(8, 2), 10));
	}
}
function FormatDate(D)
{
	var m = D.getMonth() + 1;
	var d = D.getDate();
	var y = D.getFullYear();

	if (_iCalFormat % 2 == 0 )
	{
		y = String(y).substr(2, 2);
	}

	if (_iCalFormat == 2 || _iCalFormat == 3 || _iCalFormat == 6 || _iCalFormat == 7 || _iCalFormat == 10 || _iCalFormat == 11)
	{
		m = PadNumber(m);
		d = PadNumber(d);
	}
	if (_iCalFormat < 4)
	{
		return m + _sCalSeperator + d + _sCalSeperator + y;
	}
	if (_iCalFormat > 3 && _iCalFormat < 8)
	{
		return d + _sCalSeperator + m + _sCalSeperator + y;
	}
	return y + _sCalSeperator + m + _sCalSeperator + d;
}
function FormatUtcDate(D)
{
	return String(D.getFullYear()) + "-" + PadNumber( String(D.getMonth() + 1)) + "-" + PadNumber(String(D.getDate())) + "T" + PadNumber(String(D.getHours())) + ":" + PadNumber(String(D.getMinutes())) + ":00";
}
function PadNumber(s)
{
	if (String(s).length == 1)
	{
		return "0" + s;
	}

	return s;
}
function PadYear(s)
{
	s = new String(s);

	if (s.length == 4)
	{
		return s;
	}
	
	if (s.length == 1)
	{
		s = 0 + s;
	}
	if (parseInt(s, 10) < 30)
	{
		return "20" + s;
	}

	return "19" + s;
}
function FormatUtcDateTime(s)
{
	var f = 0;
	var hh = parseInt(s.substr(11, 2), 10);
	var mm = s.substr(14, 2);
	var ss = s.substr(17, 2);
	var tt = "";
	switch (f)
	{
		case 0: case 1: case 4: case 5:
		
			if (hh == 12)
			{
				tt	= " PM";
			}
			else if (hh > 12)
			{
				hh	= hh - 12;
				tt	= " PM";
			}
			else
			{
				tt	= " AM";
			}
			break;
	}
	switch (f)
	{
		case 1: case 3: case 5: case 7:
			hh = PadNumber(hh);
			break;
	}
	if (f > 3)
	{
		return FormatDate(ParseUtcDate(s)) + " " + hh + ":" + mm + ":" + ss + tt;
	}
	else
	{
		return FormatDate(ParseUtcDate(s)) + " " + hh + ":" + mm + tt;
	}
}
function GetFirstDayOfWeek( D )
{
	var daysToSubtract = (D.getDay() + 7 - _iCalStartDay) % 7;
	return new Date(D.getTime() - (daysToSubtract * 24 * 60 * 60 * 1000));
}
function GetLastDayOfWeek( D )
{
	var firstDay = GetFirstDayOfWeek( D );
	return new Date( firstDay.getTime( ) + ( 6 * 24 * 60 * 60 * 1000 ) );  // Add 6 days to the first day of the week
}
function IsValidNumber(n)
{
	if (n == null)
		return false;
	var l = n.length;
	if (l == 0)
		return false;
	var s = 0;
	if (n.charAt(0) == "-")
		s = 1;
	var i,c;
	for (i = s; i < l; i++)
	{
		c = n.charCodeAt(i);
		if (c < 46 || c > 57)
			return false;
	}
	return true;
}