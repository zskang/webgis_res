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
        In.add('commonjs', {path:'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
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
	         			parent.refreshPoint('A35');
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});					
         		 //初始化RegionTree
         		initRegionTree_001();
        });
			
			var type = "broadband";
			function doSubmit(act){
				if(act == 'save' && $('#xtbh').val() == ''){
					top.refreshPoint('A35');
				}
				var url ="${ctx}/res/groupcustomsmgr/{type}!{act}.action";
				document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
				if(act == 'view'){
					window.location.href = url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
					//document.forms[0].submit();
				}
			}
			var regionCallBackId = function(xtbh){
				$('#regionid').val(xtbh);
			};
		</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form id="formname" name="formname" method="post" action="">
			    <input type="hidden" name="lon" id="lon" value="${entity.lon}" />
				<input type="hidden" name="lat" id="lat" value="${entity.lat}" />
				<input type="hidden" id="objectid" name="objectid" value="${entity.objectid}" />
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}">
				<c:if test="${entity.xtbh==null || entity.xtbh==''}">
					<div class="ui-form-input-box">
						<div style="width:100%;height:30px;">
							<span class="ui-form-input-title">经度：</span>
							<input type="text" class="required ui-form-input" readonly="readonly" style="width:100px" name="pointX" id="pointX" /><span class="ui-form-symbol-color">*</span>
							<input type="hidden" name="projectx" id="projectx" />
							<input type="button" value="选择坐标" onclick="javascript:top.addPoint('A35')" />
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
				    <span class="ui-form-input-title">宽带小区名称：</span>
				    <input type="text" class="required ui-form-input" name="zymc" id="zymc" value="${entity.zymc}"/>
				 	<span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">宽带小区编码：</span>
				    <input type="text" class="required ui-form-input" name="commid" id="commid" value="${entity.commid}"/>
					<span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">原名称：</span>
				    <input type="text" class="ui-form-input" name="ymc" id="ymc" value="${entity.ymc}"/>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">小区地址：</span>
				    <input type="text" class="ui-form-input" name="commaddr" id="commaddr" value="${entity.commaddr}"/>
				 </div>
				 
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
					<baseinfo:regiontree widgetId="001" defaultValue="${entity.regionid}" cls="required ui-form-input" callBackId="regionCallBackId"
						regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}"><span class="ui-form-symbol-color">*</span>
				</div>
				 
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">宽带类型：</span>
					<baseinfo:dicselector name="broadtype" columntype="KDLX"
						  type="select" keyValue="${entity.broadtype}"
						cssClass="required ui-form-input" isQuery="query"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设备归属：</span>
					<baseinfo:dicselector name="sbgs" columntype="PONSBLX"
						  type="select" keyValue="${entity.sbgs}"
						cssClass="required ui-form-input" isQuery="query"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
				    <span class="ui-form-input-title">归属接入点名称：</span>
				    <input type="text" class="ui-form-input" name="gsjrdmc" id="gsjrdmc" value="${entity.gsjrdmc}"/>
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