<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript">
	In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	In.ready('ctcss',function(){
		In.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
		if('${tipview}'){
			$('.ui-form-input-box:last').css('display','none');
		}
	});
</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post"
				action="${ctx}/res/publicmgr/nodeb!input.action">
				<input type="hidden" id="nodeid" name="nodeid" value="${entity.nodeid}" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属站点:</span>
					<span class="ui-form-value">${entity.zdmc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属机房:</span>
					<span class="ui-form-value">${entity.jfmc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">网元名称：</span>
					<span class="ui-form-value">${entity.nename}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">中文名称:</span>
					<span class="ui-form-value">${entity.cnname}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属RNC:</span>
					<span class="ui-form-value">${entity.rncid}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">传输类型:</span>
					<span class="ui-form-value">
						<baseinfo:dicselector name="" columntype="TRANSFER_TYPE" type="view" keyValue="${entity.transfertype}"></baseinfo:dicselector>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">频段:</span>
					<span class="ui-form-value">${entity.band}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">蜂窝类型：</span>
					<span class="ui-form-value"> 
					    <baseinfo:dicselector name="" columntype="BS_TYPE" type="view" keyValue="${entity.bstype}"></baseinfo:dicselector> 
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">VIP标识：</span>
					<span class="ui-form-value">
						<baseinfo:dicselector name="" columntype="BS_LEVEL" type="view" keyValue="${entity.bslevel}"></baseinfo:dicselector>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设备型号：</span>
					<span class="ui-form-value">${entity.devicemodel}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设备厂家:</span>
					<span class="ui-form-value">${entity.producer}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">开通时间:</span>
					<span class="ui-form-value">${entity.openingtime}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="javascript:history.go(-1);">返回</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>