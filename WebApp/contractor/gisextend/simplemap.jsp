<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="height:100%;">
  <head>
    <title>地图</title>
	<script language="JavaScript" type="text/javascript" charset="utf-8">
		djConfig = {
			webliburl : "${config.webliburl}",
			baseUrl : '${config.weblibctx}/',
			parseOnLoad : true,
			modulePaths : {
				'com.cabletech' : 'cabletech/mapapi'
			}
		};
		In.add('esricss',{path:'http://${config.webliburl}/esri/jsapi/js/dojo/dijit/themes/claro/claro.css'});
		In.add('popcss',{path:'http://${config.webliburl}/esri/jsapi/js/esri/dijit/css/Popup.css'});
		In.add('notycss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery.noty.css'});
		In.add('mynotycss',{path:'http://${config.webliburl}/cabletech/ui/css/noty_theme_twitter.css'});	
		In.add('esrijs',{path:'http://${config.webliburl}/esri/jsapi/',type:'js',charset:'utf-8',rely:['esricss','popcss']});
		In.add('simplemapjs',{path:'${ctx}/js/contractor/simplemap.js',type:'js',charset:'utf-8',rely:['esrijs']});
		In.add('noty',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.noty.js',type:'js',charset:'utf-8',rely:['notycss','mynotycss']});		
		In.ready('simplemapjs','noty',function(){
			dojo.subscribe("INIT_BUSINESS_LAYER",function(){//监听地图是否加载完毕
				//第一次检查Web调用合法性
				if(!detectWeb2GisRequest.detect('${user.userId}', '${reqtype}', '${isNotNullParams}')){
					window.close();//自动关闭窗口
				}
						
		 		//第一次检查Web调用合法性
				if(detectWeb2GisRequest.check('${user.userId}', '${reqtype}', '${isNotNullParams}')){			
					if('${reqtype}' == 'drawreturn'){
						  tb.drawGeoWebReq('${graphictype}', dr_callback);
						//drawReturn('${graphictype}', 'geoid');
					}else if('${reqtype}' == 'drawtype001'){
						cmap.historyposition.drawPath(jQuery.parseJSON('${json}'), jQuery.parseJSON('${businesstype}'));
					}else if('${reqtype}' == 'draw'){
				    	cmap.locateObjectByCondition('${resourcetype}','${queryWhere}');
					}else if('${reqtype}' == 'drawxy' || '${reqtype}' == 'drawtable'){
					    cmap.drawGeometryWebReq('${xy}','${graphictype}', '${marked}');
					}else if('${reqtype}' == 'edittable'){
						tb.drawGeoWebReq('${graphictype}', edittable_callback);
						//edittable('${tablename}','${keycolumn}','${titlecolumn}','${remarkcolumn}','${graphictype}','${user.userId}');
					}else if('${reqtype}' == 'drawpoints' || '${reqtype}' == 'drawonlinemen' || '${reqtype}' == 'drawtype002'){
						cmap.drawGeometryWebReq('${xy}','${graphictype}');
					}else if('${reqtype}' == 'selectOeoilengines'){
						//默认显示该组织机构下所有正常油机并以该资源为中心
						cmap.drawOilengines(jQuery.parseJSON('${resourcejson}'), jQuery.parseJSON('${olienginejson}'));
						//tb.searchByGeometry(3);						
					}else if('${reqtype}' == 'universalProcessLocus'){
						//通用处理过程（轨迹）
						cmap.historyposition.drawPath(jQuery.parseJSON('${json}'), jQuery.parseJSON('${businesstype}'));
						//getUniversalProcessLocus('${id}','${type}');
					}else if('${reqtype}' == 'oilenginePosition'){
						cmap.oilenginePosition(jQuery.parseJSON('${oilengine}'), jQuery.parseJSON('${positionlist}'));
						//oilenginePosition('${id}');
					}
				}				
			}); 
		});
		
		//绘制并返回坐标回调
		var dr_callback = function(geometry){
	        var markerSymbol = new esri.symbol.SimpleMarkerSymbol(esri.symbol.SimpleMarkerSymbol.STYLE_SQUARE, 10, new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color([255, 0, 0]), 1), new dojo.Color([0, 255, 0, 0.25]));
	        var lineSymbol = new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color([255, 0, 0]), 5);
	        var polygonSymbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_NONE, new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_DASHDOT, new dojo.Color([255, 0, 0]), 2), new dojo.Color([255, 255, 0, 0.25]));
		  cmap.map.graphics.clear();
		  var graphic = null;
		  if(geometry.type == 'point'){
		  	var point = esri.geometry.Point(geometry);
		  	graphic = new esri.Graphic(point, markerSymbol);
		  	$('#geo').val(point.x+" "+point.y);
		  }
		  if(geometry.type == 'polyline'){
		  	var polyline = esri.geometry.Polyline(geometry);
		  	graphic = new esri.Graphic(polyline, lineSymbol);
		  	$('#geo').val(getPoints(polyline.paths));
		  }if(geometry.type == 'polygon'){
		  	var polygon = esri.geometry.Polygon(geometry);
		  	graphic = new esri.Graphic(polygon, polygonSymbol);
		  	$('#geo').val(getPoints(polygon.rings));
		  }
		  cmap.map.graphics.add(graphic);
	      tb.toolbbar.deactivate();
	      $('#confirmBtn').show();
      	}
      	
      	//油机搜索回调
      	var oil_callback = function(geometry) {
		  var layer = tb.mapUtil.createGraphicLayer("measurelayer");
	      tb.mapUtil.clearGraphicLayer("measurelayer"); 	  
	 	  tb.mapUtil.map.disablePan();      	
   		  var graphic;
   	  	  var linesymbol = new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color("#ff0000"), 1.5);
   		  tb.mapUtil.map.enablePan();
   		  tb.toolbbar.deactivate();
   		  var geo = null;
	  	  if(geometry){
	  	      geo = geometry;
	  	      //计算半径
		      var measureonce = dojo.connect(cmap.geometryService, "onLengthsComplete", function(result){
		    	  if(result.lengths[0]){
			    	  var textSymbol =  new esri.symbol.TextSymbol("半径："+result.lengths[0]+"米").setColor(
			    			    new dojo.Color("#ff0000")).setAlign(esri.symbol.Font.ALIGN_START).setFont(
			    			    	    new esri.symbol.Font("12pt").setWeight(esri.symbol.Font.WEIGHT_BOLD)) ;
			    	  if(geo){
			    		  var point = new esri.geometry.Point(geo.paths[0][geo.paths[0].length-1][0], geo.paths[0][geo.paths[0].length-1][1],cmap.map.spatialReference);
			    	      layer.add(new esri.Graphic(point, textSymbol));
			    	  }
		    	  }
		    	  dojo.disconnect(measureonce);
		      });
	  	  		
		   	  var lengthParams = new esri.tasks.LengthsParameters();
		      lengthParams.polylines = [geo];
		      lengthParams.lengthUnit = esri.tasks.GeometryService.UNIT_METER;
		      lengthParams.geodesic = true;
		      cmap.geometryService.lengths(lengthParams);
		      var ls = new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color("#ff0000"), 1.5);
		      layer.add(new esri.Graphic(geo, ls));	 	  		
	  	  			  	  		
   	   		    var circle = new esri.geometry.Polygon(tb.mapUtil.map.spatialReference);//定义一个圆
				var startpoint = {x:geometry.paths[0][0][0],y:geometry.paths[0][0][1]};
				var endpoint = {x:geometry.paths[0][geometry.paths[0].length-1][0],y:geometry.paths[0][geometry.paths[0].length-1][1]};
				var arbentab = Math.PI / 18;
				var arrx = endpoint.x - startpoint.x;
				var arry = endpoint.y - startpoint.y;
				var radus = Math.sqrt(arrx * arrx + arry * arry);
				var movex = startpoint.x;
				var movey = startpoint.y;
				var rings = new Array();
				rings[0] = [ radus + movex, movey ];
				for ( var i = 1; i < 36; i++) {
					j = i - 1;
					k = i;
					arrx = radus * Math.cos(arbentab * k)+ movex;
					arry = radus * Math.sin(arbentab * k)+ movey;
					rings[i] = [ arrx, arry ];
				}
				rings[36] = rings[0];
				circle.addRing(rings);
	   	   		var polygonsymbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_BACKWARD_DIAGONAL, linesymbol, new dojo.Color("#ff0000"));
				graphic = new esri.Graphic(circle, polygonsymbol);
	  	  }
   		  if(graphic){
   			  layer.add(graphic);
   			  //查询所有满足该区域内的油机
   			  var oilids = [];
   			 var ex = graphic.geometry.getExtent();
   			 
		    dojo.forEach(tempArray[1], dojo.hitch(this,function(item){
		    	var pt = new esri.geometry.Point(item.ct_x, item.ct_y, map.spatialReference);
		      	var gp = new esri.Graphic(pt, null);
		     	if(ex.contains(pt)){
		     		oilids.push(item.id);
		     	}
		    }));
		    if(oilids.length>0){
		    	$('#geo').val(oilids.join(','));
		    	$('#confirmBtn').show();
		    }else{
		    	$('#confirmBtn').hide();
		    }
   		  }
   	  }
   	  
   	  //油机搜索
   	  function searchOeoilengines(){
		cmap.searchOeoilengines(oil_callback);   	  
   	  }
   	  
   	  //绘制
   	  function edittable_callback(geometry){
   	  	  console.log(geometry.type);
   	  	  var points = "";
   	  	  var point = null,poly=null;
		  if(geometry.type == 'point'){
		  	point = esri.geometry.Point(geometry);
		  	points = point.x+" "+point.y;
		  }
		  if(geometry.type == 'polyline'){
		  	poly = esri.geometry.Polyline(geometry);
		  	points = getPoints(poly.paths);
		  }if(geometry.type == 'polygon'){
		  	poly = esri.geometry.Polygon(geometry);
		  	points = getPoints(poly.rings);
		  }
		  console.log("points:::::"+points);
	      tb.toolbbar.deactivate();
           cmap.map.infoWindow.setFeatures([new esri.Graphic(geometry, null)]);
           cmap.map.infoWindow.setTitle("编辑业务");
           cmap.map.infoWindow.setContent('<iframe src="${fctx}/${ctx}/gisextend!toEditTablePage.action?points='+points+'&tablename=${tablename}&keycolumn=${keycolumn}&titlecolumn=${titlecolumn}&remarkcolumn=${remarkcolumn}&graphictype=${graphictype}&userid=${userid}"></iframe>');
           if(geometry.type == 'point'){
           		cmap.map.infoWindow.show(point);
           }else{
           		cmap.map.infoWindow.show(poly.getPoint(0, 0));
           } 	  
   	  }
      	
      	//获取图形边缘的点
      	function getPoints(geoarr){
		  	var points = "";
		  	for(var i=0; i<geoarr.length; i++){
		  		for(var j=0; j<geoarr[i].length; j++){
		  			var point = esri.geometry.Point(geoarr[i][j]);
		  			points += point.x+ " "+point.y+",";
		  		}
		  	}
		  	if(points){
		  		points = points.substr(0, points.length-1);
		  	}
		  	return points;     	
      	}
      	
      	//确认框
		function confirmWin(reqtype, eid){
			//绘制图元、油机选择
			if(reqtype == 'drawreturn' || reqtype == 'selectOeoilengines'){
				var eid_value = $('#geo').val();
				if(eid_value != ''){
					var top;
					if(!!window.opener){//open方式
						top = window.opener.document;
					}else if(!!window.dialogArguments){//dialog方式
						top = window.dialogArguments.document;
					}else{
						return;
					}
					var t = $('#'+eid, top);
					if(t.is('div')){
						t.html(eid_value);
					}else{
						t.val(eid_value);
					}
					window.close();
				}else{
					alert('请先选择对应操作！');
				}
			}else{
				window.close();
			}
		}	   	
      	
	</script>
  </head>
  
  <body style="width:auto;height:100%;overflow:hidden;margin:0; padding:0;">
	  <div id="map" style="margin:0; padding:0;width:auto;height:100%;"></div>
	  <div id="controldiv" style="position:fixed;top:0;right:0;width:auto;z-index:9px">
	    <div id="drawtype001Btn" style="display:none">重放【轨迹】</div><!-- 轨迹播放 -->
	    <div id="drawpointsBtn" style="display:none">定位【资源】</div>
	    <div id="drawtype002Btn" style="display:none">呈现【计划路由】</div>
	    <div id="drawxyBtn" style="display:none">呈现【图形】</div>
	    <div id="drawtableBtn" style="display:none">呈现【图形】</div><!-- 表、关键字绘制 -->
	    <div id="edittableBtn" style="display:none">地图绘制【新增记录】</div><!-- 新增某表记录地图绘制 -->
	  	<div id="drawBtn" style="display:none">呈现【计划漏检点】</div>
	  	<div id="onlinemenBtn" style="display:none">呈现【在线巡检人员】</div>
	  	<div id="universalProcessLocusBtn" style="display:none">呈现【处理过程】</div>
	  	<div id="oilenginePositionBtn" style="display:none">呈现【油机发电记录轨迹】</div>	  	
	  	<div id="drawreturnBtn" style="display:none">地图绘制【图形】</div><!-- 绘制 -->
	  	<div id="selectOeoilenginesBtn" style="display:none"><!-- 油机搜索 -->
	  		<button onclick="searchOeoilengines();">点击选择范围【油机】</button>
	  	</div>
	  	<button id="confirmBtn" style="display:none" onclick="confirmWin('${reqtype}','${eid}')">确定</button>
	  	<input type="hidden" style="width:100%;" id="geo">
	  </div>	  
	  <div id="info" style="font-size:10px;z-index:9px;position:fixed;bottom:0px;left:0px;"></div>
 </body>
</html>