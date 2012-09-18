<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>成端、跳纤、熔纤管理</title>
		<script>
			In.add('cttabcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery.ct.ui.tabs.css'});
			In.add('topocss',{path:'${ctx }/css/topo.css'});
			In.add('layout',{path:'${ctx}/css/jquery.ct.ui.gis.layout.css'});
			In.add('cttabjs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ct.ui.tabs.js',type:'js',charset:'utf-8',rely:['cttabcss','layout']});
			In.add('swfjs',{path:'${ctx }/res/connectmgr/twaver/swfobject.js',type:'js',charset:'utf-8'});
			In.add('asjsinvoker',{path:'${ctx }/js/res/connectmgr/AsJsInvoker.js',type:'js',charset:'utf-8'});
		    In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
		    In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});	  
			In.add('jggridjs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/jquery.jqGrid.min.js',type:'js',charset:'utf-8',rely:['jqgridcss','uicss']});
			In.add('jggridlocalejs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/grid.locale-cn.js',type:'js',charset:'utf-8'});
			In.add('jqgridcss',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/css/ui.jqgrid.css'});
			In.add('uicss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css'});
			In.add('cm',{path:'${ctx }/js/res/connectmgr/connect_list.js',type:'js',charset:'utf-8',rely:['topocss']});
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
			//Ready
			var ctab = "AA201";
			In.ready('cttabjs','swfjs','asjsinvoker','ztreejs','jggridjs','jggridlocalejs','cm','commonjs',function(){
				$('.section>DIV').css("height","140");//设置tab页高度
				//载入swf文件
				var flashvars = {};
	    		var params = { menu: "false", scale: "noScale", allowFullscreen: "true", allowScriptAccess: "always", bgcolor: "#FFFFFF", wmode:"opaque" };
	    		var attributes = {id:"swf"};
	    		swfobject.embedSWF("${ctx }/res/connectmgr/twaver/Index.swf", "swfcontainer", "100%", "100%", "9.0.0", "", flashvars, params, attributes);
	    		setTimeout(init_lines_grid,500); //初始化光缆grid
	    		setTimeout(init_p2p_grid,500); //初始化跳纤grid
	    		setTimeout(init_p2l_grid,500); //初始化成端grid
	    		setTimeout(init_l2l_grid,500); // 初始化熔纤grid
	    		setTimeout(init_res_tree,500); //初始化资源树
	    		enableControls(true);
			});
			//禁\启用控件
			function enableControls(b){
				$('#btn_exp').attr("disabled",b);
				$('#btn_save').attr("disabled",b);
				$('#btn_del').attr("disabled",b);
				$('#btn_all').attr("disabled",b);
				$('#btn_new').attr("disabled",b);
			}
			//取消
			function cancel(){
				enableControls(true);
				troggerLayer();
				clearData();
				getFlexApp('swf').cancel();

				reload_l2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
				reload_p2p_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
				reload_p2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新成端grid
			}
			//新建连接
			function createLink(){
				getFlexApp('swf').createNewLink();
			}
			//删除连接
			function deleteLink(){
				getFlexApp('swf').deleteLink();
			}
			//保存连接
			function saveLinks(){
				var url = fullctx+contextPath+'/res/connectmgr/connect!saveConnect.action';
				getFlexApp('swf').saveLinks(url,deviceTopo.lid,deviceTopo.ltype,deviceTopo.rid,deviceTopo.rtype,deviceTopo.tid,deviceTopo.ttype);
			}
			//ActionScript保存成功后通知javascript刷新界面
			function AsInvok_Save_Links(){
				$.fn.Alert("面板保存成功!",2);
				cancel();
				reload_l2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
				reload_p2p_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
				reload_p2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新成端grid
			}
			//切换tab页
			function changeTab(_num){
				ctab = _num;
			}
			//删除链接
			function delLinks(){
				if(confirm("删除后面板将会刷新，确认是否已经保存数据后再操作。")){
					var selRows = null;
					if(ctab == "AA201"){
						selRows = $("#grid_p2p").jqGrid('getGridParam','selarrrow');
					}else if(ctab == "AA202"){
						selRows = $("#grid_l2l").jqGrid('getGridParam','selarrrow');
					}else{
						selRows = $("#grid_p2l").jqGrid('getGridParam','selarrrow');
					}
					if(selRows && selRows.length > 0){
						$.ajax({
							url: contextPath+'/res/connectmgr/connect!deleteConnects.action?zylx='+deviceTopo.ttype+'&xtbhs='+selRows.join(",")+'&ctype='+ctab,
							dataType: "json",
							type:'GET',
							success : function(result) {
								//删除后刷新面板
								if(deviceTopo.rid){
									var url = fullctx+contextPath+'/res/connectmgr/connect!panelXML.action';
									getFlexApp('swf').showTopoByXML(url+'?lid='+deviceTopo.lid+'&ltype='+deviceTopo.ltype+'&rid='+deviceTopo.rid+'&rtype='+deviceTopo.rtype+'&tid='+deviceTopo.tid+'&ttype='+deviceTopo.ttype);
								}else if(deviceTopo.isViewMode){
									var url = fullctx+contextPath+'/res/connectmgr/connect!panelXML.action';
									getFlexApp('swf').showTopoByXML(url+'?lid='+deviceTopo.viewId+'&ltype='+deviceTopo.viewType+'&rid=&rtype=&tid=&ttype=');
								}
								reload_l2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
								reload_p2p_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
								reload_p2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新成端grid
								$.fn.Alert("删除成功，正在重新构造面板!",2);
							},
							error : function() {
								alert("删除出现异常!");
							}
						});		
					}else{
						$.fn.Alert("请选择后再删除!",4);
					}
				}
			}
			//批量新建
			function newLotsofLinks(){
				if(confirm("批量新增连接前请先保存否则将会丢失数据!")){
					function ref(){
						if(deviceTopo.rid){
							var url = fullctx+contextPath+'/res/connectmgr/connect!panelXML.action';
							getFlexApp('swf').showTopoByXML(url+'?lid='+deviceTopo.lid+'&ltype='+deviceTopo.ltype+'&rid='+deviceTopo.rid+'&rtype='+deviceTopo.rtype+'&tid='+deviceTopo.tid+'&ttype='+deviceTopo.ttype);
						}
						reload_l2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
						reload_p2p_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
						reload_p2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新成端grid
						$.fn.Alert("已经处理批量新增，正在重新构造面板!",2); 
					}
					var url="${ctx}/res/connectmgr/pconnect.action";
					url = url+'?lid='+deviceTopo.lid+'&ltype='+deviceTopo.ltype+'&rid='+deviceTopo.rid+'&rtype='+deviceTopo.rtype+'&tid='+deviceTopo.tid+'&ttype='+deviceTopo.ttype;
					window.parent.parent.openResourcetreediv("批量新建",url,600,430,ref);
				}
			}
		</script>
	</head>
	<body>
		<div class="TLEFT">
			<div class="TLTOP">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">资源树</span>
	   		    </div>
				<ul id="restree" class="ztree" style="border:none;background-color:#f2f8fc;width:99%;margin:0px;padding:0px;height:250px;margin-top:5px;overflow-y:srcoll;overflow:auto;"></ul>
			</div>
			<div class="TLBOTTOM">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">光缆列表</span>
	   		    </div>
				<div style="width:100%;" id="grid_lines_box">
					<table id="grid_lines"></table>
					<div id="grid_lines_pager"></div>
				</div>
			</div>
		</div>
		<div class="TRIGHT">
			<div class="TRTOP">
				<div class="ui-gis-right-title-bg">
					<input type="button" value="取消" onclick="cancel()" />
					<input id="btn_all" type="button" value="批量新建" onclick="newLotsofLinks();" />
					<input id="btn_save" type="button" value="保存" onclick="saveLinks()" />
					<input id="btn_del" type="button" value="删除连接" onclick="deleteLink();" />
					<input id="btn_new" type="button" value="新建连接" onclick="createLink();" />
	   		    </div>
			</div>
			<div class="TRBOTTOM">
				<div class="TRBTOP">
					<div id="swfcontainer" style="width:100%;height:100%;"></div>
				</div>
				<div class="TRBBOTTOM">
					<div class="section">
						<ul class="tabs">
							<li class="current" onclick="changeTab('AA201')">跳纤</li>
							<li onclick="changeTab('AA203')">成端</li>
							<li onclick="changeTab('AA202')">熔纤</li>
							<li class="button"><input type="button" value="删除选择连接" onclick="delLinks()" /></li>
						</ul>
						<div class="box visible" style="padding:0px;">
							<table id="grid_p2p"></table>
							<div id="grid_p2p_pager"></div>
						</div>
						<div class="box" style="padding:0px;">
							<table id="grid_p2l"></table>
							<div id="grid_p2l_pager"></div>
						</div>
						<div class="box" style="padding:0px;">
							<table id="grid_l2l"></table>
							<div id="grid_l2l_pager"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="xtbh" name="xtbh" value="${xtbh}">
		<input type="hidden" id="zylx" name="zylx" value="${zylx}">
	</body>
</html>