var Jexs = {
    Version: 0.01,
    RQ: SafeData(Request.QueryString),
    RF: SafeData(Request.Form)
}
Jexs.arrySort = function(objectit){
    return objectit.sort(new Function("a", "b", "return a-b;"));
}
//安全请求
function SafeData(fn){
    return function(Str, RType){
        var TempStr = fn(Str) + "";
        switch (RType) {
            case 0:
                TempStr = TempStr.replace("'", "''");
                break;
        }
        return TempStr;
    };
}

// SQL查询转对象 只读
Jexs.ADO2Obj = function(SQL, ReConn, RType){
    var rs = new ActiveXObject("ADODB.Recordset");
    rs.Open(SQL, ReConn, 1, 1);
	if(rs.EOF||rs.BOF)return [];
    var FieldsName = new Array();//字段名
    for (var i = 0; i < rs.Fields.Count; i++) {
        FieldsName[i] = rs.Fields(i).Name;
    }
    var fieldslen = rs.Fields.Count;
    var arr = rs.GetRows.toArray();
    var len = arr.length / fieldslen, data = [], sp;
    for (var i = 0; i < len; i++) {
        data[i] = new Array();
        sp = i * fieldslen;
        if (RType == 1) {
            var temp_obj = {};
            for (var j = 0; j < fieldslen; j++) {
                temp_obj[FieldsName[j]] = arr[sp + j];
            }
            data[i] = temp_obj
        }
        else {
            for (var j = 0; j < fieldslen; j++) 
                data[i][j] = arr[sp + j];
        }
    }
    return data;
    rs = null;
}
//VBArray GetRows转obj,FieldsNameArray必须是数组,fieldslen为实际字段数
Jexs.VBRows2Obj=function(DbGetRows,FieldsNameArray_a,fieldslen,RType) {
	var FieldsNameArray = FieldsNameArray_a.toArray();
	var arr=DbGetRows.toArray();
	var len=arr.length/fieldslen,data=[],sp;
	for(var i=0;i<len;i++) {
		data[i]=new Array();
		sp=i*fieldslen;
		if (FieldsNameArray.length < fieldslen) {
			J_temp = FieldsNameArray.length;
		}else{
			J_temp=fieldslen;
		}
        if (RType == 1) {
            var temp_obj = {};
            for (var j = 0; j < J_temp; j++) {
                temp_obj[FieldsNameArray[j]] = arr[sp + j];
            }
            data[i] = temp_obj
        }
        else {
            for (var j = 0; j < J_temp; j++) 
                data[i][j] = arr[sp + j];
        }
	}
	return data;
}

//打开数据库
function createConnection(IsSqlDataBase, strPath, SqlUsername, SqlPassword, SqlDatabaseName, SqlLocalName){
    try {
        Conn = Server.CreateObject("ADODB.Connection");
        if (IsSqlDataBase == "0") {
            Conn.connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath(strPath);
        }
        else {
            Conn.connectionString = "Provider = Sqloledb; User ID = " + SqlUsername + "; Password = " + SqlPassword + "; Initial Catalog = " + SqlDatabaseName + "; Data Source = " + SqlLocalName + ";"
            
        }
        Conn.open();
    } 
    catch (e) {
        Response.Write('<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />数据库连接出错，请检查连接字串!');
        Response.End
    }
}

//*************************************
//关闭数据库
//*************************************
function CloseDB(){
    try {
        Conn.close();
        Conn = null;
    } 
    catch (e) {
    }
}
