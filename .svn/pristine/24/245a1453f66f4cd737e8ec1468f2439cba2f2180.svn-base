//初始化跳纤数据
function init_p2p_grid(){
	$('#grid_p2p').jqGrid({
		url: contextPath+'/contractor/search!searchRsList.action?id='+$("#id").val(),
		mtype: 'POST',
		datatype: "json",
		colNames: ['代维单位','巡检人','到达时间','巡检开始时间','巡检结束时间','巡检历时','上报异常项数'],
		colModel: [
		{ name: 'RS_NAME', align: "left",sortable:false },
		{ name: 'PATROLMANNAME', align: "left",sortable:false },
		{ name: 'ARRIVE_TIME', align: "left",sortable:false },
		{ name: 'START_TIME', align: "left",sortable:false },
		{ name: 'END_TIME', align: "left",sortable:false },
		{ name: 'TAKETIME', align: "left",sortable:false },
		{ name: 'EXCEPTIONCOUNT', align: "left",sortable:false }
		],
	   	rowNum:10,
		rowList: [10, 20, 30],
		width:$('.section>DIV').width()-2,
		height:220,
		multiselect: false,
		viewrecords: true,
		viewrecords: true,
		autowidth : true,
		shrinkToFit : true,		
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

