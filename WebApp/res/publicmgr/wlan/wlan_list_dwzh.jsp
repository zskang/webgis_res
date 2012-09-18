<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<title>Wlan信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	In.add('dwcss', {
		path : '${ctx}/css/style.css'
	});
	In
			.add(
					'uicss',
					{
						path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css',
						rely : [ 'dwcss' ]
					});
	In
			.add(
					'autocompleteCss',
					{
						path : 'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'
					});
	In
			.add(
					'autocompleteJs',
					{
						path : 'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'autocompleteCss' ]
					});
	In
			.add(
					'ztreecss',
					{
						path : 'http://${config.webliburl}/cabletech/ui/ztree/css/zTreeStyle/zTreeStyle.css'
					});
	In
			.add(
					'ztreejs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/ztree/jquery.ztree.all.min.js',
						rely : [ 'ztreecss' ]
					});
	In
			.add(
					'jqgridcss',
					{
						path : 'http://${config.webliburl}/cabletech/ui/jqgrid/css/ui.jqgrid.css',
						rely : [ 'uicss' ]
					});
	In
			.add(
					'jggridjs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/jqgrid/js/jquery.jqGrid.min.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'jqgridcss' ]
					});
	In
			.add(
					'jggridlocalejs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/jqgrid/js/grid.locale-cn.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'jggridjs' ]
					});
	In
			.add(
					'wdatepickerjs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',
						type : 'js',
						charset : 'utf-8'
					});
	In.add('common', {
		path : '${ctx}/js/common.js',
		type : 'js',
		charset : 'utf-8'
	});
	In.add('wlan_common', {
		path : '${ctx}/js/res/publicmgr/wlan_common.js',
		type : 'js',
		charset : 'utf-8'
	});
	In
			.add(
					'commonjs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'common' ]
					});
	In.add('wresize', {
		path : '${ctx}/js/jquery.wresize.js',
		type : 'js',
		charset : 'utf-8'
	});
</script>
<script type="text/javascript">
	In
			.ready(
					'autocompleteJs',
					'ztreejs',
					'jggridlocalejs',
					'wdatepickerjs',
					'jqgridcss',
					'commonjs',
					'wresize',
					'wlan_common',
					function() {
						jQuery(function() {
							var jqgrid = $("#wlangrid")
									.jqGrid(
											{
												url : "${ctx}/res/publicmgr/wlan!listData.action",
												datatype : "json",
												mtype : "GET",
												rownumbers : true,
												colNames : [ '热点名称', '所属站点',
														'NAS-ID', '热点类型',
														'传输类型', 'AP数量', '设备厂家',
														'代维公司', '维护组', '操作' ],
												colModel : [
														{
															name : 'HOSTNAME',
															id : 'HOSTNAME',
															sortable : true
														},
														{
															name : 'ZYMC',
															id : 'ZYMC',
															sortable : true
														},
														{
															name : 'NASID',
															id : 'NASID',
															sortable : true
														},
														{
															name : 'HOSTTYPE',
															id : 'HOSTTYPE',
															sortable : true
														},
														{
															name : 'TRANSTYPE',
															id : 'TRANSTYPE',
															sortable : true
														},
														{
															name : 'APNUM',
															id : 'APNUM',
															sortable : true
														},
														{
															name : 'PRODUCT',
															id : 'PRODUCT',
															sortable : false
														},
														{
															name : 'ORGNAME',
															id : 'ORGNAME',
															sortable : false
														},
														{
															name : 'PATROLGROUP',
															id : 'PATROLGROUP',
															sortable : false
														},
														{
															name : 'ID',
															id : 'ID',
															sortable : false,
															formatter : WaitHandWlanFmatter
														} ],
												rowNum : 15,
												autowidth : true,
												rowList : [ 15, 30, 50 ],
												pager : '#wlanpager',
												shrinkToFit : true,
												viewrecords : true,/* 
																																																																																																											width : '600',
																																																																																																											height : '300', */
												hidegrid : false,
												prmNames : {
													page : "pageNo",
													rows : "rows",
													sort : "sidx",
													order : "sord"
												},
												jsonReader : {
													root : "root", // 数据行（默认为：rows） 
													page : "pageNo", // 当前页 
													total : "totalPages", // 总页数 
													records : "total", // 总记录数 
													repeatitems : false,
													id : "ID"
												}
											}).navGrid('#wlanpager', {
										edit : false,
										add : false,
										del : false,
										search : false,
										sortable : false
									});
							$(window).wresize(function() {
								grid_resize(jqgrid);
							});

							getAutoCompleteValue(false, 'zdmc', 'siteId',
									'res_zdxx');
							grid_resize(jqgrid);
							initRegionTree_001();
							initOrgTree_002();
							initPatrolGroupTree_003();
						});
					});
	var regionCallBackId = function(id) {
		$('#regionid').val(id);
	}
	var orgCallBackId = function(id) {
		$('#orgid').val(id);
	}

	var patrolgroupCallBackId = function(id) {
		$('#patrolgroupid').val(id);
	}
	function query() {
		jQuery("#wlangrid").jqGrid().setGridParam({
			postData : {
				regionid : jQuery("#regionid").val(),
				orgid : jQuery("#orgid").val(),
				patrolgroupid : jQuery("#patrolgroupid").val(),
				hostName : jQuery("#hostName").val(),
				hostType : jQuery("#hostType").val(),
				transType : jQuery("#transType").val(),
				siteId : jQuery("#siteId").val(),
				product : jQuery("#product").val()
			}
		}).trigger("reloadGrid");
	}

	function add() {
		window.location.href = '${ctx}/res/publicmgr/wlan!input.action';
	}
</script>
</head>
<body>
	<form name="form1" id="form1" method="post">
		<div class="tabcontent">
			<input type="hidden" id="serializeQueryCondition"
				name="serializeQueryCondition" />
			<table cellspacing="0" cellpadding="0" border="0" align="center">
				<tr>
					<th>热点名称:</th>
					<td><input name="hostName" id="hostName"
						value="${searchCondition.hostName}" class="inputtext" type="text" />
					</td>
					<th>热点类型:</th>
					<td><baseinfo:dicselector name="hostType"
							columntype="OVERLAY_TYPE" type="select" cssClass="inputtext"
							keyValue="${searchCondition.hostType}"></baseinfo:dicselector></td>
				</tr>
				<tr>
					<th>传输类型:</th>
					<td><baseinfo:dicselector name="transType"
							columntype="TRANSFER_TYPE" type="select" cssClass="inputtext"
							keyValue="${searchCondition.transType}"></baseinfo:dicselector></td>
					<th>维护组:</th>
					<td><baseinfo:patrolgrouptree widgetId="003" orgType="2"
							cls="inputtext" regionId="${user.regionId}"
							callBackId="groupCallBackId"></baseinfo:patrolgrouptree> <input
						id="patrolgroupid" name="patrolgroupid" hidden="true" /></td>
				</tr>
				<tr>
					<th>设备厂家:</th>
					<td><input name="product" id="product"
						value="${searchCondition.product}" class="inputtext" type="text" />
					</td>
					<th>所在站点:</th>
					<td><input id="zdmc" name="zdmc"
						class="required ui-form-input" type="text"
						onblur="judgeHiddenValue(this,'siteId')"
						value='<resinfo:resCommon keyValue="${searchCondition.siteId}" 
					tableName="res_zdxx"></resinfo:resCommon>' />
						<input type="hidden" name="siteId" id="siteId"
						value="${searchCondition.siteId }"></td>
				</tr>
				<tr>
					<th>所属区域</th>
					<td><baseinfo:regiontree widgetId="001" cls="inputtext"
							regionId="${user.regionId}" callBackId="regionCallBackId"></baseinfo:regiontree><input
						type="hidden" id="regionid" name="regionid"
						value="${searchCondition.regionid}" /></td>
					<th>代维公司:</th>
					<td><baseinfo:orgtree widgetId="002"
							regionId="${user.regionId}" orgType="2" cls="inputtext"
							callBackId="orgCallBackId"></baseinfo:orgtree> <input id="orgid"
						name="orgid" hidden="true" /></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="button" value="新增"
						onclick="add();" /> <input type="button" value="查询"
						onclick="query();" /> <baseinfo:expexcel cls="exprotButton"
							businessId="wlanlist" name="导出excel"></baseinfo:expexcel></td>
				</tr>
			</table>
		</div>
		<br />
		<div id="content" align="center">
			<table id="wlangrid"></table>
			<div id="wlanpager"></div>
		</div>
	</form>

</body>
</html>