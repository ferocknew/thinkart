$.createNameSpace = function(name){
    var namespace = name.split("."), name = namespace.pop(), ns = this, p;
    for (var ii in namespace) {
        p = namespace[ii];
        ns = (p in ns ? ns[p] : ns[p] = {});
    }
    return {
        "ns": ns,
        "cName": name
    };
}
$.declare = function(name, prototype,content){
    var nsc = $.createNameSpace(name);
    
    nsc.ns[nsc.cName] = function(element, options){
        var self = this;
        
        this.namespace = nsc.ns;
        this.widgetName = nsc.cName;
        this.widgetBaseClass = nsc.cName;
        
        //处理参数
        if( element && element!=window && typeof options=='undefined' && typeof element.nodeType=='undefined'){
            options=element;
            element=window;
        }
        this.options = $.extend({}, nsc.ns[nsc.cName].defaults, options);
        
        this.element = $(element);
		if ($.isFunction(this._init)) {
           return this._init();
        }
    };
    //扩充自身属性
	if(typeof content!='undefined')	$.extend(nsc.ns[nsc.cName],content);
	 //名称
    nsc.ns[nsc.cName].cName=nsc.cName;
    // 添加 prototype
    nsc.ns[nsc.cName].prototype = prototype;
    return nsc.ns[nsc.cName];
}
$.myWidget = function(name, prototype,content){
    var dec=$.declare(name, prototype,content);
    // create plugin method
    $.fn[dec.cName] = function(options){
        var isMethodCall = (typeof options == 'string'), args = Array.prototype.slice.call(arguments, 1);
        
        // @修饰的方法，返回widget的值，而不是返回jQuery对象.第二个参数（紧跟@修饰的方法的参数）为第几个dom对应的widget
        // 直接调用返回jQuery对象
        if (isMethodCall){
            switch (options.substring(0, 1)){
                case '_':
                    return this;
                case '@':
                    var dom=this[args.shift()];
                    var instance = dom&&$.data(dom, dec.cName);
			        return (instance ? instance[options.substring(1)].apply(instance, args):undefined);
            }
        }
        
        // handle initialization and non-getter methods
        return this.each(function(){
            var instance = $.data(this, dec.cName);
            if (instance && isMethodCall && $.isFunction(instance[options])) {
                instance[options].apply(instance, args)
            } else if (!isMethodCall&&!instance) {
                instance = new dec(this, options);
                $.data(this, dec.cName, instance);
            }
        });
    };
};
$.common={
	option:function(key,value){
		var options = key;

		if ( typeof key === "string" ){
			if ( value === undefined )
				return this.options[key];
			else {
				options = {};
				options[ key ] = value;
			}
		}
		$.extend(this.options,options);
	}
}