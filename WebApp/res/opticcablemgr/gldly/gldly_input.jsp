<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>新增光缆段路由</title>
	<script type="text/javascript">
		 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
		 	In.add('autocompleteJs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompleteCss']});
		    In.add('autocompleteCss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
	        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
	        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
	        In.add('commonjs', {path:'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	        In.ready('ztreejs','validatejs','autocompleteJs','ctcss','commonjs',function(){
	        	In.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
	        	In.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
         		$("#formname").validate({});
         		var xtbh = $('#xtbh').val();
				if(!xtbh){
					$('.ui-form-container .ui-form-input-box INPUT:last').css('display','none');
					qdlxChange();
					zdlxChange();					
				}else{
					getAutoCompleteValue(true,'Qdmcinput', 'qdmc', requestData[$('#qdlx').val()]);
					getAutoCompleteValue(true,'Zdmcinput', 'zdmc', requestData[$('#zdlx').val()]);
				}
	         	jQuery(function(){
	         		if($('#actmsg').val()){
	         			parent.refreshPoint('A33');
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});				
				getAutoCompleteValue(false,'ssglinput','ssgl','res_glxx');
         		initRegionTree_001();
			});
	        var requestData = [];
			requestData["AA001"] = "res_odf";
			requestData["AA003"] = "res_gjjx";
			requestData["AA004"] = "res_gfxx";
			requestData["AA005"] = "res_gjt";
			requestData["AA006"] = "res_gzdh";
			function qdlxChange(){
				if($('#qdlx').val() in requestData) {
					$('#Qdmcinput').val('');
					$('#qdmc').val('');
					getAutoCompleteValue(true,'Qdmcinput', 'qdmc', requestData[$('#qdlx').val()]);
				}
			}
			function zdlxChange() {
				if($('#zdlx').val() in requestData) {
					$('#Zdmcinput').val('');
					$('#zdmc').val('');
					getAutoCompleteValue(true,'Zdmcinput', 'zdmc', requestData[$('#zdlx').val()]);
				}
			}			
			var regionCallBackId = function(id) {
				$('#regionid').val(id);
			}
			
			var parseAZ = function(object){
				if($('#qdmc').val() != '' && $('#zdmc').val() != '' && ($('#qdmc').val() == $('#zdmc').val())){
					$.fn.Alert('不能选择相同的设备！',4);
					//$('#'+object).focus();
					 $('#zdmc').val('');
					 $('#Zdmcinput').val('');
					 $('#qdmc').val('');
					 $('#Qdmcinput').val('');
				}
			}
			function checkZD()
			{
			     if($('#qdmc').val() && $('#zdmc').val() ){
			           if(($('#qdlx').val()==$('#zdlx').val()) && ($('#qdlx').val()!='AA003' || $('#qdlx').val()!='AA005'))
			           {
			               //alert( "qdlx="+$('#qdlx').val()+"&qdmc="+$('#qdmc').val()+"&zdmc="+$('#zdmc').val());
				        	$.ajax({
							   type: "POST",
							   dataType: "json",
							   url: "${ctx}/res/opticcablemgr/gldly!checkZD.action",
							   data: "qdlx="+$('#qdlx').val()+"&qdmc="+$('#qdmc').val()+"&zdmc="+$('#zdmc').val(),
							   success: function(msg){
							     if(msg.ispass=="fail")
							     {
							    	 $('#zdmc').val('');
							    	 $('#Zdmcinput').val('');
							    	 $('#qdmc').val('');
							    	 $('#Qdmcinput').val('');
							    	 $.fn.Alert("光缆段的起始和终止设备不能是同一站点中的两台设备。",1);
							     }
							   }
							 });
					 }
				}
			}
			
			
			
			var type = "gldly";
			function doSubmit(act) {
				var url = "${ctx}/res/opticcablemgr/{type}!{act}.action";
				document.forms[0].action = url.replace('{type}', type).replace('{act}', act);
				if(act == 'view'){
					window.location.href = url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
				}
			}
</script>
	</head>
	<body>
		<div class="ui-form-container">
	<form name="formname" id="formname" method="post" action="">
				<input type="hidden" id="objectid" name="objectid" value="${entity.objectid}" />
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}">		
				<div class="ui-form-input-box">
					<span class="required ui-form-input-title">光缆段名称：</span>
					<input type="text" name="zymc" id="zymc"
						class="required ui-form-input"  value="${entity.zymc}" />
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光缆段编号：</span>
					<input type="text" name="gldbh" id="gldbh" class="ui-form-input"
						value="${entity.gldbh}" />
				</div>
				<div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属光缆：</span>
					<input id="ssglinput" name="ssgltinput" type="text"  class="ui-form-input" onblur="judgeHiddenValue(this,'ssgl')"
						value='<resinfo:resCommon keyValue="${entity.ssgl}" tableName="res_glxx"></resinfo:resCommon>' />
					<input size="30" type="hidden" readonly name="ssgl" id="ssgl"
						value="${entity.ssgl}" />
					 <span class="ui-form-symbol-icon"></span><!--<span class="ui-form-symbol-color">*</span> -->
				 </div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">纤芯数：</span>
					<input type="text" class="required ui-form-input number" value="${entity.xxs}"
						name="xxs" id="xxs" />
					<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">长度：</span>
					<input type="text" class="ui-form-input number" value="${entity.cd}"
						name="cd" id="cd" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">敷设方式：</span>
					<baseinfo:dicselector name="fsfs" columntype="layingmethod"
						type="select" keyValue="${entity.fsfs}" style="width:220px" isQuery="query" 
						cssClass="ui-form-input"></baseinfo:dicselector>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT" isQuery="query"
						type="select" keyValue="${entity.sszt}" style="width:220px"
						cssClass="required ui-form-input"></baseinfo:dicselector>
							<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">A端设备类型：</span>
					<baseinfo:dicselector name="adsblx" id="qdlx" columntype="CSSBLX" onChange="qdlxChange()" exclude="AA002"
						type="select" keyValue="${entity.adsblx}" style="width:220px" isQuery="query"  
						cssClass="required ui-form-input"></baseinfo:dicselector>
							<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">A端设备名称：</span>
					<input type="text" class="required ui-form-input" onblur="judgeHiddenValue(this,'qdmc');parseAZ('Qdmcinput');" name="Qdmcinput" id="Qdmcinput" value='<resinfo:resCommon keyValue="${entity.adsbmc}" resType="${entity.adsblx}"></resinfo:resCommon>'/>
					<input type="hidden" id="qdmc" name="adsbmc" value="${entity.adsbmc}"/>
					<span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">Z端设备类型：</span>
					<baseinfo:dicselector name="zdsblx" id="zdlx" columntype="CSSBLX" onChange="zdlxChange()" exclude="AA002"
						type="select" keyValue="${entity.zdsblx}" style="width:220px" isQuery="query" 
						cssClass="required ui-form-input"></baseinfo:dicselector>
							<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">Z端设备名称：</span>
					<input type="text" class="required ui-form-input" onblur="judgeHiddenValue(this,'zdmc');parseAZ('Zdmcinput');checkZD();" name="Zdmcinput" id="Zdmcinput" value='<resinfo:resCommon keyValue="${entity.zdsbmc}" resType="${entity.zdsblx}"></resinfo:resCommon>'/>
					<input type="hidden" id="zdmc" name="zdsbmc" value="${entity.zdsbmc}"/>
					<span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">生产厂家：</span>
					<input type="text" class="ui-form-input" value="${entity.sccj}"
						name="sccj" id="sccj" />
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">纤芯类型：</span>
					<baseinfo:dicselector name="qxlx" columntype="XXLX"
						type="select" keyValue="${entity.qxlx}" style="width:220px" isQuery="query" 
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">工程名称：</span>
					<input type="text" class="ui-form-input" value="${entity.gcmc}"
						name="gcmc" id="gcmc" />
				</div>
				
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">施工单位：</span>
					<input type="text" class="ui-form-input" value="${entity.sgdw}"
						name="sgdw" id="sgdw" />
				</div>
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">使用单位：</span>
					<input type="text" class="ui-form-input" value="${entity.sydw}"
						name="sydw" id="sydw" />
				</div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree cls="required ui-form-input" widgetId="001" defaultValue="${entity.regionid}" width="210" height="120"
						regionId="${user.regionId}" callBackId="regionCallBackId"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid" value="${entity.regionid}">
					<span class="ui-form-symbol-color">*</span>
				 </div>		
				 	<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"
						type="select" keyValue="${entity.cqxz}" style="width:220px" isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS"
						type="select" keyValue="${entity.whfs}" style="width:220px" isQuery="query" 
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				 
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">用途：</span>
					<baseinfo:dicselector name="yt" columntype="SSYT"
						type="select" keyValue="${entity.yt}" style="width:220px" isQuery="query"  
						cssClass="ui-form-input"></baseinfo:dicselector>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所有权人：</span>
					<input type="text" class="ui-form-input"
						value="${entity.syqr}" name="syqr" id="syqr" />
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