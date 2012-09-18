<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
   <%@ include file="/common/header.jsp"%>
		<script type="text/javascript">
		 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
	        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	        In.ready('ztreejs','validatejs','ctcss','commonjs',function(){
	        	In.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
	        	In.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');	        
         		$("#formname").validate({});
         		var xtbh = $('#xtbh').val();
         		if(!xtbh){
					$('.ui-form-container .ui-form-input-box INPUT:last').css('display','none');
				}
		       	jQuery(function(){
		       		if($('#actmsg').val()){
		       			$.fn.Alert($('#actmsg').val(), 4);
		       		}
		       	});				
				//初始化RegionTree
         		initRegionTree_001();
	        });
		var regionCallBackId = function(id){
			$('#regionid').val(id);
		}
		var type = "bsdxt";
		function doSubmit(act){
			var url ="${ctx}/res/basemgr/{type}!{act}.action";
			document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
			if(act == 'view'){
				window.location.href = url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
				//document.forms[0].submit();
			}
		}
</script>
		<link
			href="http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css"
			rel="stylesheet" type="text/css">
		<style type="text/css">
.ui-form-input-title {
	width: 120px;
}

INPUT {
	width: 220px;
}
</style>
	</head>
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="">
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" name="xtbh" value="${entity.xtbh}">
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"> 直埋系统名称：</span>
					<input type="text" class="required ui-form-input"
						value="${entity.zymc}" maxlength="50" name="zymc" id="zymc" />
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">总长度：</span>
					<input type="text" maxlength="10" value="${entity.zcd}" class="ui-form-input number"
						name="zcd" id="zcd" />(米)
				</div>
				<!-- <div class="ui-form-input-box">
					<span class="ui-form-input-title">标石数:</span>
					<input type="text" value="${entity.bss}"
						class="required ui-form-input number"  maxlength="10" name="bss" id="bss" />
						<span class="ui-form-symbol-color">*</span>
				</div> -->
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree defaultValue="${entity.regionid}"  cls="required ui-form-input"
					 widgetId="001"	regionId="${user.regionId}" callBackId="regionCallBackId"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}">
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别：</span>
					<baseinfo:dicselector name="ywjb" columntype="CABLETYPE"   isQuery="query" 
						type="select" keyValue="${entity.ywjb}" cssClass="ui-form-input"></baseinfo:dicselector>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"  isQuery="query" 
						type="select" keyValue="${entity.cqxz}" cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT" type="select"  isQuery="query" 
						keyValue="${entity.sszt}" cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" type="select"
						keyValue="${entity.whfs}"  isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">建设单位：</span>
					<input type="text" value="${entity.jsdw}" maxlength="50" class="ui-form-input"
						name="jsdw" id="jsdw" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注：</span>
					<textarea class="input textarea" name="bz" id="bz" maxlength="200" style="width:210px;">${entity.bz}</textarea>
				</div>
				<div class="ui-form-input-box">
					 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" onclick="doSubmit('save')" style="width:80px;">
					<input type="button" value="取消" onclick="doSubmit('view')" style="width:80px;">
				 </div>
				</div>

			</form>
		</div>
	</body>
</html>