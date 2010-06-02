/*
 --系统通用函数--
 Edit by 2009-11-28
 */
//对象合并
function extend(des, src, override){
    if(src instanceof Array){
        for(var i = 0, len = src.length; i < len; i++)
             extend(des, src[i], override);
    }
    for( var i in src){
        if(override || !(i in des)){
            des[i] = src[i];
        }
    }
    return des;
}
function getType(o) {
  var _t; return ((_t = typeof(o)) == "object" ? o==null && "null" || Object.prototype.toString.call(o).slice(8,-1):_t).toLowerCase();
}
 //偏函数
function partial(fn){
    var args=[].slice.call(arguments,1);
    return function (){
        var cargs=[].slice.call(arguments)
        for(var i=0,l=args.length;i<l;i++)
            if(args[i]=='_')args[i]=cargs.shift();
        return fn.apply(this,args.concat(cargs))
    }
}
//获取地址栏get变量值
function getvalue(name){
    var str = window.location.search;
    if (str.indexOf(name) != -1) {
        var pos_start = str.indexOf(name) + name.length + 1;
        var pos_end = str.indexOf("&", pos_start);
        if (pos_end == -1) {
            return str.substring(pos_start);
        }
        else {
            return str.substring(pos_start, pos_end)
        }
    }
    else {
        return null;
    }
}
//获取URL当前目录
function get_url_show(type){
    var url_r = location.href;
    url_r = url_r.toString().split("/");
    var url_out = "";
    switch (type) {
        case "end_file":
            url_out = url_r[url_r.length - 1];
            url_out = url_out.toString().split("?");
            return url_out[0];
            break;
        default:
            url_out = url_r[0];
            for (i = 1; i < url_r.length - 1; i++) {
                url_out += "/" + url_r[i];
            }
            ;
            return url_out;
            break;
    }

}

//限制文本宽度
function init(content, allowedLength){
    //    var content = document.getElementById("div1").innerHTML;
    var flag = false;
    while (content.replace(/[^\x00-\xff]/g, "xx").length > allowedLength) {
        content = content.substring(0, content.length - 1);
        flag = true;
    }
    if (flag) {
        content += "...";
    }
    //    document.getElementById("div1").innerHTML = content;
    return content;

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
/*
 String.prototype.Trim = function(){
 return this.replace(/(^s*)|(s*$)/g, "");
 }
 */
String.prototype.LTrim = function(){
    return this.replace(/(^s*)/g, "");
}

String.prototype.RTrim = function(){
    return this.replace(/(s*$)/g, "");
}

Date.prototype.format = function(format) //author: meizz
{
    var o = {
        "M+": this.getMonth() + 1, //month
        "d+": this.getDate(), //day
        "h+": this.getHours(), //hour
        "m+": this.getMinutes(), //minute
        "s+": this.getSeconds(), //second
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
        "S": this.getMilliseconds() //millisecond
    }
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}/*
 *jquery select 操作方法
 */
;
(function($){
    jQuery.fn.SelectSize = function(){
        return jQuery(this).get(0).options.length;
    }
    //获得选中项的索引
    jQuery.fn.getSelectedIndex = function(){
        return jQuery(this).get(0).selectedIndex;
    }
    //获得当前选中项的文本
    jQuery.fn.getSelectedText = function(){
        if (this.SelectSize() == 0) {
            return "下拉框中无选项";
        }
        else {
            var index = this.getSelectedIndex();
            return jQuery(this).get(0).options[index].text;
        }
    }
    //获得当前选中项的值
    jQuery.fn.getSelectedValue = function(){
        if (this.SelectSize() == 0) {
            return "下拉框中无选中值";
        }
        else {
            return jQuery(this).val();
        }
    }
    //设置select中值为value的项为选中
    jQuery.fn.setSelectedValue = function(value){
        jQuery(this).get(0).value = value;
    }
    //设置select中文本为text的第一项被选中
    jQuery.fn.setSelectedText = function(text){
        var isExist = false;
        var count = this.SelectSize();
        for (var i = 0; i < count; i++) {
            if (jQuery(this).get(0).options[i].text == text) {
                jQuery(this).get(0).options[i].selected = true;
                isExist = true;
                break;
            }
        }
        if (!isExist) {
            alert("下拉框中不存在该项");
        }
    }
    //设置选中指定索引项
    jQuery.fn.setSelectedIndex = function(index){
        var count = this.SelectSize();
        if (index >= count || index < 0) {
            alert("选中项索引超出范围");
        }
        else {
            jQuery(this).get(0).selectedIndex = index;
        }
    }
    //判断select项中是否存在值为value的项
    jQuery.fn.isExistItem = function(value){
        var isExist = false;
        var count = this.SelectSize();
        for (var i = 0; i < count; i++) {
            if (jQuery(this).get(0).options[i].value == value) {
                isExist = true;
                break;
            }
        }
        return isExist;
    }
    //向select中添加一项，显示内容为text，值为value,如果该项值已存在，则提示
    jQuery.fn.addOption = function(text, value){
        if (this.isExistItem(value)) {
            alert("待添加项的值已存在");
        }
        else {
            jQuery(this).get(0).options.add(new Option(text, value));
        }
    }
    //删除select中值为value的项，如果该项不存在，则提示
    jQuery.fn.removeItem = function(value){
        if (this.isExistItem(value)) {
            var count = this.SelectSize();
            for (var i = 0; i < count; i++) {
                if (jQuery(this).get(0).options[i].value == value) {
                    jQuery(this).get(0).remove(i);
                    break;
                }
            }
        }
        else {
            alert("待删除的项不存在!");
        }
    }
    //删除select中指定索引的项
    jQuery.fn.removeIndex = function(index){
        var count = this.SelectSize();
        if (index >= count || index < 0) {
            alert("待删除项索引超出范围");
        }
        else {
            jQuery(this).get(0).remove(index);
        }
    }
    //删除select中选定的项
    jQuery.fn.removeSelected = function(){
        var index = this.getSelectedIndex();
        this.removeIndex(index);
    }
    //清除select中的所有项
    jQuery.fn.clearAll = function(){
        for (var i in $(this).get()) {
            $(this).get(i).options.length = 0;
        }
    }
})(jQuery);