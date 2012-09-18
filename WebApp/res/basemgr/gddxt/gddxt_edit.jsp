<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	   <%@ include file="/common/header.jsp"%>
	   <script type="text/javascript">
		 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	   	    In.add('autocompleteJs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompleteCss']});
	        In.add('autocompleteCss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
	        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
	        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
	        
	        In.ready('ztreejs','validatejs','commonjs','ctcss','autocompleteJs',function(){
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
							url:'${ctx}/res/basemgr/gddxt!batchEdit.action',
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
	<body>
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="">
				<input type="hidden" id="xtbh" name="xtbh" value="${xtbhs}">
				<input type="hidden" id="serializeQueryCondition" name="serializeQueryCondition" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别：</span>
					<baseinfo:dicselector name="ywjb" keyValue="${entity.ywjb}" isQuery="query" 
						columntype="CABLETYPE" style="width:218px" type="select" cssClass="ui-form-input"></baseinfo:dicselector>
				</div>				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" keyValue="${entity.sszt}" isQuery="query"
						columntype="SSZT" style="width:218px" type="select" cssClass="required ui-form-input"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
				</div>	
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" style="width:218px" isQuery="query"
						  type="select" cssClass="required ui-form-input"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>	  
				</div>							

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector keyValue="${entity.cqxz}" name="cqxz"  isQuery="query"
						columntype="property_right" style="width:218px" type="select" cssClass="required ui-form-input"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
					<baseinfo:regiontree widgetId="001" defaultValue="${entity.regionid}"   cls="required ui-form-input" callBackId="regionCallBackId"
						regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}"><span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" style="width: 80px;">
				</div>
			</form>
		</div>
	</body>
</html>