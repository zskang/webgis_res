var rightMenu = function(options){
	var defaults = {
		obj:document, menu:"#context-menu", offX:5, offY:5
	},
	options = $.extend({},defaults,options);
	this.options = options;
	this.options.obj = $(this.options.obj);
	this.options.menu = $(this.options.menu);
	this.init();
};

// 初始
rightMenu.prototype.init = function() {
	var that = this,
	$obj = that.options.obj,
	$menu = that.options.menu;
	
	// 屏蔽右键
	$obj.bind("contextmenu",function(){
		return false;
	});

	// 右键触发菜单弹出
	$obj.mousedown(function(evt){
		evt = evt || window.event;
		$obj.children().children().children("input:checkbox").each(function(){
			//$(this).attr("checked",false);
		});
		if (evt.button === 2 ) {
			that.mouseCoords(evt);
			//设值
			var chk = $(evt.target).parent().children().children("input:checkbox").attr("checked",true);
		} else {
			$menu.hide();
		}
	});

}

// 点击坐标
rightMenu.prototype.mouseCoords = function(evt) {
	var that = this,
	coord = {};
	if(evt.pageX || evt.pageY){
		coord = {x:evt.pageX, y:evt.pageY};
	} else {
		coord = {x:evt.clientX, y:evt.clientY + document.body.scrollTop};
	}
	that.rightMenuOut(coord);
}

// 菜单弹出
rightMenu.prototype.rightMenuOut = function(coord) {
	var that = this,
		opts = that.options,
		$menu = opts.menu,
		$window = $(window),
		_menuW = $menu.outerWidth(),
		_menuH = $menu.outerHeight(),
		_winW = $window.width(),
		_winH = $window.height() + document.body.scrollTop,
		_cX = coord.x,
		_cY = coord.y;

	// 靠近边框判断
	_cX = (_menuW + _cX + opts.offX) < _winW ? (_cX + opts.offX) : (_cX - _menuW - opts.offX);
	_cY = (_menuH + _cY + opts.offY) < _winH ? (_cY + opts.offY) : (_cY - _menuH - opts.offY);

	$menu.css({'left':_cX, 'top':_cY}).fadeIn(200).mousedown(function(){
		// 屏蔽菜单上的点击
		return false;
	});
}

//获取选中行
var getSelectOne = function(){
	var itemids = [];
	$("#datatable tbody").children().children().children("input:checkbox").each(function(){
		if($(this).attr("checked")){
			itemids.push($(this)[0].defaultValue);
		}
	});
	return itemids;
}

//删除
var deleteJX = function(url){
	var ids = getSelectOne().join(',');
	if(ids){
		$.dialog.confirm("确认删除吗？",function(){
			$.ajax({
				url:url,dataType:'html',data:"xtbhs="+ids,
				success:function(text){
					if(text == '删除成功！'){
						noty({layout:'topCenter',theme:'noty_theme_mitgux',type: 'success',text:text,timeout:1500});
						window.location.reload();
					}else{
						noty({layout:'topCenter',theme:'noty_theme_mitgux',type: 'error',text:text,timeout:1500});
					}
				}
			});
		});		
		//window.parent.openDeleteConfirmDiv(url, selectidvalue);
	}else{
		$.fn.Alert("请选择一条！",4);
	}
}