<%Session.CodePage=65001%>
<!--#include file="light-admin/inc_checkLogin.asp"-->
<!--#include file="inc_conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CSS盒模型</title>
<link href="tpl-scripts/tpl_menu.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript" src="tpl-scripts/jquery-1.6.1.min.js"></script>

<script language="javascript">
function t_toggle(toggleObjId){
	$("#"+ toggleObjId).toggle();}
</script>
<body>
<div id="container">
  <div id="intro">
    <div id="header">
      <div id="navigation">主菜单</div>
    </div>
    
    级菜单
    <div id="content">
      <div id="menu">
        <div id="menu_title">产品列表</div>

        <ul>
			<%
            Set rs = Server.CreateObject("ADODB.Recordset")
            sql = "select * from light_class where class_type = 1 and class_level = 1 order by id desc"
            rs.open sql,Conn,1,1
            %>
            
          <%
			i = 1
			while not rs.eof%>
            <li class="menuStyle_1_normal" onClick="t_toggle('menu_lv2_<%=rs("id")%>');"><a href="#"><%=rs("class_name")%></a></li>
			
		  <%
				'———第二层分类循环开始————————————————————————————————————————————————————————————————————————————————————————————————————————————
                Set rs2 = Server.CreateObject("ADODB.Recordset")
                sql2 = "select * from light_class where class_type = 1 and class_level = 2 and class_follow = "&rs("id")&" order by id desc"
                rs2.open sql2,Conn,1,1
                %>
                
		  <%
				if rs2.eof then
				'———第二层内容循环开始————————————————————————————————————————————————————————————————————————————————————————————————————————————
                Set rs_content = Server.CreateObject("ADODB.Recordset")
                sql_content = "select * from light_content where c_follow_class_id = "&rs("id")&" order by id desc"
                rs_content.open sql_content,Conn,1,1
                %>
                
                <ul id="menu_lv2_<%=rs("id")%>">
                <%while not rs_content.eof%>
                <li class="menuStyle_2_normal"><%=rs_content("c_title")%></li>
                <%rs_content.movenext
                wend
                rs_content.close
                set rs_content = nothing%>
                </ul>
          <%
				end if
				'———第二层内容循环结束————————————————————————————————————————————————————————————————————————————————————————————————————————————
				%>
                
                <%if not rs2.eof then%>
      <ul id="menu_lv2_<%=rs("id")%>">
                <%while not rs2.eof%>
                <li class="menuStyle_2_normal" onClick="t_toggle('menu_lv3_<%=rs2("id")%>');"><a href="#"><%=rs2("class_name")%></a></li>
                
			<%
						'———第三层分类循环开始————————————————————————————————————————————————————————————————————————————————————
                        Set rs3 = Server.CreateObject("ADODB.Recordset")
                        sql3 = "select * from light_class where class_type = 1 and class_level = 3 and class_follow = "&rs2("id")&" order by id desc"
                        rs3.open sql3,Conn,1,1
                        %>
                        
						<%
                        if rs3.eof then
                        '———第三层内容循环开始————————————————————————————————————————————————————————————————————————————————————————————————————————————
                        Set rs_content2 = Server.CreateObject("ADODB.Recordset")
                        sql_content2 = "select * from light_content where c_follow_class_id = "&rs2("id")&" order by id desc"
                        rs_content2.open sql_content2,Conn,1,1
                        %>
                        
                        <ul id="menu_lv3_<%=rs2("id")%>">
                        <%while not rs_content2.eof%>
                        <li class="menuStyle_3_normal"><%=rs_content2("c_title")%></li>
                        <%rs_content2.movenext
                        wend
                        rs_content2.close
                        set rs_content2 = nothing%>
                        </ul>
                        <%
                        end if
                        '———第三层内容循环结束————————————————————————————————————————————————————————————————————————————————————————————————————————————
                        %>
                        
                        <%if not rs3.eof then%>
                        <ul id="menu_lv3_<%=rs2("id")%>">
						<%while not rs3.eof%>                        
                        <li onclick="t_toggle('menu_lv3_<%=rs3("id")%>');" class="menuStyle_3_normal"><a href="#"><%=rs3("class_name")%></a></li>
                        		<%
								'———第四层内容循环开始————————————————————————————————————————————————————————————————————————————————————
								Set rs_content3 = Server.CreateObject("ADODB.Recordset")
								sql_content3 = "select * from light_content where c_follow_class_id = "&rs3("id")&" order by id desc"
								rs_content3.open sql_content3,Conn,1,1
								%>
                                
                      <ul id="menu_lv3_<%=rs3("id")%>">
                                <%while not rs_content3.eof%>
                                <li class="menuStyle_4_normal"><a href="#"><%=rs_content3("c_title")%></a></li>
                                <%rs_content3.movenext
                                wend
                                rs_content3.close
                                set rs_content3 = nothing%>
                                </ul>
                                <%
								'———第四层内容循环结束————————————————————————————————————————————————————————————————————————————————————
								%>
                                
						<%rs3.movenext
                        wend
                        rs3.close
                        set rs3 = nothing%>
                        </ul>
            <%end if
						'———第三层分类循环结束————————————————————————————————————————————————————————————————————————————————————
						%>
                
        <%rs2.movenext
				wend
				rs2.close
				set rs2 = nothing%>
                </ul>
          <%end if
				'———第二层分类循环结束————————————————————————————————————————————————————————————————————————————————————————————————————————————
				%>
                
            <%
			i = i + 1
			rs.movenext
			wend
			rs.close
			set rs = nothing%>
        </ul>

      </div>
      <div id="innerContent">
        <h1>内容标题</h1>
        <p>1月27日，省委、省政府召开电视电话会议，就贯彻落实中央新修订的《关于实行党风廉政建设责任制的规定》作出部署。电视电话会议结束后，无锡分会场续会。江苏省委常委、无锡市委书记杨卫泽就贯彻落实《规定》提出了要求。 </p>
        <p>市委、市人大、市政府、市政协全体领导同志；市人大各工委、市政协各专委主要负责同志
          <!--ADV_CONTENT-->
          ；市纪委常委，市法院、检察院主要负责人；市各部委办局、人民团体、直属单位主要负责同志，各市(县)区五套班子领导收听收看了电视电话会议。 </p>
        <p>杨卫泽指出，全省电视电话会议对贯彻落实《规定》提出了明确要求，各地各部门和各级领导干部要把学习和贯彻落实《规定》作为一项重大政治任务，认真学习、深刻领会，以扎实有效的措施把《规定》落到实处。当前，要抓宣传，充分发挥媒体的作用，在全社会广泛宣传《规定》，组织各级党员领导干部集中学习，为责任制的贯彻落实创造良好氛围和条件；要抓巡察，切实加强对领导班子及其成员落实党风廉政建设责任制情况的日常监督，实现党风廉政建设责任制检查的规范化、制度化；要抓考核，全面客观评价各地各部门责任制落实情况和反腐倡廉建设总体状况；要抓问责，切实强化责任追究，对违反党风廉政建设责任制的，要严肃问责，决不姑息迁就。 </p>
        <p>杨卫泽强调，加强反腐倡廉建设，领导干部必须以身作则，带头廉洁自律。2011年春节即将来临，各地各部门要严格贯彻落实中央和省市新近下发的有关通知要求，切实加强廉洁自律和厉行节约工作。党员干部特别是领导干部要严格执行省委重申的&ldquo;七个严禁&rdquo;的纪律规定。他代表市委常委会就带头执行&ldquo;七个严禁&rdquo;作出公开承诺，并表示诚挚欢迎全市干部群众和新闻媒体的监督。 </p>
        <p>中共中央、国务院近日印发了《关于实行党风廉政建设责任制的规定》。《规定》是深入推进党风廉政建设和反腐败斗争的一项重要基础性法规，对于强化各级领导班子和领导干部抓反腐倡廉建设的政治责任，保证党风廉政建设和反腐败斗争各项决策部署的贯彻落实，进一步提高管党治党水平，为推动科学发展、促进社会和谐提供有力的政治保障，具有十分重要的意义。</p>
      </div>
    </div>
  </div>
  <div id="footer"></div>
</div>
</body>
</html>
