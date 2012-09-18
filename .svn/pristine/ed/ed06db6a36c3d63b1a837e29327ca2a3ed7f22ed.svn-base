//初始化跳纤数据
function init_p2p_grid(){
	$('#grid_p2p').jqGrid({
		url: contextPath+'/contractor/carapplydispatch!getCarHistoryTaskList.action?id='+$("#id").val(),
		mtype: 'POST',
		datatype: "json",
		colNames: ['任务申请人','任务开始时间','任务结束时间','任务历时','任务行驶公里数'],
		colModel: [
		{ name: 'APPLICANT', width: 150, align: "left",sortable:false },
		{ name: 'USE_START_DATE', width: 150, align: "left",sortable:false },
		{ name: 'USE_END_DATE', width: 150, align: "left",sortable:false },
		{ name: '', width: 150, align: "left",sortable:false },
		{ name: 'DISTANCE', width: 150, align: "left",sortable:false }
		],
	   	rowNum:10,
		rowList: [10, 20, 30],
		width:$('.section>DIV').width()-2,
		height:220,
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

