<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript">
	 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
        In.add('wdatepickerjs',{path:'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',type:'js',charset:'utf-8'});
        In.ready('ztreejs','validatejs','ctcss','commonjs','wdatepickerjs',function(){
        	In.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
        	In.css('.ui-form-input {width:220px} .ui-form-input-title{width:100px}');        
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
			var type = "gddxt";
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
	<body style="overflow: auto;">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="">
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}">

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">管道系统名称：</span>
					<input type="text" class="required ui-form-input" name="zymc" maxlength="50"
						value="${entity.zymc}" id="zymc" />
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">总长度：</span>
					<input type="text" class="ui-form-input number" value="${entity.zcd}" maxlength="10"
						name="zcd" id="zcd" />(米)
				</div>

				<!--  <div class="ui-form-input-box">
					<span class="ui-form-input-title">管井数：</span>
					<input type="text" class="number ui-form-input" value="${entity.gjs}" maxlength="10"
						name="gjs" id="gjs" />
				</div>
-->
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别：</span>
					<baseinfo:dicselector name="ywjb" columntype="CABLETYPE" isQuery="query"
						style="width:220px" cssClass="required ui-form-input" type="select"
						keyValue="${entity.ywjb}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" keyValue="${entity.sszt}"
						style="width:220px" columntype="SSZT" type="select" isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
					<baseinfo:regiontree widgetId="001" defaultValue="${entity.regionid}" width="220"
						height="220" cls="required ui-form-input" callBackId="regionCallBackId"
						regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}"><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" keyValue="${entity.whfs}" 
					isQuery="query"	style="width:220px" type="select" cssClass="required ui-form-input"></baseinfo:dicselector>
				<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector keyValue="${entity.cqxz}" name="cqxz" isQuery="query"
						columntype="property_right" style="width:220px" type="select"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">建设单位：</span>
					<input type="text" class="ui-form-input" value="${entity.jsdw}" maxlength="50"
						name="jsdw" id="jsdw" />
				</div>
				
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">竣工时间：</span>
				    <input type="text" class="ui-form-input Wdate" name="jgsj" id="jgsj" value="${entity.jgsj}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				 </div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注：</span>
					<textarea class="input textarea" name="bz" id="bz" maxlength="150"
						style="width: 220px">${entity.bz}</textarea>
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