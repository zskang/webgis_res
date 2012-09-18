<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript" type="text/JavaScript" charset="utf-8">
		djConfig = {
			webliburl : "${config.webliburl}",
			baseUrl : '${config.weblibctx}/',
			parseOnLoad : true,
			modulePaths : {
				'com.cabletech' : 'cabletech/mapapi'
			}
		};
</script>
<style type="text/css">
	HTML,BODY{margin:0px;padding:0px;width:100%;height:100%; }
	#map{width:100%;height:100%; }
</style>
<link rel="stylesheet" type="text/css" href="http://${config.webliburl}/esri/jsapi/js/dojo/dijit/themes/tundra/tundra.css">
<script type="text/javascript" src="http://${config.webliburl}/esri/jsapi/"></script>
<script type="text/javascript">
	dojo.require("esri.map");
    var ct_map,ct_layers = [];
	dojo.ready(function(){
		 ct_map = new esri.Map("map", {
             logo: false
         });
         var baseLayer = new esri.layers.ArcGISTiledMapServiceLayer("http://192.168.1.179:8399/arcgis/rest/services/shanxi_zq/MapServer");
         var optLayer = new esri.layers.ArcGISDynamicMapServiceLayer("http://192.168.1.179:8399/arcgis/rest/services/shanxi_zy/MapServer");
         ct_layers.push(baseLayer);
         ct_layers.push(optLayer);
         ct_map.addLayers(ct_layers);
	});
</script>
</head>
	<body class="tundra">
		<div id="map"></div>
	</body>
</html>