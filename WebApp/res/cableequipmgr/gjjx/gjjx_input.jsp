<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>光交接箱信息输入</title>
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
		         			parent.refreshPoint('AA003');
		         			$.fn.Alert($('#actmsg').val(), 4);
		         		}
		         	});					
	         		 //初始化RegionTree
	         		initRegionTree_001();
	         		getAutoCompleteValue(false,'ssjfinput','ssjfhidden','res_jf');
	        });
	        
	var regionCallBackId = function(id) {
		$('#regionid').val(id);
	}
	
	var type = "gjjx";
	function doSubmit(act) {
		if(act == 'save' && $('#xtbh').val() == ''){
			top.refreshPoint('AA003');
		}
		var url = "${ctx}/res/cableequipmgr/{type}!{act}.action";
		document.forms[0].action = url.replace('{type}', type).replace('{act}',
				act);
		if(act == 'view'){
			window.location.href=url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
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
							<input type="button" value="选择坐标" onclick="javascript:top.addPoint('AA003')" />
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
					<span class="ui-form-input-title">光交接箱名称:</span>
					<input type="text" name="zymc" id="zymc" maxlength="50"
						class="required ui-form-input" value="${entity.zymc}" />
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光交接箱编号:</span>
					<input type="text" name="gjjxbh" id="gjjxbh" class="ui-form-input"
						value="${entity.gjjxbh}" maxlength="50" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">原名称:</span>
					<input type="text" class="ui-form-input" value="${entity.ymc}"
						name="ymc" id="ymc" maxlength="50" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">固定资产编号:</span>
					<input type="text" class="ui-form-input" value="${entity.gdzcbh}"
						name="gdzcbh" id="gdzcbh" maxlength="50"/>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">生产厂家:</span>
					<input type="text" class="ui-form-input" value="${entity.sccj}"
						name="sccj" id="sccj" maxlength="50"/>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">规格型号:</span>
					<input type="text" class="ui-form-input" value="${entity.ggxh}"
						name="ggxh" id="ggxh" maxlength="30"/>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">标称容量:</span>
					<input type="text" class="required ui-form-input number"
						value="${entity.bcrl}" name="bcrl" id="bcrl" maxlength="30" />
					<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">一体化标志:</span>
					<input type="text" class="ui-form-input" value="${entity.ythbz}"
						name="ythbz" id="ythbz" maxlength="20" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">适配类型:</span>
					<baseinfo:dicselector name="splx" columntype="SPLX" type="select"
						keyValue="${entity.splx}"  isQuery="query"
						cssClass="ui-form-input"></baseinfo:dicselector>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别:</span>
					<baseinfo:dicselector name="ywjb" columntype="CABLETYPE"
						type="select" keyValue="${entity.ywjb}"  isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">具体位置:</span>
					<input type="text" class="ui-form-input" value="${entity.jtwz}"
						name="jtwz" id="jtwz" maxlength="50" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">道路名称:</span>
					<input type="text" value="${entity.dlmc}"
						class="ui-form-input" name="dlmc" id="dlmc" maxlength="50" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">门牌:</span>
					<input type="text" class="ui-form-input" value="${entity.mp}"
						name="mp" id="mp" maxlength="50"/>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">安装方式:</span>
					<baseinfo:dicselector name="azfs" columntype="AZFS" type="select"
						keyValue="${entity.azfs}"  isQuery="query"
						cssClass="ui-form-input"></baseinfo:dicselector>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM框行数:</span>
					<input type="text" class="required ui-form-input number"
						value="${entity.odmkhs}" name="odmkhs" id="odmkhs" maxlength="10" /><span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM框列数:</span>
					<input type="text" class="required ui-form-input number"
						value="${entity.odmkls}" name="odmkls" id="odmkls"  maxlength="10" /><span class="ui-form-symbol-color">*</span>
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
					<span class="ui-form-input-title">网元状态:</span>
					<baseinfo:dicselector name="wyzt" columntype="WYZT" type="select"
						keyValue="${entity.wyzt}"  isQuery="query"
						cssClass="ui-form-input"></baseinfo:dicselector>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质:</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"
						type="select" keyValue="${entity.cqxz}"  isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态:</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT" type="select"
						keyValue="${entity.sszt}"  isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式:</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" type="select"
						keyValue="${entity.whfs}"  isQuery="query"
						cssClass="required ui-form-input"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">用途:</span>
					<baseinfo:dicselector name="yt" columntype="SSYT" type="select"
						keyValue="${entity.yt}"  isQuery="query"
						cssClass="ui-form-input"></baseinfo:dicselector>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属工程:</span>
					<input type="text" value="${entity.ssgc}" class="ui-form-input"
						name="ssgc" id="ssgc"  maxlength="50"  />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">主建单位:</span>
					<input type="text" value="${entity.zjdw}" class="ui-form-input"
						name="zjdw" id="zjdw" maxlength="50"  />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">参建单位:</span>
					<input type="text" class="ui-form-input" value="${entity.cjdw}"
						name="cjdw" id="cjdw" maxlength="50"  />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属管理区:</span>
					<input type="text" class="ui-form-input" value="${entity.ssglq}"
						name="ssglq" id="ssglq"  maxlength="15" />
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
					<baseinfo:regiontree cls="required ui-form-input" widgetId="001"
						defaultValue="${entity.regionid}" 
						regionId="${user.regionId}" callBackId="regionCallBackId"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}">
						<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码:</span>
					<input type="text" value="${entity.ewm}" class="ui-form-input"
						name="ewm" id="ewm"  maxlength="50"  />
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