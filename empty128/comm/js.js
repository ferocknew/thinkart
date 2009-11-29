/*
 --系统通用函数--
 Edit by 2009-11-28
 */
 //获取URL当前目录
function get_url_show(){
	var url_r=location.href;
	url_r=url_r.toString().split("/");
	var url_out=url_r[0];
	for (i=1;i<url_r.length-1;i++){url_out+="/"+url_r[i];};
	return url_out;
}
 //限制文本宽度
function init(content,allowedLength){
//    var content = document.getElementById("div1").innerHTML;
    var flag = false;
    while(content.replace(/[^\x00-\xff]/g,"xx").length > allowedLength){
        content = content.substring(0,content.length - 1);
        flag = true;
    }
    if(flag){
        content += "...";
    }
//    document.getElementById("div1").innerHTML = content;
	return content;
    
}
//js返回URL的host信息
function show_FromHost(){
    var FromHost = document.referrer;
    var doshow = FromHost.split("/");
    return doshow[2];
}

//Cookie操作
function SetCookie(name, value, hour){
    if (hour > 0) {
        var exp = new Date();
        exp.setTime(exp.getTime() + hour * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";path=/;expires=" + exp.toGMTString();
    }
    else {
        document.cookie = name + "=" + escape(value) + ";path=/;";
    }
}

function GetCookie(name){
    var arr = null;
    var reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg)) 
        return arr[2];
    else 
        return null;
}

function DelCookie(name){
    SetCookie(name, "null", 1);
    
}

//无响应显示
function Failure_ajax(){
    alert("远程数据出错！请咨询管理员！");
    return false
}

//选取body里所有的name的元素
function $TagN(name){
    return document.getElementsByTagName ? document.getElementsByTagName(name) : new Array()
}

//文本过长截取
function mCutStr(text, len){
    if (text.length < len) {
        return text;
    }
    else {
        var pos = 0;
        for (i = 0; i < len; i++) {
            (text.substr(i, 1).charCodeAt(0) >= 160) ? i++ : "";
            pos++;
        }
        return text.substr(0, pos) + "..";
    }
}

//按比例调整图片大小函数
function DrawImage(ImgD, FitWidth, FitHeight){
    var image = new Image();
    image.src = ImgD.src;
    if (image.width > 0 && image.height > 0) {
        if (image.width / image.height >= FitWidth / FitHeight) {
            if (image.width > FitWidth) {
                ImgD.width = FitWidth;
                ImgD.height = (image.height * FitWidth) / image.width;
                ImgD.title = "在新窗口打开图片";
                ImgD.style.cursor = "hand";
                ImgD.onclick = (function(v){
                    return function(){
                        window.open(v);
                    };
                })(ImgD.src);
            }
            else {
                ImgD.width = image.width;
                ImgD.height = image.height;
            }
        }
        else {
            if (image.height > FitHeight) {
                ImgD.height = FitHeight;
                ImgD.width = (image.width * FitHeight) / image.height;
                ImgD.title = "在新窗口打开图片";
                ImgD.style.cursor = "hand";
                ImgD.onclick = (function(v){
                    return function(){
                        window.open(v);
                    };
                })(ImgD.src);
            }
            else {
                ImgD.width = image.width;
                ImgD.height = image.height;
            }
        }
    }
}

//返回html标签数组
function $TagN(name){
    return document.getElementsByTagName ? document.getElementsByTagName(name) : new Array()
}

//文本框限制
function regInput(obj, reg, inputStr){
    var docSel = document.selection.createRange()
    if (docSel.parentElement().tagName != "INPUT") 
        return false
    oSel = docSel.duplicate()
    oSel.text = ""
    var srcRange = obj.createTextRange()
    oSel.setEndPoint("StartToStart", srcRange)
    var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length)
    return reg.test(str)
}

//编码转换函数
function UrlEncode(str){
    return encodeURIComponent(escape(str));
}

function UrlDecode(str){
    return unescape(decodeURIComponent(str));
}

/*--系统通用类--*/
//给出浏览器居中坐标
function DialogLoc(t_DiglogW, t_DiglogH){
    var dde = document.documentElement;
    if (window.innerWidth) {
        var ww = window.innerWidth;
        var wh = window.innerHeight;
        var bgX = window.pageXOffset;
        var bgY = window.pageYOffset;
    }
    else {
        var ww = dde.offsetWidth;
        var wh = dde.offsetHeight;
        var bgX = dde.scrollLeft;
        var bgY = dde.scrollTop;
    }
    this.t_DiglogX = (bgX + ((ww - t_DiglogW) / 2));
    this.t_DiglogY = (bgY + ((wh - t_DiglogH) / 2));
}

//测试浏览器
function Browser(){
    var ua, s, i;
    this.isIE = false;
    this.isNS = false;
    this.isOP = false;
    this.isSF = false;
    ua = navigator.userAgent.toLowerCase();
    s = "opera";
    if ((i = ua.indexOf(s)) >= 0) {
        this.isOP = true;
        return;
    }
    s = "msie";
    if ((i = ua.indexOf(s)) >= 0) {
        this.isIE = true;
        return;
    }
    s = "netscape6/";
    if ((i = ua.indexOf(s)) >= 0) {
        this.isNS = true;
        return;
    }
    s = "gecko";
    if ((i = ua.indexOf(s)) >= 0) {
        this.isNS = true;
        return;
    }
    s = "safari";
    if ((i = ua.indexOf(s)) >= 0) {
        this.isSF = true;
        return;
    }
}

//*****************************************************
//checkbox输出类
//*****************************************************
function docheckbox(checkboxname){
    var boxes = document.getElementsByName(checkboxname);
    //checkbox的个数
    this.extent = boxes.length;
    if (boxes.length == 0) {
        return false;
    }
    else {
        var num = 0;
        var groupTypeId = new Array();
        for (var i = 0; i < boxes.length; i++) {
            if (boxes[i].checked) {
                groupTypeId[i] = boxes[i].value;
                num += 1;
            }
        }
        //输出checkbox的value
        this.value = groupTypeId;
        groupTypeId = null;
        //checkbox的选择个数
        this.checkednum = num;
        //自定义分隔符输出
        this.outvalue = function(separator){
            if (boxes.length == 0) {
                return false;
            }
            else {
                var new_value = "";
                for (var i = 0; i < boxes.length; i++) {
                    if (boxes[i].checked) {
                        new_value = new_value + boxes[i].value + separator;
                    }
                }
                return new_value;
            }
        }
    }
}

//单个调整图片的宽
function Reimg_alone_width(some_one, width_num){
    if (some_one.width > width_num) {
        some_one.width = width_num;
    }
}

//单个调整图片的高
function Reimg_alone_height(some_one, height_num){
    if (some_one.height > height_num) {
        some_one.height = height_num;
    }
}
//出处:网上搜集
//made by yaosansi 2005-12-02
//For more visit http://www.yaosansi.com
// Trim() , Ltrim() , RTrim()

String.prototype.Trim = function(){
    return this.replace(/(^s*)|(s*$)/g, "");
}

String.prototype.LTrim = function(){
    return this.replace(/(^s*)/g, "");
}

String.prototype.RTrim = function(){
    return this.replace(/(s*$)/g, "");
}
