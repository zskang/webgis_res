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
								.css('#WlanForm label.error {margin-left: 10px;width: auto;display: inline;}');
						In
								.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
					
						$("#WlanForm").validate({});
						var id = $('#id').val();
						if (!id) {
							$(
									'.ui-form-container .ui-form-input-box INPUT:last')
									.css('display', 'none');
						}
						getAutoCompleteValue(false, 'zdmc', 'siteId',
						'res_zdxx');
					});
	var type = "wlan";
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
		<form name="WlanForm" id="WlanForm" method="post">
			<input type="hidden" id="actmsg" name="actmsg"
				value="${entity.actionMessage}" />
			<div class="ui-form-input-box">
				<input type="hidden" id="id" name="id" value="${entity.id}" /> <span
					class="ui-form-input-title required">热点名称：</span> <input type="text"
					class="required ui-form-input" name="hostName" id="hostName"
					value="${entity.hostName}" /> <span class="ui-form-symbol-color">*</span>
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
				<span class="ui-form-input-title">NAS-ID：</span> <input type="text"
					class="ui-form-input required number" name="nasId" id="nasId"
					value="${entity.nasId}" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">热点类型：</span>
				<baseinfo:dicselector name="hostType" columntype="OVERLAY_TYPE"
					type="select" cssClass="ui-form-input required"
					keyValue="${entity.hostType}"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>

			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">传输类型：</span>
				<baseinfo:dicselector name="transType" columntype="TRANSFER_TYPE"
					type="select" cssClass="ui-form-input"
					keyValue="${entity.transType}"></baseinfo:dicselector>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">设备厂家：</span> <input id="product"
					class=" required  ui-form-input" name="product" type="text"
					value=' ${entity.product}' /> <span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">AP数量：</span> <input size="30"
					type="text" name="apNum" id="apNum"
					class=" required number ui-form-input" value="${entity.apNum}" />
				<span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">地址：</span> <input type="text"
					class="required ui-form-input"  id="address" name="address"
					value="${entity.address}"> <span
					class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">WLAN网络覆盖区域：</span> <input
					type="text" class="ui-form-input required" name="wlanCover" id="wlanCover"
					value="${entity.wlanCover}" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">备注：</span>
				<textarea class="ui-form-input textarea required"  name="remark" id="remark"
					style="width: 210px;">${entity.remark}</textarea>
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