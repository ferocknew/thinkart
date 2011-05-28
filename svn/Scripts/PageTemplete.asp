<!--jumpstyle若为load则使用loadHTML方式，否则使用window.location方式-->
<%
If jumpstyle="" Then jumpstyle="load" End If
paraClassID=""
If ClassID<>"" Then
	paraClassID="&ClassID="& ClassID
End If
%>
<a <%If jumpstyle="load" Then%>href="#" onclick="loadHTML('<%=pagename%>?page=<%=lastpage%><%=paraClassID%>')"<%Else%>href="<%=pagename%>?page=<%=lastpage%><%=paraClassID%>"<%End If%>><img src="../WebSystem/images/btm_prevPage.gif" align="top" /></a>
 第 <%=pageindex%> 页 共 <%=setpagecount%> 页 
<a <%If jumpstyle="load" Then%>href="#" onclick="loadHTML('<%=pagename%>?page=<%=nextpage%><%=paraClassID%>')"<%Else%>href="<%=pagename%>?page=<%=nextpage%><%=paraClassID%>"<%End If%>><img src="../WebSystem/images/btm_nextPage.gif" align="top" /></a>
&nbsp;&nbsp; 选择 
<input name="pageindex" type="text" class="input_page" id="pageindex" maxlength="2" size="2" />
页 
<a href="#" onclick="<%If jumpstyle="load" Then%>loadHTML('<%=pagename%>?page='+document.getElementById('pageindex').value+'<%=paraClassID%>')<%Else%>window.location='<%=pagename%>?page='+document.getElementById('pageindex').value+'<%=paraClassID%>'<%End If%>"><img src="../WebSystem/images/btm_enter.gif" align="top" /></a>