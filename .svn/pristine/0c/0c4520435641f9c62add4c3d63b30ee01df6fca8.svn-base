<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>公告管理</title>
		<script type="text/javascript">
			In.add('topocss',{path:'${ctx }/css/topo.css'});
			In.add('layout',{path:'${ctx}/css/jquery.ct.ui.gis.layout.css'}); 			
			In.add('uicss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css'});
			In.add('jqgridcss',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/css/ui.jqgrid.css'});
			In.add('jggridjs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/jquery.jqGrid.min.js',type:'js',charset:'utf-8',rely:['jqgridcss','uicss']});
			In.add('jggridlocalejs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/grid.locale-cn.js',type:'js',charset:'utf-8'});
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	        In.add('wdatepickerjs',{path:'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',type:'js',charset:'utf-8'});
			//Ready
			In.ready('topocss','layout','jggridjs','jggridlocalejs','commonjs','wdatepickerjs',function(){
				init_grid_data();
			});

			function init_grid_data(){
				$('#grid').jqGrid({
					url: contextPath+'/res/notice!noticeJsonList.action',
					postData: {
						title:$("#title").val(),
						noticetype:$("#noticetype").val()
			        },
					mtype: 'POST',
			        shrinkToFit:false,
					datatype: "json",
					colNames: ['XTBH', '公告类型', '公告标题','发布时间','发布人','操作'], 
					colModel: [
					{ name: 'XTBH',hidden:true },
					{ name: 'TYPE', width: 120, align: "left",sortable:false },
					{ name: 'TITLE', width: 500, align: "left",sortable:false },
					{ name: 'DT', width: 120, align: "left",sortable:false  },
					{ name: 'MAN', width: 100, align: "left",sortable:false  },
					{ name: 'XTBH', width: 80, align: "left",sortable:false,formatter:checkDetails  }
					],
				   	rowNum:50,
					rowList: [50, 75, 100],
					width:995,
					height: 405,
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

			function checkDetails(cellvalue, options, rowObjec){
				var view = '<a href="#" onclick="view(\''+cellvalue+'\')" style="color:#336699">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="delNotice(\''+cellvalue+'\')" style="color:#336699">删除</a>';
				return view;
			}

			function reload(){
				jQuery("#grid").jqGrid().setGridParam({
			        postData: {
						title:$("#title").val(),
						noticetype:$("#noticetype").val()
			        } 
			    }).trigger("reloadGrid");
			}

			function addNotice(){
				window.parent.parent.openResourcetreediv('添加公告',contextPath+"/res/notice!input.action",600,450);
			}

			function delNotice(noticeid){
				if(confirm('确定要删除吗？')){
				$.ajax({
					url: contextPath+'/res/notice!delNotice.action?noticeid='+noticeid,
					dataType: "json",
					type:'GET',
					success : function(result) {
         				$.fn.Alert("删除成功!", 4);
         				reload();
					},
					error : function() {
						alert("删除失败!");
					}
				});		
				}
			}

			function view(noticeid){
				window.parent.parent.openResourcetreediv('查看通告',contextPath+"/res/notice!view.action?nid="+noticeid,600,450);
			}
			
		</script>
	</head>
	<body>
		<div class="TRIGHT" style="width:100%">
			<div class="TRTOP" style="height:17%">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">查询条件</span>
	   		    </div> 
	   		    <div class="formBox2">
	   		    	<table style="width:100%;padding-top:10px;">
	   		    		<tr>
	   		    			<td style="width:12%;height:30px;padding-left:20px;">标题名称</td>
	   		    			<td style="width:20%">
	   		    				<input type="input" id="title" name="title" style="width:90%;height:26px;" />
	   		    			</td>
	   		    			<td style="width:10%;padding-left:20px;">公告类型：</td>
	   		    			<td style="width:20%">
								<baseinfo:dicselector name="noticetype" columntype="NOTICETYPE"
								style="width:90%;height:26px;" type="select" isQuery="query"></baseinfo:dicselector>
	   		    			</td>
	   		    			<td style="width:10%;padding-left:20px;">&nbsp;</td>
	   		    			<td style="width:20%">
	   		    				<input type="button" value="添加公告"  onclick="addNotice()" style="width:80px;height:26px;float:right;margin-right:10px;" />
	   		    				<input type="button" value="查询"  onclick="reload()" style="width:80px;height:26px;float:right;margin-right:10px;" />
	   		    			</td>
	   		    		</tr>
	   		    	</table>
	   		    </div>
			</div>
			<div class="TRBOTTOM" style="height:82%">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">查询结果</span>
	   		    </div>
				<table id="grid"></table>
				<div id="grid_pager"></div> 
			</div>
		</div>
	</body>	
</html>