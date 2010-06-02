/*
name:jquery.lazyload.mini
webSite:http://www.appelsiini.net/projects/lazyload
demo:$("img").lazyload();
*/
(function($){$.fn.lazyload=function(options){var settings={threshold:0,failurelimit:0,event:"scroll",effect:"show",container:window};if(options){$.extend(settings,options);}
var elements=this;if("scroll"==settings.event){$(settings.container).bind("scroll",function(event){var counter=0;elements.each(function(){if($.abovethetop(this,settings)||$.leftofbegin(this,settings)){}else if(!$.belowthefold(this,settings)&&!$.rightoffold(this,settings)){$(this).trigger("appear");}else{if(counter++>settings.failurelimit){return false;}}});var temp=$.grep(elements,function(element){return!element.loaded;});elements=$(temp);});}
this.each(function(){var self=this;if(undefined==$(self).attr("original")){$(self).attr("original",$(self).attr("src"));}
if("scroll"!=settings.event||undefined==$(self).attr("src")||settings.placeholder==$(self).attr("src")||($.abovethetop(self,settings)||$.leftofbegin(self,settings)||$.belowthefold(self,settings)||$.rightoffold(self,settings))){if(settings.placeholder){$(self).attr("src",settings.placeholder);}else{$(self).removeAttr("src");}
self.loaded=false;}else{self.loaded=true;}
$(self).one("appear",function(){if(!this.loaded){$("<img />").bind("load",function(){$(self).hide().attr("src",$(self).attr("original"))
[settings.effect](settings.effectspeed);self.loaded=true;}).attr("src",$(self).attr("original"));};});if("scroll"!=settings.event){$(self).bind(settings.event,function(event){if(!self.loaded){$(self).trigger("appear");}});}});$(settings.container).trigger(settings.event);return this;};$.belowthefold=function(element,settings){if(settings.container===undefined||settings.container===window){var fold=$(window).height()+$(window).scrollTop();}else{var fold=$(settings.container).offset().top+$(settings.container).height();}
return fold<=$(element).offset().top-settings.threshold;};$.rightoffold=function(element,settings){if(settings.container===undefined||settings.container===window){var fold=$(window).width()+$(window).scrollLeft();}else{var fold=$(settings.container).offset().left+$(settings.container).width();}
return fold<=$(element).offset().left-settings.threshold;};$.abovethetop=function(element,settings){if(settings.container===undefined||settings.container===window){var fold=$(window).scrollTop();}else{var fold=$(settings.container).offset().top;}
return fold>=$(element).offset().top+settings.threshold+$(element).height();};$.leftofbegin=function(element,settings){if(settings.container===undefined||settings.container===window){var fold=$(window).scrollLeft();}else{var fold=$(settings.container).offset().left;}
return fold>=$(element).offset().left+settings.threshold+$(element).width();};$.extend($.expr[':'],{"below-the-fold":"$.belowthefold(a, {threshold : 0, container: window})","above-the-fold":"!$.belowthefold(a, {threshold : 0, container: window})","right-of-fold":"$.rightoffold(a, {threshold : 0, container: window})","left-of-fold":"!$.rightoffold(a, {threshold : 0, container: window})"});})(jQuery);
/*
name:xml2json
demo: $.xmlToJSON(xml [, options]) $.textToXML(textXML)
*/
;if(window.jQuery)(function($){$.extend({xml2json:function(xml,extended){if(!xml)return{};function parseXML(node,simple){if(!node)return null;var txt='',obj=null,att=null;var nt=node.nodeType,nn=jsVar(node.localName||node.nodeName);var nv=node.text||node.nodeValue||'';if(node.childNodes){if(node.childNodes.length>0){$.each(node.childNodes,function(n,cn){var cnt=cn.nodeType,cnn=jsVar(cn.localName||cn.nodeName);var cnv=cn.text||cn.nodeValue||'';if(cnt==8){return}else if(cnt==3||cnt==4||!cnn){if(cnv.match(/^\s+$/)){return};txt+=cnv.replace(/^\s+/,'').replace(/\s+$/,'')}else{obj=obj||{};if(obj[cnn]){if(!obj[cnn].length)obj[cnn]=myArr(obj[cnn]);obj[cnn][obj[cnn].length]=parseXML(cn,true);obj[cnn].length=obj[cnn].length}else{obj[cnn]=parseXML(cn)}}})}};if(node.attributes){if(node.attributes.length>0){att={};obj=obj||{};$.each(node.attributes,function(a,at){var atn=jsVar(at.name),atv=at.value;att[atn]=atv;if(obj[atn]){if(!obj[atn].length)obj[atn]=myArr(obj[atn]);obj[atn][obj[atn].length]=atv;obj[atn].length=obj[atn].length}else{obj[atn]=atv}})}};if(obj){obj=$.extend((txt!=''?new String(txt):{}),obj||{});txt=(obj.text)?(typeof(obj.text)=='object'?obj.text:[obj.text||'']).concat([txt]):txt;if(txt)obj.text=txt;txt=''};var out=obj||txt;if(extended){if(txt)out={};txt=out.text||txt||'';if(txt)out.text=txt;if(!simple)out=myArr(out)};return out};var jsVar=function(s){return String(s||'').replace(/-/g,"_")};var isNum=function(s){return(typeof s=="number")||String((s&&typeof s=="string")?s:'').test(/^((-)?([0-9]*)((\.{0,1})([0-9]+))?$)/)};var myArr=function(o){if(!o.length)o=[o];o.length=o.length;return o};if(typeof xml=='string')xml=$.text2xml(xml);if(!xml.nodeType)return;if(xml.nodeType==3||xml.nodeType==4)return xml.nodeValue;var root=(xml.nodeType==9)?xml.documentElement:xml;var out=parseXML(root,true);xml=null;root=null;return out},text2xml:function(str){var out;try{var xml=($.browser.msie)?new ActiveXObject("Microsoft.XMLDOM"):new DOMParser();xml.async=false}catch(e){throw new Error("XML Parser could not be instantiated")};try{if($.browser.msie)out=(xml.loadXML(str))?xml:false;else out=xml.parseFromString(str,"text/xml")}catch(e){throw new Error("Error parsing XML string")};return out}})})(jQuery);
/*
name:  jQuery Corner
webSite: http://www.malsup.com/jquery/corner/
demo: $(this).corner();
*/
;(function($){var ua=navigator.userAgent;var moz=$.browser.mozilla&&/gecko/i.test(ua);var webkit=$.browser.safari&&/Safari\/[5-9]/.test(ua);var expr=$.browser.msie&&(function(){var div=document.createElement('div');try{div.style.setExpression('width','0+0');div.style.removeExpression('width')}catch(e){return false}return true})();function sz(el,p){return parseInt($.css(el,p))||0};function hex2(s){var s=parseInt(s).toString(16);return(s.length<2)?'0'+s:s};function gpc(node){for(;node&&node.nodeName.toLowerCase()!='html';node=node.parentNode){var v=$.css(node,'backgroundColor');if(v=='rgba(0, 0, 0, 0)')continue;if(v.indexOf('rgb')>=0){var rgb=v.match(/\d+/g);return'#'+hex2(rgb[0])+hex2(rgb[1])+hex2(rgb[2])}if(v&&v!='transparent')return v}return'#ffffff'};function getWidth(fx,i,width){switch(fx){case'round':return Math.round(width*(1-Math.cos(Math.asin(i/width))));case'cool':return Math.round(width*(1+Math.cos(Math.asin(i/width))));case'sharp':return Math.round(width*(1-Math.cos(Math.acos(i/width))));case'bite':return Math.round(width*(Math.cos(Math.asin((width-i-1)/width))));case'slide':return Math.round(width*(Math.atan2(i,width/i)));case'jut':return Math.round(width*(Math.atan2(width,(width-i-1))));case'curl':return Math.round(width*(Math.atan(i)));case'tear':return Math.round(width*(Math.cos(i)));case'wicked':return Math.round(width*(Math.tan(i)));case'long':return Math.round(width*(Math.sqrt(i)));case'sculpt':return Math.round(width*(Math.log((width-i-1),width)));case'dog':return(i&1)?(i+1):width;case'dog2':return(i&2)?(i+1):width;case'dog3':return(i&3)?(i+1):width;case'fray':return(i%2)*width;case'notch':return width;case'bevel':return i+1}};$.fn.corner=function(options){if(this.length==0){if(!$.isReady&&this.selector){var s=this.selector,c=this.context;$(function(){$(s,c).corner(options)})}return this}return this.each(function(index){var $this=$(this);var o=[options||'',$this.attr($.fn.corner.defaults.metaAttr)||''].join(' ').toLowerCase();var keep=/keep/.test(o);var cc=((o.match(/cc:(#[0-9a-f]+)/)||[])[1]);var sc=((o.match(/sc:(#[0-9a-f]+)/)||[])[1]);var width=parseInt((o.match(/(\d+)px/)||[])[1])||10;var re=/round|bevel|notch|bite|cool|sharp|slide|jut|curl|tear|fray|wicked|sculpt|long|dog3|dog2|dog/;var fx=((o.match(re)||['round'])[0]);var edges={T:0,B:1};var opts={TL:/top|tl|left/.test(o),TR:/top|tr|right/.test(o),BL:/bottom|bl|left/.test(o),BR:/bottom|br|right/.test(o)};if(!opts.TL&&!opts.TR&&!opts.BL&&!opts.BR)opts={TL:1,TR:1,BL:1,BR:1};if($.fn.corner.defaults.useNative&&fx=='round'&&(moz||webkit)&&!cc&&!sc){if(opts.TL)$this.css(moz?'-moz-border-radius-topleft':'-webkit-border-top-left-radius',width+'px');if(opts.TR)$this.css(moz?'-moz-border-radius-topright':'-webkit-border-top-right-radius',width+'px');if(opts.BL)$this.css(moz?'-moz-border-radius-bottomleft':'-webkit-border-bottom-left-radius',width+'px');if(opts.BR)$this.css(moz?'-moz-border-radius-bottomright':'-webkit-border-bottom-right-radius',width+'px');return}var strip=document.createElement('div');strip.style.overflow='hidden';strip.style.height='1px';strip.style.backgroundColor=sc||'transparent';strip.style.borderStyle='solid';var pad={T:parseInt($.css(this,'paddingTop'))||0,R:parseInt($.css(this,'paddingRight'))||0,B:parseInt($.css(this,'paddingBottom'))||0,L:parseInt($.css(this,'paddingLeft'))||0};if(typeof this.style.zoom!=undefined)this.style.zoom=1;if(!keep)this.style.border='none';strip.style.borderColor=cc||gpc(this.parentNode);var cssHeight=$.curCSS(this,'height');for(var j in edges){var bot=edges[j];if((bot&&(opts.BL||opts.BR))||(!bot&&(opts.TL||opts.TR))){strip.style.borderStyle='none '+(opts[j+'R']?'solid':'none')+' none '+(opts[j+'L']?'solid':'none');var d=document.createElement('div');$(d).addClass('jquery-corner');var ds=d.style;bot?this.appendChild(d):this.insertBefore(d,this.firstChild);if(bot&&cssHeight!='auto'){if($.css(this,'position')=='static')this.style.position='relative';ds.position='absolute';ds.bottom=ds.left=ds.padding=ds.margin='0';if(expr)ds.setExpression('width','this.parentNode.offsetWidth');else ds.width='100%'}else if(!bot&&$.browser.msie){if($.css(this,'position')=='static')this.style.position='relative';ds.position='absolute';ds.top=ds.left=ds.right=ds.padding=ds.margin='0';if(expr){var bw=sz(this,'borderLeftWidth')+sz(this,'borderRightWidth');ds.setExpression('width','this.parentNode.offsetWidth - '+bw+'+ "px"')}else ds.width='100%'}else{ds.position='relative';ds.margin=!bot?'-'+pad.T+'px -'+pad.R+'px '+(pad.T-width)+'px -'+pad.L+'px':(pad.B-width)+'px -'+pad.R+'px -'+pad.B+'px -'+pad.L+'px'}for(var i=0;i<width;i++){var w=Math.max(0,getWidth(fx,i,width));var e=strip.cloneNode(false);e.style.borderWidth='0 '+(opts[j+'R']?w:0)+'px 0 '+(opts[j+'L']?w:0)+'px';bot?d.appendChild(e):d.insertBefore(e,d.firstChild)}}}})};$.fn.uncorner=function(){if(moz||webkit)this.css(moz?'-moz-border-radius':'-webkit-border-radius',0);$('div.jquery-corner',this).remove();return this};$.fn.corner.defaults={useNative:true,metaAttr:'data-corner'}})(jQuery);
/**
 * jQuery.ScrollTo - Easy element scrolling using jQuery.
 * Copyright (c) 2007-2009 Ariel Flesler - aflesler(at)gmail(dot)com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * Date: 5/25/2009
 * @author Ariel Flesler
 * @version 1.4.2
 *
 * http://flesler.blogspot.com/2007/10/jqueryscrollto.html
 */
;(function(d){var k=d.scrollTo=function(a,i,e){d(window).scrollTo(a,i,e)};k.defaults={axis:'xy',duration:parseFloat(d.fn.jquery)>=1.3?0:1};k.window=function(a){return d(window)._scrollable()};d.fn._scrollable=function(){return this.map(function(){var a=this,i=!a.nodeName||d.inArray(a.nodeName.toLowerCase(),['iframe','#document','html','body'])!=-1;if(!i)return a;var e=(a.contentWindow||a).document||a.ownerDocument||a;return d.browser.safari||e.compatMode=='BackCompat'?e.body:e.documentElement})};d.fn.scrollTo=function(n,j,b){if(typeof j=='object'){b=j;j=0}if(typeof b=='function')b={onAfter:b};if(n=='max')n=9e9;b=d.extend({},k.defaults,b);j=j||b.speed||b.duration;b.queue=b.queue&&b.axis.length>1;if(b.queue)j/=2;b.offset=p(b.offset);b.over=p(b.over);return this._scrollable().each(function(){var q=this,r=d(q),f=n,s,g={},u=r.is('html,body');switch(typeof f){case'number':case'string':if(/^([+-]=)?\d+(\.\d+)?(px|%)?$/.test(f)){f=p(f);break}f=d(f,this);case'object':if(f.is||f.style)s=(f=d(f)).offset()}d.each(b.axis.split(''),function(a,i){var e=i=='x'?'Left':'Top',h=e.toLowerCase(),c='scroll'+e,l=q[c],m=k.max(q,i);if(s){g[c]=s[h]+(u?0:l-r.offset()[h]);if(b.margin){g[c]-=parseInt(f.css('margin'+e))||0;g[c]-=parseInt(f.css('border'+e+'Width'))||0}g[c]+=b.offset[h]||0;if(b.over[h])g[c]+=f[i=='x'?'width':'height']()*b.over[h]}else{var o=f[h];g[c]=o.slice&&o.slice(-1)=='%'?parseFloat(o)/100*m:o}if(/^\d+$/.test(g[c]))g[c]=g[c]<=0?0:Math.min(g[c],m);if(!a&&b.queue){if(l!=g[c])t(b.onAfterFirst);delete g[c]}});t(b.onAfter);function t(a){r.animate(g,j,b.easing,a&&function(){a.call(this,n,b)})}}).end()};k.max=function(a,i){var e=i=='x'?'Width':'Height',h='scroll'+e;if(!d(a).is('html,body'))return a[h]-d(a)[e.toLowerCase()]();var c='client'+e,l=a.ownerDocument.documentElement,m=a.ownerDocument.body;return Math.max(l[h],m[h])-Math.min(l[c],m[c])};function p(a){return typeof a=='object'?a:{top:a,left:a}}})(jQuery);
/*
name: js-hotkeys
website: http://code.google.com/p/js-hotkeys/
demo: $(document).bind('keydown', {combi:'s', disableInInput: true}, function(e){..;return false;});
*/
;(function(jQuery){jQuery.fn.__bind__=jQuery.fn.bind;jQuery.fn.__unbind__=jQuery.fn.unbind;jQuery.fn.__find__=jQuery.fn.find;var hotkeys={version:'0.7.9',override:/keypress|keydown|keyup/g,triggersMap:{},specialKeys:{27:'esc',9:'tab',32:'space',13:'return',8:'backspace',145:'scroll',20:'capslock',144:'numlock',19:'pause',45:'insert',36:'home',46:'del',35:'end',33:'pageup',34:'pagedown',37:'left',38:'up',39:'right',40:'down',109:'-',112:'f1',113:'f2',114:'f3',115:'f4',116:'f5',117:'f6',118:'f7',119:'f8',120:'f9',121:'f10',122:'f11',123:'f12',191:'/'},shiftNums:{"`":"~","1":"!","2":"@","3":"#","4":"$","5":"%","6":"^","7":"&","8":"*","9":"(","0":")","-":"_","=":"+",";":":","'":"\"",",":"<",".":">","/":"?","\\":"|"},newTrigger:function(type,combi,callback){var result={};result[type]={};result[type][combi]={cb:callback,disableInInput:false};return result}};hotkeys.specialKeys=jQuery.extend(hotkeys.specialKeys,{96:'0',97:'1',98:'2',99:'3',100:'4',101:'5',102:'6',103:'7',104:'8',105:'9',106:'*',107:'+',109:'-',110:'.',111:'/'});jQuery.fn.find=function(selector){this.query=selector;return jQuery.fn.__find__.apply(this,arguments)};jQuery.fn.unbind=function(type,combi,fn){if(jQuery.isFunction(combi)){fn=combi;combi=null}if(combi&&typeof combi==='string'){var selectorId=((this.prevObject&&this.prevObject.query)||(this[0].id&&this[0].id)||this[0]).toString();var hkTypes=type.split(' ');for(var x=0;x<hkTypes.length;x++){delete hotkeys.triggersMap[selectorId][hkTypes[x]][combi]}}return this.__unbind__(type,fn)};jQuery.fn.bind=function(type,data,fn){var handle=type.match(hotkeys.override);if(jQuery.isFunction(data)||!handle){return this.__bind__(type,data,fn)}else{var result=null,pass2jq=jQuery.trim(type.replace(hotkeys.override,''));if(pass2jq){result=this.__bind__(pass2jq,data,fn)}if(typeof data==="string"){data={'combi':data}}if(data.combi){for(var x=0;x<handle.length;x++){var eventType=handle[x];var combi=data.combi.toLowerCase(),trigger=hotkeys.newTrigger(eventType,combi,fn),selectorId=((this.prevObject&&this.prevObject.query)||(this[0].id&&this[0].id)||this[0]).toString();trigger[eventType][combi].disableInInput=data.disableInInput;if(!hotkeys.triggersMap[selectorId]){hotkeys.triggersMap[selectorId]=trigger}else if(!hotkeys.triggersMap[selectorId][eventType]){hotkeys.triggersMap[selectorId][eventType]=trigger[eventType]}var mapPoint=hotkeys.triggersMap[selectorId][eventType][combi];if(!mapPoint){hotkeys.triggersMap[selectorId][eventType][combi]=[trigger[eventType][combi]]}else if(mapPoint.constructor!==Array){hotkeys.triggersMap[selectorId][eventType][combi]=[mapPoint]}else{hotkeys.triggersMap[selectorId][eventType][combi][mapPoint.length]=trigger[eventType][combi]}this.each(function(){var jqElem=jQuery(this);if(jqElem.attr('hkId')&&jqElem.attr('hkId')!==selectorId){selectorId=jqElem.attr('hkId')+";"+selectorId}jqElem.attr('hkId',selectorId)});result=this.__bind__(handle.join(' '),data,hotkeys.handler)}}return result}};hotkeys.findElement=function(elem){if(!jQuery(elem).attr('hkId')){if(jQuery.browser.opera||jQuery.browser.safari){while(!jQuery(elem).attr('hkId')&&elem.parentNode){elem=elem.parentNode}}}return elem};hotkeys.handler=function(event){var target=hotkeys.findElement(event.currentTarget),jTarget=jQuery(target),ids=jTarget.attr('hkId');if(ids){ids=ids.split(';');var code=event.which,type=event.type,special=hotkeys.specialKeys[code],character=!special&&String.fromCharCode(code).toLowerCase(),shift=event.shiftKey,ctrl=event.ctrlKey,alt=event.altKey||event.originalEvent.altKey,mapPoint=null;for(var x=0;x<ids.length;x++){if(hotkeys.triggersMap[ids[x]][type]){mapPoint=hotkeys.triggersMap[ids[x]][type];break}}if(mapPoint){var trigger;if(!shift&&!ctrl&&!alt){trigger=mapPoint[special]||(character&&mapPoint[character])}else{var modif='';if(alt)modif+='alt+';if(ctrl)modif+='ctrl+';if(shift)modif+='shift+';trigger=mapPoint[modif+special];if(!trigger){if(character){trigger=mapPoint[modif+character]||mapPoint[modif+hotkeys.shiftNums[character]]||(modif==='shift+'&&mapPoint[hotkeys.shiftNums[character]])}}}if(trigger){var result=false;for(var x=0;x<trigger.length;x++){if(trigger[x].disableInInput){var elem=jQuery(event.target);if(jTarget.is("input")||jTarget.is("textarea")||jTarget.is("select")||elem.is("input")||elem.is("textarea")||elem.is("select")){return true}}result=result||trigger[x].cb.apply(this,[event])}return result}}}};window.hotkeys=hotkeys;return jQuery})(jQuery);
/*
name: jQuery.query
website: http://plugins.jquery.com/project/query-object  http://www.cssrain.cn/article.asp?id=1204
demo: var test = $.query.get('test');
*/
;new function(settings){var $separator=settings.separator||'&';var $spaces=settings.spaces===false?false:true;var $suffix=settings.suffix===false?'':'[]';var $prefix=settings.prefix===false?false:true;var $hash=$prefix?settings.hash===true?"#":"?":"";var $numbers=settings.numbers===false?false:true;jQuery.query=new function(){var is=function(o,t){return o!=undefined&&o!==null&&(!!t?o.constructor==t:true)};var parse=function(path){var m,rx=/\[([^[]*)\]/g,match=/^([^[]+)(\[.*\])?$/.exec(path),base=match[1],tokens=[];while(m=rx.exec(match[2]))tokens.push(m[1]);return[base,tokens]};var set=function(target,tokens,value){var o,token=tokens.shift();if(typeof target!='object')target=null;if(token===""){if(!target)target=[];if(is(target,Array)){target.push(tokens.length==0?value:set(null,tokens.slice(0),value))}else if(is(target,Object)){var i=0;while(target[i++]!=null);target[--i]=tokens.length==0?value:set(target[i],tokens.slice(0),value)}else{target=[];target.push(tokens.length==0?value:set(null,tokens.slice(0),value))}}else if(token&&token.match(/^\s*[0-9]+\s*$/)){var index=parseInt(token,10);if(!target)target=[];target[index]=tokens.length==0?value:set(target[index],tokens.slice(0),value)}else if(token){var index=token.replace(/^\s*|\s*$/g,"");if(!target)target={};if(is(target,Array)){var temp={};for(var i=0;i<target.length;++i){temp[i]=target[i]}target=temp}target[index]=tokens.length==0?value:set(target[index],tokens.slice(0),value)}else{return value}return target};var queryObject=function(a){var self=this;self.keys={};if(a.queryObject){jQuery.each(a.get(),function(key,val){self.SET(key,val)})}else{jQuery.each(arguments,function(){var q=""+this;q=q.replace(/^[?#]/,'');q=q.replace(/[;&]$/,'');if($spaces)q=q.replace(/[+]/g,' ');jQuery.each(q.split(/[&;]/),function(){var key=decodeURIComponent(this.split('=')[0]||"");var val=decodeURIComponent(this.split('=')[1]||"");if(!key)return;if($numbers){if(/^[+-]?[0-9]+\.[0-9]*$/.test(val))val=parseFloat(val);else if(/^[+-]?[0-9]+$/.test(val))val=parseInt(val,10)}val=(!val&&val!==0)?true:val;if(val!==false&&val!==true&&typeof val!='number')val=val;self.SET(key,val)})})}return self};queryObject.prototype={queryObject:true,has:function(key,type){var value=this.get(key);return is(value,type)},GET:function(key){if(!is(key))return this.keys;var parsed=parse(key),base=parsed[0],tokens=parsed[1];var target=this.keys[base];while(target!=null&&tokens.length!=0){target=target[tokens.shift()]}return typeof target=='number'?target:target||""},get:function(key){var target=this.GET(key);if(is(target,Object))return jQuery.extend(true,{},target);else if(is(target,Array))return target.slice(0);return target},SET:function(key,val){var value=!is(val)?null:val;var parsed=parse(key),base=parsed[0],tokens=parsed[1];var target=this.keys[base];this.keys[base]=set(target,tokens.slice(0),value);return this},set:function(key,val){return this.copy().SET(key,val)},REMOVE:function(key){return this.SET(key,null).COMPACT()},remove:function(key){return this.copy().REMOVE(key)},EMPTY:function(){var self=this;jQuery.each(self.keys,function(key,value){delete self.keys[key]});return self},load:function(url){var hash=url.replace(/^.*?[#](.+?)(?:\?.+)?$/,"$1");var search=url.replace(/^.*?[?](.+?)(?:#.+)?$/,"$1");return new queryObject(url.length==search.length?'':search,url.length==hash.length?'':hash)},empty:function(){return this.copy().EMPTY()},copy:function(){return new queryObject(this)},COMPACT:function(){function build(orig){var obj=typeof orig=="object"?is(orig,Array)?[]:{}:orig;if(typeof orig=='object'){function add(o,key,value){if(is(o,Array))o.push(value);else o[key]=value}jQuery.each(orig,function(key,value){if(!is(value))return true;add(obj,key,build(value))})}return obj}this.keys=build(this.keys);return this},compact:function(){return this.copy().COMPACT()},toString:function(){var i=0,queryString=[],chunks=[],self=this;var encode=function(str){str=str+"";if($spaces)str=str.replace(/ /g,"+");return encodeURIComponent(str)};var addFields=function(arr,key,value){if(!is(value)||value===false)return;var o=[encode(key)];if(value!==true){o.push("=");o.push(encode(value))}arr.push(o.join(""))};var build=function(obj,base){var newKey=function(key){return!base||base==""?[key].join(""):[base,"[",key,"]"].join("")};jQuery.each(obj,function(key,value){if(typeof value=='object')build(value,newKey(key));else addFields(chunks,newKey(key),value)})};build(this.keys);if(chunks.length>0)queryString.push($hash);queryString.push(chunks.join($separator));return queryString.join("")}};return new queryObject(location.search,location.hash)}}(jQuery.query||{});
/*
Jquery 小扩展
*/
(function(a){a.extend({log:function(){if(arguments.length>0){var b=(arguments.length>1)?Array.prototype.join.call(arguments," "):arguments[0];try{console.log(b);return true}catch(c){try{opera.postError(b);return true}catch(c){}}alert(b);return false}}})})(jQuery);
/*
name: jQuery Flash Plugin
website: http://jquery.lukelutman.com/plugins/flash/
demo:
$('#hello').flash({
    src: 'hello.swf',
    width: 320,
    height: 240
});
*/
;(function(){var $$;$$=jQuery.fn.flash=function(htmlOptions,pluginOptions,replace,update){var block=replace||$$.replace;pluginOptions=$$.copy($$.pluginOptions,pluginOptions);if(!$$.hasFlash(pluginOptions.version)){if(pluginOptions.expressInstall&&$$.hasFlash(6,0,65)){var expressInstallOptions={flashvars:{MMredirectURL:location,MMplayerType:'PlugIn',MMdoctitle:jQuery('title').text()}}}else if(pluginOptions.update){block=update||$$.update}else{return this}}htmlOptions=$$.copy($$.htmlOptions,expressInstallOptions,htmlOptions);return this.each(function(){block.call(this,$$.copy(htmlOptions))})};$$.copy=function(){var options={},flashvars={};for(var i=0;i<arguments.length;i++){var arg=arguments[i];if(arg==undefined)continue;jQuery.extend(options,arg);if(arg.flashvars==undefined)continue;jQuery.extend(flashvars,arg.flashvars)}options.flashvars=flashvars;return options};$$.hasFlash=function(){if(/hasFlash\=true/.test(location))return true;if(/hasFlash\=false/.test(location))return false;var pv=$$.hasFlash.playerVersion().match(/\d+/g);var rv=String([arguments[0],arguments[1],arguments[2]]).match(/\d+/g)||String($$.pluginOptions.version).match(/\d+/g);for(var i=0;i<3;i++){pv[i]=parseInt(pv[i]||0);rv[i]=parseInt(rv[i]||0);if(pv[i]<rv[i])return false;if(pv[i]>rv[i])return true}return true};$$.hasFlash.playerVersion=function(){try{try{var axo=new ActiveXObject('ShockwaveFlash.ShockwaveFlash.6');try{axo.AllowScriptAccess='always'}catch(e){return'6,0,0'}}catch(e){}return new ActiveXObject('ShockwaveFlash.ShockwaveFlash').GetVariable('$version').replace(/\D+/g,',').match(/^,?(.+),?$/)[1]}catch(e){try{if(navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin){return(navigator.plugins["Shockwave Flash 2.0"]||navigator.plugins["Shockwave Flash"]).description.replace(/\D+/g,",").match(/^,?(.+),?$/)[1]}}catch(e){}}return'0,0,0'};$$.htmlOptions={height:240,flashvars:{},pluginspage:'http://www.adobe.com/go/getflashplayer',src:'#',type:'application/x-shockwave-flash',width:320};$$.pluginOptions={expressInstall:false,update:true,version:'6.0.65'};$$.replace=function(htmlOptions){this.innerHTML='<div class="alt">'+this.innerHTML+'</div>';jQuery(this).addClass('flash-replaced').prepend($$.transform(htmlOptions))};$$.update=function(htmlOptions){var url=String(location).split('?');url.splice(1,0,'?hasFlash=true&');url=url.join('');var msg='<p>This content requires the Flash Player. <a href="http://www.adobe.com/go/getflashplayer">Download Flash Player</a>. Already have Flash Player? <a href="'+url+'">Click here.</a></p>';this.innerHTML='<span class="alt">'+this.innerHTML+'</span>';jQuery(this).addClass('flash-update').prepend(msg)};function toAttributeString(){var s='';for(var key in this)if(typeof this[key]!='function')s+=key+'="'+this[key]+'" ';return s};function toFlashvarsString(){var s='';for(var key in this)if(typeof this[key]!='function')s+=key+'='+encodeURIComponent(this[key])+'&';return s.replace(/&$/,'')};$$.transform=function(htmlOptions){htmlOptions.toString=toAttributeString;if(htmlOptions.flashvars)htmlOptions.flashvars.toString=toFlashvarsString;return'<embed '+String(htmlOptions)+'/>'};if(window.attachEvent){window.attachEvent("onbeforeunload",function(){__flash_unloadHandler=function(){};__flash_savedUnloadHandler=function(){}})}})();
/*
name: jQuery Cookie Plugin
website: http://plugins.jquery.com/project/cookie
demo:
var options = { path: '/', expires: 10 };
$.cookie('the_cookie', 'the_value');
$.cookie('the_cookie');
$.cookie(COOKIE_NAME, null, options);
*/
jQuery.cookie=function(name,value,options){if(typeof value!='undefined'){options=options||{};if(value===null){value='';options.expires=-1}var expires='';if(options.expires&&(typeof options.expires=='number'||options.expires.toUTCString)){var date;if(typeof options.expires=='number'){date=new Date();date.setTime(date.getTime()+(options.expires*24*60*60*1000))}else{date=options.expires}expires='; expires='+date.toUTCString()}var path=options.path?'; path='+(options.path):'';var domain=options.domain?'; domain='+(options.domain):'';var secure=options.secure?'; secure':'';document.cookie=[name,'=',encodeURIComponent(value),expires,path,domain,secure].join('')}else{var cookieValue=null;if(document.cookie&&document.cookie!=''){var cookies=document.cookie.split(';');for(var i=0;i<cookies.length;i++){var cookie=jQuery.trim(cookies[i]);if(cookie.substring(0,name.length+1)==(name+'=')){cookieValue=decodeURIComponent(cookie.substring(name.length+1));break}}}return cookieValue}};
/*
定义预加载图片列表的函数(有参数)
http://plugins.jquery.com/project/preloadImages
$.preloadImages(['1.jpg', '2.jpg', '3.jpg']);
*/
/*
 * jQuery preloadImages plugin
 * Version 0.1.1  (20/12/2007)
 * @requires jQuery v1.2.1+
 *
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * @name preloadImages
 * @type jQuery
 * @cat Plugins/Browser Tweaks
 * @author Blair McBride <blair@theunfocused.net>
*/

(function($) {
/**
*
* Queue up a list of images, and start preloading them.
* Works with multi-dimensional arrays.
*
* @example $.preloadImages(['1.jpg', '2.jpg', '3.jpg']);
* @example $.preloadImages(['1.jpg', '2.jpg', '3.jpg', ['4.jpg', '5.jpg']]);
*
* @param arr Any number of image URLs to preload, in an array.
*/
$.preloadImages = function(arr) {
	$.preloadImages.add(arr);

	queuedStop = false;
	startPreloading();
};




/**
* Add a list of images to the end of the preload queue.
* Does not start precoessing the queue, unlike $.preloadImages()
* Works with multi-dimensional arrays.
*
* @example $.preloadImages.add(['1.jpg', '2.jpg', '3.jpg']);
* @example $.preloadImages.add(['1.jpg', '2.jpg', '3.jpg', ['4.jpg', '5.jpg']]);
*
* @param arr Any number of image URLs to preload, either as individual arguments or in an array.
*/
$.preloadImages.add = function(arr) {
	if(typeof(arr) == 'string') {
		$.preloadImages.imageQueue.push(arr);
		return;
	}

	if(arr.length < 1) return;

	for(var i = 0, numimgs = arr.length; i < numimgs; i++) {
		if(typeof(arr[i]) == 'string')
			$.preloadImages.imageQueue.push(arr[i]);
		else if(typeof(arr[i]) == 'object' && arr[i].length > 0)
			$.preloadImages.add(arr[i]);
	}
}

/**
* Prepend a list of images to the start of the preload queue.
* Does not start precoessing the queue, unlike $.preloadImages()
* Works with multi-dimensional arrays.
*
* @example $.preloadImages.add('1.jpg', '2.jpg', '3.jpg');
* @example $.preloadImages.add(['1.jpg', '2.jpg', '3.jpg'], ['4.jpg', '5.jpg']);
*
* @param Any number of image URLs to preload, either as individual arguments or in an array.
*/
$.preloadImages.prepend = function() {
	if(typeof(arr) == 'string') {
		$.preloadImages.imageQueue.unshift(arr);
		return;
	}

	if(arr.length < 1) return;

	for(var i = numargs - 1; i >= 0; i--) {
		if(typeof(arr[i]) == 'string')
			$.preloadImages.imageQueue.unshift(arr[i]);
		else if(typeof(arr[i]) == 'object' && arr[i].length > 0)
			$.preloadImages.prepend(arr[i]);
	}
}

/**
* Clear the preload queue.
*/
$.preloadImages.clear = function() {
	$.preloadImages.imageQueue = [];
}

/**
* Stop processing the preload queue. Does not clear the queue, so precessing can be started off from where it was stopped.
*/
$.preloadImages.stop = function() {
	queuedStop = true;
}

/**
* Start processing the preload queue.
*/
$.preloadImages.start = function() {
	queuedStop = false;
	startPreloading();
}

/**
* The preload queue, for direct manupilation of the queue.
* Items at the start of the queue will be processed first.
* This needs to be kept single-dimensional.
*/
$.preloadImages.imageQueue = [];



/* PRIVATE */
var isPreloading = false;
var queuedStop = false;

function startPreloading() {
	if(isPreloading)
		return;

	$(document.createElement('img')).bind('load', function() {
		if(queuedStop) {
			queuedStop = isPreloading = false;
			return;
		}
		isPreloading = true;
		if($.preloadImages.imageQueue.length > 0) {
			this.src = $.preloadImages.imageQueue.shift();
		} else
			isPreloading = false;
	}).trigger('load');
}


})(jQuery);
