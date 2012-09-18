<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
	In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
    In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	In.ready('ctcss','commonjs',function(){
		In.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
		if('${tipview}'){
			$('.ui-form-input-box:last').css('display','none');
		}
       	jQuery(function(){
       		if($('#actmsg').val()){
       			$.fn.Alert($('#actmsg').val(), 4);
       			parent.loadTree('tree',$('#rooturl', parent.document).val());
       			top.refreshPoint('AD605');
       		}
       	});			
	});
</script>
</head>
<body>
	<div class="ui-form-container"> 
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">直放站名称：</span> <span
					class="ui-form-value">${entity.prepeaterName}</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属站点：</span> <span
					class="ui-form-value">${entity.zdmc}</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">网元状态：</span> <span
					class="ui-form-value"><baseinfo:dic displayProperty="LABLE"
						codevalue="${entity.state}" columntype="WYZT"></baseinfo:dic> </span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">直放站类型：</span> 
				<span class="ui-form-value"><baseinfo:dic
						displayProperty="LABLE" codevalue="${entity.prepeaterType}"
						columntype="REPEATER_TYPE"></baseinfo:dic> </span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">所属小区：</span> <span
					class="ui-form-value">${entity.cell} </span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">覆盖类型：</span> <span
					class="ui-form-value"><baseinfo:dic displayProperty="LABLE"
						codevalue="${entity.coverType}" columntype="REPEATER_COVER_TYPE"></baseinfo:dic>
				</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">设备厂家：</span> <span
					class="ui-form-value">${entity.producer}</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">信号接收方式：</span> <span
					class="ui-form-value"><baseinfo:dic displayProperty="LABLE"
						codevalue="${entity.signalReceiveMode}"
						columntype="SIGNAL_RECEIVE_MODE"></baseinfo:dic> </span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">供电方式：</span> <span
					class="ui-form-value"><baseinfo:dic displayProperty="LABLE"
						codevalue="${entity.powerSupplyMode}"
						columntype="POWER_SUPPLY_MODE"></baseinfo:dic> </span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">入网日期：</span> <span
					class="ui-form-value">${entity.openingTime} </span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title"></span><span class="ui-form-value"
					style="float: right; margin-right: 50px"> <a
					href="${ctx}/res/publicmgr/prepeater!input.action?id=${entity.prepeaterId}">编辑</a>
				</span>
			</div> 
	</div>
</body>
</html>