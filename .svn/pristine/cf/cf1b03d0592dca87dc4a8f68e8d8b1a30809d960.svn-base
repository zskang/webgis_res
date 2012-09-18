<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>直放站信息查询</title>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
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
	In.add('prepeater_common', {
		path : '${ctx}/js/res/publicmgr/prepeater_common.js',
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
					'prepeater_common',
					function() {
						var jqgrid = $("#prepeatergrid")
								.jqGrid(
										{
											url : "${ctx}/res/publicmgr/prepeater!listData.action",
											datatype : "json",
											mtype : "GET",
											rownumbers : true,
											colNames : [ '直放站名称', '所属站点',
													'直放站类型', '网元状态', '供电方式',
													'区域', '代维公司', '维护组',
													'入网时间', '设备提供商', '操作' ],
											colModel : [
													{
														name : 'REPEATERNAME',
														id : 'REPEATERNAME',
														sortable : true
													},
													{
														name : 'ZYMC',
														id : 'ZYMC',
														sortable : true
													},
													{
														name : 'REPEATERTYPE',
														id : 'REPEATERTYPE',
														sortable : true
													},
													{
														name : 'STATE',
														id : 'STATE',
														sortable : true
													},
													{
														name : 'POWERSUPPLYMODE',
														id : 'POWER_SUPPLY_MODE',
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
														name : 'OPENINGTIME',
														id : 'OPENINGTIME',
														sortable : false
													},
													{
														name : 'PRODUCER',
														id : 'PRODUCER',
														sortable : false
													},
													{
														name : 'REPEATER_ID',
														id : 'REPEATER_ID',
														sortable : false,
														formatter : WaitHandprepeaterFmatter
													} ],
											rowNum : 15,
											autowidth : true,
											rowList : [ 15, 30, 50 ],
											pager : '#prepeaterpager',
											shrinkToFit : true,
											viewrecords : true,
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
												id : "REPEATER_ID"
											}
										}).navGrid('#prepeaterpager', {
									edit : false,
									add : false,
									del : false,
									search : false,
									sortable : false
								});
						initRegionTree_001();
						initOrgTree_002();
						initPatrolGroupTree_003();
						$(window).wresize(function() {
							grid_resize(jqgrid);
						});
						grid_resize(jqgrid);
						getAutoCompleteValue(false, 'zdmc', 'siteid',
								'res_zdxx');
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
		jQuery("#prepeatergrid").jqGrid().setGridParam({
			postData : {
				regionid : jQuery("#regionid").val(),
				siteid : jQuery("#siteid").val(),
				orgid : jQuery("#orgid").val(),
				producer : jQuery("#producer").val(),
				prepeaterType : jQuery("#prepeaterType").val(),
				prepeaterName : jQuery("#prepeaterName").val(),
				patrolgroupid : jQuery("#patrolgroupid").val(),
				begintime : jQuery("#begintime").val(),
				endtime : jQuery("#endtime").val()
			}
		}).trigger("reloadGrid");

	}
	function add() {
		window.location.href = '${ctx}/res/publicmgr/prepeater!input.action';
	}
</script>
</head>
<body>
	<form name="form1" id="form1" method="post">
		<div class="tabcontent">
			<input type="hidden" id="serializeQueryCondition"
				name="serializeQueryCondition" /> <input type="hidden"
				id="regionid" name="regionid" value="${searchCondition.regionid}" />
			<input type="hidden" id="orgid" name="orgid"
				value="${searchCondition.orgid}" /> <input type="hidden"
				id="patrolgroupid" name="patrolgroupid"
				value="${searchCondition.patrolgroupid}" />
			<table cellspacing="0" cellpadding="0" border="0" align="center">
				<tr>
					<th>直放站名称:</th>
					<td><input type="text" class="inputtext" name="prepeaterName"
						id="prepeaterName" value="${searchCondition.prepeaterName}" /></td>
					<th>直放站类型:</th>
					<td><baseinfo:dicselector name="prepeaterType"
							columntype="REPEATER_TYPE" type="select" cssClass="inputtext"
							keyValue="${searchCondition.prepeaterType}"></baseinfo:dicselector>
					</td>
				</tr>
				<tr>
					<th>入网时间:</th>
					<td><input type="text" class=" inputtext" name="begintime"
						id="begintime" value="${searchCondition.begintime}"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endtime\')}'})" />~<input
						type="text" class=" inputtext" name="endtime" id="endtime"
						value="${searchCondition.endtime}"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'begintime\')}'})" />
					</td>
					<th>所在站点:</th>
					<td><input id="zdmc" name="zdmc"
						class="required ui-form-input" type="text"
						onblur="judgeHiddenValue(this,'siteid')"
						value='<resinfo:resCommon keyValue="${searchCondition.siteid}" 
					tableName="res_zdxx"></resinfo:resCommon>' />
						<input type="hidden" name="siteid" id="siteid"
						value="${searchCondition.siteid }"></td>
				</tr>
				<tr>
					<th>设备提供商:</th>
					<td><input type="text" class="inputtext" name="producer"
						id="producer" value="${searchCondition.producer}" /></td>
					<th>区域:</th>
					<td><baseinfo:regiontree widgetId="001"
							defaultValue="${searchCondition.regionid}" cls="inputtext"
							callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>
					</td>
				</tr>
				<tr>
					<th>代维公司:</th>
					<td><baseinfo:orgtree widgetId="002" orgType="2"
							defaultValue="${searchCondition.orgid}" cls="inputtext"
							callBackId="orgCallBackId" regionId="${user.regionId }"></baseinfo:orgtree>
					</td>
					<th>维护组:</th>
					<td><baseinfo:patrolgrouptree widgetId="003"
							defaultValue="${searchCondition.patrolgroupid}" cls="inputtext"
							callBackId="patrolgroupCallBackId" regionId="${user.regionId }"></baseinfo:patrolgrouptree>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="button" value="查询"
						onclick="query();" /> <input type="button" value="新增"
						onclick="add();" /> <baseinfo:expexcel cls="exprotButton"
							businessId="prepeaterlist" name="导出excel"></baseinfo:expexcel></td>
				</tr>
			</table>
		</div>
		<br />
		<div id="content" align="center">
			<table id="prepeatergrid"></table>
			<div id="prepeaterpager"></div>
		</div>
	</form>
</body>
</html>