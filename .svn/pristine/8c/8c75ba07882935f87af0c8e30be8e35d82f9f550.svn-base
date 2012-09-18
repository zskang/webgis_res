<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/common/header.jsp"%>
<script language="JavaScript" type="text/JavaScript" charset="utf-8">
	djConfig = {
		webliburl : "${config.webliburl}",
		baseUrl : '${config.weblibctx}/',
		parseOnLoad : true,
		modulePaths : {
			'com.cabletech' : 'cabletech/mapapi'
		}
	};
	var mainlayout = null;
</script>
<script type="text/javascript">
	In.add('layoutjs',{
						path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.ui.layout.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'layoutcss' ]
					});
	In.add('layoutcss',{
						path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'
					});
	In.add('paginagtionjs',{
						path : 'http://${config.webliburl}/cabletech/ui/jqpagination/jquery.pagination.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'paginagtioncss' ]
					});
	In.add('paginagtioncss',{
						path : 'http://${config.webliburl}/cabletech/ui/jqpagination/pagination.css'
					});				
	In.add('jqueryuijs',{
						path : 'http://${config.webliburl}/cabletech/ui/js/jquery-ui-1.8.19.custom.min.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'jqueryuicss' ]
					});
	In.add('jqueryuicss',{
						path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css'
					});				
	In.add('esrijs', {
		path : 'http://${config.webliburl}/esri/jsapi/',
		type : 'js',
		charset : 'utf-8',
		rely : [ 'esricss', 'popcss' ]
	});
	In.add('esricss',
					{
						path : 'http://${config.webliburl}/esri/jsapi/js/dojo/dijit/themes/claro/claro.css'
					});
	In.add('popcss',
					{
						path : 'http://${config.webliburl}/esri/jsapi/js/esri/dijit/css/Popup.css'
					});
	In.add('gislayout', {
		path : '${ctx}/css/jquery.ct.ui.gis.layout.css'
	});
	In.add('loadmap', {
		path : '${ctx}/js/contractorloadmap.js',
		type : 'js',
		charset : 'utf-8',
		rely : [ 'esrijs' ]
	});
	In.add('contractorindexjs', {
		path : '${ctx}/js/contractor/contractorindex.js',
		type : 'js',
		charset : 'utf-8',
		rely: ['highchartsjs']
	});	
	In.add('highchartsjs', {
		path : 'http://${config.webliburl}/cabletech/ui/highchart/highcharts.js',
		type : 'js',
		charset : 'utf-8'
	});	
	In.add('wdatepickerjs', {
		path : 'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',
		type : 'js',
		charset : 'utf-8'
	});
	In.add('notycss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery.noty.css'});
	In.add('mynotycss',{path:'http://${config.webliburl}/cabletech/ui/css/noty_theme_twitter.css'});
	In.add('noty',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.noty.js',type:'js',charset:'utf-8',rely:['notycss','mynotycss']});	
	In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8',rely:['noty']});			
	In.ready('commonjs','layoutjs','loadmap','jqueryuijs','contractorindexjs','paginagtionjs','wdatepickerjs',
					function() {
						var panes = {
							applyDemoStyles : false,
							closable : true,
							resizable : true,
							spacing_open : 0
						};
						mainlayout = $('body').layout({
							panes : panes,
							east : {
								spacing_open : 0,
								size : 320,
								initHidden: true
							},
						});
						In('gislayout');
						In.css('.claro .dijitContentPane {padding: 0;} .ui-layout-pane {border:1px solid #E8E8E8;padding:0px; overflow:auto;}')
						//loadRightFrame("index!rightmenu.action");
						jQuery(function(){
							//加载当前在线人员数量
							jQuery.ajax({
								url:'${ctx}/contractor/onlinedata!todaycalcdata.action?R='+Math.random(),
								dataType:'json',
								success:function(json){
									$('#onlineman').html(json['onlineman']);
									$('#onlinecar').html(json['onlinecar']);
									$('#onlinealert').html(json['onlinealert']);	
								}
							});	
						});						
					});
</script>
<title>资源管理系统</title>
</head>
<body class="claro">
	<div class="ui-layout-center">
		<div id="quicksearch" style="position:absolute;width:260px;right:0px;border:1px solid #aaa;z-index:1000;display:none;background-color:#fff">
			<div class="ui-title-banner-bg">
    			<div class="ui-title-banner-text" onclick="javascript:closeQuickSearch();">
    				快捷搜索
    				<span style="float:right"><a href="javascript:void(0);" style="cursor:pointer ">关闭</a></span>
    			</div>
			</div>
			<div class="ui-form-search-container">
			<ul>
				<li>
				<span class="ui-form-input-title" style="width:80px">搜索类型：</span>
				 <select size="1" id="quicksearchcondition" class="ui-form-input" name="quicksearchcondition" style="width:140px;" onchange="quickSearchOnChange()">
					<option value="0">今日巡检人</option>
					<option value="1">今日车辆</option>
					<option value="2">未处理隐患</option>
					<option value="3">资源</option>
				</select>
				</li>
			</ul>
			<ul>
				<li>
					<span class="ui-form-input-title"  style="width:80px">搜索内容：</span> 
					<input type="text" name="quicksearchkey" id="quicksearchkey" style="width:140px;" value="请输入巡检人姓名" onclick="javascript:this.value=''" class="ui-form-input"/> 
				</li>
			</ul>
			<ul>
				<li>
					<span class="ui-form-input-title"  style="width:80px">&nbsp;</span> 
					<input type="button" value="搜索" onclick="quickSearch()">
				</li>
			</ul>	 
			</div>
		</div>
		
		<div id="map" dojotype="dijit.layout.ContentPane"
			style="width:100%;height:100%"></div>
	</div>
	<DIV class="ui-layout-north" style="height:31px;overflow:hidden">
		<div class="ui-gis-banner">
			<div class="ui-gis-menu">
				<ul>
					<li><a href="#" onclick="tb.maptools('测距')"><span
							class="ui-gis-icon-ranging"></span>测距</a>
					</li>
					<!-- <li><a href="#" onclick="tb.maptools('导出')"><span
							class="ui-gis-icon-outpic"></span>导出</a>
					</li> -->
					<li><a href="#" onclick="tb.maptools('图例',32,135)"><span
							class="ui-gis-icon-legend"></span>图例</a>
					</li>
					<li><a href="#" onclick="tb.maptools('图层',32,195)"><span
							class="ui-gis-icon-layers"></span>图层</a>
					</li>
					<li><a href="#" onclick="tb.maptools('框选')"><span
							class="ui-gis-icon-marquee"></span>框选</a>
					</li>
					<li><a href="#" onclick="tb.maptools('多边形')"><span
							class="ui-gis-icon-Polygon"></span>多边形</a>
					</li>
					<li><a href="#" onclick="tb.linkline('${user.userId}')"><span class="ui-gis-icon-linkline"></span>连线</a></li>		        	
					<li><a href="#" onclick="tb.maptools('清除')"><span
							class="ui-gis-icon-remove"></span>清除</a>
					</li>
					<li><a href="#" onclick="tb.maptools('全图')"><span class="ui-gis-icon-fullextend"></span>全图</a></li>
				</ul>
				<ul style="float:right">
					<li><a href="javascript:void(0);" style="width:73px" onclick="showQuickSearch();"><span class="ui-gis-icon-search" ></span>快速搜索</a></li>
					<li><a href="javascript:void(0);" title="今日在线人员" onclick="showOnlineResult(0)"><span class="ui-gis-icon-people"></span><font id="onlineman" color="red">0</font></a></li>
					<li><a href="javascript:void(0);" title="今日在线车辆" onclick="showOnlineResult(1)"><span class="ui-gis-icon-car"></span><font id="onlinecar" color="red">0</font></a></li>
					<li><a href="javascript:void(0);" title="未处理故障" onclick="showOnlineResult(2)"><span class="ui-gis-icon-fault"></span><font id="onlinealert" color="red">0</font></a></li>
					<!-- <li>隐患：34</li> -->
					<li><div id="menudiv"></div></li>
				</ul>
			</div>
		</div>
	</DIV>
	<DIV class="ui-layout-east">
		<div style="position:absolute;right:6px;top:4px;line-height:23px;height:23px;z-index:999;">
			<a href='javascript:void(0);' onclick="javascript:closeQuickSearchResult();">关闭</a>
		</div>
		<div id="quicksearchresult" style="position:absolute;top:0px;width:100%;height:99.4%;right:0px;border:0px solid #aaa;">
			<div id="resultcontent" style="width:100%;height:100%;bottom:20px;"></div>
			<div style="bottom:0px;right:0px;" class="jqpagination"></div>
			<div id="loadtip" style='display:none;width:100%;height:100%;text-align:center;filter:alpha(Opacity=80);-moz-opacity:0.5;opacity: 0.5;z-index:100; background-color:#ffffff;'><div style='margin-top:30%;margin-left:15%;'>加载中……<div></div>
		</div>
	</DIV>
</body>
</html>