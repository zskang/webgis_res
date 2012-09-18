<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	In
			.add(
					'validatejs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',
						type : 'js',
						charset : 'utf-8'
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
					'autocompleteCss',
					{
						path : 'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'
					});
	In
			.add(
					'commonjs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',
						type : 'js',
						charset : 'utf-8'
					});
	In
			.add(
					'ctcss',
					{
						path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'
					});
	In
			.add(
					'ztreejs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'ztreecss' ]
					});
	In.add('ztreecss', {
		path : 'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'
	});
	In
			.add(
					'wdatepickerjs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',
						type : 'js',
						charset : 'utf-8'
					});
	In
			.ready(
					'commonjs',
					'autocompleteCss',
					'ctcss',
					'ztreecss',
					'ztreejs',
					'validatejs',
					'autocompleteJs',
					'wdatepickerjs',
					'ctcss',
					function() {
						In
								.css('#prepeaterForm label.error {margin-left: 10px;width: auto;display: inline;}');
						In
								.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
						$("#prepeaterForm").validate({});
						getAutoCompleteValue(false, 'zdmc', 'siteId',
								'res_zdxx');
						var prepeaterId = $('#prepeaterId').val();
						if (!prepeaterId) {
							$(
									'.ui-form-container .ui-form-input-box INPUT:last')
									.css('display', 'none');
						}
					});
	var type = "prepeater";
	function doSubmit(act) {
		var url = "${ctx}/res/publicmgr/{type}!{act}.action";
		document.forms[0].action = url.replace('{type}', type).replace('{act}',
				act);
		if (act == 'view') {
			document.forms[0].submit();
		}
	}
</script>
</head>
<body>
	<div class="ui-form-container">
		<form name="prepeaterForm" id="prepeaterForm" method="post">
			<div class="ui-form-input-box">
				<input type="hidden" id="prepeaterId" name="prepeaterId"
					value="${entity.prepeaterId}" /> <span class="ui-form-input-title">直放站名称：</span>
				<input type="text" class="required ui-form-input"
					name="prepeaterName" id="prepeaterName"
					value="${entity.prepeaterName}" /> <span
					class="ui-form-symbol-color">*</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属站点:</span> <span
					class="ui-form-value required"> <input id="zdmc" name="zdmc"
					class="required ui-form-input" type="text"
					onblur="judgeHiddenValue(this,'siteId')"
					value='<resinfo:resCommon keyValue="${entity.siteId}" 
					tableName="res_zdxx"></resinfo:resCommon>' />
					<span class="ui-form-symbol-icon"> </span><span
					class="ui-form-symbol-color">*</span>
				</span> <input type="hidden" name="siteId" id="siteId"
					value="${entity.siteId }">
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">网元状态：</span>
				<baseinfo:dicselector name="state" columntype="WYZT" type="select"
					cssClass="ui-form-input required" keyValue="${entity.state}"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">直放站站点类型：</span>
				<baseinfo:dicselector name="prepeaterType"
					columntype="REPEATER_TYPE" type="select" cssClass="ui-form-input required"
					keyValue="${entity.prepeaterType}"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>

			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属小区：</span> <input type="text"
					class="ui-form-input required" name="cell" id="cell" value="${entity.cell}" />
				<span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">覆盖类型：</span>
				<baseinfo:dicselector name="coverType"
					columntype="REPEATER_COVER_TYPE" type="select"
					cssClass="ui-form-input required" keyValue="${entity.coverType}"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">设备厂家：</span> <input id="producer"
					class="ui-form-input required" name="producer" type="text"
					value='${entity.producer}' /> <span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">信号接收方式：</span>
				<baseinfo:dicselector name="signalReceiveMode"
					columntype="SIGNAL_RECEIVE_MODE" type="select"
					cssClass="ui-form-input required" keyValue="${entity.signalReceiveMode}"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">供电方式：</span>
				<baseinfo:dicselector name="powerSupplyMode"
					columntype="POWER_SUPPLY_MODE" type="select"
					cssClass="ui-form-input required" keyValue="${entity.powerSupplyMode}"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">入网日期：</span> <input type="text"
					class="ui-form-input Wdate" name="openingTime" id="openingTime"
					value="${entity.openingTime}"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">&nbsp;</span> <input type="submit"
					value="保存" onclick="doSubmit('save')" style="width: 40px;">
				<input type="button" value="取消"
					onclick="javascript:history.go(-1); " style="width: 40px;">
			</div>
		</form>
	</div>
</body>
</html>