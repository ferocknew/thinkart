<!--下载信息-->
<!--接收参数：did 不可为空-->
<!--#include file="../Adapter/DownloadFileAdapter.asp" -->
<%
If Not IsNumeric(pid) Then pid = 0 End If
set showDownloadFile = DownloadFileManager.GetDownloadFileById(did)
%>
<script type="text/javascript">
try{$('#DownloadFile_ShowName').val('<%=showDownloadFile.ShowName%>');}catch(e){}
try{$('#DownloadFile_FileName').val('<%=showDownloadFile.FileName%>');}catch(e){}
try{$('#DownloadFile_Keywords').val('<%=showDownloadFile.Keywords%>');}catch(e){}
try{$('#DownloadFile_Abstract').val('<%=showDownloadFile.Abstract%>');}catch(e){}
try{$('#DownloadFile_ClassName').val('<%=showDownloadFile.ClassName%>');}catch(e){}
</script>