<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
		 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	        In.add('autocompleteJs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompleteCss']});
	        In.add('autocompleteCss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
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
					}
		         	jQuery(function(){
		         		if($('#actmsg').val()){
		         			parent.refreshPoint('AA005');
		         			$.fn.Alert($('#actmsg').val(), 4);
		         		}
		         	});					
					getAutoCompleteValue(false,'ssglinput','ssglhidden','res_glxx');
	         		 //初始化RegionTree
	         		initRegionTree_001();
	        });
			
			var type = "gjt";
			function doSubmit(act){
				if(act == 'save' && $('#xtbh').val() == ''){
					top.refreshPoint('AA006');
				}
				var url ="${ctx}/res/cableequipmgr/{type}!{act}.action";
				document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
				if(act == 'view'){
					window.location.href=url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
				}
			}
			var regionCallBackId = function(id){
				$('#regionid').val(id);
			};
			
			function ChangeDevType(){
			     $('#Qdmcinput').val("");
			     $('#ssssmc').val("");
				var zylx = $('#sssslx').val();
				if(zylx == "A20"){
					getAutoCompleteValue(true,'Qdmcinput','ssssmc','res_dgxx');
				}
				else if (zylx == "A21"){
					getAutoCompleteValue(true,'Qdmcinput','ssssmc','res_gjxx');
				}
				else if(zylx == "A22"){
					getAutoCompleteValue(true,'Qdmcinput','ssssmc','res_bsxx');
				}
				else if(zylx == "A23"){
					getAutoCompleteValue(true,'Qdmcinput','ssssmc','res_gqxx');
				}
				else{
					getAutoCompleteValue(true,'Qdmcinput','ssssmc','');
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
				<input type="hidden" name="lon" id="lon" value="${entity.lon}" />
				<input type="hidden" name="lat" id="lat" value="${entity.lat}" />
				<c:if test="${entity.xtbh==null || entity.xtbh==''}">
					<div class="ui-form-input-box">
						<div style="width:100%;height:30px;">
							<span class="ui-form-input-title">经度：</span>
							<input type="text" class="required ui-form-input" readonly="readonly" style="width:100px" name="pointX" id="pointX" /><span class="ui-form-symbol-color">*</span>
							<input type="hidden" name="projectx" id="projectx" />
							<input type="button" value="选择坐标" onclick="javascript:top.addPoint('AA006')" />
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
				    <span class="ui-form-input-title">光接头名称：</span>
				    <input type="text" class="required ui-form-input" name="zymc" id="zymc" value="${entity.zymc}" maxlength="50" />
				 <span class="ui-form-symbol-color">*</span>
				 </div>
				 
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">光接头编号：</span>
				    <input type="text" class="ui-form-input" name="gjtbh" id="gjtbh" value="${entity.gjtbh}" maxlength="50" />
				 </div>
				   <div class="ui-form-input-box">
				    <span class="ui-form-input-title">原名称：</span>
				    <input type="text" class="ui-form-input" name="ymc" id="ymc" value="${entity.ymc}" maxlength="50" />
				 </div>
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">固定资产编号：</span>
				    <input type="text" class="ui-form-input" name="gdzcbh" id="gdzcbh" value="${entity.gdzcbh}" maxlength="50" />
				 </div>
				 
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">规格型号：</span>
				    <input type="text" class="ui-form-input" name="ggxh" id="ggxh" value="${entity.ggxh}" maxlength="10"/>
				 </div>
				 
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">接头类型：</span>
				    <baseinfo:dicselector name="jtlx" columntype="GJTLX"    type="select" keyValue="${entity.jtlx}" cssClass="required ui-form-input" isQuery="query"></baseinfo:dicselector>
				 	<span class="ui-form-symbol-color">*</span>
				 </div>
				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">业务级别：</span>
				    <baseinfo:dicselector name="ywjb" columntype="CABLETYPE"    type="select" keyValue="${entity.ywjb}" cssClass="required ui-form-input" isQuery="query"></baseinfo:dicselector>
				 	<span class="ui-form-symbol-color">*</span>
				 </div>
				 
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">设施状态：</span>
				    <baseinfo:dicselector name="sszt" columntype="SSZT"    type="select" keyValue="${entity.sszt}" cssClass="required ui-form-input" isQuery="query"></baseinfo:dicselector>
				 	<span class="ui-form-symbol-color">*</span>
				 </div>
				 <div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" type="select" isQuery="query"
					  	keyValue="${entity.whfs}" cssClass="required ui-form-input"></baseinfo:dicselector>
					  	<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"
						   type="select" keyValue="${entity.cqxz}"
						cssClass="required ui-form-input" isQuery="query"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">安装方式：</span>
					<baseinfo:dicselector name="azfs" columntype="AZFS"
						   type="select" keyValue="${entity.azfs}"
						cssClass="ui-form-input" isQuery="query"></baseinfo:dicselector>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所在设施类型：</span>
					<baseinfo:dicselector id="sssslx" name="sssslx" columntype="pointtype" exclude="A31,A30,A29,A32,A33,A34,A25,A24,A28,A27,A26,A36,A35"
						   type="select" keyValue="${entity.sssslx}"
						cssClass="required ui-form-input" isQuery="query" onChange="ChangeDevType()"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				   <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所在设施名称：</span>
				 	<input id="Qdmcinput" type="text" onblur="judgeHiddenValue(this,'ssssmc')" class="required ui-form-input"
						value='<resinfo:resCommon  keyValue="${entity.ssssmc}" resType="${entity.sssslx}"></resinfo:resCommon>' />
					<input size="30" type="hidden" readonly name="ssssmc" id="ssssmc"
						value="${entity.ssssmc}" />
					<span class="ui-form-symbol-icon"></span>
					<span class="ui-form-symbol-color">*</span>
				 </div>
				 
				 <div class="ui-form-input-box">
					<span class="ui-form-input-title">所属光缆：</span>
					<input id="ssglinput" name="ssglinput"
						class="required ui-form-input" type="text"
						onblur="judgeHiddenValue(this,'ssglhidden')"
						value='<resinfo:resCommon displayName="zymc" keyColumn="xtbh" keyValue="${entity.ssgl}" tableName="res_glxx"></resinfo:resCommon>' />
					<input size="30" type="hidden" readonly name="ssgl" id="ssglhidden"
						value="${entity.ssgl}" />
						<span class="ui-form-symbol-icon"></span>
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				   <div class="ui-form-input-box">
				    <span class="ui-form-input-title">序号：</span>
				    <input type="text" class="number ui-form-input" name="xh" id="xh" value="${entity.xh}" maxlength="5" />
				 </div>
				 
				   <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属管理区：</span>
				    <input type="text" class="ui-form-input" name="ssglq" id="ssglq" value="${entity.ssglq}" maxlength="50" />
				 </div>
				   <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属工程：</span>
				    <input type="text" class="ui-form-input" name="ssgc" id="ssgc" value="${entity.ssgc}" maxlength="50" />
				 </div>
				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">主建单位：</span>
				    <input type="text" class="ui-form-input" name="zjdw" id="zjdw" value="${entity.zjdw}" maxlength="50" />
				 </div>
				 
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">参见单位：</span>
				    <input type="text" class="ui-form-input" name="cjwd" id="cjwd" value="${entity.cjwd}" maxlength="50" />
				 </div>
				 
				 	<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
					<baseinfo:regiontree defaultValue="${entity.regionid}" cls="required ui-form-input"widgetId="001"
					    callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}">
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<input type="text" class="ui-form-input" name="ewm" id="ewm" maxlength="50" 
						value="${entity.ewm}" />
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