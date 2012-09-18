<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	   <%@ include file="/common/header.jsp"%>
		<script type="text/javascript">
		 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
	        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
	        In.add('autocompletejs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompletecss']});
	        In.add('autocompletecss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	        In.ready('ztreejs','validatejs','autocompletejs','ctcss','commonjs',function(){
		        In.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
		        In.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');	        
	         	$("#formname").validate({});
				var xtbh = $('#xtbh').val();         	
	         	if(!xtbh){
					$('.ui-form-container .ui-form-input-box INPUT:last').css('display','none');
				}
	         	jQuery(function(){
	         		if($('#actmsg').val()){
	         			parent.refreshPoint('AD602');
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});				
				//初始化RegionTree
				initRegionTree_001();
				getAutoCompleteValue(false,'ssglxtinput','ssglxthidden','res_gld_xt');
				getAutoCompleteValue(false,'qddginput','qddghidden','res_dgxx');
				getAutoCompleteValue(false,'zddginput','zddghidden','res_dgxx');		        	
	        });
		</script>
		<script type="text/javascript">
			var parseAZ = function(object){
				if($('#qddghidden').val() != '' && $('#zddghidden').val() != '' && ($('#qddghidden').val() == $('#zddghidden').val())){
					$.fn.Alert('起端电杆和终端电杆不能相同！',4);
					$("#zddginput").val("");
					$("#zddghidden").val("");
					$("#qddginput").val("");
					$("#qddghidden").val("");
				}
			}
			 var checkGld=function()
	        {
	            if($('#qddghidden').val() != '' && $('#zddghidden').val() != '')
	            {
	                 	$.ajax({
							   type: "POST",
							   dataType: "json",
							   url: "${ctx}/res/basemgr/gld!checkGld.action",
							   data: "qddg="+$('#qddghidden').val()+"&zddg="+$('#zddghidden').val(),
							   success: function(msg){
							     if(msg.count!="0"){
							    	$("#zddginput").val("");
					                $("#zddghidden").val("");
					                $("#qddginput").val("");
					                $("#qddghidden").val("");
							    	$.fn.Alert("杆路段已存在！",1);
							     }
							   }
							 });
	            }
	        }		
			var type = "gld";
			function doSubmit(act){
				var url ="${ctx}/res/basemgr/{type}!{act}.action";
				document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
				if(act == 'view'){
					window.location.href = url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
					//document.forms[0].submit();
				}
			}
			var regionCallBackId = function(id){
				$('#regionid').val(id);
			}
		</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="">
				<input type="hidden" id="objectid" name="objectid" value="${entity.objectid}" />
				 <input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				 <div class="ui-form-input-box">
					<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				    <span class="ui-form-input-title">杆路段名称：</span>
				    <input type="text" class="required ui-form-input" maxlength="80" name="zymc" id="zymc" value="${entity.zymc}"/><span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属杆路段系统：</span>
					<input id="ssglxtinput" name="ssglxtinput" class="required ui-form-input" type="text" onblur="judgeHiddenValue(this,'ssglxthidden')" value='<resinfo:resCommon keyValue="${entity.ssglxt}" tableName="res_gld_xt"></resinfo:resCommon>'/><span class="ui-form-symbol-color">*</span><span class="ui-form-symbol-icon"></span>
					<input size="30" type="hidden" readonly name="ssglxt" id="ssglxthidden" value="${entity.ssglxt}"/>			    
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">起端电杆：</span>
					<input id="qddginput" name="qddginput" class="required ui-form-input" type="text" onblur="judgeHiddenValue(this,'qddghidden');parseAZ('qddginput');" value='<resinfo:resCommon keyValue="${entity.qddg}" tableName="res_dgxx"></resinfo:resCommon>'/><span class="ui-form-symbol-color">*</span><span class="ui-form-symbol-icon"></span>
					<input size="30" type="hidden" readonly name="qddg" id="qddghidden" value="${entity.qddg}"/>				    
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">终端电杆：</span>
					<input id="zddginput" name="zddginput" class="required ui-form-input" type="text" onblur="judgeHiddenValue(this,'zddghidden');parseAZ('zddginput');checkGld();" value='<resinfo:resCommon keyValue="${entity.zddg}" tableName="res_dgxx"></resinfo:resCommon>'/><span class="ui-form-symbol-color">*</span><span class="ui-form-symbol-icon"></span>
					<input size="30" type="hidden" readonly name="zddg" id="zddghidden" value="${entity.zddg}"/>				    
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">杆路段长度：</span>
				    <input id="syqr" name="gldcd" type="text" maxlength="30" class="number required ui-form-input" value="${entity.gldcd}"/>(米)
				    <span class="ui-form-symbol-color">*</span>
				 </div>			 	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree widgetId="001" cls="required ui-form-input" defaultValue="${entity.regionid}" width="210" height="220"
						regionId="${user.regionId}" callBackId="regionCallBackId"></baseinfo:regiontree><span class="ui-form-symbol-color">*</span>
					<input type="hidden" id="regionid" name="regionid" value="${entity.regionid}">
				 </div>				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" style="width:218px" isQuery="query" cssClass="required ui-form-input" type="select" keyValue="${entity.whfs}"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT" style="width:218px" isQuery="query"  cssClass="required ui-form-input" type="select" keyValue="${entity.sszt}"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				 </div>	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right" style="width:218px" isQuery="query"  cssClass="required ui-form-input" type="select" keyValue="${entity.cqxz}"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所有权人：</span>
				    <input id="syqr" name="syqr" type="text" maxlength="50" class="ui-form-input" value="${entity.syqr}"/>
				 </div>				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">用途：</span>
					<baseinfo:dicselector name="yt" columntype="SSYT" style="width:218px" isQuery="query"  cssClass="ui-form-input" type="select" keyValue="${entity.yt}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">是否共享：</span>
					<baseinfo:dicselector name="sfgx" columntype="SF" style="width:218px" isQuery="query" cssClass="ui-form-input" type="select" keyValue="${entity.sfgx}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">是否共建：</span>
					<baseinfo:dicselector name="sfgj" columntype="SF" style="width:218px" isQuery="query" cssClass="ui-form-input" type="select" keyValue="${entity.sfgj}"></baseinfo:dicselector>
				 </div>				 				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" onclick="doSubmit('save')" style="width:80px;">
					<input type="button" value="取消" onclick="doSubmit('view')" style="width:80px;">
				 </div>
			</form>
		</div>	
	</body>
</html>