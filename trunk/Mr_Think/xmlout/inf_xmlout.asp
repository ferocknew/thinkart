<!--#include file="../const.asp" -->
<!--#include file="conn_xmlout.asp" -->
<!--#include file="../header_commad.asp" -->
<%
Dim data_xml
Call xmlheadResponse("utf-8")
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
Call data_xml.AddAttribute("intro_abstract",intro_abstract,item_xml) '添加属性 site_url
Call data_xml.AddNode("intro_abstract",item_xml)
Set item_xml=data_xml.SelectXmlNode("info/intro_abstract",0)
Call data_xml.AddText("1",intro_abstract,item_xml)



data_xml.RespXml()
Set data_xml=Nothing
Call CloseDB()
%>