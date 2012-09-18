<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	   <%@ include file="/common/header.jsp"%>
		<script type="text/javascript">
		 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
	        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
	        In.ready('ztreejs','validatejs','commonjs','ctcss',function(){
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
							url:'${ctx}/res/basemgr/gjxx!batchEdit.action',
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
			};
		</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form id="formname" name="formname" method="post" action="">
				<input type="hidden" id="xtbh" name="xtbh" value="${xtbhs}">
				<input type="hidden" id="serializeQueryCondition" name="serializeQueryCondition" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">井类别：</span>
					<baseinfo:dicselector name="jlb" columntype="GJLB"  isQuery="query"
					style="width:218px" cssClass="required ui-form-input" type="select" keyValue="${entity.jlb}"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">井类型：</span>
					<baseinfo:dicselector name="jlx" columntype="GJLX" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.jlx}"></baseinfo:dicselector>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">是否有电子锁：</span>
					<baseinfo:dicselector name="sfydzs" columntype="SF" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.sfydzs}"></baseinfo:dicselector>
				</div>				

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">井盖材质：</span>
					<baseinfo:dicselector name="jgcz" columntype="JGCZ" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.jgcz}"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">井盖形状：</span>
					<baseinfo:dicselector name="jgxz" columntype="JGXZ" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.jgxz}"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">管井规格：</span>
					<baseinfo:dicselector name="gjgg" columntype="GJGG" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.gjgg}"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">管井型号：</span>
					<baseinfo:dicselector name="gjxh" columntype="GJXH" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.gjxh}"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">管井用途：</span>
					<baseinfo:dicselector name="gjyt" columntype="SSYT" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.gjyt}"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" isQuery="query"
						style="width:218px" cssClass="required ui-form-input" type="select" keyValue="${entity.whfs}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">是否危险点：</span>
					<baseinfo:dicselector name="isdanger" columntype="SF" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.isdanger}"></baseinfo:dicselector>
				</div>


				<div class="ui-form-input-box">
					<span class="ui-form-input-title">是否局前井：</span>
					<baseinfo:dicselector name="sfjqj" columntype="SF" isQuery="query"
						style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.sfjqj}"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" keyValue="${entity.sszt}" isQuery="query"
						columntype="SSZT" style="width:218px" type="select" cssClass="required ui-form-input"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector keyValue="${entity.cqxz}" name="cqxz" isQuery="query"
						columntype="property_right" style="width:218px" type="select" cssClass="required ui-form-input"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree widgetId="001" defaultValue="${entity.regionid}" width="220"
						height="220" cls="required ui-form-input" callBackId="regionCallBackId"
						regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}"><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" onclick="doSubmit('save')" style="width: 80px;">
				</div>
			</form>
		</div>
	</body>
</html>