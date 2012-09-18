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
								.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
						In
								.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
						$("#formname").validate({});
					
						var groupid = $('#groupid').val();
						if (!groupid) {
							$(
									'.ui-form-container .ui-form-input-box INPUT:last')
									.css('display', 'none');
						}

						initRegionTree_001();
						getAutoCompleteValue(false, 'zdmc', 'siteid',
						'res_zdxx');
					});

	var type = "groupcustomer";
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
		<form id="formname" name="formname" method="post">
			<input type="hidden" id="actmsg" name="actmsg"
				value="${entity.actionMessage}" /> <input type="hidden" id="xtbh"
				name="xtbh" value="${entity.xtbh}"> <input type="hidden"
				id="objectid" name="objectid" value="${entity.objectid}" />
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属站点:</span> <span
					class="ui-form-value"> <input id="zdmc" name="zdmc"
					class="required ui-form-input" type="text"
					onblur="judgeHiddenValue(this,'siteid')"
					value='<resinfo:resCommon keyValue="${entity.siteid}" 
					tableName="res_zdxx"></resinfo:resCommon>' />
					<span class="ui-form-symbol-icon"> </span><span
					class="ui-form-symbol-color">*</span>
				</span> <input type="hidden" name="siteid" id="siteid"
					value="${entity.siteid }">
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">客户编号：</span> <span
					class="ui-form-value"> <input id="groupid" name="groupid"
					class="required ui-form-input" type="text"
					value="${entity.groupid}" />
				</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">客户名称:</span> <span
					class="ui-form-value"> <input id="groupname"
					name="groupname" class="required ui-form-input" type="text"
					value="${entity.groupname}" />
				</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">原名称:</span> <span
					class="ui-form-value"> <input id="ymc" name="ymc"
					class="required ui-form-input" type="text" value="${entity.ymc}" /></span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">地址:</span> <span
					class="ui-form-value"> <input id="groupaddr"
					name="groupaddr" class="required ui-form-input" type="text"
					value="${entity.groupaddr}" /></span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属地市:</span>
				<baseinfo:regiontree widgetId="001"
					defaultValue="${entity.regionid}" width="220" height="220"
					cls="ui-form-input" callBackId="regionCallBackId"
					regionId="${user.regionId}"></baseinfo:regiontree>
				<input type="hidden" id="regionid" name="regionid"
					value="${entity.regionid}">
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">集客部联系人：</span> <span
					class="ui-form-value"> <input id="jkblxr" name="jkblxr"
					class="required ui-form-input" type="text" value="${entity.jkblxr}" /></span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">集客部联系电话：</span> <span
					class="ui-form-value"> <input id="jkblxdh" name="jkblxdh"
					class="required ui-form-input" type="text"
					value="${entity.jkblxdh}" />
				</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">客户经理：</span> <span
					class="ui-form-value"> <input id="khjl" name="khjl"
					class="required ui-form-input" type="text" value="${entity.khjl}" />
				</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">客户经理电话：</span> <span
					class="ui-form-value"> <input id="khjldh" name="khjldh"
					class="required ui-form-input" type="text" value="${entity.khjldh}" />
				</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">入网时间：</span>
				<!-- 不知道是什么时间，暂定入网时间-->
				<span class="ui-form-value"> <input type="text"
					class="required ui-form-input Wdate" name="createtime"
					id="createtime" value="${entity.createtime}"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				</span>
			</div>

			<div class="ui-form-input-box">
				<span class="ui-form-input-title">接入方式：</span> <span
					class="ui-form-value"> <baseinfo:dicselector name="jrfs"
						columntype="JRFS" type="select" keyValue="${entity.jrfs }"
						isQuery="query"></baseinfo:dicselector>
				</span>
			</div>
	     <div class="ui-form-input-box">
				<span class="ui-form-input-title">归属接入点名称：</span> 
				<span
					class="ui-form-value"> <input id="gsjrdmc" name="gsjrdmc"
					class="ui-form-input required" type="text" value="${entity.gsjrdmc}" />
				</span> 
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">承载业务信息：</span> <span
					class="ui-form-value"> <input id="czywxx" name="czywxx"
					class="ui-form-input required" type="text" value="${entity.czywxx}" />
				</span>
			</div>   

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">设备归属：</span> <span
			class="ui-form-value"> <input id="sbgs" name="sbgs"
			class="ui-form-input required" type="text" value="${entity.sbgs}" />
		</span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">重要级别：</span> <span
			class="ui-form-value"> <baseinfo:dicselector name="zyjb"
				columntype="ZYJB" type="select" keyValue="${entity.zyjb }"
				isQuery="query"></baseinfo:dicselector>
		</span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">客户类别：</span> <span
			class="ui-form-value"> <baseinfo:dicselector name="khlb"
				columntype="KHLB" type="select" keyValue="${entity.khlb}"
				isQuery="query"></baseinfo:dicselector>
		</span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">客户联系人：</span> <span
			class="ui-form-value"> <input id="linkman" name="linkman"
			class="ui-form-input" type="text" value="${entity.linkman}" /></span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">客户联系电话：</span> <span
			class="ui-form-value"> <input id="phone" name="phone"
			class="ui-form-input" type="text" value="${entity.phone}" /></span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">客户级别：</span> <span
			class="ui-form-value"> <baseinfo:dicselector name="khjb"
				columntype="GROUP_LEVEL" type="select" keyValue="${entity.khjb}"
				isQuery="query"></baseinfo:dicselector>
		</span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">客户服务等级：</span> <span
			class="ui-form-value"> <baseinfo:dicselector
				name="gradeofservice" columntype="JTKHJB" type="select"
				keyValue="${entity.gradeofservice}" isQuery="query"></baseinfo:dicselector>
		</span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">客户行业：</span> <span
			class="ui-form-value"> <baseinfo:dicselector name="industry"
				columntype="INDUSTRY" type="select" keyValue="${entity.industry}"
				isQuery="query"></baseinfo:dicselector>
		</span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">备注:</span> <span
			class="ui-form-value"> 
			<textarea rows="10" cols="120" id="remark" name="remark">${entity.remark}</textarea>
			 
		</span>
	</div>

	<div class="ui-form-input-box">
		<span class="ui-form-input-title">&nbsp;</span> <input type="submit"
			value="保存" onclick="doSubmit('savedwzh')" style="width: 80px;"> <input
			type="button" value="取消" onclick="doSubmit('view')"
			style="width: 80px;">
	</div>
	</form>
	</div>
</body>
</html>