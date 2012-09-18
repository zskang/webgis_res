dojo.require("esri.map");
dojo.require("esri.utils");
dojo.require("com.cabletech.map.CMap");
dojo.require("com.cabletech.search.SearchUtil");
dojo.require("com.cabletech.map.CMenu");
dojo.require("dijit.layout.ContentPane");
dojo.require("com.cabletech.toolbar.ToolBar");
var cmap, wgt,tb;
var identifyTask,identifyParams,featureSet,findTask,findParams;
dojo.ready(function() {
	var json = {};
	esri.request({
	    url:contextPath+"/res/index!getGisConfig.action",
	    handleAs: "json",
	    load: function(response, ioArgs){
			json = response;
			json.proxyurl = contextPath+"/proxy.jsp";
			json.property = contextPath+"/res/popup.action";
			json.legendconfig = contextPath+"/legend.json";
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
			//console.log('资源加载完毕了！');
			//以下开始加载菜单
			var menujson = [
			                {"text":"车辆搜索","hrefurl":"/RES/contractor/search!searchCarForm.action","appclass":"1","id":"1","parentid":"-1"},
			                {"text":"巡检人搜索","hrefurl":"/RES/contractor/search!searchPatrolManForm.action","appclass":"1","id":"2","parentid":"-1"}
			                ];
			var options = new com.cabletech.map.CMenuOptions(menujson,"menudiv","-1");
			options.iframeid = "resultcontent";
			var menu = new com.cabletech.map.CMenu(options);
			menu.createMenu("搜索");
			
		},
	    error: function(response, ioArgs){
	    	alert("地图配置加载失败!" + response);
	    }
	});
	 
});
/**
 * 变更条件，同时更新文本框提示信息
 * 
 * @returns
 */
var quickSearchOnChange = function(){
	var condition = $("#quicksearchcondition").val();
	switch(condition){
		case '0':$("#quicksearchkey").val("请输入巡检人姓名");break;
		case '1':$("#quicksearchkey").val("请输入车牌号");break;
		case '2':$("#quicksearchkey").val("请输入隐患名称");break;
		case '3':$("#quicksearchkey").val("请输入资源名称");break;
	}
}
/**
 * 快捷搜索界面
 * @returns
 */
var quickSearch = function(){
		mainlayout.open("east");
		$("#quicksearchresult").css("height","99.8%");
		$("#resultcontent").html("<img src='http://"+djConfig.webliburl+"/cabletech/ui/css/img/loading.gif'>");
		var key = $("#quicksearchkey").val();
		var url = [
				contextPath+'/contractor/onlinedata!todayonlineman.action?name='+key,
				contextPath+'/contractor/onlinedata!todayonlinecar.action?name='+key,
				contextPath+'/contractor/onlinedata!undoaccident.action?name='+key,
				contextPath+'/contractor/onlinedata!pointresource.action?name='+key,
				];
		var index = $("#quicksearchcondition").val();
		if(index == 3){
			//资源通过findTask 根据资源名称进行模糊查询
			findResources(key);
		}else{
			commonShowPagination(encodeURI(url[index]));
		}
}
 

/**
 * 通用页面分页器
 * 
 * @param url
 * @returns
 */
var commonShowPagination = function(url){
		$(".jqpagination").html("");
		$("#resultcontent").html("");
		//设置选项
		var optInit = {num_display_entries:4,num_edge_entries:1,items_per_page:5,callback:function(pagenum){
				var urls = "";
				urls = url + '&page='+(pagenum+1)+'&rows='+optInit.items_per_page;
				//异步载入内容
				$.ajax({
					url: urls+"&R="+Math.random(),
					success:function(data){
						$("#resultcontent").html(data);
						if($("#total").val() != null && $("#total").val() > 0){
							cmap.createLayerWithGraphics("实时数据图层", jQuery.parseJSON("["+$("#locatejson").val()+"]"));
							$(".jqpagination").draw($("#total").val());
						}
						console.log("2");
					}
				});
		}};
		$(".jqpagination").pagination(optInit);
}


/**
 * 弹出快捷搜索界面
 * 
 * @returns
 */
var showQuickSearch = function(){
	$("#quicksearch").show("blind", {}, 500, function() {
		
	});
}
/**
 * 关闭快捷搜索界面
 * 
 * @returns
 */
var closeQuickSearch = function(){
	$("#quicksearch").hide("blind", {}, 500, function() {
		
	});
}
/**
 * 关闭快捷搜索结果面板
 * @returns
 */
var closeQuickSearchResult = function(){
	mainlayout.hide("east");
	$("#resultcontent").html("");
	$(".jqpagination").html("");
	cmap.clearGraphicLayer("实时数据图层"); 
}

/**
 * 根据区域ID显示当前区域下的在线巡检人
 * @param regionid 区域编号
 * @param index  访问链接索引 
 * @returns
 */
var showOnlineByRegion = function(regionid, index){
	var urls = [contextPath+'/contractor/onlinedata!todayonlineman.action?R='+Math.random()+'&regionid='+regionid,
	            contextPath+'/contractor/onlinedata!todayonlinecar.action?R='+Math.random()+'&regionid='+regionid,
	            contextPath+'/contractor/onlinedata!undoonlinealer.action?R='+Math.random()+'&regionid='+regionid
	            ];
	commonShowPagination(urls[index]);
}

/**
 * 根据组织机构ID显示当前区域下的在线巡检人
 * @param orgid 组织机构编号
 * @param index 访问链接索引
 * @returns
 */
var showOnlineByOrg = function(orgid, index){
	var urls = [contextPath+'/contractor/onlinedata!todayonlineman.action?R='+Math.random()+'&orgid='+orgid,
	            contextPath+'/contractor/onlinedata!todayonlinecar.action?R='+Math.random()+'&orgid='+orgid,
	            contextPath+'/contractor/onlinedata!undoonlinealer.action?R='+Math.random()+'&orgid='+orgid]
	commonShowPagination(urls[index]);
}

/**
 * 通用根据URL显示内容的方法
 * 
 * @param url
 * @returns
 */
var showURLResult = function(url){
	mainlayout.open("east");
	$("#resultcontent").load(url);
	$(".jqpagination").html("");
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
 * 搜索结果
 * @param graphic 几何图形
 * @param type 框选
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
		var url = contextPath+"/contractor/search!findResourcePage.action?R="+Math.random();

		mainlayout.open("east");
		$("#resultcontent").html("<iframe style='width:100%;height:100%;border:0;' src='"+url+"'></iframe>");
		$(".jqpagination").html("");
    	featureSet = idResults;
	});
}

/**
* 显示地图POP窗口
* @param x 经度
* @param y 纬度
* @param title 窗口标题
* @param srctype 区分来源 
* @param id 唯一编号
* @param restype 资源类型
*/
function showinfowindow(x, y, title, srctype, id, restype){
   var point = new esri.geometry.Point(x, y, cmap.map.spatialReference);
   var graphic = new esri.Graphic(point, null);
   cmap.map.infoWindow.setTitle(title);
   var url = "";
   if(srctype=="car"){
   		url = contextPath+"/contractor/carinfo.action?id="+id;
   }else if(srctype=="man"){
   		url = contextPath+"/contractor/patrolmaninfo.action?id="+id+"&businesstype="+restype;
   }else{//当框选资源操作时
   		url = srctype;
   		if(restype=='站点'){//无线资源显示基本信息、巡检历史
   			url = contextPath+"/contractor/search!zdxxdatainfo.action?id="+id;
   		}
   }
   cmap.map.infoWindow.resize(515, 300);
   cmap.map.infoWindow.setContent("<iframe frameborder='0' scrolling='no' width='500' height='300' src='"+url+"'></iframe>");
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
   		$(this).css({"background-color":"#fff","padding": "0","margin":"0","width":"514","height":"300","overflow":"hidden"});
   });
   //设置infowindow 隐藏最大化按钮  
   jQuery.each(jQuery.find(".titlePane > div"), function(){
   		if($(this).attr("title")=="最大化"){
   			$(this).css({"display":"none"});
   		}
   });
}

/**
* 搜索资源根据名称模糊搜索
* @param name 资源名称
*/
function findResources(name){
	var layerids = [];
	dojo.forEach(cmap.config.operationlayer.details, function(item){
		layerids.push(item.id);
	});
	if(!cmap.config.operationlayer.url){jQuery.fn.Alert("图层配置有问题！请检查！");return;}
	var findTask = new esri.tasks.FindTask(cmap.config.operationlayer.url);
	var findParams = new esri.tasks.FindParameters();
	findParams.layerIds = layerids;
	findParams.searchFields = ["ZYMC"];
	findParams.searchText = name;
	findParams.contains = true;
	findParams.returnGeometry = true;
	findTask.execute(findParams, function(idResults){
		var url = contextPath+"/contractor/search!findResourcePage.action?R="+Math.random();
		mainlayout.open("east");
		$("#resultcontent").html("<iframe style='width:100%;height:100%;border:0;' src='"+url+"'></iframe>");
		$(".jqpagination").html("");
    	featureSet = idResults;		
	});
}

 