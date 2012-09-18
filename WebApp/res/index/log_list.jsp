<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>消息日志查询</title>
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
					url: contextPath+'/res/log!logListJson.action',
					postData: {
			        	xtbh:$("#xtbh").val(),
			        	zylx:$("#zylx").val(),
			        	zymc:$("#zymc").val(),
			        	action:$("#action").val(),
			        	actman:$("#actman").val(),
			        	begin:$("#begin").val(),
			        	end:$("#end").val()
			        }, 
					mtype: 'POST',
			        shrinkToFit:false,
					datatype: "json",
					colNames: ['XTBH', '系统编号', '资源名称','资源类型','操作类型','操作时间','操作人'],
					colModel: [
					{ name: 'ID',hidden:true },
					{ name: 'XTBH', width: 120, align: "left",sortable:false },
					{ name: 'ZYMC', width: 250, align: "left",sortable:false },
					{ name: 'ZYLX', width: 100, align: "left",sortable:false  },
					{ name: 'ACT', width: 120, align: "left",sortable:false  },
					{ name: 'DT', width: 120, align: "left",sortable:false  },
					{ name: 'MAN', width: 100, align: "left",sortable:false  }
					],
				   	rowNum:50,
					rowList: [50, 75, 100],
					width: 865,
					height: 365,
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
			            id:"ID"
			        },
					pager: '#grid_pager'
				});
			}

			function reload(){
				jQuery("#grid").jqGrid().setGridParam({
			        postData: {
					xtbh:$("#xtbh").val(),
		        	zylx:$("#zylx").val(),
		        	zymc:$("#zymc").val(),
		        	action:$("#action").val(),
		        	actman:$("#actman").val(),
		        	begin:$("#begin").val(),
		        	end:$("#end").val()
			        } 
			    }).trigger("reloadGrid");
			}
			
		</script>
	</head>
	<body>
		<div class="TRIGHT" style="width:100%">
			<div class="TRTOP" style="height:25%">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">查询条件</span>
	   		    </div> 
	   		    <div class="formBox2">
	   		    	<table style="width:100%;padding-top:10px;">
	   		    		<tr>
	   		    			<td style="width:12%;height:30px;padding-left:20px;">资源类型：</td>
	   		    			<td style="width:20%">
	   		    				<select name="zylx" id="zylx" style="width:90%;height:26px;">
									<option value="">不限</option>
									<option value="A21">管井</option>
									<option value="AD601">管道段</option>
									<option value="AD606">管道段系统</option>
									<option value="A20">电杆</option>
									<option value="AD602">杆路段</option>
									<option value="AD607">杆路段系统</option>
									<option value="A22">标石</option>
									<option value="AD603">标石段</option>
									<option value="AD608">标石段系统</option>
									<option value="A23">挂墙</option>
									<option value="AD604">挂墙段</option>
									<option value="AD609">挂墙段系统</option>
									<option value="AD605">引上</option>
									<option value="AD6010">引上系统</option>
									<option value="AA003">光交接箱</option>
									<option value="AA006">光终端盒</option>
									<option value="AA004">光分纤箱</option>
									<option value="AA005">光接头</option>
									<option value="A33">光缆段</option>
									<option value="AD6011">光缆</option>
									<option value="AD706">光缆盘留</option>
									<option value="A29">站点</option>
									<option value="AD701">机房</option>
									<option value="AA001">ODF</option>
									<option value="AA502">集团客户</option>
									<option value="AA312">校园网</option>
									<option value="A35">宽带小区</option>
									<option value="A36">营业厅</option>
								</select>
	   		    			</td>
	   		    			<td style="width:10%;padding-left:20px;">资源名称：</td>
	   		    			<td style="width:20%">
	   		    				<input type="input" id="zymc" name="zymc" style="width:90%;height:26px;" />
	   		    			</td>
	   		    			<td style="width:10%;padding-left:20px;">系统编号：</td>
	   		    			<td style="width:20%">
	   		    				<input type="input" id="xtbh" name="xtbh" style="width:90%;height:26px;" />
	   		    			</td>
	   		    		</tr>
	   		    		<tr>
	   		    			<td style="width:12%;height:30px;padding-left:20px;">操作类型：</td>
	   		    			<td style="width:20%">
								<baseinfo:dicselector name="action" columntype="ACTIONTYPE"
								style="width:90%;height:26px;" type="select" isQuery="query"></baseinfo:dicselector>
	   		    			</td>
	   		    			<td style="width:10%;padding-left:20px;">操作人：</td>
	   		    			<td style="width:20%">
	   		    				<input type="input" id="actman" name="actman" style="width:90%;height:26px;" />
	   		    			</td>
	   		    			<td style="width:10%;padding-left:20px;">&nbsp;</td>
	   		    			<td style="width:20%">&nbsp;</td>
	   		    		</tr>
	   		    		<tr>
	   		    			<td style="width:12%;height:30px;padding-left:20px;">开始时间：</td>
	   		    			<td style="width:20%">
	   		    				<input type="input" id="begin" name="begin" style="width:90%;height:26px;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
	   		    			</td>
	   		    			<td style="width:10%;padding-left:20px;">结束时间：</td>
	   		    			<td style="width:20%">
	   		    				<input type="input" id="end" name="end" style="width:90%;height:26px;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
	   		    			</td>
	   		    			<td style="width:10%;padding-left:20px;">&nbsp;</td>
	   		    			<td style="width:20%"><input type="button" value="查询"  onclick="reload()" style="width:80px;height:26px;float:right;margin-right:10px;" /></td>
	   		    		</tr>
	   		    	</table>
	   		    </div>
			</div>
			<div class="TRBOTTOM" style="height:74%">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">查询结果</span>
	   		    </div>
				<table id="grid"></table>
				<div id="grid_pager"></div> 
			</div>
		</div>
	</body>	
</html>