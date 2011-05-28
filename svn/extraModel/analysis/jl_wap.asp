<%
dim sjmp5_mdb,sjmp5_mdb_ip
dim conn2,exec,sql2,ipconn,rsx,ips,myip,sql
dim sjmp5_geturl,sjmp5_getlyurl,sjmp5_ipaddess_zw
dim sjmp5_getlyurl2,sjmp5_getlyurls,sjmp5_jl_windows,sjmp5_jl_window,sjmp5_jl_ie,sjmp5_jl_xt
dim sjmp5_ipaddess,sjmp5_http4,sjmp5_http5,sjmp5_https1,sjmp5_https3
Dim urlstr,sjmp5,sjmp2,sjmp3,sjmp4,sjmp5_key_url,sjmp5_key_name
if Request.ServerVariables("HTTP_X_FORWARDED_FOR")<>"" then
   sjmp5_ipaddess = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
else
   sjmp5_ipaddess = Request.ServerVariables("REMOTE_ADDR")
end if
Function GetLocationURL() 
   sjmp5_https1="http://" & Request.ServerVariables("server_name")
if Request.ServerVariables("SERVER_PORT")<>"80" then sjmp5_https1="http://" & Request.ServerVariables("server_name")&":"&Request.ServerVariables("SERVER_PORT")
   sjmp5_https1="http://" & Request.ServerVariables("server_name")&Request.ServerVariables("script_name")
If Request.ServerVariables("QUERY_STRING") <>"" Then sjmp5_https1="http://" & Request.ServerVariables("server_name")&"?"& Request.ServerVariables("QUERY_STRING") 
   GetLocationURL=sjmp5_https1 
End Function 
sjmp5_https3=GetLocationURL
sjmp5_geturl =sjmp5_https3 'Request.QueryString("sjmp5_geturl") '
sjmp5_getlyurl =Cstr(Request.ServerVariables("HTTP_REFERER"))' Request.QueryString("sjmp5_getlyurl") '
sjmp5_getlyurls =Cstr(Request.ServerVariables("HTTP_REFERER"))' Request.QueryString("sjmp5_getlyurl") '
sjmp5_jl_windows=Request.ServerVariables("HTTP_USER_AGENT") 
sjmp5_jl_windows=replace(sjmp5_jl_windows,"MSIE","Internet Explorer") 
sjmp5_jl_windows=replace(sjmp5_jl_windows,"NT 5.0","2000") 
sjmp5_jl_windows=replace(sjmp5_jl_windows,"NT 5.1","XP") 
sjmp5_jl_windows=replace(sjmp5_jl_windows,"NT 5.2","2003") 
sjmp5_jl_windows=replace(sjmp5_jl_windows,"uc web","uc") 
sjmp5_jl_windows=replace(sjmp5_jl_windows,"wap 1.0","wap") 
sjmp5_jl_windows=replace(sjmp5_jl_windows,"wap 2.0","wap") 
sjmp5_jl_window =split(sjmp5_jl_windows,";") 
sjmp5_jl_ie="0"'sjmp5_jl_window(1)  '"手机浏览器" 
sjmp5_jl_xt="0"'sjmp5_jl_window(2)  '"未知系统"
if sjmp5_getlyurls = "" then
   sjmp5_getlyurls = "http://直接访问/?url=http://www.sjmp5.com/"
end if
   sjmp5_getlyurls = replace(sjmp5_getlyurls,"http://","")
   sjmp5_getlyurl2 = split(sjmp5_getlyurls,"/")%><!--#include file="mdb.asp"-->
<%Set conn2 = Server.CreateObject ("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&sjmp5_mdb&"")
conn2.Open connstr
exec="select * from sjmp5_jl"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn2,1,1
   rs.close
   sql2="select * from sjmp5_jl"
   rs.open sql2,conn2,1,3
   rs.addnew
   rs("sjmp5_jl_fwurl")=sjmp5_geturl
   rs("sjmp5_jl_ip")=sjmp5_ipaddess
   rs("sjmp5_jl_iply")=sjmp5_ipaddess
   rs("sjmp5_jl_ie")=sjmp5_jl_ie
   rs("sjmp5_jl_windows")=sjmp5_jl_xt
if sjmp5_getlyurl<>"" then 
   rs("sjmp5_jl_lyurlname")=sjmp5_getlyurl2(0)
   rs("sjmp5_jl_lyurl")=sjmp5_getlyurl
else
   rs("sjmp5_jl_lyurlname")="直接访问"
   rs("sjmp5_jl_lyurl")="直接访问"
end if
   rs.update 
   rs.close
   sql2="select * from sjmp5_ip where sjmp5_ip_ip='"&sjmp5_ipaddess&"' and sjmp5_ip_date=#"&date()&"# "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_ip_ip")=sjmp5_ipaddess
   rs("sjmp5_ip_lyurl")=sjmp5_ipaddess
   rs.update
else
   conn2.execute("update sjmp5_ip set sjmp5_ip_hits=sjmp5_ip_hits+1 where sjmp5_ip_ip='"&sjmp5_ipaddess&"' and sjmp5_ip_date=#"&date()&"#   ")
end if
   rs.close
   sql2="select * from sjmp5_ip_total where sjmp5_ip_total_ip='"&sjmp5_ipaddess&"' "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_ip_total_ip")=sjmp5_ipaddess
   rs("sjmp5_ip_total_from")=sjmp5_ipaddess
   rs.update
else
   conn2.execute("update sjmp5_ip_total set sjmp5_ip_total_hits=sjmp5_ip_total_hits+1 where sjmp5_ip_total_ip='"&sjmp5_ipaddess&"' ")
end if
   rs.close
   sql2="select * from sjmp5_url where sjmp5_url_name='"&sjmp5_getlyurl2(0)&"' and sjmp5_url_date=#"&date()&"# "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_url_name")=sjmp5_getlyurl2(0)
   rs.update
else
   conn2.execute("update sjmp5_url set sjmp5_url_hits=sjmp5_url_hits+1 where sjmp5_url_name='"&sjmp5_getlyurl2(0)&"' and sjmp5_url_date=#"&date()&"# ")
end if
   rs.close
   sql2="select * from sjmp5_html where sjmp5_html_url='"&sjmp5_geturl&"' and sjmp5_html_date=#"&date()&"# "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_html_url")=sjmp5_geturl
   rs.update
else
   conn2.execute("update sjmp5_html set sjmp5_html_hits=sjmp5_html_hits+1 where sjmp5_html_url='"&sjmp5_geturl&"' and sjmp5_html_date=#"&date()&"# ")
end if
if sjmp5_getlyurl2(0)<>Request.ServerVariables("SERVER_NAME") and sjmp5_getlyurl<>"" then
   rs.close
   sql2="select * from sjmp5_lyhtml where sjmp5_lyhtml_url='"&sjmp5_getlyurl&"' and sjmp5_lyhtml_date=#"&date()&"# "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_lyhtml_url")=sjmp5_getlyurl
   rs("sjmp5_lyhtml_name")=sjmp5_getlyurl2(0)
   rs.update
else
   conn2.execute("update sjmp5_lyhtml set sjmp5_lyhtml_hits=sjmp5_lyhtml_hits+1 where sjmp5_lyhtml_url='"&sjmp5_getlyurl&"' and sjmp5_lyhtml_date=#"&date()&"# ")
end if
end if
function sjmp5_keyword()
   rs.close
   sql2="select * from sjmp5_keyword where sjmp5_keyword_name='"&sjmp5_key_name&"' and sjmp5_keyword_date=#"&date()&"# "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_keyword_name")=sjmp5_key_name
   rs("sjmp5_keyword_"&sjmp5_key_url&"")=1
   rs.update
else
   conn2.execute("update sjmp5_keyword set sjmp5_keyword_hits=sjmp5_keyword_hits+1 , sjmp5_keyword_"&sjmp5_key_url&"=sjmp5_keyword_"&sjmp5_key_url&"+1 where sjmp5_keyword_name='"&sjmp5_key_name&"' and sjmp5_keyword_date=#"&date()&"# ")
end if
   rs.close
   sql2="select * from sjmp5_keyword_total where sjmp5_keyword_total_name='"&sjmp5_key_name&"' "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_keyword_total_name")=sjmp5_key_name
   rs("sjmp5_keyword_total_"&sjmp5_key_url&"")=1
   rs.update
else
   conn2.execute("update sjmp5_keyword_total set sjmp5_keyword_total_hits=sjmp5_keyword_total_hits+1 , sjmp5_keyword_total_"&sjmp5_key_url&"=sjmp5_keyword_total_"&sjmp5_key_url&"+1  where sjmp5_keyword_total_name='"&sjmp5_key_name&"' ")
end if
end function
function sjmp5_keyword2()
   rs.close
   sql2="select * from sjmp5_keyword where sjmp5_keyword_name='"&sjmp5_key_name&"' and sjmp5_keyword_date=#"&date()&"# "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_keyword_name")=sjmp5_key_name
   rs("sjmp5_keyword_"&sjmp5_key_url&"")=1
   rs.update
else
   conn2.execute("update sjmp5_keyword set sjmp5_keyword_hits=sjmp5_keyword_hits+1 , sjmp5_keyword_"&sjmp5_key_url&"=sjmp5_keyword_"&sjmp5_key_url&"+1 where sjmp5_keyword_name='"&sjmp5_key_name&"' and sjmp5_keyword_date=#"&date()&"# ")
end if
   rs.close
   sql2="select * from sjmp5_keyword_total where sjmp5_keyword_total_name='"&sjmp5_key_name&"' "
   rs.open sql2,conn2,1,3
if rs.bof and rs.eof then
   rs.addnew
   rs("sjmp5_keyword_total_name")=sjmp5_key_name
   rs("sjmp5_keyword_total_"&sjmp5_key_url&"")=1
   rs.update
else
   conn2.execute("update sjmp5_keyword_total set sjmp5_keyword_total_hits=sjmp5_keyword_total_hits+1 , sjmp5_keyword_total_"&sjmp5_key_url&"=sjmp5_keyword_total_"&sjmp5_key_url&"+1  where sjmp5_keyword_total_name='"&sjmp5_key_name&"' ")
end if
end function
if InStr(sjmp5_getlyurl,"baidu.")>0 or InStr(sjmp5_getlyurl,"google.")>0 or InStr(sjmp5_getlyurl,"soso.")>0 or InStr(sjmp5_getlyurl,"sogou.")>0 or InStr(sjmp5_getlyurl,"yahoo.")>0 or InStr(sjmp5_getlyurl,"youdao.")>0 or InStr(sjmp5_getlyurl,"search.live")>0 or InStr(sjmp5_getlyurl,"search=")>0  then 
if InStr(sjmp5_getlyurl,"baidu.")>0 or InStr(sjmp5_getlyurl,"soso.")>0 or InStr(sjmp5_getlyurl,"sogou.")>0 or InStr(sjmp5_getlyurl,"search=")>0 then 

if InStr(sjmp5_getlyurl,"baidu.")>0 and InStr(sjmp5_getlyurl,"word=")>0 then 
   sjmp5_http5="baidu"
   sjmp5=split(sjmp5_getlyurl,"word=")
   sjmp4=split(sjmp5(1),"&")
elseif InStr(sjmp5_getlyurl,"baidu.")>0 and InStr(sjmp5_getlyurl,"wd=")>0 then 
   sjmp5_http5="baidu"
   sjmp5=split(sjmp5_getlyurl,"wd=")
   sjmp4=split(sjmp5(1),"&")
elseif InStr(sjmp5_getlyurl,"soso.")>0 then
   sjmp5_http5="soso"
   sjmp5=split(sjmp5_getlyurl,"w=") 
   sjmp4=split(sjmp5(1),"&")
elseif InStr(sjmp5_getlyurl,"sogou.")>0 then
   sjmp5_http5="sogou"
   sjmp5=split(sjmp5_getlyurl,"query=") 
   sjmp4=split(sjmp5(1),"&")
elseif InStr(sjmp5_getlyurl,"search=")>0 then
   sjmp5_http5="qt"
   sjmp5=split(sjmp5_getlyurl,"search=") 
   sjmp4=split(sjmp5(1),"&")
end if
sjmp5_key_url=sjmp5_http5
sjmp5_key_name=URLDecode(sjmp4(0))
Function URLDecode(enStr)
dim deStr
dim c,i,v
deStr=""
for i=1 to len(enStr)
  c=Mid(enStr,i,1)
  if c="%" then
   v=eval("&h"+Mid(enStr,i+1,2))
   if v<128 then
    deStr=deStr&chr(v)
    i=i+2
   else
    if isvalidhex(mid(enstr,i,3)) then
     if isvalidhex(mid(enstr,i+3,3)) then
      v=eval("&h"+Mid(enStr,i+1,2)+Mid(enStr,i+4,2))
      deStr=deStr&chr(v)
      i=i+5
     else
      v=eval("&h"+Mid(enStr,i+1,2)+cstr(hex(asc(Mid(enStr,i+3,1)))))
      deStr=deStr&chr(v)
      i=i+3 
     end if 
    else 
     destr=destr&c
    end if
   end if
  else
   if c="+" then
    deStr=deStr&" "
   else
    deStr=deStr&c
   end if
  end if
next
URLDecode=deStr
end function
function isvalidhex(str)
dim c
isvalidhex=true
str=ucase(str)
if len(str)<>3 then isvalidhex=false:exit function
if left(str,1)<>"%" then isvalidhex=false:exit function
  c=mid(str,2,1)
if not (((c>="0") and (c<="9")) or ((c>="A") and (c<="Z"))) then isvalidhex=false:exit function
  c=mid(str,3,1)
if not (((c>="0") and (c<="9")) or ((c>="A") and (c<="Z"))) then isvalidhex=false:exit function
end function
Call sjmp5_keyword2()
else
if InStr(sjmp5_getlyurl,"google.")>0 then 
   sjmp5_http5="google"
   sjmp5=split(sjmp5_getlyurl,"q=") 
   sjmp4=split(sjmp5(1),"&")
elseif InStr(sjmp5_getlyurl,"youdao.")>0 and InStr(sjmp5_getlyurl,"search?q=")>0 then
   sjmp5_http5="youdao"
   sjmp5=split(sjmp5_getlyurl,"?q=") 
   sjmp4=split(sjmp5(1),"&")
elseif InStr(sjmp5_getlyurl,"youdao.")>0 and InStr(sjmp5_getlyurl,"&q=")>0 then
   sjmp5_http5="youdao"
   sjmp5=split(sjmp5_getlyurl,"&q=") 
   sjmp4=split(sjmp5(1),"&")
elseif InStr(sjmp5_getlyurl,"yahoo.")>0 then
   sjmp5_http5="yahoo"
   sjmp5=split(sjmp5_getlyurl,"p=") 
   sjmp4=split(sjmp5(1),"&")
elseif InStr(sjmp5_getlyurl,"search.live")>0 then
   sjmp5_http5="MSN"
   sjmp5=split(sjmp5_getlyurl,"q=") 
   sjmp4=split(sjmp5(1),"&")
else
   sjmp5_http5="baidu"
   sjmp5=split(sjmp5_getlyurl,"wd=") 
   sjmp4=split(sjmp5(1),"&")
end if
UTFStr=sjmp4(0)
function UTF2GB(UTFStr) 
for Dig=1 to len(UTFStr) 
if mid(UTFStr,Dig,1)="%" then 
if len(UTFStr) >= Dig+8 then 
   GBStr=GBStr & ConvChinese(mid(UTFStr,Dig,9)) 
   Dig=Dig+8 
else 
   GBStr=GBStr & mid(UTFStr,Dig,1) 
end if 
else 
   GBStr=GBStr & mid(UTFStr,Dig,1) 
end if 
next 
   UTF2GB=GBStr 
end function 
function ConvChinese(x) 
   A=split(mid(x,2),"%") 
   i=0 
   j=0 
for i=0 to ubound(A) 
   A(i)=c16to2(A(i)) 
next 
for i=0 to ubound(A)-1 
   DigS=instr(A(i),"0") 
   Unicode="" 
for j=1 to DigS-1 
if j=1 then 
   A(i)=right(A(i),len(A(i))-DigS) 
   Unicode=Unicode & A(i) 
else 
   i=i+1 
   A(i)=right(A(i),len(A(i))-2) 
   Unicode=Unicode & A(i) 
end if 
next 
if len(c2to16(Unicode))=4 then 
   ConvChinese=ConvChinese & chrw(int("&H" & c2to16(Unicode))) 
else 
   ConvChinese=ConvChinese & chr(int("&H" & c2to16(Unicode))) 
end if 
next 
end function 
function c2to16(x) 
   i=1 
for i=1 to len(x) step 4 
   c2to16=c2to16 & hex(c2to10(mid(x,i,4))) 
next 
end function 
function c2to10(x) 
   c2to10=0 
if x="0" then exit function 
   i=0 
for i= 0 to len(x) -1 
if mid(x,len(x)-i,1)="1" then c2to10=c2to10+2^(i) 
next 
end function 
function c16to2(x) 
   i=0 
for i=1 to len(trim(x)) 
   tempstr= c10to2(cint(int("&h" & mid(x,i,1)))) 
do while len(tempstr)<4 
   tempstr="0" & tempstr 
loop 
   c16to2=c16to2 & tempstr 
next 
end function 
function c10to2(x) 
   mysign=sgn(x) 
   x=abs(x) 
   DigS=1 
do 
if x<2^DigS then 
exit do 
else 
   DigS=DigS+1 
end if 
loop 
   tempnum=x 
   i=0 
for i=DigS to 1 step-1 
if tempnum>=2^(i-1) then 
   tempnum=tempnum-2^(i-1) 
   c10to2=c10to2 & "1" 
else 
   c10to2=c10to2 & "0" 
end if 
next 
if mysign=-1 then c10to2="-" & c10to2 
end function 
sjmp5_key_name=UTF2GB(UTFStr)
sjmp5_key_url=sjmp5_http5
Call sjmp5_keyword()
end if
end if
rs.close
set rs=nothing
conn2.close
set conn2=nothing
%>