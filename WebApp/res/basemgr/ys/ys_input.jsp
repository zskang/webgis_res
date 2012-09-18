<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			var requestData = [];//
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
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	        In.ready('ztreejs','autocompleteJs','validatejs','ctcss','commonjs',function(){
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
	         			parent.refreshPoint('AD605');
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});					
	         	//初始化RegionTree
	         	initRegionTree_001();
		        getAutoCompleteValue(false,'ssysxtinput','ssysxt','res_ys_xt');
	        });
				
	function qdlxChange(){
		if ($('#qdlx').val() in requestData) {
			$('#Qdmcinput').val('');
			$('#qdmc').val('');
			getAutoCompleteValue(true,'Qdmcinput', 'qdmc', requestData[$('#qdlx').val()]);
		}
	}
		function zdlxChange() {
			if ($('#zdlx').val() in requestData) {
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
					$.fn.Alert('起点和终点不能相同！',4);
					$("#Zdmcinput").val("");
					$("#zdmc").val("");
					$('#Qdmcinput').val('');
			        $('#qdmc').val('');
				}
			}		
		
	var type = "ys";
	function doSubmit(act) {
		var url = "${ctx}/res/basemgr/{type}!{act}.action";
		document.forms[0].action = url.replace('{type}', type).replace('{act}',act);
		if (act == 'view') {
			window.location.href = url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
			//document.forms[0].submit();
		}
	}
</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form id="formname" name="formname" method="post" action="">
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}">
				<input type="hidden" id="objectid" name="objectid" value="${entity.objectid}" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">引上段名称:</span>
					<input type="text" class="required ui-form-input" name="zymc" maxlength="200"
						id="zymc" value="${entity.zymc}" />
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属引上系统：</span>
					<input id="ssysxtinput" name="ssysxtinput" type="text" class="required ui-form-input"
						value='<resinfo:resCommon displayName="zymc" keyColumn="xtbh" keyValue="${entity.ssysxt}" tableName="res_ys_xt"></resinfo:resCommon>' />
					<input size="30" type="hidden" readonly name="ssysxt" id="ssysxt"
						value="${entity.ssysxt}" />
						<span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">起点类型:</span>
					<baseinfo:dicselector id="qdlx" name="qdlx" columntype="pointtype" exclude="A24,A25,A26,A27,A28,A29,A30,A31,A32,A33,A34"
						type="select"   cssClass="required ui-form-input" isQuery="query"
						keyValue="${entity.qdlx}" onChange="qdlxChange();"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">起点名称：</span>
					<input id="Qdmcinput" name="Qdmcinput" type="text" class="required ui-form-input" onblur="judgeHiddenValue(this,'qdmc');parseAZ('Qdmcinput');"
						value='<resinfo:resCommon  keyValue="${entity.qdmc}" resType="${entity.qdlx}"></resinfo:resCommon>' />
					<input size="30" type="hidden" readonly name="qdmc" id="qdmc" value="${entity.qdmc}" />
					<span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">终点类型:</span>
					<baseinfo:dicselector name="zdlx" columntype="pointtype" isQuery="query" exclude="A24,A25,A26,A27,A28,A29,A30,A31,A32,A33,A34"
						type="select"   cssClass="required ui-form-input"
						keyValue="${entity.zdlx}" onChange="zdlxChange()"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">终点名称：</span>
					<input id="Zdmcinput" name="Zdmcinput" type="text" class="required ui-form-input" onblur="judgeHiddenValue(this,'zdmc');parseAZ('Zdmcinput');"
						value='<resinfo:resCommon  keyValue="${entity.zdmc}" resType="${entity.zdlx}"></resinfo:resCommon>' />
					<input size="30" type="hidden" readonly name="zdmc" id="zdmc"
						value="${entity.zdmc}" />
						<span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">长度:</span>
					<input type="text"  class="ui-form-input number" name="cd" id="cd" maxlength="30"
						class="ui-form-input" value="${entity.cd}" />(米)
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right" isQuery="query"
						type="select"   cssClass="required ui-form-input"
						keyValue="${entity.cqxz}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT"
						type="select"   cssClass="required ui-form-input" isQuery="query"
						keyValue="${entity.sszt}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>				

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" type="select"
						  cssClass="required ui-form-input" isQuery="query"
						keyValue="${entity.whfs}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">使用用途：</span>
					<baseinfo:dicselector name="yt" columntype="SSYT" type="select"
						isQuery="query" cssClass="ui-form-input"
						keyValue="${entity.yt}"></baseinfo:dicselector>
				</div>

					<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
								<baseinfo:regiontree defaultValue="${entity.regionid}"
								cls="required ui-form-input"	widgetId="001" callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>
								<input type="hidden" id="regionid" name="regionid"
									value="${entity.regionid}">
						<span class="ui-form-symbol-color">*</span>
						</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">使用单位：</span>
					<input type="text" class="input ui-form-input" name="sydw" id="sydw"
						value="${entity.sydw}" class="ui-form-input" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所有权人：</span>
					<input type="text" class="input ui-form-input" name="syqr" id="syqr" maxlength="50"
						value="${entity.syqr}" class="ui-form-input" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<input type="text" class="ui-form-input" name="ewm" id="ewm" maxlength="100"
						class="ui-form-input" value="${entity.ewm}" />
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