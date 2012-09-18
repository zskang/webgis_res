<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	   <%@ include file="/common/header.jsp"%>
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
				//初始化RegionTree
	         	initRegionTree_001();
	         	jQuery(function(){
	         		if($('#actmsg').val()){
	         			parent.refreshPoint('A20');
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});		         	
	        });
			var type = "dgxx";
			function doSubmit(act){
				if(act == 'save' && $('#xtbh').val() == ''){
					top.refreshPoint('A20');
				}		
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
				 <input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				 <input type="hidden" id="objectid" name="objectid" value="${entity.objectid}" />
				<c:if test="${entity.xtbh==null || entity.xtbh==''}">
					<div class="ui-form-input-box">
						<div style="width:100%;height:30px;">
							<span class="ui-form-input-title">经度：</span>
							<input type="text" class="required ui-form-input" readonly="readonly" style="width:100px" name="pointX" id="pointX" /><span class="ui-form-symbol-color">*</span>
							<input type="hidden" name="projectx" id="projectx" />
							<input type="button" value="选择坐标" onclick="javascript:top.addPoint('A20')" />
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
					<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				    <span class="ui-form-input-title">电杆名称：</span>
				    <input type="text" class="required ui-form-input" maxlength="50" name="zymc" id="zymc" value="${entity.zymc}"/>
				    <span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">原名称：</span>
				    <input type="text" class="ui-form-input" name="ymc"  maxlength="50" id="ymc" value="${entity.ymc}"/>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">道路名称：</span>
				    <input type="text" class="ui-form-input" name="dlmc"  maxlength="50" id="dlmc" value="${entity.dlmc}"/>
				 </div>					 			 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">具体位置：</span>
				    <input type="text" class="ui-form-input" name="jtwz"  maxlength="50" id="jtwz" value="${entity.jtwz}"/>
				 </div>	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">杆高度：</span>
				    <input type="text" class="number ui-form-input"  maxlength="30" name="gdd" id="gdd" value="${entity.gdd}"/>(米)
				 </div>				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">门牌：</span>
				    <input type="text" class="number ui-form-input" maxlength="20" name="mp" id="mp" value="${entity.mp}"/>
				 </div>	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">杆材质：</span>
				    <baseinfo:dicselector name="gcz" columntype="DGCZ" isQuery="query" style="width:218px" cssClass="required ui-form-input" type="select" keyValue="${entity.gcz}"></baseinfo:dicselector>
				    <span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">杆形状：</span>
				    <baseinfo:dicselector name="gxz" columntype="DGXZ" isQuery="query" style="width:218px" cssClass="ui-form-input" type="select" keyValue="${entity.gxz}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">杆规格：</span>
				    <input type="text" class="ui-form-input" name="ggg" id="ggg" value="${entity.ggg}"/>
				 </div>				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">避雷装置：</span>
				    <baseinfo:dicselector name="blzz" columntype="SF" style="width:218px" isQuery="query"  cssClass="ui-form-input" type="select" keyValue="${entity.blzz}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">拉线条数：</span>
				    <input type="text" class="number ui-form-input" maxlength="10" name="lxts" id="lxts" value="${entity.lxts}"/>(条)
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">撑杆根数：</span>
				    <input type="text" class="number ui-form-input"  maxlength="10" name="cggs" id="cggs" value="${entity.cggs}"/>(根)
				 </div>				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">是否撑点：</span>
				    <baseinfo:dicselector name="sfcd" columntype="SF" style="width:218px" isQuery="query"  cssClass="ui-form-input" type="select" keyValue="${entity.sfcd}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">杆面形式：</span>
				    <baseinfo:dicselector name="gmxs" columntype="DGMXS" style="width:218px" isQuery="query"  cssClass="ui-form-input" type="select" keyValue="${entity.gmxs}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">电杆用途：</span>
				    <baseinfo:dicselector name="dgyt" columntype="SSYT" style="width:218px" isQuery="query"  cssClass="ui-form-input" type="select" keyValue="${entity.dgyt}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">是否有吊牌：</span>
				    <baseinfo:dicselector name="sfydp" columntype="SF" isQuery="query" style="width:218px"  cssClass="ui-form-input" type="select" keyValue="${entity.sfydp}"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT" isQuery="query" style="width:218px"  cssClass="required ui-form-input" type="select" keyValue="${entity.sszt}"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				 </div>	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"  style="width:218px"isQuery="query"  cssClass="required ui-form-input" type="select" keyValue="${entity.cqxz}"></baseinfo:dicselector>
				 	<span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS"  isQuery="query"  style="width:218px" cssClass="required ui-form-input" type="select" keyValue="${entity.whfs}"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree cls="required ui-form-input" defaultValue="${entity.regionid}" width="210" height="120"
					 widgetId="001"	regionId="${user.regionId}" callBackId="regionCallBackId"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}">
						<span class="ui-form-symbol-color">*</span>
				 </div>				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属管理区：</span>
				    <input type="text" class="ui-form-input" maxlength="80" name="ssglq" id="ssglq" value="${entity.ssglq}"/>
				 </div>
				 
				 	<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<input type="text" class="ui-form-input" maxlength="80" value="${entity.ewm}" name="ewm" id="ewm" />
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