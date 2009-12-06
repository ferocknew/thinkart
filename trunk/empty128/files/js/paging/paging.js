(function($){
    $.myWidget('My.paging', $.extend({},$.common,{
        _init: function(){
            this.perpage = this.options.perpage;
            this.loadPages = this.options.loadPages || this.loadPages;
            this.pagenav = this.element.find(this.options.nav);
            this.pagebody = this.element.find(this.options.body);
            //创建导航按钮
            this.createNavs();
            
            var navs = this.firsts.add(this.lasts).add(this.middles).add(this.prev).add(this.next);
			
            var self = this;
            // 翻页事件
            $(navs).click(function(e){
                
                var index = parseInt($(this).attr("page"));
                self.showPage(index);
                e.preventDefault();
                return false;
            });
            this.pagenav.append(this.prev, this.firsts, this.ellipsis_l, this.middles, this.ellipsis_r, this.lasts, this.next).hide();
            
			if(this.options.jumpAble) this._jump();

            //设置总页数。如果没有指定则在showPages里完成。
            if (this.options.totalnum) {
                this.totalnum = this.options.totalnum;
                this.initNav();
                this.initFlag = true;
            }
            //自动载入第几页
            if (this.options.autoPage) {
                this.showPage(this.options.autoPage);
            }
        },
        createNavs: function(){
			var firsthtml=lasthtml=middlehtml='';

            this.prev =$('<a href="#" class="prev">‹‹</a>'); 
            this.next = $('<a href="#" class="next">››</a>');
            
            this.ellipsis_l =  $('<span class="ellipsis_l">...</span>');
            this.ellipsis_r =  $('<span class="ellipsis_r">...</span>');
            
			//创建首尾
			for(var i=0;i<this.options.BENUM;i++){
				firsthtml+='<a href="#" class="first"></a>';
				lasthtml+='<a href="#" class="last"></a>';
			}
            this.firsts = $(firsthtml);
            this.lasts = $(lasthtml);
			//创建中部
			
			for(var i=0,len=2*this.options.OFFSET + 1;i<len;i++){
				middlehtml+='<a href="#" class="middle"></a>';
			}
            this.middles =$(middlehtml);
        },
		_jump:function(){
            this.jumpLable=$('<span class="jump-lable">跳转到</span>');
            this.jumpText=$('<input type="text" class="jump-text"/>');
            this.jumpButton=$('<input type="button" class="jump-button" value="确定"/>');
            this.jumps=$(this.jumpLable).add(this.jumpText).add(this.jumpButton);
			
			var self=this;
			 //跳转事件
            this.jumpText.keydown(function(e){
                if(e.keyCode==13){
                    self.showPage(this.value);
                }
            });
            this.jumpButton.click(function(){
                self.showPage(self.jumpText.val());    
            });

			this.pagenav.append(this.jumps);
        },
        initNav: function(){
            //总个数改变，不显示一些项
            this.pagenav.children().hide();
            
            this.maxpage = Math.ceil(this.totalnum / this.perpage);
            if (this.maxpage == 0) return;
            $(this.prev).hide();
            $(this.next).attr("page", 2);
            
            var j = 1;
            $.each(this.firsts, function(){
                $(this).attr("page", j).html(j++);
            });
            j = this.maxpage - this.options.BENUM + 1;
            $.each(this.lasts, function(){
                $(this).attr("page", j).html(j++);
            });
            this.pagenav.show();
            if(this.jumps) this.jumps.show();
        },
        /**
         * 调整分页导航
         *
         * @param {int} index 当前页
         */
        setNav: function(index){
            if(this.maxpage==0) return;
            var from = index - this.options.OFFSET;
            var to = index + this.options.OFFSET;
            
            // 到达头和尾时，保持有2倍OFFSET加1个显示项
            if (from < 1) {
                to += 1 - from;
                to = to > this.maxpage ? this.maxpage : to;
                from = 1;
            }
            
            if (to > this.maxpage) {
                from = from - to + this.maxpage;
                from = from < 1 ? 1 : from;
                to = this.maxpage;
            }
            
            // 给中间显示项赋值
            var tmp = from;
            $.each(this.middles, function(){
                $(this).attr("page", tmp).html(tmp++).hide();
            });
            
            // 所有要显示的项
            var fts = this.middles;
            
            if (from > this.options.BENUM) {
                // 显示最开始的几个
                $.each(this.firsts, function(){
                    $(this).show();
                });
                // 显示省略号
                if (from == this.options.BENUM + 1) {
                    $(this.ellipsis_l).hide();
                } else {
                    $(this.ellipsis_l).show();
                }
            } else {// 中间项与开始项有重合
                // 不显示省略号
                $(this.ellipsis_l).hide();
                
                // 隐藏开始项
                $(this.firsts).hide();
                // 去除不显示的中间项
                fts = fts.slice(this.options.BENUM + 1 - from);
                // 总页数少于开始项数时，去除不显示的开头项
                if (this.maxpage < this.options.BENUM) {
                    fts = this.firsts.slice(0, this.options.BENUM - this.maxpage).add(fts);
                } else {
                    fts = this.firsts.add(fts);
                }
                from = 1;
            }
            
            if (to <= (this.maxpage - this.options.BENUM)) {
                // 显示所有结尾项
                $.each(this.lasts, function(i){
                    $(this).show();
                });
                // 处理尾部省略号
                if (to == this.maxpage - this.options.BENUM) {
                    $(this.ellipsis_r).hide();
                } else {
                    $(this.ellipsis_r).show();
                }
            } else {
                // 不显示省略号
                $(this.ellipsis_r).hide();
                // 隐藏结尾项
                $(this.lasts).hide();
                
                // 如果总页数小于开始和结尾的项数和，去除中间项
                if (this.maxpage <= 2 * this.options.BENUM) {
                    fts = fts.slice(0, this.options.BENUM - 2 * this.options.OFFSET - 1);
                    fts = fts.add(this.lasts.slice(2 * this.options.BENUM - this.maxpage, this.options.BENUM));
                } else {
                    fts = fts.slice(0, this.maxpage - to - this.options.BENUM).add(this.lasts);
                }
                
                to = this.maxpage;
            }
            // 显示导航内容
            this.lastnav && this.lastnav.removeClass("current");
            var lastnav = null;
            $.each(fts, function(){
                $(this).show();
                if ($(this).attr("page") == index) {
                    $(this).addClass("current");
                    lastnav = this;
                }
            });
            this.lastnav = $(lastnav);
            
            // 前一页
            if (index > 1&&this.maxpage>1) {
                $(this.prev).attr("page", index - 1).show();
            } else {
                $(this.prev).hide();
            }
            // 后一页
            if (index < this.maxpage) {
                $(this.next).attr("page", index + 1).show();
            } else {
                $(this.next).hide();
            }
        },
		setPage:function(total){
            if(this.totalnum==total) return;
            this.totalnum = total;
            this.initNav();
            this.initFlag = true;
        },
        showPage: function(index){
            index=parseInt(index);
            if(isNaN(index)||this.lastIndex == index||index<1||this.initFlag &&index>this.maxpage) return false;
            this.lastIndex = index;
            //在loadPages里调用setNav。由于异步请求，如果要修改页数，setNav会被提前执行。
            //返回false不是使用异步方式,是否调用过setNav
            if(this.loadPages(index)===false){
                this.setNav(index);
            }
        },
        /**
         * 复位，初始化导航
         */
        reset: function(index){
            index=index||0;
            this.initFlag = false;
			this.lastIndex=0;
            this.showPage(index);
        },
        /**
         * 处理分页内容
         *
         * @param {int} index 第几页
         */
        loadPages: function(index){
            alert('没有指定showPages方法');
        }
    }), {
        defaults: {
            perpage: 10,// 每页项数
            body: '.pagebody',
            nav: '.pagenav',
            OFFSET: 2,// 中间显示部分和当前的距离，实际显示2*OFFSET+1项
            BENUM: 2,// 开始结尾显示的个数
            aotuPage: 0,//自动装入页
			jumpAble:1	//是否带有跳转
        }
    });
})(jQuery);
