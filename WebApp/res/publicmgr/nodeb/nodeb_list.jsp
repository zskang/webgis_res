<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>nodeb 信息列表</title>
<script type="text/javascript">
	In.add('dwcss', {path : '${ctx}/css/style.css'});
In.add('uicss', {path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css',rely : ['dwcss']});
In.add('autocompleteCss', {path : 'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
In.add('autocompleteJs', {path : 'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type : 'js',charset : 'utf-8',rely : ['autocompleteCss']});
In.add('ztreecss', {path : 'http://${config.webliburl}/cabletech/ui/ztree/css/zTreeStyle/zTreeStyle.css'});
In.add('ztreejs', {path : 'http://${config.webliburl}/cabletech/ui/ztree/jquery.ztree.all.min.js',rely : ['ztreecss']});
In.add('jqgridcss', {path : 'http://${config.webliburl}/cabletech/ui/jqgrid/css/ui.jqgrid.css',rely : ['uicss']});
In.add('jggridjs', {path : 'http://${config.webliburl}/cabletech/ui/jqgrid/js/jquery.jqGrid.min.js',type : 'js',charset : 'utf-8',rely : ['jqgridcss']});
In.add('jggridlocalejs', {path : 'http://${config.webliburl}/cabletech/ui/jqgrid/js/grid.locale-cn.js',type : 'js',charset : 'utf-8',rely : ['jggridjs']});
In.add('wdatepickerjs', {path : 'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',type : 'js',charset : 'utf-8'});
In.add('common', {path : '${ctx}/js/common.js',type : 'js',charset : 'utf-8'});
In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8',rely : ['common']});
In.add('wresize', {path : '${ctx}/js/jquery.wresize.js',type : 'js',charset : 'utf-8'});
</script>
<script type="text/javascript">
	In.ready('autocompleteJs','ztreejs','jggridlocalejs','wdatepickerjs','jqgridcss','commonjs','wresize',function() {
		initRegionTree_001();
		initOrgTree_002();
		initPatrolGroupTree_003();
			//使用层布局
			var jqgrid = $("#nodebgrid").jqGrid({
				url : "${ctx}/res/publicmgr/nodeb!listdata.action",
				datatype : "json",mtype : 'GET',rownumbers : true,
				colNames : [ '站点编号', '站点名称','网元名称', '中文名称','基站级别', '所属机房', '区域','入网时间', '代维公司','代维组','操作' ],
				colModel : [ 
					{name : 'ZDBH',id : 'ZDBH',sortable : false}, 
					{name : 'ZDMC',id : 'ZDMC',sortable : false}, 
					{name : 'NE_NAME',id : 'NE_NAME',sortable : false}, 
					{name : 'CN_NAME',id : 'CN_NAME',sortable : false}, 
					{name : 'BS_LEVELNAME',id : 'BS_LEVELNAME',sortable : false}, 
					{name : 'JFMC',id : 'JFMC',sortable : false}, 
					{name : 'REGIONNAME',id : 'REGIONNAME',sortable : false}, 
					{name : 'OPENINGTIME',id : 'OPENINGTIME',sortable : false}, 
					{name : 'ORGNAME',id : 'ORGNAME',sortable : false}, 
					{name : 'PATROLGROUP',id : 'PATROLGROUP',sortable : false}, 
					{name : 'NODE_ID',id : 'NODE_ID',sortable : false,formatter : operateFmatter} 
				],
				rowNum : 15,autowidth : true,rowList : [ 15, 30, 50 ],pager : '#nodebpager',
				shrinkToFit : true,viewrecords : true,hidegrid : false,
				prmNames : {page : "pageNo",rows : "rows",sort : "sidx",order : "sord"},
				jsonReader : {root : "root",page : "pageNo",total : "totalPages",records : "total",repeatitems : false,id : "NODEB_ID"}
			}).navGrid('#nodebpager', {edit : false,add : false,del : false,search : false,sortable : false});
			$(window).wresize(function() {
				grid_resize(jqgrid);
			});
			grid_resize(jqgrid); 
     		getAutoCompleteValue(false,'zdmc','siteid','res_zdxx');
     		getAutoCompleteValue(false,'jfmc','roomid','res_jf');
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
	//操作按钮
	function operateFmatter(cellvalue, options, rowObjec) {
		var view = '<a href="#" style="color: blue;text-decoration: underline;" onclick="view(\''
				+ rowObjec.NODEB_ID + '\')">查看</a>';
		view += '&nbsp;&nbsp;<a href="#" style="color: blue;text-decoration: underline;" onclick="editit(\''
				+ rowObjec.NODEB_ID + '\')">编辑</a>';
		view += '&nbsp;&nbsp;<a href="#" style="color: blue;text-decoration: underline;" onclick="deleteit(\''
				+ rowObjec.NODEB_ID + '\')">删除</a>';
		return view;
	}
	//查看
	function view(nodeid) {
		window.location.href='${ctx}/res/publicmgr/nodeb!view.action?nodeid=' + nodeid;
	}
	//编辑
	function editit(nodeid) {
		window.location.href='${ctx}/res/publicmgr/nodeb!input.action?nodeid=' + nodeid;
	}
	//删除
	function deleteit(nodeid) {
		if(confirm("确定要删除该信息吗？")){
		window.location.href = '${ctx}/res/publicmgr/nodeb!delete.action?nodeid='+ nodeid;
		}
	}
	//查询
	function query() {
		jQuery("#nodebgrid").jqGrid().setGridParam({
			postData : {
				regionid : jQuery("#regionid").val(),
				orgid : jQuery("#orgid").val(),
				patrolgroupid : jQuery("#patrolgroupid").val(),
				roomid : jQuery("#roomid").val(),
				bslevel : jQuery("#bslevel").val(),
				bstype : jQuery("#bstype").val(),
				nename : jQuery("#nename").val(),
				cnname : jQuery("#cnname").val(),
				siteid : jQuery("#siteid").val()
			}
		}).trigger("reloadGrid");
	}
	function add() {
		window.location.href = '${ctx}/res/publicmgr/nodeb!input.action';
	}
</script>
</head>
<body>
	<form id="form1" method="post">
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
					<th>网元名称:</th>
					<td><input type="text" class="inputtext" name="nename"
						id="nename" /></td>
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
					<th>区域:</th>
					<td><baseinfo:regiontree widgetId="001"
							defaultValue="${searchCondition.regionid}" cls="inputtext"
							callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>
					</td>
					<th>基站级别:</th>
					<td><baseinfo:dicselector name="bslevel" columntype="BS_LEVEL"
							type="select" cssClass="inputtext" isQuery="query"></baseinfo:dicselector></td>
				</tr>
				<tr>
					<th>蜂窝类型:</th>
					<td><baseinfo:dicselector name="bstype" columntype="BS_TYPE"
							type="select" cssClass="inputtext" isQuery="query"></baseinfo:dicselector></td>
					<th>代维公司:</th>
					<td><baseinfo:orgtree widgetId="002" orgType="2"
							defaultValue="${searchCondition.orgid}" cls="inputtext"
							callBackId="orgCallBackId" regionId="${user.regionId }"></baseinfo:orgtree>
					</td>
				</tr>
				<tr>
					<th>基站编号:</th>
					<td><input type="text" class="inputtext" name="zdbh" id="zdbh" /></td>
					<th>所属机房:</th>
					<td><input id="jfmc" name="jfmc"
						class="required ui-form-input" type="text"
						onblur="judgeHiddenValue(this,'roomid')"
						value='<resinfo:resCommon keyValue="${searchCondition.roomid}" tableName="res_jf"></resinfo:resCommon>' />
						<input id="roomid" name="roomid" class="inputtext" type="hidden"
						value='${searchCondition.roomid }' /></td>
				</tr>
				<tr>
					<th>中文名称:</th>
					<td><input type="text" class="inputtext" name="cnname"
						id="cnname" /></td>
					<th>维护组:</th>
					<td><baseinfo:patrolgrouptree widgetId="003"
							defaultValue="${searchCondition.patrolgroupid}" cls="inputtext"
							callBackId="patrolgroupCallBackId" regionId="${user.regionId }"></baseinfo:patrolgrouptree></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="button" value="查询"
						onclick="query();" /> <input type="button" value="新增"
						onclick="add();" />
					<baseinfo:expexcel cls="exprotButton" businessId="nodeblist"
							name="导出excel"></baseinfo:expexcel></td>
				</tr>
			</table>
		</div>
		<div id="content" align="center">
			<table id="nodebgrid"></table>
			<div id="nodebpager"></div>
		</div>
	</form>
</body>
</html>