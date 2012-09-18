<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@ include file="/common/header.jsp"%>
		<script type="text/javascript">
		 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
		 	In.add('autocompleteJs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompleteCss']});
		    In.add('autocompleteCss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
		    In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
		    In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
			In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
		    In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
		        
		       In.ready('ztreejs','validatejs','autocompleteJs','ctcss','commonjs',function(){
		       	In.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
		       	In.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
		       		$("#formname").validate({});
		       		var xtbh = $('#xtbh').val();
				if(!xtbh){
					$('.ui-form-container .ui-form-input-box INPUT:last').css('display','none');
				}
				var actionMessage = $('#actmsg').val();
         		if(actionMessage == "新增成功!"){
					$.fn.Alert(actionMessage,2);
             	}else{
					$.fn.Alert(actionMessage,3);
                }
	       		initRegionTree_001();
				getAutoCompleteValue(false,'ssjfinput','ssjfhidden','res_jf');
			});

			var regionCallBackId = function(id) {
				$('#regionid').val(id);
			}
			var type = "odf";
			function doSubmit(act){
				var url ="${ctx}/res/publicmgr/{type}!{act}.action";
				document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
				if(act == 'view'){
					window.location.href=url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
				}
			}
			
		</script>
	</head>
	<body>
		<div class="ui-form-container">
			<div class="ui-form-title" style="display: none">
				<a href="${ctx}/res/index!rightmenu.action">资源管理</a><span>&gt;</span>
				<span>新增ODF</span>
			</div>
			<form id="formname" name="formname" method="post" action="">
				<input type="hidden" id="actmsg" name="actmsg"
					value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}">

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODF名称:</span>
					<input type="text" class="required ui-form-input" name="zymc"
						id="zymc" value="${entity.zymc}" maxlength="50" />
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODF原名称:</span>
					<input type="text" class="ui-form-input" name="odfymc"
						id="odfymc" value="${entity.odfymc}" maxlength="50" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">固定资产编号:</span>
					<input type="text" class="ui-form-input" name="gdzcbh" id="gdzcbh"
						value="${entity.gdzcbh}" maxlength="50" />
				</div>

	 			<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属机房：</span>
					<input id="ssjfinput" name="ssjfinput" class="required ui-form-input" type="text" onblur="judgeHiddenValue(this,'ssjfhidden')" value='<resinfo:resCommon keyValue="${entity.ssjf}" tableName="res_jf"></resinfo:resCommon>'/><span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
					<input size="30" type="hidden" readonly name="ssjf" id="ssjfhidden" value="${entity.ssjf}"/>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设备类型:</span>
					<baseinfo:dicselector name="sblx" columntype="CSSBLX" type="select" style="width:220px" cssClass="required ui-form-input" isQuery="query" keyValue="${entity.sblx}" include="AA001,AA002">
					</baseinfo:dicselector>

					<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">具体位置:</span>
					<input type="text" class="ui-form-input" name="jtwz" id="jtwz"
						value="${entity.jtwz}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">生产厂家:</span>
					<input type="text" class="ui-form-input" name="sccj" id="sccj"
						value="${entity.sccj}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">规格型号:</span>
					<input type="text" class="ui-form-input" name="ggxh" id="ggxh"
						value="${entity.ggxh}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">宽度:</span>
					<input type="text" class="ui-form-input number"  name="kd" id="kd"
						class="ui-form-input" value="${entity.kd}" />(米)
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">深度:</span>
					<input type="text" class="ui-form-input number"  name="sd" id="sd"
						value="${entity.sd}" />(米)
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">高度:</span>
					<input type="text" class="ui-form-input number" name="gd" id="gd"
						value="${entity.gd}" />(米)
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM框行数:</span>
					<input type="text" class="required ui-form-input number"
						value="${entity.odmkhs}" name="odmkhs" id="odmkhs" /><span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM框列数:</span>
					<input type="text" class="required ui-form-input number"
						value="${entity.odmhls}" name="odmhls" id="odmhls" /><span class="ui-form-symbol-color">*</span>
				</div>	

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">框行排列方式:</span>
					<baseinfo:dicselector name="khplfs" columntype="PLFS" type="select"
						keyValue="${entity.khplfs}"  isQuery="query" exclude="AD004,AD002,AD003,AD005"
						cssClass="required ui-form-input"></baseinfo:dicselector><span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">框列排列方式:</span>
					<baseinfo:dicselector name="klplfs" columntype="PLFS" type="select"
						keyValue="${entity.klplfs}"  isQuery="query" exclude="AD001,AD002,AD003,AD006"
						cssClass="required ui-form-input"></baseinfo:dicselector><span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">框排列规则:</span>
					<baseinfo:dicselector name="kphgz" columntype="KPHGZ" type="select"
						keyValue="${entity.kphgz}"  isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector><span class="ui-form-symbol-color">*</span>
				</div>			

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">一体化标志:</span>
					<input type="text" class="ui-form-input" name="ythbz" id="ythbz"
						value="${entity.ythbz}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
					<baseinfo:regiontree defaultValue="${entity.regionid}"  
					 widgetId="001"	cls="required ui-form-input" callBackId="regionCallBackId"
						regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}">
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"
						type="select" style="width:220px" cssClass="required ui-form-input" isQuery="query"
						keyValue="${entity.cqxz}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" type="select"
						style="width:220px" cssClass="required ui-form-input" isQuery="query"
						keyValue="${entity.whfs}"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">网元状态：</span>
					<baseinfo:dicselector name="wyzt" columntype="WYZT" type="select"
						style="width:220px" cssClass="ui-form-input"
						keyValue="${entity.wyzt}"></baseinfo:dicselector>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">被熔接盘占的框序号:</span>
					<input type="text" class="ui-form-input" name="kx" id="kx"
						value="${entity.kx}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">使用用途：</span>
					<baseinfo:dicselector name="odfyt" columntype="SSYT" type="select"
						style="width:220px" cssClass="ui-form-input"
						keyValue="${entity.odfyt}"></baseinfo:dicselector>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属管理区：</span>
					<input type="text" class="ui-form-input" name="ssglq" id="ssglq"
						class="ui-form-input" value="${entity.ssglq}" />
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<input type="text" class="ui-form-input" name="ewm" id="ewm"
						class="ui-form-input" value="${entity.ewm}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注：</span>
					<textarea class="input textarea" name="bz" id="bz"
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