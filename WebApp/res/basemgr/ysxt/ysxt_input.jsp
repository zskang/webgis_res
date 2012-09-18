<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

			var regionCallBackId = function(id) {
				$('#regionid').val(id);
			}
			
			var type = "ysxt";
			function doSubmit(act){
				var url ="${ctx}/res/basemgr/{type}!{act}.action";
				document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
				if(act == 'view'){
					window.location.href = url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
					//document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form id="formname" name="formname" method="post" action="">
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}">
				
							<div class="ui-form-input-box">
					<span class="ui-form-input-title">引上系统名称：</span>
								<input type="text" class="required ui-form-input" maxlength="100" value="${entity.zymc}"
									name="zymc" id="zymc"   />
									<span class="ui-form-symbol-color">*</span>
							</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质 ：</span>
								<baseinfo:dicselector name="cqxz" columntype="property_right" isQuery="query"
									type="select" keyValue="${entity.cqxz}"   cssClass="required ui-form-input"></baseinfo:dicselector>
							<span class="ui-form-symbol-color">*</span>
							</div>
							
			<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
									<baseinfo:dicselector name="sszt" columntype="SSZT"
										type="select" keyValue="${entity.sszt}" isQuery="query"
										  cssClass="required ui-form-input"></baseinfo:dicselector>
										<span class="ui-form-symbol-color">*</span>
							</div>
							
						<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
										<baseinfo:dicselector name="whfs" columntype="WHFS"
											type="select" keyValue="${entity.whfs}" isQuery="query"
											  cssClass="required ui-form-input"></baseinfo:dicselector>
											<span class="ui-form-symbol-color">*</span>
								</div>
							
							<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别:</span>
										<baseinfo:dicselector name="ywjb" columntype="CABLETYPE"
										 isQuery="query"	type="select" keyValue="${entity.ywjb}"
											  cssClass="ui-form-input"></baseinfo:dicselector>
								</div>
							
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
								<baseinfo:regiontree defaultValue="${entity.regionid}" 
								cls="required ui-form-input" widgetId="001" callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>
								<input type="hidden" id="regionid" name="regionid"
									value="${entity.regionid}">
									<span class="ui-form-symbol-color">*</span>
						</div>
							
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注：</span>
								<textarea class="input textarea"  name="bz" maxlength="100"
									id="bz" style="width: 210px">${entity.bz}</textarea>
									
				</div>
							
			<div class="ui-form-input-box">
					<span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" onclick="doSubmit('save')"
						style="width: 80px;">
					<input type="button" value="取消" onclick="doSubmit('view')"
						style="width: 80px;">
				</div>
			</form>
		</div>
	</body>
</html>