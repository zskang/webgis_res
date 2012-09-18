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
       		}
       	});		
	});
</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="${ctx}/res/groupcustomsmgr/campus!input.action">
				 <input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">校园编号：</span>
				    <span class="ui-form-value">${entity.camid}</span>
					<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">校园名称：</span>
				    <span class="ui-form-value">${entity.zymc}</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">原名称：</span>
				    <span class="ui-form-value">${entity.ymc}</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">校园地址：</span>
				    <span class="ui-form-value">${entity.camaddr}</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
				    <span class="ui-form-value">
						<baseinfo:region displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				 </div>				 		 			 				 			
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">接入方式：</span>
				    <span class="ui-form-value">
						<baseinfo:dic displayProperty="LABLE" codevalue="${entity.jrfs}" columntype="JRFS"></baseinfo:dic>
					</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">归属接入点名称：</span>
				    <span class="ui-form-value">${entity.gsjrdmc}</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">设备归属：</span>
				    <!-- <span class="ui-form-value">${entity.sbgs}</span>-->
				    <baseinfo:dic displayProperty="LABLE" codevalue="${entity.sbgs}"
							columntype="PONSBLX"></baseinfo:dic></span>
				 </div>				 				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">组织单位：</span>
					<span class="ui-form-value">
						<baseinfo:org displayProperty="organizename" id="${entity.orgid}"></baseinfo:org>
					</span>
				</div>				 				 				 			 
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/groupcustomsmgr/campus!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form> 
		</div>
	</body>
</html>