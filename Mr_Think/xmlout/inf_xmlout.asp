<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<%
Dim data_xml,show_code,act,SQL,DBField
show_code=SafeRequest("code",0)
act=SafeRequest("act",0)

Select Case act
Case "edit" '修改 info
Dim sitename,comnam,leader,siteicp,siteurl
sitename=Trim(CheckStr(Request.Form("sitename")))
comnam=Trim(CheckStr(Request.Form("comnam")))
leader=Trim(CheckStr(Request.Form("leader")))
siteicp=Trim(CheckStr(Request.Form("siteicp")))
siteurl=Trim(CheckStr(Request.Form("siteurl")))

Set conn_info = Server.CreateObject("ADODB.RecordSet")
DBField="site_name,com_name,leader,site_icp,site_url"
SQL="SELECT "&DBField&" FROM info where (id=1)"
conn_info.Open SQL, Conn, 1, 3
conn_info("site_name")=sitename
conn_info("com_name")=comnam
conn_info("leader")=leader
conn_info("site_icp")=siteicp
conn_info("site_url")=siteurl
conn_info.update
conn_info.close:Set conn_info=Nothing
FreeMemory
getInfo(1)

End Select

Select Case show_code
Case "json" 'json 部分
set json_temp=new Aien_Json
json_temp.JsonType="object"
json_temp.addData "site_name",site_name
json_temp.addData "com_name",com_name
json_temp.addData "site_logo",site_logo
json_temp.addData "site_leader",site_leader
json_temp.addData "site_icp",site_icp
json_temp.addData "site_url",site_url
json_temp.addData "intro_abstract",intro_abstract

Set json=new Aien_Json
json.JsonType="object"
json.addData "info",json_temp

Call jsonheadResponse()
Response.Write(json.getJson(json))
Set json=Nothing
Set json_temp=Nothing

Case Else 'xml 部分
Set data_xml=new PXML
Call data_xml.Create("root")
Set item_xml=data_xml.XMLRoot()
Call data_xml.AddNode("info",item_xml)
Set item_xml=data_xml.SelectXmlNode("info",0)
Call data_xml.AddAttribute("site_name",site_name,item_xml) '添加属性 site_name
Call data_xml.AddAttribute("com_name",com_name,item_xml) '添加属性 com_name
Call data_xml.AddAttribute("site_logo",site_logo,item_xml) '添加属性 site_logo
Call data_xml.AddAttribute("site_leader",site_leader,item_xml) '添加属性 site_leader
Call data_xml.AddAttribute("site_icp",site_icp,item_xml) '添加属性 site_icp
Call data_xml.AddAttribute("site_url",site_url,item_xml) '添加属性 site_url
Call data_xml.AddNode("intro_abstract",item_xml)
Set item_xml=data_xml.SelectXmlNode("info/intro_abstract",0)
Call data_xml.AddText("1",intro_abstract,item_xml) '添加子节点 intro_abstract

Call xmlheadResponse("utf-8")
data_xml.RespXml()
Set data_xml=Nothing
End Select

Call CloseDB()
%>