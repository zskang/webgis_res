<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
		 	In.add('autocompleteJs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompleteCss']});
		    In.add('autocompleteCss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
	        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
	        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	        In.ready('ztreejs','autocompleteJs','validatejs','ctcss','commonjs',function(){
		        In.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
		        In.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
	         	//初始化RegionTree
	         	initRegionTree_001();		        
	         	jQuery("#formname").validate({
	         		focusInvalid : false,
					submitHandler : function(form) {
						$('#serializeQueryCondition').val('');
						$('#serializeQueryCondition').val($(form).serialize());
						$.ajax({
							url:'${ctx}/res/basemgr/dgxx!batchEdit.action',
							dataType:'html',
							data: $('#serializeQueryCondition').val(),
							success:function(text){
								if(text == '编辑成功！'){
									$.fn.Alert(text,2);
									window.parent.refeshTopWindow();
									frameElement.api.close();
								}else{
									$.fn.Alert(text,3);
								}
							}
						});
					}	         		
	         	});
	        });
			var regionCallBackId = function(id) {
				$('#regionid').val(id);
			}
		</script>
	</head>
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form id="formname" name="formname" method="post" action="">
				<input type="hidden" id="xtbh" name="xtbh" value="${xtbhs}">
				<input type="hidden" id="serializeQueryCondition" name="serializeQueryCondition" />
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">杆材质：</span>
				    <baseinfo:dicselector name="gcz" columntype="DGCZ" isQuery="query"   cssClass="ui-form-input" type="select" keyValue="${entity.gcz}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">杆形状：</span>
				    <baseinfo:dicselector name="gxz" columntype="DGXZ" isQuery="query"   cssClass="ui-form-input" type="select" keyValue="${entity.gxz}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">电杆用途：</span>
				    <baseinfo:dicselector name="dgyt" columntype="SSYT" isQuery="query"   cssClass="ui-form-input" type="select" keyValue="${entity.dgyt}"></baseinfo:dicselector>
				 </div>				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT"
						type="select"   cssClass="required ui-form-input" isQuery="query"
						keyValue="${entity.sszt}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"
						type="select"   cssClass="required ui-form-input" isQuery="query"
						keyValue="${entity.cqxz}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" isQuery="query"
						type="select"   cssClass="required ui-form-input"
						keyValue="${entity.whfs}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>												

					<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
								<baseinfo:regiontree defaultValue="${entity.regionid}"  width="210" height="120"
								cls="required ui-form-input"	widgetId="001" callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>
								<input type="hidden" id="regionid" name="regionid"
									value="${entity.regionid}">
									<span class="ui-form-symbol-color">*</span>
						</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" style="width: 80px;">
				</div>
			</form>
		</div>
	</body>
</html>