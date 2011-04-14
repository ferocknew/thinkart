<a href="<%=pagename%>?page=<%=lastpage%>"><img src="images/btm_prevPage.gif" align="top" border="0" /></a>
 第 <%=pageindex%> 页 共 <%=setpagecount%> 页 
<a href="<%=pagename%>?page=<%=lastpage%>"><img src="images/btm_nextPage.gif" align="top" border="0" /></a>
&nbsp;&nbsp; 选择 
<input name="pageindex" type="text" class="input_page" id="pageindex" size="2" maxlength="2" />
页 
<a href="#" onclick="window.location='<%=pagename%>?page='+document.getElementById('pageindex').value"><img src="images/btm_enter.gif" align="top" border="0" /></a>