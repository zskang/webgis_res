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
In.ready('commonjs',
		'autocompleteCss',
		'ctcss',
		'ztreecss',
		'ztreejs',
		'validatejs',
		'autocompleteJs',
		'wdatepickerjs',
		'ctcss',function(){
	
						In
								.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
						In
								.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
						$("#formname").validate({});
						var xtbh = $('#xtbh').val();
						if (!xtbh) {
							$(
									'.ui-form-container .ui-form-input-box INPUT:last')
									.css('display', 'none');
						}

						$(function() {
							if ($('#actmsg').val()) {
								$.fn.Alert($('#actmsg').val(), 4);
							}
						});
						initRegionTree_001();
						getAutoCompleteValue(false, 'zdmc', 'sszd',
								'res_zdxx');
					});
	var type = "jfxx";
	function doSubmit(act) {
		var url = "${ctx}/res/publicmgr/{type}!{act}.action";
		document.forms[0].action = url.replace('{type}', type).replace('{act}',
				act);
		if (act == 'view') {
			window.location.href = url.replace('{type}', type).replace('{act}',
					act)
					+ "?xtbh=" + $('#xtbh').val();
		}
	}
	var regionCallBackId = function(id) {
		$('#regionid').val(id);
	};
</script>
</head>
<body>
	<div class="ui-form-container">
		<form name="formname" id="formname" method="post" action="">
			<input type="hidden" id="actmsg" name="actmsg"
				value="${entity.actionMessage}" />
			<div class="ui-form-input-box">
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				<input type="hidden" id="status" name="status" value="${entity.status}" />
				<span class="ui-form-input-title">机房名称：</span> <input type="text"
					class="required ui-form-input" name="zymc" id="zymc" maxlength="50"
					value="${entity.zymc}" /> <span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">机房编码：</span> <input type="text"
					class="ui-form-input" name="jfbm" id="jfbm" value="${entity.jfbm}"
					maxlength="50" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">原名称：</span> <input type="text"
					class="ui-form-input" name="ymc" id="ymc" value="${entity.ymc}"
					maxlength="50" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">缩写：</span> <input type="text"
					class="ui-form-input" name="sx" id="sx" value="${entity.sx}"
					maxlength="50" />
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">固定资产编号：</span> <input type="text"
					class="ui-form-input" name="gdzcbh" id="gdzcbh"
					value="${entity.gdzcbh}" />
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属站点:</span> <span
					class="ui-form-value"> <input id="zdmc" name="zdmc"
					class="required ui-form-input" type="text"
					onblur="judgeHiddenValue(this,'sszd')"
					value='<resinfo:resCommon keyValue="${entity.sszd}" 
					tableName="res_zdxx"></resinfo:resCommon>' />
					<span class="ui-form-symbol-icon"> </span><span
					class="ui-form-symbol-color">*</span>
				</span> <input type="hidden" name="sszd" id="sszd"
					value="${entity.sszd }">
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">机房类型：</span>
				<baseinfo:dicselector name="jflx" columntype="JFLX" type="select"
					keyValue="${entity.jflx}" cssClass="required ui-form-input"
					isQuery="query"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属区域：</span>
				<baseinfo:regiontree widgetId="001"
					defaultValue="${entity.regionid}" cls="required ui-form-input"
					callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>
				<input type="hidden" class="required" id="regionid" name="regionid"
					value="${entity.regionid}"> <span
					class="ui-form-symbol-color">*</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所在建筑物：</span> <input type="text"
					class="ui-form-input" name="szjzw" id="szjzw"
					value="${entity.szjzw}" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">楼层号：</span> <input type="text"
					class="ui-form-input" name="lch" id="lch" value="${entity.lch}" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">房间号：</span> <input type="text"
					class="ui-form-input" name="fjh" id="fjh" value="${entity.fjh}" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">长度：</span> <input type="text"
					class="ui-form-input number" name="cd" id="cd" value="${entity.cd}" />(米)
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">高度：</span> <input type="text"
					class="ui-form-input number" name="gd" id="gd" value="${entity.gd}" />(米)
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">宽度：</span> <input type="text"
					class="ui-form-input number" name="kd" id="kd" value="${entity.kd}" />(米)
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">产权性质：</span>
				<baseinfo:dicselector name="cqxz" columntype="property_right"
					type="select" keyValue="${entity.cqxz}"
					cssClass="required ui-form-input" isQuery="query"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">业务级别：</span>
				<baseinfo:dicselector name="ywjb" columntype="CABLETYPE"
					type="select" keyValue="${entity.ywjb}"
					cssClass="required ui-form-input" isQuery="query"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">维护方式：</span>
				<baseinfo:dicselector name="whfs" columntype="WHFS" type="select"
					keyValue="${entity.whfs}" cssClass="required ui-form-input"
					isQuery="query"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属管理区：</span> <input type="text"
					class="ui-form-input" name="precinct" id="precinct"
					value="${entity.precinct}" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">二维码：</span> <input type="text"
					class="ui-form-input" value="${entity.ewm}" name="ewm" id="ewm" />
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">备注：</span>
				<textarea class="input textarea" name="bz" id="bz"
					style="width: 210px;">${entity.bz}</textarea>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">&nbsp;</span> <input type="submit"
					value="保存" onclick="doSubmit('saveDwzh')" style="width: 80px;">
				<input type="button" value="取消" onclick="doSubmit('view')"
					style="width: 80px;">
			</div>
		</form>
	</div>
</body>
</html>