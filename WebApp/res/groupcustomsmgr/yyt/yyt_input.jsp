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
	         			parent.refreshPoint('A36');
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});					
         		initRegionTree_001();
        });

		var type = "yyt";
		function doSubmit(act) {
			if(act == 'save' && $('#xtbh').val() == ''){
				top.refreshPoint('A36');
			}
			var url = "${ctx}/res/groupcustomsmgr/{type}!{act}.action";
			document.forms[0].action = url.replace('{type}', type).replace('{act}', act);
			if(act == 'view'){
				window.location.href = url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
				//document.forms[0].submit();
			}
		}
		var regionCallBackId = function(id) {
			$('#regionid').val(id);
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
							<input type="button" value="选择坐标" onclick="javascript:top.addPoint('A36')" />
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
					<span class="ui-form-input-title">营业厅名称：</span>
					<input type="text" class="required ui-form-input" name="zymc" id="zymc" value="${entity.zymc}" />
					<span class="ui-form-symbol-color">*</span>
				</div>
				

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">营业厅编号：</span>
					<input type="text" class="required ui-form-input" value="${entity.yytbh}"
						name="yytbh" id="yytbh" />
					<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">营业厅地址：</span>
					<input type="text" class="ui-form-input" name="yytdz" id="yytdz"
						value="${entity.yytdz}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">联系人：</span>
					<input type="text" class="ui-form-input" name="lxr" id="lxr"
						value="${entity.lxr}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">联系电话：</span>
					<input type="text" class="required ui-form-input" name="lxdh" id="lxdh"
						value="${entity.lxdh}" />
							<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">数据更新状态：</span>
					<baseinfo:dicselector name="sjgxzt" columntype="SJGXZT" type="select" isQuery="query" cssClass="required ui-form-input" keyValue="${entity.sjgxzt}"></baseinfo:dicselector>
					<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree defaultValue="${entity.regionid}" widgetId="001"
					regionId="${user.regionId}"  cls="required ui-form-input" 
						callBackId="regionCallBackId"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}">
						<span class="ui-form-symbol-color">*</span>
				</div>

			
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">数据更新信息：</span>
					<input type="text" class="required  ui-form-input" value="${entity.sjgxxx}"
						name="sjgxxx" id="sjgxxx" />
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设备归属：</span>
					<baseinfo:dicselector name="sbgs" columntype="PONSBLX"
						  type="select" keyValue="${entity.sbgs}"
						cssClass="ui-form-input" isQuery="query"></baseinfo:dicselector>
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