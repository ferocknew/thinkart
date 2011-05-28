<%
set objSite=server.CreateObject("MicroSoft.XMLDom")
objSite.load(Server.MapPath("Site.xml"))
set SiteXML_SiteName=objSite.documentElement.SelectSingleNode("//Site/SiteName")
set SiteXML_IcpNum=objSite.documentElement.SelectSingleNode("//Site/IcpNum")
set SiteXML_SeoKeywords=objSite.documentElement.SelectSingleNode("//Site/SeoKeywords")
set SiteXML_SeoDesc=objSite.documentElement.SelectSingleNode("//Site/SeoDesc")
set SiteXML_SiteCopyright=objSite.documentElement.SelectSingleNode("//Site/SiteCopyright")
set SiteXML_AdminPath=objSite.documentElement.SelectSingleNode("//Site/AdminPath")
set SiteXML_SiteOn=objSite.documentElement.SelectSingleNode("//Site/SiteOn")
set SiteXML_NewDays=objSite.documentElement.SelectSingleNode("//Site/NewDays")
set SiteXML_HotCount=objSite.documentElement.SelectSingleNode("//Site/HotCount")
set SiteXML_EditWidth=objSite.documentElement.SelectSingleNode("//Site/EditWidth")
set SiteXML_State=objSite.documentElement.SelectSingleNode("//Site/State")

'objSite.save(Server.MapPath("Site.xml"))
%>