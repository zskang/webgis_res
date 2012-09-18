dojo.require("esri.map");
dojo.require("esri.utils");
dojo.require("com.cabletech.map.CMap");
dojo.require("com.cabletech.map.CMenu");
dojo.require("dijit.layout.ContentPane");
dojo.require("com.cabletech.toolbar.ToolBar");
console.log('开始执行地图装载！');
var cmap, wgt,tb;
var identifyTask,identifyParams,featureSet;
dojo.ready(function() {
	var json = {};
	esri.request({
	    url:contextPath+"/res/index!getGisConfig.action",
	    handleAs: "json",
	    load: function(response, ioArgs){
			json = response;
			json.proxyurl = contextPath+"/proxy.jsp";
			json.property = contextPath+"/res/popup.action";
			json.legendconfig = contextPath+"/legend_res.json";
			json.printurl = contextPath+"/res/index!export.action";
			cmap = new com.cabletech.map.CMap("map", json);
			dojo.connect(cmap.map, "onMouseUp", dojo.hitch(this,function(evt){
		        var outSR = new esri.SpatialReference({ wkid: 4326});
				cmap.geometryService.project([evt.mapPoint], outSR, function(projectedPoints) {
					var mp = projectedPoints[0];
					dojo.byId("info").innerHTML = "<span style='display:block;float:left;margin-top:6px;margin-left:10px;'>经度：<span style='color:#7f001e;'>"+mp.x+"</span>&nbsp;&nbsp;&nbsp;&nbsp;纬度：<span style='color:#7f001e;'>"+mp.y+"</span></span>";	
				});
			}));
			tb = new com.cabletech.toolbar.ToolBar(cmap);
			console.log('资源加载完毕了！');
		},
	    error: function(response, ioArgs){
	    	alert("地图配置加载失败!");
	    }
	});
	//加载菜单
	esri.request({
	    url:contextPath+"/res/index!getTopMenu.action",
	    handleAs: "json",
	    load: function(response, ioArgs){
			dojo.forEach(response, dojo.hitch(this,function(item, index){
	        	if(item.LV == 1){
	        		$(".ui-gis-head-right-menu").append("<div id='place"+index+"' style='float:left'></div>");
					var options = new com.cabletech.map.CMenuOptions(response,"place"+index,item.ID);
					var menu = new com.cabletech.map.CMenu(options);
					menu.createMenu(item.TEXT);
	        	}
	        }));
		},
	    error: function(response, ioArgs){
	    	alert("菜单加载失败!");
	    }
	});
});
/**
 * 添加点坐标
 */
var addPointLayer = null;
function addPoint(type){
	//addPointLayer = cmap.createGraphicLayer("__addPointLayer");
	//addPointLayer.clear();
	cmap.map.graphics.clear();
	var drawToolbar = new esri.toolbars.Draw(cmap.map);
    var _drawEventHandle = dojo.connect(drawToolbar, "onDrawEnd", function(geometry){
        drawToolbar.deactivate();
		var syb = new esri.symbol.PictureMarkerSymbol("../legendIcons/"+type+".bmp", 16, 16);	
      	var graphic = new esri.Graphic(geometry, syb);
      	//addPointLayer.add(graphic);
		cmap.map.graphics.add(graphic);
		dojo.disconnect(_drawEventHandle);
		var mp;
        var outSR = new esri.SpatialReference({ wkid: 4326});
		cmap.geometryService.project([geometry], outSR, function(projectedPoints) {
			mp = projectedPoints[0];
		    var lx = $("#pageFrame")[0].contentWindow.document.getElementById("pointX");
			var px = $("#pageFrame")[0].contentWindow.document.getElementById("projectx");
			lx.value = mp.x;
			px.value = geometry.x;
			var ly = $("#pageFrame")[0].contentWindow.document.getElementById("pointY");
			var py = $("#pageFrame")[0].contentWindow.document.getElementById("projecty");
			ly.value = mp.y;
			py.value = geometry.y;
        });

    });
	drawToolbar.activate(esri.toolbars.Draw.POINT);
}

	function refreshPoint(_type){
		cmap.map.graphics.clear();
		var mapservice = cmap.map.getLayer(cmap.config.operationlayer.label)
		if(mapservice){
			mapservice.refresh();
		}
		var label = null;
		dojo.forEach(cmap.config.operationlayer.details, function(item){
			var layer = cmap.map.getLayer(item.label);
			layer.refresh();
        });
	}

/**
 * 搜索结果
 * @param graphic
 * @param type
 * @return
 */
function searchResults(graphic,type){
	identifyTask = new esri.tasks.IdentifyTask(cmap.config.operationlayer.url);

    identifyParams = new esri.tasks.IdentifyParameters();
    identifyParams.tolerance = 3;
    identifyParams.returnGeometry = true;
    identifyParams.layerIds = cmap.config.visibleLayers;
    identifyParams.layerOption = esri.tasks.IdentifyParameters.LAYER_OPTION_ALL;
    identifyParams.width  = cmap.map.width;
    identifyParams.height = cmap.map.height;
    identifyParams.geometry = graphic.geometry;
    identifyParams.mapExtent = cmap.map.extent;
    
    identifyTask.execute(identifyParams, function(idResults) {
    	exchangeDiv(contextPath+"/res/index!search.action","搜索结果");
    	featureSet = idResults;
    });
}

/**
 * 打开通用的Dialog对话框
 * @param _title 标题 
 * @param _url 需要载入的URL
 * @returns
 */
var openResourcetreediv =function(_title,_url,width,height,funRef){
    var w = 660;
    var fun=refeshTopWindow;
    if(width){
       w = width ;
    }
    var h = 500;
    if(height){
    	h = height;
    }
    if(funRef){
    	fun=funRef;
    }
	$.dialog({title:_title,content: 'url:'+_url,width:w,height:h,max:false,min:false,lock: true,close: fun});
}

/**
 * 打开通用的Dialog删除确认框
 * @param url 链接地址 
 * @param ids 串编号
 * @param win 当前操作窗口对象
 * @returns
*/
var openDeleteConfirmDiv = function(url, ids, restype){
	//alert(restype);
	var msg="确认删除吗?";
	if(restype=="A21")
	{
	   msg="删除该管井，在该管井的管道闸、管孔、管道段以及在该管井上的穿放关系一并删除,"+msg;	
	}
	else if(restype=="AD601")
	{
		msg="删除该管道段,将同时删除管道段和管井的关系,"+msg;
	}
	else if(restype=="A22")
	{
		msg="删除该标石,该标石关联的直埋段一并删除,"+msg;
	}
	else if(restype=="A23")
	{
		msg="删除该挂墙,和该挂墙关联的挂墙段也一并删除,"+msg;
	}
	else if(restype=="AD604")
	{
		msg="删除该挂墙段,将同时删除挂墙段和挂墙的关系,"+msg;
	}
	else if(restype=="AD605")
	{
		msg="删除该引上,将同时删除引上和承载设施的关系,"+msg;
	}
	else if(restype=="A33")
	{
		msg="删除该光缆段,同时会删除光缆段上的成端、熔纤以及光缆段的纤芯,"+msg;
	}
	else if(restype=="A29")
	{
		msg="删除该站点,与站点关联的机房、ODF、ODM、ODF成端、ODF跳纤、ODF端子一并删除,"+msg;
	}
	else if(restype=="AD701")
	{
		msg="删除该机房，与机房关联的ODF、ODM、ODF成端、ODF跳纤、ODF端子一并删除,"+msg
	}
	else if(restype=="AA001")
	{
		msg="删除该ODF，ODF与机房的关联关系以及ODF关联的ODM、ODF成端、ODF跳纤、ODF端子一并删除,"+msg;
	}
	else if(restype=="AD6011")
	{
		msg="删除该光缆，同时会删除光缆段和光缆的关系,"+msg;
	}
	else if(restype=="AD606")
	{
		msg="删除该管道段系统，将同时删除管道段系统和管道段的关系,"+msg;
	}
	else if(restype=="AD609")
	{
		msg="删除该挂墙段系统，将同时删除挂墙段系统和挂墙段的关系,"+msg;
	}
	else if(restype=="AD6010")
	{
		 msg="删除引上系统，将同时删除引上系统和引上的关系,"+msg;
	}
	else if(restype=="AA003")
	{
		 msg="删除光交接箱，将同时删除端子信息,"+msg;
	}
	else if(restype=="AA004")
	{
		 msg="删除光分纤箱，将同时删除端子信息,"+msg;
	}
	else if(restype=="AA005")
	{
		 msg="删除光接头 ，将同时熔纤关系,"+msg;
	}
	else if(restype=="AA006")
	{
		 msg="删除光终端盒，将同时删除端子信息,"+msg;
	}
	$.dialog.confirm(msg,function(){
		$.ajax({
			url:url,dataType:'html',data:"xtbhs="+ids,
			success:function(text){
				if(text == '删除成功！'){
					$.fn.Alert(text, 2);
					refeshTopWindow();
					if(restype){//空间资源
						refreshPoint(restype);
					}
				}else{
					$.fn.Alert(text, 3);
				}
			}
		});
	});
};
/**
 * 弹出消息框
 * 
 * @param content
 * @param flag
 * @returns
 */
var opentipmessage = function(content,flag){
	var successicon = "success.gif";
	var erroricon = "error.gif";
	var icons = successicon;
	if(flag == "error"){
		icons = erroricon;
	}
	$.dialog({
	    id: 'msg',
	    content: content,
	    icon:icons,
	    width: 200,
	    height: 100,
	    left: '100%',
	    top: '100%',
	    fixed: true,
	    drag: false,
	    resize: false,
	    init: function () {
	        var that = this, i = 3;
	        var fn = function () {
	            that.title(i + '秒后关闭');
	            !i && that.close();
	            i --;
	        };
	        timer = setInterval(fn, 1000);
	        fn();
	    },
	    close: function () {
	        clearInterval(timer);
	    }
	});
}
/**
 * 加载右边部分的内容
 * 
 * @returns
 */
var loadRightFrame = function(url) {
	// mainlayout.sizePane("east", 500);
	$("#rightframe").load(url);
}
/**
 * 使用动态切换效果，完成页面编辑操作
 * @param url 需要载入的URL
 * @param _title 标题
 * @param _width 宽度
 * @returns
 */
var exchangeDiv = function(url,_title, _width) {
	var _w = 420;
	if(_width){
		_w = _width;
	}	
	mainlayout.sizePane("east", _w);
	$("#rightframe").css("display", "none");
	$("#exchangediv").css("display", "");
	if(url){
		$("#exchangediv").show("slide", {}, 500, function() {
			document.getElementById("pageFrame").src = url;
			$("#divtipname").html("-" + _title);
		});
	}
}
/**
 * 返回到菜单主页面
 * 
 * @returns
 */
var exchangeBackDiv = function() {
	if($("#rightframe").css("display")=="none"){
		document.getElementById("pageFrame").src = "";
		$("#exchangediv").hide("slide", {}, 500, function() {
			$("#rightframe").css("display", "");
			$("#exchangediv").css("display", "none");
			mainlayout.sizePane("east", 320);
		});
	}
}

/**
 * 当前在线人员信息
 * 
 * @returns
 */
$('.onlineuserinfo').qtip({
	content : {
		text : 'Loading...', // The text to use whilst the AJAX request is
								// loading
		ajax : {
			url : 'index!onlineuerinfo.action', // URL to the local file
			type : 'GET'
		},
		title : {
			text : '登陆用户信息',
			button : true
		}
	},
	hide : 'unfocus',
	position : {
		at : 'bottom center ', // Position the tooltip above the link
		my : 'top right'
	},
	show : {
		event : 'click',
		solo : true
	// Only show one tooltip at a time
	},
	style : {
		classes : 'ui-tooltip-shadow ui-tooltip-blue'
	}
});

/**
 * 刷新数据窗口
 */
var refeshTopWindow=function(){
	var iframe = document.getElementById('pageFrame');
	iframe.contentWindow.location.replace(iframe.src+$('#pagecon').val());
}

/**
* 定位
* @param restype 资源类型
* @param objectIds 资源编号集合 24769,24770,24780
*/
var locate=function(restype, objectIds){
	cmap.locateObject(restype, objectIds);
}

/**
 * Esri Ajax Rest 方式提交点、线和面数据到FeatureLayer中
 * @param options {'url':url,'features':features} 参数内容
 * @returns
 */
var esriAjaxRestPost = function(options){
	if(!options.url){
		$.fn.Alert("请传入URL参数!",4);
		return false;
	}else if(!options.features){
		$.fn.Alert("请传入features参数!",4);
		return false;
	}
	var param = {"f":"pjson","features":options.features};
	$.ajax({
		url:options.url,
		type:'POST',
		data:param,
		dataType:'jsonp',
		success:function(data){
			console.log("资源添加成功！"+data);
		},
		error:function(data){
			console.log("资源添加失败！");
		}
	});
 
//	esri.request({
//	    url: options.url,
//	    content: {
//	    	"f":"pjson",
//	    	"features":options.features
//	    },
//	    handleAs: "text",
//	    callbackParamName: "jsoncallback",
//	    load: function(data){
//	    	console.log("load sucess!");
//	    },
//	    error: function(data){
//	    	console.log("load error!"+data);
//	    }
//	  },{usePost:true});
	}

/**
* 显示地图POP窗口
* @param x 经度
* @param y 纬度
* @param title 窗口标题
* @param url 获取数据链接地址
*/
function showinfowindow(x, y, title, url){
  var point = new esri.geometry.Point(x, y, cmap.map.spatialReference);
   var graphic = new esri.Graphic(point, null);
   cmap.map.infoWindow.setTitle(title);
   cmap.map.infoWindow.resize(405, 250);
   cmap.map.infoWindow.setContent("<iframe frameborder='0' scrolling='no' width='403' height='248' src='"+url+"'></iframe>");
   cmap.map.infoWindow.show(point);
   if(!cmap.map.extent.contains(point)){
   		cmap.map.centerAt(point);
   }   
   //设置infowindow 标题栏样式
   jQuery.each(jQuery('.titlePane'), function(){
   		$(this).css({"background-color": "#59B2F1"});
   });
   //设置infowindow 内容面板样式
   jQuery.each(jQuery('.contentPane'), function(){
   		$(this).css({"padding": "0","width":"403","height":"248","overflow":"hidden"});
   });
   //设置infowindow 隐藏最大化按钮  
   jQuery.each(jQuery.find(".titlePane > div"), function(){
   		if($(this).attr("title")=="最大化"){
   			$(this).css({"display":"none"});
   		}
   }); 	
}