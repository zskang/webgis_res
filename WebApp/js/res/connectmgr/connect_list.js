var deviceTopo={};//props:lid,ltype,ldata,rid,rtype,rdata
deviceTopo.tid = $("#xtbh").val();
deviceTopo.ttype = $("#zylx").val();
//遮盖控制
function troggerLayer(){
	if(!$('#layer')[0]){
		$('.TLEFT').append('<div id="layer"><span style="display:block;float:left;color:white;margin-top:100px;margin-left:20px;">操作已经锁定，请保存或取消后继续操作。</span></div>');
		$('#layer').addClass('mylayer');
	}else{
		if($('#layer')[0].style.display == "none"){
			$('#layer').css("display","block");
		}else{
			$('#layer').css("display","none");
		}
	}
}

//初始化资源树
function init_res_tree(){
	var setting = {
			data: {simpleData: {enable:true,open: true,idKey: "ID",pIdKey: "PID"},key: {title: "NAME",name: "NAME"}},
			view: {addDiyDom: addDiyDom},
			callback: {onClick: onResTreeClick}
	};
	function addDiyDom(treeId, treeNode) {
		//光接头盒 和 类别节点 没有加入拓扑查看功能
		if(treeNode.ID>0 && treeNode.RTYPE != "AA005"){
			var aObj = $("#" + treeNode.tId + "_a");
			var editStr ="";
			if(treeNode.RTYPE == "AA001" || treeNode.RTYPE == "AA003"){
				editStr = '<a href="#" style="margin-left:15px;" onclick="view_action(\''+treeNode.TYPE+'\',\''+treeNode.ID+'\')"><img title="查看面板" src="'+contextPath+'/css/images/viewlink.png'+'" /></a>';
			}else{
				if(treeNode.PID<=0){
					treeNode.PID = treeNode.ID;
				}
				editStr = '<a href="#" style="margin-left:15px;" onclick="join_action(\''+treeNode.TYPE+'\',\''+treeNode.PID+'\','+'\''+treeNode.RTYPE+'\',\''+treeNode.ID+'\',null)"><img title="点击加入拓扑面板" src="'+contextPath+'/css/images/setlink.png'+'" /></a>';
			}
			aObj.append(editStr);
			var btn = $("#diyBtn_"+treeNode.id);
			if (btn) btn.bind("click", function(){alert("diy Button for " + treeNode.name);});
		}
	}
	$.ajax({
		url: contextPath+'/res/connectmgr/connect!resTreeJson.action?xtbh='+$("#xtbh").val()+'&zylx='+$("#zylx").val(),
		dataType: "json",
		type:'GET',
		success : function(result) {
			$.fn.zTree.init($("#restree"), setting, result.root);
		},
		error : function() {
			alert("获取资源结点数据异常！");
		}
	});		
}

//资源树点击事件
function onResTreeClick(event, treeId, treeNode, clickFlag){
	if(treeNode.ID>0){
		if(treeNode.PID>0){
			//以点击节点父节点信息刷新grid
			reload_lines_grid(treeNode.PID,treeNode.TYPE);//刷新光缆grid
			reload_l2l_grid(treeNode.PID,treeNode.TYPE); //刷新跳纤grid
			reload_p2p_grid(treeNode.PID,treeNode.TYPE); //刷新跳纤grid
			reload_p2l_grid(treeNode.PID,treeNode.TYPE); //刷新成端grid
			deviceTopo.tid = treeNode.PID;
		}else{
			//以点击节点信息刷新grid
			reload_lines_grid(treeNode.ID,treeNode.TYPE);//刷新光缆grid
			deviceTopo.tid = treeNode.ID;
			reload_l2l_grid(treeNode.ID,treeNode.RTYPE); //刷新跳纤grid
			reload_p2p_grid(treeNode.ID,treeNode.RTYPE); //刷新跳纤grid
			reload_p2l_grid(treeNode.ID,treeNode.RTYPE); //刷新成端grid
		}
		deviceTopo.ttype = treeNode.TYPE;
	}
}

//初始化光缆列表gird
function init_lines_grid(){
	$('#grid_lines').jqGrid({
		url: contextPath+'/res/connectmgr/connect!lineListJson.action',
		postData: {
        	xtbh:$("#xtbh").val(),
        	zylx:$("#zylx").val()
        }, 
		mtype: 'POST',
		datatype: "json",
		colNames: ['XTBH', '光缆段名称', '线芯','','','','',''],
		colModel: [
		{ name: 'XTBH',hidden:true },
		{ name: 'ZYMC', width: 150, align: "left",sortable:false },
		{ name: 'XXS', width: 30, align: "right",sortable:false },
		{ name: 'ADSBLX',hidden:true },
		{ name: 'ADSBMC',hidden:true },
		{ name: 'ZDSBLX',hidden:true },
		{ name: 'ZDSBMC',hidden:true },
		{ name: 'XTBH', width: 20,sortable:false,formatter:join_fmt }
		],
	   	rowNum:10,
		rowList: [10, 20, 30],
		width: $('#grid_lines_box').width()-5,
		height: 218,
		viewrecords: true,
		prmNames : {
			page : "pageNo",
			rows : "pageSize",
			sort : "sidx",
			order : "sord"
		},
		jsonReader: {
            root:"root" , 
            page : "pageNo", // 当前页 
			total : "totalPages", // 总页数 
			records : "total", // 总记录数 
            repeatitems: false,
            id:"XTBH"
        },
		pager: '#grid_lines_pager'
	});
}
function reload_lines_grid(_xtbh,_zylx){
	jQuery("#grid_lines").jqGrid().setGridParam({
        postData: {
	    	xtbh:_xtbh,
	    	zylx:_zylx
        } 
    }).trigger("reloadGrid");
}
//初始化跳纤数据
function init_p2p_grid(){
	$('#grid_p2p').jqGrid({
		url: contextPath+'/res/connectmgr/connect!p2pListJson.action',
		postData: {
        	xtbh:$("#xtbh").val(),
        	zylx:$("#zylx").val()
        }, 
		multiselect: true,
        shrinkToFit:false,
        multiboxonly:true,
		mtype: 'POST',
		datatype: "json",
		colNames: ['端子名称','状态','Z端设备名称','Z端设备类型','Z端名称','ZID','XTBH','','',''],
		colModel: [
		{ name: 'PNAME', width: 120, align: "left",sortable:false },
		{ name: 'PSTATE', width: 50, align: "left",sortable:false },
		{ name: 'ZNAME', width: 150, align: "left",sortable:false },
		{ name: 'ZTYPE', width: 80, align: "left",sortable:false },
		{ name: 'ZPNAME', width: 180, align: "left",sortable:false },
		{ name: 'ZID', hidden:true},
		{ name: 'XTBH',hidden:true},
		{ name: 'AID',hidden:true},
		{ name: 'ODM',hidden:true},
		{ name: 'XTBH', width: 30,sortable:false,formatter:linkInTopo }
		],
	   	rowNum:10,
		rowList: [10, 20, 30],
		width:$('.section>DIV').width()-2,
		height:90,
		viewrecords: true,
		prmNames : {
			page : "pageNo",
			rows : "pageSize",
			sort : "sidx",
			order : "sord"
		},
		jsonReader: {
            root:"root" , 
            page : "pageNo", // 当前页 
			total : "totalPages", // 总页数 
			records : "total", // 总记录数 
            repeatitems: false,
            id:"XTBH"
        },
		pager: '#grid_p2p_pager'
	});
}
function reload_p2p_grid(_xtbh,_zylx){
	jQuery("#grid_p2p").jqGrid().setGridParam({
        postData: {
	    	xtbh:_xtbh,
	    	zylx:_zylx
        } 
    }).trigger("reloadGrid");
}
//初始化成端数据
function init_p2l_grid(){
	$('#grid_p2l').jqGrid({
		url: contextPath+'/res/connectmgr/connect!p2lListJson.action',
		postData: {
        	xtbh:$("#xtbh").val(),
        	zylx:$("#zylx").val()
        }, 
		multiselect: true,
        shrinkToFit:false,
        multiboxonly:true,
		mtype: 'POST',
		datatype: "json",
		colNames: ['端子名称','状态','光缆段名称','线芯','ZID','XTBH','','',''],
		colModel: [
		{ name: 'PNAME', width: 210, align: "left",sortable:false },
		{ name: 'PSTATE', width: 80, align: "left",sortable:false },
		{ name: 'ZNAME', width: 210, align: "left",sortable:false },
		{ name: 'ZPNAME', width: 80, align: "left",sortable:false },
		{ name: 'ZID', hidden:true},
		{ name: 'XTBH',hidden:true},
		{ name: 'AID',hidden:true},
		{ name: 'ODM',hidden:true},
		{ name: 'XTBH', width: 30,sortable:false,formatter:linkInTopo }
		],
	   	rowNum:10,
		rowList: [10, 20, 30],
		width:$('.section>DIV').width()-2,
		height:90,
		viewrecords: true,
		prmNames : {
			page : "pageNo",
			rows : "pageSize",
			sort : "sidx",
			order : "sord"
		},
		jsonReader: {
            root:"root" , 
            page : "pageNo", // 当前页 
			total : "totalPages", // 总页数 
			records : "total", // 总记录数 
            repeatitems: false,
            id:"XTBH"
        },
		pager: '#grid_p2l_pager'
	});
}
function reload_p2l_grid(_xtbh,_zylx){
	jQuery("#grid_p2l").jqGrid().setGridParam({
        postData: {
	    	xtbh:_xtbh,
	    	zylx:_zylx
        } 
    }).trigger("reloadGrid");
}
//初始化熔纤数据
function init_l2l_grid(){
	$('#grid_l2l').jqGrid({
		url: contextPath+'/res/connectmgr/connect!l2lListJson.action',
		postData: {
        	xtbh:$("#xtbh").val(),
        	zylx:$("#zylx").val()
        }, 
		multiselect: true,
        shrinkToFit:false,
        multiboxonly:true,
		mtype: 'POST',
		datatype: "json",
		colNames: ['A端光缆段名称','A端线芯','Z端光缆段名称','Z端线芯','AID','ZID','CTYPE','HTYPE','HID','XTBH','',''],
		colModel: [
		{ name: 'ANAME', width: 230, align: "left",sortable:false },
		{ name: 'PNAME', width: 65, align: "left",sortable:false },
		{ name: 'ZNAME', width: 230, align: "left",sortable:false },
		{ name: 'ZPNAME', width: 65, align: "left",sortable:false },
		{ name: 'AID',hidden:true},
		{ name: 'ZID',hidden:true},
		{ name: 'CTYPE',hidden:true},
		{ name: 'HTYPE',hidden:true},
		{ name: 'HID',hidden:true},
		{ name: 'XTBH',hidden:true},
		{ name: 'ODM',hidden:true},
		{ name: 'XTBH', width: 30,sortable:false,formatter:linkInTopo }
		],
	   	rowNum:10,
		rowList: [10, 20, 30],
		width:$('.section>DIV').width()-2,
		height:90,
		viewrecords: true,
		prmNames : {
			page : "pageNo",
			rows : "pageSize",
			sort : "sidx",
			order : "sord"
		},
		jsonReader: {
            root:"root" , 
            page : "pageNo", // 当前页 
			total : "totalPages", // 总页数 
			records : "total", // 总记录数 
            repeatitems: false,
            id:"XTBH"
        },
		pager: '#grid_l2l_pager'
	});
}
function reload_l2l_grid(_xtbh,_zylx){
	jQuery("#grid_l2l").jqGrid().setGridParam({
        postData: {
	    	xtbh:_xtbh,
	    	zylx:_zylx
        } 
    }).trigger("reloadGrid");
}
// 光缆 grid加入按钮
function join_fmt(cellvalue, options, rowObjec){
	var view = '<a href="#" style="margin-left:5px;" onclick="join_action(\'A33\',\''+rowObjec.XTBH+'\','+'\'A33\',\''+rowObjec.XTBH+'\',{aid:\''+rowObjec.ADSBMC+'\',alx:\''+rowObjec.ADSBLX+'\',zid:\''+rowObjec.ZDSBMC+'\',zlx:\''+rowObjec.ZDSBLX+'\'}'+')"><img title="点击加入拓扑面板" src="'+contextPath+'/css/images/setlink.png'+'" /></a>';
	return view;
}
// 处理加入按钮操作
function join_action(_pzylx,_pxtbh,_zylx,_xtbh,_data){
	if(_data){
		reload_l2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
		reload_p2p_grid(deviceTopo.tid,deviceTopo.ttype); //刷新跳纤grid
		reload_p2l_grid(deviceTopo.tid,deviceTopo.ttype); //刷新成端grid
	}
	if(deviceTopo.lid && deviceTopo.ltype){
		if(deviceTopo.lid == _xtbh && deviceTopo.ltype == _zylx){
			$.fn.Alert("已经选择，请勿重复选择!",3);
			return;
		}else{
			deviceTopo.rid = _xtbh;
			deviceTopo.rtype = _zylx;
			deviceTopo.rpid = _pxtbh;
			deviceTopo.rptype = _pzylx;
			deviceTopo.rdata = _data;
			if(!deviceTopo.ldata && deviceTopo.rdata){
				if((deviceTopo.rdata.aid == deviceTopo.lpid&& deviceTopo.rdata.alx == deviceTopo.lptype) 
						|| (deviceTopo.rdata.zid == deviceTopo.lpid && deviceTopo.rdata.zlx == deviceTopo.lptype)){}else{
					$.fn.Alert("光缆段未经过选中设备!",3);
					return;
				}
			}
			else if(deviceTopo.ldata && !deviceTopo.rdata){
				if((deviceTopo.ldata.aid == deviceTopo.rpid && deviceTopo.ldata.alx == deviceTopo.rptype) 
						|| (deviceTopo.ldata.zid == deviceTopo.rpid && deviceTopo.ldata.zlx == deviceTopo.rptype)){}else{
					$.fn.Alert("光缆段未经过选中设备!",3);
					return;
				}
			}else if(deviceTopo.ldata && deviceTopo.rdata){
				if((deviceTopo.ldata.aid == deviceTopo.rdata.aid && deviceTopo.ldata.alx == deviceTopo.rdata.alx) ||
						(deviceTopo.ldata.aid == deviceTopo.rdata.zid && deviceTopo.ldata.alx == deviceTopo.rdata.zlx)
						|| (deviceTopo.ldata.zid == deviceTopo.rdata.zid && deviceTopo.ldata.zlx == deviceTopo.rdata.zlx)||
						(deviceTopo.ldata.zid == deviceTopo.rdata.aid && deviceTopo.ldata.zlx == deviceTopo.rdata.alx)){}else{
					$.fn.Alert("两条光缆段不经过同一设备，无法进行熔纤操作!",3);
					return;
				}
			}
			enableControls(false);
			troggerLayer();
			$.fn.Alert("请稍后，正在为您绘制面板图....",2,5000);
			//提交选中设备，获取拓扑。
			var url = fullctx+contextPath+'/res/connectmgr/connect!panelXML.action';
			getFlexApp('swf').showTopoByXML(url+'?lid='+deviceTopo.lid+'&ltype='+deviceTopo.ltype+'&rid='+deviceTopo.rid+'&rtype='+deviceTopo.rtype+'&tid='+deviceTopo.tid+'&ttype='+deviceTopo.ttype);
			//console.log(url+'?lid='+deviceTopo.lid+'&ltype='+deviceTopo.ltype+'&rid='+deviceTopo.rid+'&rtype='+deviceTopo.rtype+'&tid='+deviceTopo.tid+'&ttype='+deviceTopo.ttype);
		}
	}else{
		deviceTopo.lid = _xtbh;
		deviceTopo.ltype = _zylx;
		deviceTopo.lpid = _pxtbh;
		deviceTopo.lptype = _pzylx;
		deviceTopo.ldata = _data;
		$.fn.Alert("选择成功，请再选择一台设备进行连接管理!",2);
	}
}
// 处理查看按钮操作
function view_action(_zylx,_xtbh){
	$.fn.Alert("请稍后，正在为您绘制面板图(查看模式)",2,5000);
	troggerLayer();
	deviceTopo.isViewMode = true;
	deviceTopo.viewId = _xtbh;
	deviceTopo.viewType = _zylx;
	var url = fullctx+contextPath+'/res/connectmgr/connect!panelXML.action';
	getFlexApp('swf').showTopoByXML(url+'?lid='+_xtbh+'&ltype='+_zylx+'&rid=&rtype=&tid=&ttype=');
}
//在拓扑面板上显示连接
function linkInTopo(cellvalue, options, rowObjec){
	var view = '';
	if(deviceTopo && deviceTopo.lpid && deviceTopo.rpid){
		if(rowObjec.ODM){
			if((rowObjec.ODM == deviceTopo.lid && rowObjec.ZID == deviceTopo.rpid) || (rowObjec.ODM == deviceTopo.rid && rowObjec.ZID == deviceTopo.lpid)){
				view = '<a href="#" style="margin-left:5px;" onclick="viewInPanel(\''+rowObjec.AID+'\',\''+rowObjec.PNAME+'\',\''+rowObjec.ZID+'\',\''+rowObjec.ZPNAME+'\')"><img title="在面板上显示" src="'+contextPath+'/css/images/getlink.png'+'" /></a>';
				return view;
			}
		}else{
			if((rowObjec.AID == deviceTopo.lpid && rowObjec.ZID == deviceTopo.rpid) || (rowObjec.AID == deviceTopo.rpid && rowObjec.ZID == deviceTopo.lpid)){
				view = '<a href="#" style="margin-left:5px;" onclick="viewInPanel(\''+rowObjec.AID+'\',\''+rowObjec.PNAME+'\',\''+rowObjec.ZID+'\',\''+rowObjec.ZPNAME+'\')"><img title="在面板上显示" src="'+contextPath+'/css/images/getlink.png'+'" /></a>';
				return view;
			}
		}
	}
	return view;
}
//清空选择
function clearData(){
	deviceTopo.isViewMode = null;
	deviceTopo.viewId = null;
	deviceTopo.viewType = null;
	deviceTopo.lid = null;
	deviceTopo.ltype = null;
	deviceTopo.lpid = null;
	deviceTopo.lptype = null;
	deviceTopo.ldata = null;
	deviceTopo.rid = null;
	deviceTopo.rtype = null;
	deviceTopo.rpid = null;
	deviceTopo.rptype = null;
	deviceTopo.rdata = null;
}

//在面板显示
function viewInPanel(AID,ABH,ZID,ZBH){
	getFlexApp('swf').viewInPanel(AID,ABH,ZID,ZBH);
}