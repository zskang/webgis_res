<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机房</title>
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
	In.add('jfxx_common', {
		path : '${ctx}/js/res/publicmgr/jfxx_common.js',
		type : 'js',
		charset : 'utf-8'
	});
</script>

<script type="text/javascript">
	In.ready('autocompleteJs', 'ztreejs', 'jggridlocalejs', 'wdatepickerjs',
			'jqgridcss', 'commonjs', 'wresize', 'jfxx_common', function() {
				var jqgrid = $("#jfxxgrid").jqGrid(
						{
							url : "${ctx}/res/publicmgr/jfxx!listdata.action",
							datatype : "json",
							mtype : "GET",
							rownumbers : true,
							colNames : [ '站点编号', '资源名称', '产权性质', '机房类型',
									'所属区域', '采集时间', '所属管理区', '代维公司', '维护组',
									'操作' ],
							colModel : [ {
								name : 'ZDBHD',
								id : 'ZDBHD',
								sortable : false
							}, {
								name : 'ZYMC',
								id : 'ZYMC',
								sortable : false
							}, {
								name : 'CQXZ',
								id : 'CQXZ',
								sortable : false
							}, {
								name : 'JFLX_NAME',
								id : 'JFLX_NAME',
								sortable : false
							}, {
								name : 'REGIONNAME',
								id : 'REGIONNAME',
								sortable : false
							}, {
								name : 'CJSJ',
								id : 'CJSJ',
								sortable : false
							}, {
								name : 'PRECINCT',
								id : 'PRECINCT',
								sortable : false
							}, {
								name : 'ORGNAME',
								id : 'ORGNAME',
								sortable : false
							}, {
								name : 'PATROLGROUP',
								id : 'PATROLGROUP',
								sortable : false
							}, {
								name : 'XTBH',
								id : 'XTBH',
								sortable : true,
								formatter : WaitHandjfxxFmatter
							} ],
							rowNum : 15,
							autowidth : true,
							rowList : [ 15, 30, 50 ],
							pager : '#jfxxpager',
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
								id : "XTBH"
							}
						}).navGrid('#jfxxpager', {
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
		jQuery("#jfxxgrid").jqGrid().setGridParam({
			postData : {
				regionid : jQuery("#regionid").val(),
				jflx : jQuery("#jflx").val(),
				cqxz : jQuery("#cqxz").val(),
				zymc : jQuery("#zymc").val(),
				orgid : jQuery("#orgid").val(),
				patrolgroupid : jQuery("#patrolgroupid").val(),
				jfbm : jQuery("#jfbm").val(),
				precinct : jQuery("#precinct").val(),
				begintime : jQuery("#begintime").val(),
				endtime : jQuery("#endtime").val()
			}
		}).trigger("reloadGrid");

	}

	function add() {
		window.location.href = '${ctx}/res/publicmgr/jfxx!input.action';
	}
</script>
</head>
<body>
	<form name="form1" id="form1" method="post">
		<input type="hidden" id="serializeQueryCondition"
			name="serializeQueryCondition" /> <input type="hidden" id="regionid"
			name="regionid" value="${searchCondition.regionid}" />
		<div class="tabcontent">
			<table cellspacing="0" cellpadding="0" border="0" align="center">
				<tr>
					<th>机房名称:</th>
					<td><input type="text" class="inputtext" name="zymc" id="zymc"
						value="${searchCondition.zymc}" /></td>
					<th>机房类型:</th>
					<td><baseinfo:dicselector name="jflx" columntype="JFLX"
							type="select" keyValue="${searchCondition.jflx}"
							cssClass="inputtext" isQuery="query"></baseinfo:dicselector></td>
				</tr>
				<tr>
					<th>区域:</th>
					<td><baseinfo:regiontree widgetId="001"
							defaultValue="${searchCondition.regionid}" cls="inputtext"
							callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>

					</td>
					<th>产权性质:</th>
					<td><baseinfo:dicselector name="cqxz"
							columntype="PROPERTY_RIGHT" type="select"
							keyValue="${searchCondition.cqxz}" cssClass="inputtext"
							isQuery="query"></baseinfo:dicselector></td>
				</tr>
				<tr>
					<th>机房编码:</th>
					<td><input type="text" class="inputtext" name="jfbm" id="jfbm"
						value="${searchCondition.jfbm}" /></td>
					<th>采集时间:</th>
					<td><input type="text" class="Wdate" name="starttime"
						id="starttime" value="${searchCondition.starttime}"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm:ss',maxDate:'#F{$dp.$D(\'endtime\')}'})" />~
						<input type="text" class="Wdate" name="endtime" id="endtime"
						value="${searchCondition.endtime}"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm:ss',minDate:'#F{$dp.$D(\'starttime\')}'})" />
					</td>
				</tr>
				<tr>
					<th>所属管理区:</th>
					<td><input type="text" class="inputtext" name="precinct"
						id="precinct" value="${searchCondition.precinct}" /></td>
					<th>维护组:</th>
					<td><baseinfo:patrolgrouptree widgetId="003"
							defaultValue="${searchCondition.patrolgroupid}" cls="inputtext"
							callBackId="patrolgroupCallBackId" regionId="${user.regionId }"></baseinfo:patrolgrouptree>
					</td>
				</tr>
				<tr>
					<th>代维公司:</th>
					<td><baseinfo:orgtree widgetId="002" orgType="2"
							defaultValue="${searchCondition.orgid}" cls="inputtext"
							callBackId="orgCallBackId" regionId="${user.regionId }"></baseinfo:orgtree>
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
					<td colspan="4" align="center"><input type="button" value="查询"
						onclick="query();"> <input type="button" value="新增"
						onclick="add();" /> <baseinfo:expexcel cls="exprotButton"
							businessId="jflist" name="导出excel"></baseinfo:expexcel></td>
				</tr>
			</table>
		</div>
		<br />
		<div id="content" align="center">
			<table id="jfxxgrid"></table>
			<div id="jfxxpager"></div>
		</div>
	</form>
</body>
</html>