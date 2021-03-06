<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript">
			var requestData = [];
			requestData["A21"] = "res_gjxx";
			requestData["A20"] = "res_dgxx";
			requestData["A22"] = "res_bsxx";
			requestData["A23"] = "res_gqxx";
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
				}else{
					getAutoCompleteValue(true,'Zdmcinput', 'szssmc', requestData[$('#szsslx').val()]);
				}
	         	jQuery(function(){
	         		if($('#actmsg').val()){
	         			parent.refreshPoint('AD706');
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});					
         		getAutoCompleteValue(false,'Qdmcinput','ssgld','res_gld_ly');
         		initRegionTree_001();
			});
	        function qdlxChange(){
	    		if ($('#szsslx').val() in requestData) {
	    			$('#Zdmcinput').val('');
	    			$('#szssmc').val('');
	    			getAutoCompleteValue(true,'Zdmcinput', 'szssmc', requestData[$('#szsslx').val()]);
	    		}
	    	}
			var regionCallBackId = function(id) {
				$('#regionid').val(id);
			}
	
			var type = "glpl";
			function doSubmit(act) {
				if(act == 'save' && $('#xtbh').val() == ''){
					top.refreshPoint('AD706');
				}
				var url ="${ctx}/res/opticcablemgr/{type}!{act}.action";
				document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
				if(act == 'view'){
					window.location.href = url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
					//document.forms[0].submit();
				}
			}
	</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form id="formname" name="formname" method="post" action="">
				<input type="hidden" id="objectid" name="objectid" value="${entity.objectid}" />
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}">
				<c:if test="${entity.xtbh==null || entity.xtbh==''}">
					<div class="ui-form-input-box">
						<div style="width:100%;height:30px;">
							<span class="ui-form-input-title">经度：</span>
							<input type="text" class="required ui-form-input" readonly="readonly" style="width:100px" name="pointX" id="pointX" /><span class="ui-form-symbol-color">*</span>
							<input type="hidden" name="projectx" id="projectx" />
							<input type="button" value="选择坐标" onclick="javascript:top.addPoint('AD706')" />
						</div>
					</div>
					<div class="ui-form-input-box">
						<span class="ui-form-input-title">纬度：</span>
						<input type="text" class="required ui-form-input" readonly="readonly" style="width:100px" name="pointY" id="pointY" /><span class="ui-form-symbol-color">*</span>
						 <input type="hidden" name="projecty" id="projecty" />
					</div>
				</c:if>
				<c:if test="${entity.xtbh!=null && entity.xtbh!=''}">
					<input type="hidden" name="projectx" id="projectx" value="${entity.projectx}"/>
					<input type="hidden" name="projecty" id="projecty" value="${entity.projecty}"/>
				</c:if>					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光缆盘留名称：</span>
					<input type="text" name="zymc" id="zymc" class="required ui-form-input"  value="${entity.zymc}" />
					<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属光缆段：</span>
					<input id="Qdmcinput" name="Qdmcinput" type="text" class="required ui-form-input" onblur="judgeHiddenValue(this,'ssgld')"
						value='<resinfo:resCommon keyValue="${entity.ssgld}" tableName="res_gld_ly"></resinfo:resCommon>' />
					<input size="30" type="hidden" readonly name="ssgld" id="ssgld" value="${entity.ssgld}" />
					<span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
				</div>				
				 
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">盘留点序号：</span>
					<input type="text" name="pldxh" id="pldxh" class="ui-form-input" value="${entity.pldxh}" />
				</div> 
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所在设施类型:</span>
					<baseinfo:dicselector id="szsslx" name="szsslx" columntype="pointtype" exclude="A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,A32,A33,A34" type="select" cssClass="required ui-form-input" style="width:220px" isQuery="query" keyValue="${entity.szsslx}" onChange="qdlxChange();"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所在设施名称：</span>
					<input id="Zdmcinput" name="Zdmcinput" type="text" class="required ui-form-input" onblur="judgeHiddenValue(this,'szssmc')" value='<resinfo:resCommon keyValue="${entity.szssmc}" resType="${entity.szsslx}"></resinfo:resCommon>' />
					<input size="30" type="hidden" name="szssmc" id="szssmc" value="${entity.szssmc}" />
					<span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">盘留长度:</span>
					<input type="text" class="ui-form-input" value="${entity.plsj}" name="plsj" id="plsj" />(米)
				</div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree cls="required ui-form-input" widgetId="001" defaultValue="${entity.regionid}" width="210" height="120"
						regionId="${user.regionId}" callBackId="regionCallBackId"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid" value="${entity.regionid}">
					<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<input type="text" class="input ui-form-input" name="ewm" id="ewm" class="ui-form-input" value="${entity.ewm}" />
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" onclick="doSubmit('save')" style="width: 80px;">
					<input type="button" value="取消" onclick="doSubmit('view')" style="width: 80px;">
				</div>
			</form>
		</div>
	</body>
</html>