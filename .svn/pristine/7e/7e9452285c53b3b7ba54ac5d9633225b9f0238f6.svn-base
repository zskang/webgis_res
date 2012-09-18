<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	       		}
	       	});				
		});
	</script>
	</head>
<body style="overflow: auto">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post"
				action="${ctx}/res/basemgr/gddxt!input.action">
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">管道系统名称：</span>
					<span class="ui-form-value">${entity.zymc}</span>
					</div>
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">总长度：</span>
					<span class="ui-form-value">${entity.zcd}(米)</span>
				</div>
					
			<div class="ui-form-input-box">
					<span class="ui-form-input-title">管井数：</span>
					<span class="ui-form-value">${entity.gjs}</span>
					</div>
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别：</span>
						<span class="ui-form-value">
							<baseinfo:dic displayProperty="LABLE" codevalue="${entity.ywjb}"
								columntype="CABLETYPE"></baseinfo:dic></span>
					</div>
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
							<span class="ui-form-value">
								<baseinfo:dic displayProperty="LABLE" codevalue="${entity.sszt}"
									columntype="SSZT"></baseinfo:dic></span>
					</div>
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
							<span class="ui-form-value">
								<baseinfo:region displayProperty="regionname"
									id="${entity.regionid}"></baseinfo:region></span>
					</div>
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
									<span class="ui-form-value">
								<baseinfo:dic displayProperty="LABLE" codevalue="${entity.whfs}"
									columntype="WHFS"></baseinfo:dic></span>
					</div>
						
						<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
						<span class="ui-form-value">
								<baseinfo:dic displayProperty="LABLE" codevalue="${entity.cqxz}"
									columntype="property_right"></baseinfo:dic></span>
					</div>
						
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">建设单位：</span>
						<span class="ui-form-value">${entity.jsdw}</span>
					</div>
						
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">竣工时间：</span>
							<span class="ui-form-value">${entity.jgsj}</span>
					</div>
						
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注：</span>
							<span class="ui-form-value">${entity.bz}</span>
					</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">组织单位：</span>
					<span class="ui-form-value">
						<baseinfo:org displayProperty="organizename" id="${entity.orgid}"></baseinfo:org>
					</span>
				</div>					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/basemgr/gddxt!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>