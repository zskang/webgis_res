<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>demo测试</title>
		<link rel="stylesheet" type="text/css" href="http://${config.webliburl}/esri/jsapi/js/dojo/dijit/themes/tundra/tundra.css">
		<link rel="stylesheet" type="text/css" href="http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css">
		<link rel="stylesheet" type="text/css" href="http://${config.webliburl}/cabletech/ui/css/jquery.ct.ui.gis.layout.css">
		<link rel="stylesheet" type="text/css" href="http://${config.webliburl}/cabletech/ui/css/jquery.qtip.min.css">
		<link href="http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="http://${config.webliburl}/cabletech/ui/js/jquery-ui-1.8.19.custom.min.js"></script>		
		<style type="text/css">
		 	.ui-layout-pane {background:	#FFF; border:		0px solid #7DC3EE;padding:	0px; overflow:	auto;}
		</style>
		<script type="text/javascript">
			var fdialog,_url;
		  	$(function() {
				 fdialog=$('#form_dialog').dialog({
	                autoOpen: false,
	                width: 810,
	                height: 510,
	                modal: true,
	                resizable: true,
	                autoResize: true,
	                open: function(){
						$("#externalIframe").attr("src",_url);	                
	                },
					close: function(){
						$("#externalIframe").attr("src","about:blank");
						dojo.publish("refreshpage");
						dojo.unsubscribe("refreshpage");
					},
	                overlay: {
	                    opacity: 0.5,
	                    background: "black"
	                }
	            });  	
			});
			function loadDialogFormView(_title, url){
				_url=url;
				fdialog.dialog({title: _title});
				fdialog.dialog('open');
				$("#externalIframe").attr("width",810).attr("height",510);
			}
			function addListener(name,fn){
				dojo.subscribe(name,fn);
			}
		</script>		
	</head>
	<body class="tundra">
		<DIV class="ui-layout-center">
			<div id="form_dialog"><iframe id="externalIframe" width="0" height="0"></iframe></div>
			<div id="map" dojotype="dijit.layout.ContentPane" style="width:100%;height:100%;"></div>
		</DIV>
		<DIV class="ui-layout-north"><div class="ui-gis-head"> 
		</div>
		<div class="ui-gis-banner"> 
			<div class="ui-gis-menu">
		    	<ul>
		        	<li><a href="#" onclick="tb.maptools('测距')"><span class="ui-gis-icon-ranging"></span>测距</a></li>
		        	<li><a href="#" onclick="tb.maptools('导出')"><span class="ui-gis-icon-outpic"></span>导出</a></li>
		        	<li><a href="#" onclick="tb.maptools('图例')"><span class="ui-gis-icon-legend"></span>图例</a></li>
		        	<li><a href="#" onclick="tb.maptools('图层')"><span class="ui-gis-icon-layers"></span>图层</a></li>
		        	<li><a href="#" onclick="tb.maptools('点选')"><span class="ui-gis-icon-click"></span>点选</a></li>
		        	<li><a href="#" onclick="tb.maptools('框选')"><span class="ui-gis-icon-marquee"></span>框选</a></li>
		        	<li><a href="#" onclick="tb.maptools('多边形')"><span class="ui-gis-icon-Polygon"></span>多边形</a></li>
		        	<li><a href="#" onclick="tb.maptools('清除')"><span class="ui-gis-icon-remove"></span>清除</a></li>
		        </ul>
		        <ul style="float:right">
			   	   <li><span class="onlineuserinfo" style="cursor:pointer" title="显示陈庆平详细信息">欢迎 ,陈庆平!</span></li>
			   	   <li><a href="#">[退出]</a></li>
			   	   <li>&nbsp;</li>
		        </ul>
		       </div>
			</div>
	    </DIV>
		<DIV class="ui-layout-south">
		<div class="ui-gis-head" style="height:30px"> </div>
	    </DIV>
		<DIV class="ui-layout-east">
	     <iframe id="queryFrame" name="queryFrame" frameborder="0" width="100%" src="${ctx}/res/index!rightmenu.action" height="100%"
				scrolling="auto" style="overflow-x:hidden"></iframe>
	    </DIV>
    </body>
	<script type="text/javascript" src="http://${config.webliburl}/cabletech/ui/js/jquery.ct.ui.layout.js"></script>
	<script type="text/javascript" src="http://${config.webliburl}/cabletech/ui/js/jquery.qtip.min.js"></script>	
	<script language="JavaScript" type="text/JavaScript" charset="utf-8">djConfig = {webliburl : "${config.webliburl}",baseUrl : '${config.weblibctx}/',parseOnLoad : true,modulePaths:{'com.cabletech':'cabletech/mapapi'}};</script>
	<script type="text/javascript" src="http://${config.webliburl}/esri/jsapi/"></script>
	<script type="text/javascript">
		dojo.require("esri.map");
		dojo.require("com.cabletech.map.CMap");
		dojo.require("dijit.layout.ContentPane");
		dojo.require("com.cabletech.toolbar.ToolBar");
		var cmap, wgt,tb;
		dojo.ready(function() {
					var json = {
						geometryservice : "http://192.168.1.179:8399/arcgis/rest/services/Geometry/GeometryServer",
						proxyurl : "${ctx}/proxy.jsp",
						property : "${ctx}/test3.jsp",
						legendconfig : "${ctx}/legend.json",
						printurl:"${ctx}/res/index!export.action",
						baselayer : {
							label : "西安基础",
							url : "http://192.168.1.179:8399/arcgis/rest/services/shanxi_zq/MapServer"
						},
						operationlayer : {
							label : "西安资源",
							url : "http://192.168.1.179:8399/arcgis/rest/services/shanxi_zy/MapServer",
							details : [
									{
										id : "7",
										url : "http://192.168.1.179:8399/arcgis/rest/services/shanxi_zy/MapServer/7",
										type : "A21",
										label : "管井",
										where : "1!=1"
									},
									{
										id : "1",
										url : "http://192.168.1.179:8399/arcgis/rest/services/shanxi_zy/MapServer/1",
										type : "A22",
										label : "标石",
										where : "1!=1"
									},
									{
										id : "3",
										url : "http://192.168.1.179:8399/arcgis/rest/services/shanxi_zy/MapServer/3",
										type : "A20",
										label : "电杆",
										where : "1!=1"
									},
									{
										id : "9",
										url : "http://192.168.1.179:8399/arcgis/rest/services/shanxi_zy/MapServer/9",
										type : "A23",
										label : "挂墙",
										where : "1!=1"
									} ]
						}
					};
					//以下载入layout
					 var panes = {  
								applyDemoStyles: 		false		 
							,	closable:				true		 
							,	resizable:				true	 
						 
							,	spacing_open:			0,			 
							onresize:function(){
								cmap.map.resize();
							}
							 
							};

					$('body').layout({
							panes:panes
							,east:{
							  spacing_open:    6
							  ,size:           320
							}
							});

					cmap = new com.cabletech.map.CMap("map", json);
					tb = new com.cabletech.toolbar.ToolBar(cmap);
				});

		$('.onlineuserinfo').qtip({
			content: {
				text: 'Loading...', // The text to use whilst the AJAX request is loading
				ajax: {
					url: '${ctx}/res/index!onlineuerinfo.action', // URL to the local file
					type: 'GET'
				},
				title: {
					text: '陈庆平', 
					button: true
				}
			},
			hide: 'unfocus',
			position: {
				at: 'bottom center ', // Position the tooltip above the link
				my: 'top right'
			},
			show: {
				event: 'click',
				solo: true // Only show one tooltip at a time
			},
			style: {
				classes: 'ui-tooltip-shadow ui-tooltip-blue'
			}
		});

	var addPointLayer = null;
	function addPoint(type){
		addPointLayer = cmap.createGraphicLayer("__addPointLayer");
		addPointLayer.clear();
		var drawToolbar = new esri.toolbars.Draw(cmap.map);
        var _drawEventHandle = dojo.connect(drawToolbar, "onDrawEnd", function(geometry){
            drawToolbar.deactivate();
			var syb = new esri.symbol.PictureMarkerSymbol("${ctx}/legendIcons/"+type+".bmp", 16, 16);	
	      	var graphic = new esri.Graphic(geometry, syb);
	      	addPointLayer.add(graphic);
			dojo.disconnect(_drawEventHandle);
			var mp;
	        var outSR = new esri.SpatialReference({ wkid: 4326});
			cmap.geometryService.project([geometry], outSR, function(projectedPoints) {
			    mp = projectedPoints[0];
				var lx = frames['queryFrame'].document.getElementById("pointX");
				var px = frames['queryFrame'].document.getElementById("projectx");
				lx.value = mp.x;
				px.value = geometry.x;
				var ly = frames['queryFrame'].document.getElementById("pointY");
				var py = frames['queryFrame'].document.getElementById("projecty");
				ly.value = mp.y;
				py.value = geometry.y;
	        });

        });
    	drawToolbar.activate(esri.toolbars.Draw.POINT);
	}

	function refreshPoint(_type){
		addPointLayer.clear();
		var mapservice = cmap.map.getLayer(cmap.config.operationlayer.label)
		if(mapservice){
			mapservice.refresh();
		}
		var label = null;
		dojo.some(cmap.config.operationlayer.details, function(item){
			if(item.type === _type){
				label = item.label;
			}
        	return item.type === _type;
        });
        if(label){
			var layer = cmap.map.getLayer(label);
			layer.refresh();
        }
	}
	var identifyTask,identifyParams,featureSet;
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
        	$('#queryFrame')[0].src = "${ctx}/res/index!search.action";
        	featureSet = idResults;
        });
	}
    </script>
</html>
