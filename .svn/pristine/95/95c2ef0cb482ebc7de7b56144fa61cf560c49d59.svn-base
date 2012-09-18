<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
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
			var cols_modal = null;
			In.ready('topocss','layout','jggridjs','jggridlocalejs','commonjs','wdatepickerjs',function(){
				$('.formBoxIrem')[1].style.display = "none";
				$('.formBoxIrem')[2].style.display = "none";
				doChange();
			});
			//统计类型变更操作
			function doChange(){
				var zylx = $("input:[name=zylx]:radio:checked").val();//$('#zylx').val();
				var tjlx = $('#tjlx').val();
				if(tjlx == "AE702"){
					$('.formBoxIrem')[1].style.display = "block";
					$('.formBoxIrem')[2].style.display = "block";
				}else{
					$('.formBoxIrem')[1].style.display = "none";
					$('.formBoxIrem')[2].style.display = "none";
				}
				$.ajax({
					url: contextPath+'/res/analyse/totalanalyse!initGridHeader.action?zylx='+zylx+'&tjlx='+tjlx,
					dataType: "json",
					type:'GET',
					success : function(result) {
						if(result && result[0]){
							var header = result[0];
							cols_modal = {};
							cols_modal.encols = new Array();
							cols_modal.cncols = new Array();
							for(var prop in header){
								var headerprops = header[prop].split(',');
								cols_modal.cncols.push(headerprops[0]);
								var visb = false;
								if(headerprops[1] == "false"){
									visb = true;
								}
								cols_modal.encols.push({name:prop,width:105,sortable:false,hidden:visb});
							}
							init_grid_data();
						}
					},
					error : function() {
						$('#grid').GridUnload();
						$.fn.Alert("获取统计指标失败！",3);
					}
				});	
			}
			
			//初始化grid
			function init_grid_data(){
				$('#grid').GridUnload();
				$('#grid').jqGrid({
					url: contextPath+'/res/analyse/totalanalyse!initGridData.action',
					postData: {
			        	zylx:$("input:[name=zylx]:radio:checked").val(),//$("#zylx").val(),
			        	tjlx:$("#tjlx").val(),
			        	start:$("#start").val(),
			        	end:$("#end").val()
			        }, 
					mtype: 'POST',
					datatype: "json",
					colNames: cols_modal.cncols,
					colModel: cols_modal.encols,
			        shrinkToFit:false,
				   	rowNum:50,
					rowList: [10, 20, 30],
					width: $('.TRBOTTOM').width()-5,
					height: $('.TRBOTTOM').height()-50,
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
		</script>
	</head>
	<body>
		<div class="TLEFT">
			<div class="TLTOP" style="height:33%">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">总量统计分析</span>
	   		    </div>
				<div class="formBox">
					<div class="formBoxIrem">
						<span class="ui-form-input-title">统计类型：</span>
						<baseinfo:dicselector name="tjlx" columntype="ZYTJLX" onChange="doChange()"
						style="width:165px;height:22px;margin-top:2px;" type="select"></baseinfo:dicselector>
					</div>
					<div class="formBoxIrem">
						<span class="ui-form-input-title">采集开始日期：</span>
						<input type="input" id="start" name="start" onfocus="WdatePicker({onpicking:doChange,oncleared:doChange,dateFmt:'yyyy-MM-dd'})" />
					</div>
					<div class="formBoxIrem">
						<span class="ui-form-input-title">采集结束日期：</span>
						<input type="input" id="end" name="end" onfocus="WdatePicker({onpicking:doChange,oncleared:doChange,dateFmt:'yyyy-MM-dd'})" />
					</div>
				</div>
			</div>
			<div class="TLBOTTOM" style="height:69%">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">统计指标</span>
	   		    </div>
				<div class="formBox2">
					<div class="formBoxIrem"><input class="checkInput" onclick="doChange()" name="zylx" id="zylx" type="radio" checked="checked" value="T001"/><span class="checkName">总个数（个）</span></div>
					<div class="formBoxIrem"><input class="checkInput" onclick="doChange()" name="zylx" id="zylx" type="radio" value="T002"/><span class="checkName">总长度（公里）</span></div>
					<div class="formBoxIrem"><input class="checkInput" onclick="doChange()" name="zylx" id="zylx" type="radio" value="T003"/><span class="checkName">租用个数（个）</span></div>
					<div class="formBoxIrem"><input class="checkInput" onclick="doChange()" name="zylx" id="zylx" type="radio" value="T004"/><span class="checkName">租用长度（公里）</span></div>
					<div class="formBoxIrem"><input class="checkInput" onclick="doChange()" name="zylx" id="zylx" type="radio" value="T005"/><span class="checkName">自建个数（个）</span></div>
					<div class="formBoxIrem"><input class="checkInput" onclick="doChange()" name="zylx" id="zylx" type="radio" value="T006"/><span class="checkName">自建长度（公里）</span></div>
				</div>
			</div>
		</div>
		<div class="TRIGHT">
			<div class="TRTOP">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">统计结果</span>
	   		    </div> 
			</div>
			<div class="TRBOTTOM">
				<table id="grid"></table>
				<div id="grid_pager"></div>
			</div>
		</div>
	</body>
</html>