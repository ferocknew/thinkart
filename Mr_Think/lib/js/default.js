$(function(){
	//html��ʽ���ϵͳ��Ϣ
	var get_info_url="lib/dataoutput/inf_xmlout.asp";
	$.getJSON(get_info_url,{"code":"json"},loaddoc);

});