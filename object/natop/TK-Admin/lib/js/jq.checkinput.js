/**
* power by wooshoo copyright 2008-2009
* 程序名：JQuery 专用输入检查器
* 内容：专门针对input[text password hidden]以及textarea的用户输入进行检查
* 检查的范围包括：字符数、是否包含特殊字符、是否为整数、是否符合email格式、是否为电话号码、
* 是否为网站地址、是否为图片地址、是否为浮点小数、是否为人民币货币、是否为日期格式
* 是否为时间格式、是否为日期时间格式、是否为密码格式（仅包含大小写字母、数字及底划线）、
* 暂不可用：是否为非英数特殊字符格式（即仅为中文、日文、韩文等大字符语言）、是否包含html标签、是否包含UBB标签、
*
*/
(function($) {
var wshc = $.fn.check = function(){
return wshc.fn.init(this);
}
DATETIME = {
FULL: "full",
SIMPLE: "simple",
ENGLISH: "english",
JAPANESE: "japanese",
CHINESE: "chinese"
}
wshc.fn = {
init: function(obj){
wshc.fn.val = obj.val();
return wshc.fn;
},
notNull: function(){
if(this.val !== "" || this.val !== undefined){
return true;
}
error("您没有输入任何字符。");
return false;
},
number: function(min,max){//检查字数是否超过限制
if(this.val.length >= min && this.val.length <= max){
return true;
}
error(" 您输入的字符超过了"+min+"-"+max+"的限制。");
return false;
},
specialChar: function(pat){//检查是否包含特殊字符
//特殊字符包括：\ / @ # $ % ^ & * = < > \n \r
//如果需要自定义，可以在参数中设定
pat = pat || /[\\\/\@\#\$\%\^\&\*\=\<\>\n\r]+/;
error("您输入的字符包含了一些特殊字符。");
return mat(this.val,pat);
},
isNum: function(len){//检查是否为数字
if(!isNaN(this.val)){
return true;
}
error("您输入的不是数字。");
return false;
},
integer: function(){//检查是否为整数
if(this.val == parseInt(this.val)){
return true;
}
error("您输入的不是整数。");
return false;
},
float: function(){//检查是否为小数
if(this.isNum() && !this.integer()){
return true;
}
error("您输入的不是小数。");
return false;
},
rmb: function(){//检查是否为货币（RMB标准格式为：0.00 or 10.00 除个位数外首位不为零）
var pat = /^([1-9][0-9]+|[0-9])\.[0-9]{2}$/;
if(!mat(this.val,pat)){error("您输入的不是人民币货币格式。");}
return mat(this.val,pat);
},
email: function(pat){//检查是否符合电子邮件格式
pat = pat || /^[a-zA-Z0-9_\-\.]+@[a-zA-Z0-9_\-\.]+\.[a-zA-Z]{0,4}$/;
if(!mat(this.val,pat)){error(" 您输入的不是电子邮件格式。");}
return mat(this.val,pat);
},
http: function(pat){//检查是否为网站的地址（包含http）
pat = pat || /^(http|HTTP):\/\/[^s]*/;
if(!mat(this.val,pat)){error("您输入的不是通用网址格式。")};
return mat(this.val,pat);
},
url: function(pat){//检查是否为通信地址
pat = pat || /^[a-zA-z]+:\/\/[^s]*/;
if(!mat(this.val,pat)){error("您输入的不是通用通信协议格式。");}
return mat(this.val,pat);
},
image: function(pat){//检查是否为图片地址(jpg gif png bmp jpeg )
pat = pat || /^(http|HTTP):\/\/[^s]*(jpg|JPG|png|PNG|gif|GIF|bmp|BMP|jpeg|JPEG)$/;
if(!mat(this.val,pat)){error(" 您输入的不是网页允许的图片格式。");}
return mat(this.val,pat);
},
password: function(pat){
pat = pat || /^\w*$/;
if(!mat(this.val,pat)){error("您输入的不是密码格式。");}
return mat(this.val,pat);
},
tel: function(pat){
pat = pat || /^\d{3}\-\d{8}$|^\d{4}\-\d{7}$/;
if(!mat(this.val,pat)){error("您输入的不是中国地区的固定电话格式。");}
return mat(this.val,pat);
},
mobile: function(pat){
pat = pat || /^1\d{10}$/;
if(!mat(this.val,pat)){error("您输入的不是中国地区的移动电话格式。");}
return mat(this.val,pat);
},
datatime: function(){
return DATETIME;
},
date: function(type){
var pat;
switch(type){
case DATETIME.FULL:
pat = /^(([1-9]\d{0,3}|0)\-\d{2}\-\d{2})|(([1-9]\d{0,3}|0)\.\d{2}\.\d{2})|(([1-9]\d{0,3}|0)\/\d{2}\/\d{2})$/;
break;
case DATETIME.SIMPLE:
pat = /^(\d{2}\-\d{1,2}\-\d{1,2})|(\d{2}\.\d{1,2}\.\d{1,2})|(\d{2}\/\d{1,2}\/\d{1,2})$/;
break;
case DATETIME.ENGLISH:
pat = /^\w* \d{1,2},(([1-9]\d{0,3}|0)| ([1-9]\d{0,3}|0))$/;
break;
case DATETIME.JAPANESE:
pat = /^(([1-9]\d{0,3}|0)年\d{2}月\d{2}日)$/;
break;
case DATETIME.CHINESE:
pat = /^(([1-9]\d{0,3}|0)年\d{2}月\d{2}日)$/;
break;
}
error("您输入的日期格式不正确。");
return mat(this.val,pat);
},
time: function(type){
var pat;
switch(type){
case DATETIME.FULL:
pat = /^\d{2}:\d{2}:\d{2}$/;
break;
case DATETIME.SIMPLE:
pat = /^\d{1,2}:\d{1,2}:\d{1,2}$/;
break;
case DATETIME.ENGLISH:
pat = /^\d{1,2}:\d{1,2}:\d{1,2}$/;
break;
case DATETIME.JAPANESE:
pat = /^\d{1,2}時\d{1,2}分\d{1,2}秒$/;
break;
case DATETIME.CHINESE:
pat = /^\d{1,2}时\d{1,2}分\d{1,2}秒$/;
break;
}
error("您输入的时间格式不正确。");
return mat(this.val,pat);
}
}
var mat = function(val,pat){
if (val.match(pat)) {
return true;
}
return false;
}
var error = function(err){
wshc.fn.error = err || "无格式错误。";
}
})(jQuery); 