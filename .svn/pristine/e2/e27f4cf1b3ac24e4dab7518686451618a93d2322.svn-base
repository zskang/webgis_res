//装载数据
function initgrid(index){
	var urls = [
		contextPath+'/contractor/patrolmaninfo!getCurrentTask.action?id='+$("#id").val(),
		contextPath+'/contractor/patrolmaninfo!getCurrentTaskDetail.action?id='+$("#id").val()
	];
	var colNames = [["任务名称","开始时间","结束时间","当前巡检率"],['站点名称','进站时间','离开时间','巡检历时','异常项数量']];
	var colModels = [
		[
			{ name: 'PLAN_NAME', align: "left",sortable:false },
			{ name: 'START_TIME', align: "left",sortable:false },
			{ name: 'END_TIME', align: "left",sortable:false },
			{ name: 'RATE', align: "left",sortable:false }		
		],
		[
			{ name: 'RS_NAME', align: "left",sortable:false },
			{ name: 'START_TIME', align: "left",sortable:false },
			{ name: 'END_TIME', align: "left",sortable:false },
			{ name: 'TAKETIME', align: "left",sortable:false },
			{ name: 'EXCEPTIONCOUNT', align: "left",sortable:false }		
		]
	];
	$('#grid').jqGrid({
		url: urls[index]+"&R="+Math.random(),
		mtype: 'POST',
		datatype: "json",
		colNames: colNames[index],
		colModel: colModels[index],
	   	rowNum:10,
		rowList: [10, 20, 30],
		width:$('.section>DIV').width()-2,
		height:220,
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
            id:"ID"
        },
		pager: '#grid_pager'
	});
}