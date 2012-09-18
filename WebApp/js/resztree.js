		var setting = {
			data: {
				simpleData: {
					enable:true,
					open: true,
					idKey: "id",
					pIdKey: "pId",
					rootPId: '0'					
				},
				key: {
					title: "name",
					name: "name"
				}		
			},
			view:{
				fontCss: getFontCss
			},			
			callback: {
				onNodeCreated: zTreeOnNodeCreated,
				onClick: onClickfn,
				onDblClick: onDblClickfn,
				onRightClick: onRightClickfn
			}		
		};
		var dzsetting = {
			check:{
				enable: true
			},
			data: {
				simpleData: {
					enable: true,
					open: false,
					idKey: "id",
					pIdKey: "pId",
					rootPId: '0'					
				},
				key: {
					title: "name",
					name: "name"
				}
			},
			view:{
				fontCss: getDzFontCss,
				restype: ""
			},
			callback: {
				onNodeCreated: dzTreeOnNodeCreated,
				onClick: dzClickfn
			}		
		};
		
		//初始化端子树
		var loadDzTree = function(treeId, restype, loadTreeUrl){
		  dzsetting.restype = restype;
		  $.ajax({
				url: encodeURI(loadTreeUrl),
				dataType: "html",
				type:'GET',
				cache:true,
				async:true,
				beforeSend: function(){
					$('#tree').html("正在加载数据……");
				},
				success : function(result) {
					var zTree = $.fn.zTree.init($("#"+treeId), dzsetting, jQuery.parseJSON("["+result+"]"));
				}
			});		
		}
		
		//更改端子样式
		function getDzFontCss(treeId, treeNode){
			return (!!treeNode.highlight)? {color:"gray"} : {color:"black"};
		}			
		
		//标记端口已有局向光纤关系
		function dzTreeOnNodeCreated(e, treeId, treeNode){
			var zTree = $.fn.zTree.getZTreeObj(treeId);
			//判断是否已经存在
			if(treeNode.isalreayexist){
				if(treeNode.isalreayexist !='0'){
					treeNode.highlight = true;
					treeNode.nocheck = true;
				}
			}else{
				treeNode.nocheck = true;
			}
			zTree.updateNode(treeNode);
			$('<div id="tool-tips" style="border:1px solid red;background-color:#eee;position:absolute;visibility:hidden;z-index:30001;"><div id="tool-text" style="font-size:13px;font-weight:bold;margin:0;text-align:center;padding:6px 6px 4px;"></div>').appendTo('body');
			$('#tree_1_a').mouseover(function(){
				$(this).css({"cursor":"help"});
				$('#tool-tips').css('visibility','visible');
				$('#tool-text').html('温馨提示：点击叶子的父节点批量选择！'); 
			}).mousemove(function(e){
               $('#tool-tips').css('top',e.pageY-10);
               $('#tool-tips').css('left',e.pageX+15);
            }).mouseout(function(){
               $('#tool-tips').css('visibility','hidden');
            });			
		}
		//
		function dzClickfn(e, treeId, treeNode){
			var zTree = $.fn.zTree.getZTreeObj(treeId);
			if(treeNode.level == 2 || ((dzsetting.restype=='AA004' || dzsetting.restype=='AA006')&&treeNode.level == 0)){
				//一次只允许选择属于同一个ODM的端子
				if(treeNode.level == 2){
					var defautnode = zTree.getNodes();
					var allnodes = zTree.transformToArray(defautnode);
					for(var i=0, l=allnodes.length; i<l; i++){
						if(allnodes[i].pId != treeNode.id){//不重置当前结点下的已经选择的结点
							allnodes[i].checked = false;
							zTree.updateNode(allnodes[i]);
						}
					}
				}
				var nodes = treeNode.children;
				for(var i=0, l=nodes.length; i<l; i++) {
					nodes[i].checked = !nodes[i].checked?true:false;
					zTree.updateNode(nodes[i]);
				}
			}
		}
		
		//初始化资源树	
		var loadTree = function(treeId, loadTreeUrl){
		  $.ajax({
				url: encodeURI(loadTreeUrl),
				dataType: "html",
				type:'GET',
				cache:true,
				async:true,
				success : function(result) {
					$('body').append("<div id='rMenu' style='background-color:#ccc;border:1px solid red;position:absolute;visibility:hidden;'><input type='text' id='searchnodetext' onkeyup='searchNodes(\"tree\")'><a href='javascript:void(0)' style='background-color:#eee;text-decoration:none;' onclick='javascript:$(\"#rMenu\").hide()'>隐藏</a></div>");
					var zTree = $.fn.zTree.init($("#"+treeId), setting, jQuery.parseJSON("["+result+"]"));
				},
				error : function() {
					$.fn.Alert("获取资源结点数据异常！",4);
				}
			});		
		}		
		
		//加载结点搜索框
		function zTreeOnNodeCreated(e, treeId, treeNode){
			if(treeNode.pId == 0){
				$('<div id="tool-tips" style="border:1px solid red;background-color:#eee;position:absolute;visibility:hidden;z-index:30001;"><div id="tool-text" style="font-size:13px;font-weight:bold;margin:0;text-align:center;padding:6px 6px 4px;"></div>').appendTo('body');
				$('#tree_1_a').mouseover(function(){
					$(this).css({"cursor":"help"});
					$('#tool-tips').css('visibility','visible');
					$('#tool-text').html('温馨提示：右键搜索'); 
				}).mousemove(function(e){
	               $('#tool-tips').css('top',e.pageY-10);
	               $('#tool-tips').css('left',e.pageX+15);
	            }).mouseout(function(){
	               $('#tool-tips').css('visibility','hidden');
	            });
			}
		}
		//
		function onClickfn(event, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj(treeId);
			//获取默认根结点url
			var url = "";
			if(treeNode.pId == 0){url = getUrl(treeNode.keyid, treeNode.id);}
			//若是分类结点
			if(!!treeNode && (treeNode.level == 1 || treeNode.level == 3))return;
			zTree.selectNode(treeNode);
			var resindex = treeNode.pId;		
			//若是叶子
			if(!!treeNode && (treeNode.level == 2 || treeNode.level == 4)){
				if(!!isNaN(resindex)){
					//若引上为根结点时
					resindex = treeNode.parentKey;
				}			
				url = getUrl(resindex, treeNode.id);
			}
			$('#contentFrame').get(0).src = url;
		}
		function onDblClickfn(e, treeId, treeNode){
			//若是分类结点
			if(treeNode.level == 1)return;
			//若是叶子
			else if(!!treeNode && (treeNode.level == 2 || treeNode.level == 4)){
				var data = getData(treeNode);
				window.parent.openResourcetreediv(data.title, data.url, 800);
				frameElement.api.close();
			}
		}			
		function onRightClickfn(e, treeId, treeNode){
			if(treeNode.pId == 0){
				$('#rMenu').css({"z-index":"1000px","top":"0px", "left":"3px", "visibility":"visible"});
				$("#rMenu").show();
				$('#tool-tips').css('visibility','hidden');
				$("#searchnodetext").focus();
			}
		}
		//查询结点
		var nodeList = [],fontCss = {};
		function searchNodes(treeId){
			updateNodes(false, treeId);
			var nodetext = $.trim($("#searchnodetext").get(0).value);
			if(!!nodetext){
				var zTree = $.fn.zTree.getZTreeObj(treeId);
				nodeList = zTree.getNodesByParamFuzzy("name", nodetext);
				updateNodes(true, treeId);
			}
		}
		//更新结点
		function updateNodes(highlight, treeId) {
			var zTree = $.fn.zTree.getZTreeObj(treeId);
			for(var i=0, l=nodeList.length; i<l; i++) {
				nodeList[i].highlight = highlight;
				zTree.updateNode(nodeList[i]);
			}
		}
		//更改结点样式
		function getFontCss(treeId, treeNode) {
			return (!!treeNode.highlight)? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
		}

		//获取资源树链接及窗口名称
		var getData = function(treeNode){
			var data = {};
			var resindex = treeNode.pId;
			if(!!isNaN(resindex) || treeNode.level == 3){
				//若引上为根结点时，或三级出现时
				resindex = treeNode.parentKey;
			}
			switch(eval(resindex)){
				case 1:
					data.title = '查看引上';
					data.url = contextPath+'/res/basemgr/ys.action?xtbh='+treeNode.id;
					break;
				case 2:
					data.title = '查看引上系统';
					data.url = contextPath+"/res/basemgr/ysxt.action?xtbh="+treeNode.id;
					break;
				case 3:
					data.title = '查看挂墙';
					data.url = contextPath+"/res/basemgr/gqxx.action?xtbh="+treeNode.id;
					break;
				case 4:
					data.title = '查看挂墙段';
					data.url = contextPath+"/res/basemgr/gqd.action?xtbh="+treeNode.id;
					break;
				case 5:
					data.title = '查看挂墙系统';
					data.url = contextPath+"/res/basemgr/gqdxt.action?xtbh="+treeNode.id;
					break;
				case 6:
					data.title = '查看管井';
					data.url = contextPath+"/res/basemgr/gjxx.action?xtbh="+treeNode.id;
					break;
				case 7:
					data.title = '查看管道段';
					data.url = contextPath+"/res/basemgr/gdd.action?xtbh="+treeNode.id;
					break;
				case 8:
					data.title = '查看管道段系统';
					data.url = contextPath+"/res/basemgr/gddxt.action?xtbh="+treeNode.id;
					break;
				case 9:
					data.title = '查看标石';
					data.url = contextPath+"/res/basemgr/bsxx.action?xtbh="+treeNode.id;
					break;
				case 10:
					data.title = '查看直埋段';
					data.url = contextPath+"/res/basemgr/bsd.action?xtbh="+treeNode.id;
					break;
				case 11:
					data.title = '查看直埋段系统';
					data.url = contextPath+"/res/basemgr/bsdxt.action?xtbh="+treeNode.id;
					break;
				case 12:
					data.title = '查看电杆';
					data.url = contextPath+"/res/basemgr/dgxx.action?xtbh="+treeNode.id;
					break;
				case 13:
					data.title = '查看杆路段';
					data.url = contextPath+"/res/basemgr/gld.action?xtbh="+treeNode.id;
					break;
				case 14:
					data.title = '查看杆路段系统';
					data.url = contextPath+"/res/basemgr/gldxt.action?xtbh="+treeNode.id;
					break;
				case 15:
					data.title = '查看光缆段';
					data.url = contextPath+"/res/opticcablemgr/gldly.action?xtbh="+treeNode.id;
					break;
				case 16:
					data.title = '查看光接头';
					data.url = contextPath+"/res/cableequipmgr/gjt.action?xtbh="+treeNode.id;
					break;
				case 17:
					data.title = '查看管道闸';
					data.url = contextPath+"/res/basemgr/dgxx.action?xtbh="+treeNode.id;
					break;	
				case 18:
					data.title = '光终端盒';
					data.url = contextPath+"/res/cableequipmgr/gzdh.action?xtbh="+treeNode.id;
					break;	
				case 19:
					data.title = '光缆信息';
					data.url = contextPath+"/res/opticcablemgr/glxx.action?xtbh="+treeNode.id;
					break;	
				case 20:
					data.title = '光分纤箱';
					data.url = contextPath+"/res/cableequipmgr/gfxx.action?xtbh="+treeNode.id;
					break;	
				case 21:
					data.title = '光交接箱';
					data.url = contextPath+"/res/cableequipmgr/gjjx.action?xtbh="+treeNode.id;
					break;
				case 22:
					data.title = '光缆段路由';
					data.url = contextPath+"/res/opticcablemgr/gldly.action?xtbh="+treeNode.id;
					break;
				case 23:
					data.title = '集团客户';
					data.url = contextPath+"/res/groupcustomsmgr/groupcustoms.action?xtbh="+treeNode.id;
					break;
				case 24:
					data.title = '宽带小区';
					data.url = contextPath+"/res/groupcustomsmgr/broadband.action?xtbh="+treeNode.id;
					break;
				case 25:
					data.title = '校园网';
					data.url = contextPath+"/res/groupcustomsmgr/campus.action?xtbh="+treeNode.id;
					break;
				case 26:
					data.title = '营业厅';
					data.url = contextPath+"/res/groupcustomsmgr/yyt.action?xtbh="+treeNode.id;
					break;
				case 27:
					data.title = '机房信息';
					data.url = contextPath+"/res/publicmgr/jfxx.action?xtbh="+treeNode.id;
					break;
				case 28:
					data.title = '站点信息';
					data.url = contextPath+"/res/publicmgr/zdxx.action?xtbh="+treeNode.id;
					break;
				case 29:
					data.title = 'ODM';
					data.url = contextPath+"/res/publicmgr/odm.action?xtbh="+treeNode.id;
					break;
				case 30:
					data.title = 'ODF';
					data.url = contextPath+"/res/publicmgr/odf.action?xtbh="+treeNode.id;
					break;
				case 31:
					data.title = '地下接线室';
					data.url = contextPath+"/res/publicmgr/odf.action?xtbh="+treeNode.id;
					break;
				case 32:
					data.title = '纤芯';
					data.url = contextPath+"/res/publicmgr/odf.action?xtbh="+treeNode.id;
					break;
				case 33:
					data.title = '光缆盘留';
					data.url = contextPath+"/res/opticcablemgr/glpl.action?xtbh="+treeNode.id;
					break;
			}
			return data;
		}
		//获取资源树链接
		var getUrl = function(i, id){
			var url = "";
			switch(eval(i)){
				case 1:
					url = contextPath+'/res/basemgr/ys!view.action?xtbh='+id;
					break;
				case 2:
					url = contextPath+"/res/basemgr/ysxt!view.action?xtbh="+id;
					break;
				case 3:
					url = contextPath+"/res/basemgr/gqxx!view.action?xtbh="+id;
					break;
				case 4:
					url = contextPath+"/res/basemgr/gqd!view.action?xtbh="+id;
					break;
				case 5:
					url = contextPath+"/res/basemgr/gqdxt!view.action?xtbh="+id;
					break;
				case 6:
					url = contextPath+"/res/basemgr/gjxx!view.action?xtbh="+id;
					break;
				case 7:
					url = contextPath+"/res/basemgr/gdd!view.action?xtbh="+id;
					break;
				case 8:
					url = contextPath+"/res/basemgr/gddxt!view.action?xtbh="+id;
					break;
				case 9:
					url = contextPath+"/res/basemgr/bsxx!view.action?xtbh="+id;
					break;
				case 10:
					url = contextPath+"/res/basemgr/bsd!view.action?xtbh="+id;
					break;
				case 11:
					url = contextPath+"/res/basemgr/bsdxt!view.action?xtbh="+id;
					break;
				case 12:
					url = contextPath+"/res/basemgr/dgxx!view.action?xtbh="+id;
					break;
				case 13:
					url = contextPath+"/res/basemgr/gld!view.action?xtbh="+id;
					break;
				case 14:
					url = contextPath+"/res/basemgr/gldxt!view.action?xtbh="+id;
					break;
				case 15:
					url = contextPath+"/res/opticcablemgr/gldly!view.action?xtbh="+id;
					break;
				case 16:
					url = contextPath+"/res/cableequipmgr/gjt!view.action?xtbh="+id;
					break;
				case 17:
					url = contextPath+"/res/basemgr/dgxx!view.action?xtbh="+id;
					break;
				case 18:
					url = contextPath+"/res/cableequipmgr/gzdh!view.action?xtbh="+id;
					break;
				case 19:
					url = contextPath+"/res/opticcablemgr/glxx!view.action?xtbh="+id;
					break;
				case 20:
					url = contextPath+"/res/cableequipmgr/gfxx!view.action?xtbh="+id;
					break;
				case 21:
					url = contextPath+"/res/cableequipmgr/gjjx!view.action?xtbh="+id;
					break;
				case 22:
					url = contextPath+"/res/opticcablemgr/gldly!view.action?xtbh="+id;
					break;
				case 23:
					url = contextPath+"/res/groupcustomsmgr/groupcustoms!view.action?xtbh="+id;
					break;
				case 24:
					url = contextPath+"/res/groupcustomsmgr/broadband!view.action?xtbh="+id;
					break;
				case 25:
					url = contextPath+"/res/groupcustomsmgr/campus!view.action?xtbh="+id;
					break;
				case 26:
					url = contextPath+"/res/groupcustomsmgr/yyt!view.action?xtbh="+id;
					break;
				case 27:
					url = contextPath+"/res/publicmgr/jfxx!view.action?xtbh="+id;
					break;
				case 28:
					url = contextPath+"/res/publicmgr/zdxx!view.action?xtbh="+id;
					break;
				case 29:
					url = contextPath+"/res/publicmgr/odm!view.action?xtbh="+id;
					break;
				case 30:
					url = contextPath+"/res/publicmgr/odf!view.action?xtbh="+id;
					break;
				case 31:
					url = contextPath+"/res/publicmgr/dxjxs!view.action?xtbh="+id;
					break;
				case 32:
					url = contextPath+"/res/publicmgr/dxjxs!view.action?xtbh="+id;
					break;
				case 33:
					url = contextPath+"/res/opticcablemgr/glpl!view.action?xtbh="+id;
					break;
			}
			return url;		
		}