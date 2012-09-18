<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
	 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	 	In.add('autocompleteJs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompleteCss']});
	    In.add('autocompleteCss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
        In.add('wdatepickerjs',{path:'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',type:'js',charset:'utf-8'});
        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
        In.ready('ztreejs','validatejs','autocompleteJs','ctcss','wdatepickerjs',function(){
	        	In.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
	        	In.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
         		$("#formname").validate({});
         		getAutoCompleteValue(false,'zdmc','siteid','res_zdxx');
         		getAutoCompleteValue(false,'jfmc','roomid','res_jf');
         		var nodeid = $('#nodeid').val();
		});
		var type = "nodeb";
		function doSubmit(act){
			var url ="${ctx}/res/publicmgr/{type}!{act}.action";
			document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
			if(act == 'view'){
				document.forms[0].submit();
			}
		}
		</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form id="formname" name="formname" method="post" action="">
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="nodeid" name="nodeid" value="${entity.nodeid}">
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属站点:</span>
					<span class="ui-form-value">
					<input id="zdmc" name="zdmc" class="required ui-form-input" type="text" 
					onblur="judgeHiddenValue(this,'siteid')" value='<resinfo:resCommon keyValue="${entity.siteid}" 
					tableName="res_zdxx"></resinfo:resCommon>'/>
					<span class="ui-form-symbol-icon">
					</span><span class="ui-form-symbol-color">*</span>
					</span>
					<input type="hidden" name="siteid" id="siteid" value="${entity.siteid }">
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属机房:</span>
					<span class="ui-form-value">
						<input id="jfmc" name="jfmc" class="required ui-form-input" type="text" onblur="judgeHiddenValue(this,'roomid')" value='<resinfo:resCommon keyValue="${entity.roomid}" tableName="res_jf"></resinfo:resCommon>'/><span class="ui-form-symbol-icon"></span>
						<span class="ui-form-symbol-color">*</span>
						<input size="30" type="hidden" readonly name="roomid" id="roomid" value="${entity.roomid}"/>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">网元名称：</span>
					<span class="ui-form-value">
						<input id="nename" name="nename" class="required ui-form-input" maxlength="90" type="text" value="${entity.nename}"/>
						<span class="ui-form-symbol-color">*</span>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">中文名称:</span>
					<span class="ui-form-value">
						<input id="cnname" name="cnname" class="ui-form-input" type="text" maxlength="40" value="${entity.cnname}"/>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属RNC:</span>
					<span class="ui-form-value">
						<input id="rncid" name="rncid" class="ui-form-input" type="text" maxlength="20" value="${entity.rncid}"/>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">传输类型:</span>
					<span class="ui-form-value">
						<baseinfo:dicselector name="transfertype" cssClass="ui-form-input" columntype="TRANSFER_TYPE" type="select" keyValue="${entity.transfertype }"></baseinfo:dicselector>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">频段:</span>
					<span class="ui-form-value">
						<baseinfo:dicselector name="band" id="band" cssClass="ui-form-input" columntype="NODEB_BAND" type="select" keyValue="${entity.band }"></baseinfo:dicselector>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">蜂窝类型：</span>
					<span class="ui-form-value"> 
						<baseinfo:dicselector name="bstype" cssClass="ui-form-input" columntype="BS_TYPE" type="select" keyValue="${entity.bstype }"></baseinfo:dicselector>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">VIP标识：</span>
					<span class="ui-form-value">
						<baseinfo:dicselector name="bslevel" cssClass="ui-form-input" columntype="BS_LEVEL" type="select" keyValue="${entity.bslevel }"></baseinfo:dicselector>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设备型号：</span>
					<span class="ui-form-value"> 
						<input id="devicemodel" name="devicemodel" class="ui-form-input" maxlength="20" type="text" value="${entity.devicemodel}"/>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设备厂家:</span>
					<span class="ui-form-value">
						<input id="producer" name="producer" class="ui-form-input" maxlength="6" type="text" value="${entity.producer}"/>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">开通时间:</span>
					<span class="ui-form-value">
						<input type="text" class="required ui-form-input Wdate" name="openingtime" id="openingtime" value="${entity.openingtime}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
						<span class="ui-form-symbol-color">*</span>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" onclick="doSubmit('save')" style="width: 80px;">
					<input type="button" value="返回" onclick="history.go(-1);" style="width: 80px;">
				</div>
			</form>
		</div>
	</body>
</html>