<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>集客集家信息查询</title>
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
	In
			.ready(
					'autocompleteJs',
					'ztreejs',
					'jggridlocalejs',
					'wdatepickerjs',
					'jqgridcss',
					'commonjs',
					'wresize',
					function() {
						//使用层布局
						var jqgrid = $("#groupcustomergrid")
								.jqGrid(
										{
											url : "${ctx}/res/publicmgr/groupcustomer!listdata.action",
											datatype : "json",
											mtype : 'GET',
											rownumbers : true,
											colNames : [ '站点编号', '客户编号',
													'客户名称', '客户地址', '客户级别',
													'客户服务等级', '客户行业', '区域',
													'代维公司','维护组', '操作' ],
											colModel : [ {
												name : 'ZYMC',
												id : 'ZYMC',
												sortable : false
											}, {
												name : 'GROUPID',
												id : 'GROUPID',
												sortable : false
											}, {
												name : 'GROUPNAME',
												id : 'GROUPNAME',
												sortable : false
											}, {
												name : 'GROUPADDR',
												id : 'GROUPADDR',
												sortable : false
											}, {
												name : 'KHJB',
												id : 'KHJB',
												sortable : false
											}, {
												name : 'GRADEOFSERVICE',
												id : 'GRADEOFSERVICE',
												sortable : false
											}, {
												name : 'INDUSTRY',
												id : 'INDUSTRY',
												sortable : false
											}, {
												name : 'REGIONNAME',
												id : 'REGIONNAME',
												sortable : false
											}, {
												name : 'ORGNAME',
												id : 'ORGNAME',
												sortable : false
											},
											{ name : 'PATROLGROUP',
												id : 'PATROLGROUP',
												sortable : false
												},
												{
												name : 'XTBH',
												id : 'XTBH',
												sortable : false,
												formatter : operateFmatter
											} ],
											rowNum : 15,
											autowidth : true,
											rowList : [ 15, 30, 50 ],
											pager : '#groupcustomerpager',
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
										}).navGrid('#btssitepager', {
									edit : false,
									add : false,
									del : false,
									search : false,
									sortable : false
								});
						In
								.css('#form1 label.error {margin-left: 10px;width: auto;display: inline;}');
						In
								.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
						initRegionTree_001();
						initOrgTree_002();
						initPatrolGroupTree_003();
						getAutoCompleteValue(false, 'zdmc', 'siteid',
								'res_zdxx');
						$(window).wresize(function() {
							grid_resize(jqgrid);
						});
						grid_resize(jqgrid);
					});
	var regionCallBackId = function(id) {
		$('#regionid').val(id);
	}
	var patrolgroupCallBackId = function(id) {
		$('#patrolgroupid').val(id);
	}
	var orgCallBackId = function(id) {
		$('#orgid').val(id);
	}
	//操作按钮
	function operateFmatter(cellvalue, options, rowObjec) {
		var view = '<a href="#" style="color: blue;text-decoration: underline;" onclick="view(\''
				+ rowObjec.XTBH + '\')">查看</a>';
		view += '&nbsp;&nbsp;<a href="#" style="color: blue;text-decoration: underline;" onclick="deleteit(\''
				+ rowObjec.XTBH + '\')">删除</a>';
		view += '&nbsp;&nbsp;<a href="#" style="color: blue;text-decoration: underline;" onclick="editit(\''
				+ rowObjec.XTBH + '\')">编辑</a>';
		return view;
	}

	//编辑
	function view(xtbh) {
		window.parent.openResourcetreediv('查看',
				'${ctx}/res/publicmgr/groupcustomer!view.action?xtbh=' + xtbh);
	}
	//编辑
	function editit(xtbh) {
		window.parent.openResourcetreediv('编辑',
				'${ctx}/res/publicmgr/groupcustomer!inputdwzh.action?xtbh='
						+ xtbh);
	}
	//删除
	function deleteit(xtbh) {
		window.location.href = '${ctx}/res/publicmgr/groupcustomer!delete.action?xtbh='
				+ xtbh;
	}
	//查询
	function query() {
		jQuery("#groupcustomergrid").jqGrid().setGridParam({
			postData : {
				regionid : jQuery("#regionid").val(),
				orgid : jQuery("#orgid").val(),
				siteid : jQuery("#siteid").val(),
				patrolgroupid : jQuery("#patrolgroupid").val(),
				groupid : jQuery("#groupid").val(),
				groupname : jQuery("#groupname").val(),
				industy : jQuery("#industy").val(),
				groupaddr : jQuery("#groupaddr").val(),
				khjb : jQuery("#khjb").val(),
				gradeofservice : jQuery("#gradeofservice").val()
			}
		}).trigger("reloadGrid");

	}
	function add() {
		window.location.href = '${ctx}/res/publicmgr/groupcustomer!inputdwzh.action';
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
					<th>代维公司:</th>
					<td><baseinfo:orgtree widgetId="002" orgType="2"
							defaultValue="${searchCondition.orgid}" cls="inputtext"
							callBackId="orgCallBackId" regionId="${user.regionId }"></baseinfo:orgtree>
					</td>
					<th>维护组:</th>
					<td><baseinfo:patrolgrouptree widgetId="003"
							defaultValue="${searchCondition.patrolgroupid}" cls="inputtext"
							callBackId="patrolgroupCallBackId" regionId="${user.regionId }"></baseinfo:patrolgrouptree></td>
				</tr>
				<tr>
					<th>客户编号:</th>
					<td><input id="groupid" name="groupid" class="inputtext"
						value="${searchCondition.groupid}" type="text" /></td>
					<th>所属区域：</th>
					<td><baseinfo:regiontree widgetId="001" width="220"
							height="120" defaultValue="${searchCondition.regionid}"
							cls="inputtext" callBackId="regionCallBackId"
							regionId="${user.regionId}"></baseinfo:regiontree> <input
						type="hidden" class="required" name="regionid"
						value="${searchCondition.regionid}"></td>
				</tr>
				<tr>
					<th>客户名称:</th>
					<td><input id="groupname" name="groupname" class="inputtext"
						value="${searchCondition.groupname}" type="text" /></td>
					<th>客户行业:</th>
					<td><baseinfo:dicselector name="industy" columntype="INDUSTRY"
							type="select" isQuery="query"></baseinfo:dicselector></td>
				</tr>
				<tr>
					<th>客户地址:</th>
					<td><input type="text" class="inputtext" name="groupaddr"
						value="${searchCondition.groupaddr}" id="groupaddr" /></td>
					<th>客户服务等级:</th>
					<td><baseinfo:dicselector name="gradeofservice"
							columntype="JTKHJB" type="select" isQuery="query"></baseinfo:dicselector></td>
				</tr>
				<tr>
					<th>客户级别:</th>
					<td><baseinfo:dicselector name="khjb" columntype="GROUP_LEVEL"
							type="select" isQuery="query"></baseinfo:dicselector></td>
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
					<td colspan="4" align="center">&nbsp; &nbsp; <input
						type="button" value="新增" onclick="add();" style="width: 80px;" />
						<input type="button" value="查询" style="width: 80px;"
						onclick="query();"> <baseinfo:expexcel cls="exprotButton"
							businessId="groupcustomerlist" name="导出excel"></baseinfo:expexcel></td>
				</tr>
			</table>
		</div>
		<div id="content" align="center">
			<table id="groupcustomergrid"></table>
			<div id="groupcustomerpager"></div>
		</div>
	</form>

</body>
</html>