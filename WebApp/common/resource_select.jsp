<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx }/js/jQuery/jqgrid/css/ui.jqgrid.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${ctx}/js/jQuery/jqgrid/grid.locale-cn.js"></script>
<script type="text/javascript"
	src="${ctx}/js/jQuery/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript"
	src="${ctx}/js/jQuery/artdialog/jquery.artDialog.js?skin=default"></script>
		
<title>选择资源</title>
<script>
	jQuery(function(){
		setContextPath('${ctx }');
		var multiselect=false;
	//使用层布局
  var jqgrid=jQuery("#resourcegrid").jqGrid({    
		url: '${ctx}/commonaccess!getresourceinfolist.action',   
		datatype: "json",    
		mtype: 'GET',
		rownumbers: true,
		colNames:['资源ID','资源编号','资源名称','资源地址','所属区域', '所属代维','所属巡检组','精度','纬度','LON','LAT','POINTID','资源类型'],
		colModel:[
		          {name:'ID',id:'ID',sortable:false,hidden:true},
		          {name:'STATIONCODE',id:'STATIONCODE',sortable:false},
		          {name:'NAME',id:'NAME',sortable:false},
		          {name:'ADDRESS',id:'ADDRESS',sortable:false},
		          {name:'REGIONNAME',id:'REGIONNAME',sortable:false},
		          {name:'ORGNAME',id:'ORGNAME',sortable:false},
		          {name:'PATROLGROUPNAME',id:'PATROLGROUPNAME',sortable:false},
		          {name:'CT_X',id:'CT_X',sortable:false},
		          {name:'CT_Y',id:'CT_Y',sortable:false},
		          {name:'LON',id:'LON',sortable:false,hidden:true},
		          {name:'LAT',id:'LAT',sortable:false,hidden:true},
		          {name:'POINTID',id:'POINTID',sortable:false,hidden:true},
		          {name:'TYPE',id:'TYPE',sortable:false,hidden:true}
		          ],      
		rowNum:10,
		autowidth:true,
		rowList:[10,20,30],    
		pager: '#resourcepager',
		shrinkToFit:true,
		viewrecords: true, 
		hidegrid: false, 
		multiselect: ${multi},
		prmNames: {page:"pageNo",rows:"rows", sort: "sidx",order: "sord"},
		jsonReader: {
               root:"result" ,                // 数据行（默认为：rows） 
               page: "pageNo" ,            // 当前页 
               total: "totalPages" ,    // 总页数 
               records: "totalCount",     // 总记录数 
               repeatitems: false,
               id:"POINTID"
               }
		  }).navGrid('#resourcepager',{edit:false ,add:false ,del:false,search:false,sortable:false  });
	
  jQuery(window).wresize(function(){
		grid_resize(jqgrid);
	});
	grid_resize(jqgrid);
	})
    //查询
	function query() {
		jQuery("#resourcegrid").jqGrid().setGridParam({
            postData: {
            	'rsparameter.rsname':jQuery("#rsname").val(),
            	'rsparameter.rstype':jQuery("#resourcetype").val(),
            	'rsparameter.address':jQuery("#address").val(),
            	'rsparameter.stationcode':jQuery("#stationcode").val()
            	} 
            }).trigger("reloadGrid");
	}
	//选择确定
	function selectOK(){
		var jqgrid=jQuery("#resourcegrid");
		var ids;
		var arr=new Array();
		if(${multi}){
			ids = jqgrid.jqGrid('getGridParam','selarrrow'); 
			 for (var i = 0; i < ids.length; i++) {
				 var rowData = jqgrid.getRowData(ids[i]);
				 arr.push(rowData);
		       }
		}else{
			ids = jqgrid.jqGrid('getGridParam','selrow'); 
			var rowData = jqgrid.getRowData(ids);
			if(!!ids){
			arr.push(rowData);
			}
		}
		if(arr.length>0){
			window.returnValue = arr;
			window.close();
		}else{
			alert('请选择资源!');
		}
	}
</script>
</head>
<body>
	<form
		action="${ctx }/wplan/patrolinfoAction!list.action?type=${businesstype}"
		id="patrolinfoForm" name="patrolinfoForm" method="post">
		<div id="header">
			<div class="title_bg">
				<div class="title">选择资源</div>
			</div>
			<div class="tabcontent">
				<table cellspacing="0" cellpadding="0" border="0" align="center">
					<tr>
						<th>资源名称：</th>
						<td><input id="rsname" name="rsname" class="inputtext"
							type="text" maxlength="60" />
						</td>
						<th>资源类型：</th>
						<td><baseinfo:dicselector name="resourcetype"
								columntype="pointtype" type="select" isQuery="query"></baseinfo:dicselector>
						</td>
					</tr>
					<tr>
						<th>资源编号：</th>
						<td><input id="stationcode" name="stationcode" class="inputtext"
							type="text" maxlength="60" /></td>
						<th>资源地址：</th>
						<td><input id="address" name="address" class="inputtext"
							type="text" maxlength="60" />
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center"><input type="button"
							onclick="query();" class="button" value="查询" /> <input
							type="button" onclick="selectOK();" class="button" value="选择确定" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="content" align="center" style="padding-top: 2px">
			<table id="resourcegrid"></table>
			<div id="resourcepager"></div>
		</div>
	</form>
</body>
</html>