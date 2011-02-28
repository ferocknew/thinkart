<!--#include file="../Service/DownloadFileService.asp"-->
<%
Class DownloadFileAdapter

	Public Function InsertDownloadFile(objDownloadFile)
		InsertDownloadFile="插入失败！"
		DownloadFileDao.InsertDownloadFile(objDownloadFile)
		InsertDownloadFile="插入成功！"
	End Function
	
	Public Function DeleteDownloadFile(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		If IsNumeric(id) Then
			DownloadFileDao.DeleteDownloadFile(id)
			DeleteDownloadFile="删除成功！"
		Else
			DeleteDownloadFile="删除失败！"
		End If
	End Function
	
	Public Function UpdateDownloadFile(objDownloadFile)
		UpdateDownloadFile="修改失败！"
		
		DownloadFileDao.UpdateDownloadFile(objDownloadFile)
		UpdateDownloadFile="修改成功！"
	End Function
	
	Public Function GetAllDownloadFile()
		Set GetAllDownloadFile=DownloadFileDao.GetAllDownloadFile()
	End Function
	
	Public Function GetDownloadFileById(id)
		If id = "" Or Not IsNumeric(id) Then
			id = "0"
		End If
		Set GetDownloadFileById = DownloadFileDao.GetDownloadFileById(id)
	End Function
	
	Public Function GetDownloadFileByClassID(ClassID)
		If id = "" Or Not IsNumeric(ClassID) Then
			id = "0"
		End If
		Set GetDownloadFileByClassID = DownloadFileDao.GetDownloadFileByClassID(ClassID)
	End Function
	
	Public Function GetDownloadFileByKeyWords(KeyWords)
		Set GetDownloadFileByKeyWords = DownloadFileDao.GetDownloadFileByKeyWords(KeyWords)
	End Function
End Class

Set DownloadFileManager = new DownloadFileAdapter
%>