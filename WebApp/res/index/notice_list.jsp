<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>公告信息查询</title>
		<script type="text/javascript">
			In.add('uicss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css'});
			In.add('jqgridcss',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/css/ui.jqgrid.css'});
			In.add('jggridjs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/jquery.jqGrid.min.js',type:'js',charset:'utf-8',rely:['jqgridcss','uicss']});
			In.add('jggridlocalejs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/grid.locale-cn.js',type:'js',charset:'utf-8'});
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
			//Ready
			In.ready('jggridjs','jggridlocalejs','commonjs',function(){
				init_grid_data();
			});

			function init_grid_data(){
				$('#grid').jqGrid({
					url: contextPath+'/res/notice!noticeJsonList.action',
					mtype: 'POST',
			        shrinkToFit:false,
					datatype: "json",
					colNames: ['XTBH', '公告类型', '公告标题','发布时间','发布人','查看详细'],
					colModel: [
					{ name: 'XTBH',hidden:true },
					{ name: 'TYPE', width: 120, align: "left",sortable:false },
					{ name: 'TITLE', width: 400, align: "left",sortable:false,formatter:boldFont },
					{ name: 'DT', width: 120, align: "left",sortable:false  },
					{ name: 'MAN', width: 100, align: "left",sortable:false  },
					{ name: 'XTBH', width: 80, align: "left",sortable:false,formatter:checkDetails  }
					],
				   	rowNum:50,
					rowList: [50, 75, 100],
					width: 855,
					height: 525,
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
					pager: '#grid_pager'
				});
			}
			function boldFont(cellvalue, options, rowObjec){
				if(rowObjec.IFREAD == 0){
					var view = '<span style="font-weight:bold;">'+cellvalue+'</span>';
				}else{
					var view = cellvalue;
				}
				return view;
			}
			function checkDetails(cellvalue, options, rowObjec){
				var view = '<a href="#" onclick="view(\''+cellvalue+'\')" style="color:#336699">查看</a>';
				return view;
			}
			function view(noticeid){
				window.parent.parent.openResourcetreediv('查看通告',contextPath+"/res/notice!view.action?nid="+noticeid,600,450);
			}
		</script>
	</head>
	<body>
		<table id="grid"></table>
		<div id="grid_pager"></div> 
	</body>	
</html>