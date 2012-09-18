<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	         			parent.refreshPoint('A23');
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});				
				//初始化RegionTree
         		initRegionTree_001();
	        });
			var regionCallBackId = function(id) {
				$('#regionid').val(id);
			}
			var type = "gqxx";
			function doSubmit(act){
				if(act == 'save' && $('#xtbh').val() == ''){
					top.refreshPoint('A23');
				}
				var url ="${ctx}/res/basemgr/{type}!{act}.action";
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
							<input type="button" value="选择坐标" onclick="javascript:top.addPoint('A23')" />
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
					<input type="hidden" name="lon" id="lon" value="${entity.lon}"/>
					<input type="hidden" name="lat" id="lat" value="${entity.lat}"/>					
				</c:if>				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">挂墙名称：</span>
					<input type="text" class="required ui-form-input" name="zymc" maxlength="50"
						id="zymc" value="${entity.zymc}" />
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">原名称：</span>
					<input type="text" class="ui-form-input" name="ymc" id="ymc" maxlength="40"
						value="${entity.ymc}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">地址：</span>
					<input type="text" class="ui-form-input" name="dz" id="dz" maxlength="100"
						value="${entity.dz}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"
						type="select" keyValue="${entity.cqxz}"  isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT" type="select"
						keyValue="${entity.sszt}"   isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
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
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" type="select"
						keyValue="${entity.whfs}"   isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">用途：</span>
					<baseinfo:dicselector name="yt" columntype="SSYT" type="select"
						keyValue="${entity.yt}"   isQuery="query"
						cssClass="ui-form-input"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">是否危险点：</span>
					<baseinfo:dicselector name="isdanger" columntype="SF" type="select"
						keyValue="${entity.isdanger}" 	isQuery="query"
						cssClass="ui-form-input"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属管理区：</span>
					<input type="text" value="${entity.ssglq}" class="ui-form-input" maxlength="100"
						name="ssglq" id="ssglq" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<input type="text" value="${entity.ewm}" class="ui-form-input" maxlength="100"
						name="ewm" id="ewm" />
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