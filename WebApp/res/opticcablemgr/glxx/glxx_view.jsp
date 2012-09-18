<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>光缆信息查看</title>
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
       		}
       	});				
	});
</script>
	</head>
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="${ctx}/res/opticcablemgr/glxx!input.action">
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">光缆名称：</span>
					 <span class="ui-form-value">${entity.zymc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光缆编号：</span>
				 <span class="ui-form-value">${entity.glbh}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">原名称：</span>
				 	<span class="ui-form-value">${entity.ymc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">固定资产编号：</span>
					<span class="ui-form-value">${entity.gdzcbh}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">规格型号：</span>
					<span class="ui-form-value">${entity.ggxh}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">纤芯数：</span>
					<span class="ui-form-value">${entity.qxs}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别：</span>
					  <span class="ui-form-value">
						<baseinfo:dic displayProperty="LABLE" codevalue="${entity.ywjb}" columntype="CABLETYPE"></baseinfo:dic>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					  <span class="ui-form-value">
						<baseinfo:dic displayProperty="LABLE" codevalue="${entity.cqxz}" columntype="property_right"></baseinfo:dic>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					  <span class="ui-form-value">
						<baseinfo:dic displayProperty="LABLE" codevalue="${entity.sszt}" columntype="SSZT"></baseinfo:dic>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					  <span class="ui-form-value">
						<baseinfo:dic displayProperty="LABLE" codevalue="${entity.whfs}" columntype="WHFS"></baseinfo:dic>
					</span>
				</div>				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">网元状态：</span>
					 <span class="ui-form-value">
						<baseinfo:dic displayProperty="LABLE" codevalue="${entity.wyzt}" columntype="WYZT"></baseinfo:dic>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光缆类型：</span>
					 <span class="ui-form-value">
						<baseinfo:dic displayProperty="LABLE" codevalue="${entity.gllx}" columntype="QXLJLX"></baseinfo:dic>
					</span>
				</div>
			
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属工程：</span>
					<span class="ui-form-value">${entity.ssgc}</span>
				</div>
				
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
					 <span class="ui-form-value">
						<baseinfo:region displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				 </div>		
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">主建单位：</span>
					<span class="ui-form-value">${entity.zjdw}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">参建单位：</span>
					<span class="ui-form-value">${entity.cjdw}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">租用单位：</span>
					<span class="ui-form-value">${entity.zydw}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">使用单位：</span>
					<span class="ui-form-value">${entity.sydw}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所有权人：</span>
					<span class="ui-form-value">${entity.syqr}</span>
				</div>
				<div class="ui-form-input-box">
				    <span class="ui-form-input-title">竣工时间：</span>
				    <span class="ui-form-value">${entity.jgsj}</span>
				 </div>	
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">组织单位：</span>
				    <span class="ui-form-value">
						<baseinfo:org displayProperty="organizename" id="${entity.orgid}"></baseinfo:org>
					</span>
				 </div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/opticcablemgr/glxx!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>