<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	In
			.add(
					'ctcss',
					{
						path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'
					});
	In
			.ready(
					'ctcss',
					function() {
						In
								.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
						if ('${tipview}') {
							$('.ui-form-input-box:last').css('display', 'none');
						}
					});
</script>
</head>
<body>
	<div class="ui-form-container">
		<div class="ui-form-input-box">
			<span class="ui-form-input-title">热点名称：</span>${entity.hostName}
		</div>

		<div class="ui-form-input-box">
			<span class="ui-form-input-title">所属站点：</span> ${entity.zymc}
		</div>
		<div class="ui-form-input-box">
			<span class="ui-form-input-title">NAS-ID：</span>${entity.nasId}
		</div>
		<div class="ui-form-input-box">
			<span class="ui-form-input-title">热点类型：</span> 
			 <span
				class="ui-form-value"><baseinfo:dic displayProperty="LABLE"
					codevalue="${entity.hostType}" columntype="OVERLAY_TYPE"></baseinfo:dic>
			</span>
		</div>

		<div class="ui-form-input-box">
			<span class="ui-form-input-title">传输类型：</span> <span
				class="ui-form-value"><baseinfo:dic displayProperty="LABLE"
					codevalue="${entity.transType}" columntype="TRANSFER_TYPE"></baseinfo:dic>
			</span>
		</div>

		<div class="ui-form-input-box">
			<span class="ui-form-input-title">设备厂家：</span> ${entity.product}
		</div>

		<div class="ui-form-input-box">
			<span class="ui-form-input-title">AP数量：</span> ${entity.apNum}
		</div>

		<div class="ui-form-input-box">
			<span class="ui-form-input-title">地址：</span> ${entity.address}
		</div>

		<div class="ui-form-input-box">
			<span class="ui-form-input-title">WLAN网络覆盖区域：</span>${entity.wlanCover}
		</div>
		<div class="ui-form-input-box">
			<span class="ui-form-input-title">备注：</span>${entity.remark}
		</div>
		<div class="ui-form-input-box">
			<span class="ui-form-input-title"></span><span class="ui-form-value"
				style="float: right; margin-right: 50px"> <a
				href="${ctx}/res/publicmgr/wlan!input.action?id=${entity.id}">编辑</a>
			</span>
		</div>
	</div>
</body>
</html>