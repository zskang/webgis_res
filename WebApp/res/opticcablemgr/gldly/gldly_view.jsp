<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>光缆段路由查看</title>
<script type="text/javascript">
	In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	In.ready('ctcss','commonjs',function(){
		In.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
		if('${tipview}'){
			$('.ui-form-input-box:last').css('display','none');
		}
       	jQuery(function(){
       		if($('#actmsg').val()){
       			$.fn.Alert($('#actmsg').val(), 4);
       			parent.loadTree('tree',$('#rooturl', parent.document).val());
       			top.refreshPoint('A33');       			
       		}
       	});			
	});
</script>
	</head>
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post"
				action="${ctx}/res/opticcablemgr/gldly!input.action">
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				 <div class="ui-form-input-box">
					<span class="required ui-form-input-title">光缆段名称:</span>
					<span class="ui-form-value">${entity.zymc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光缆段编号:</span>
					<span class="ui-form-value">${entity.gldbh}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属光缆:</span>
					<resinfo:resCommon keyValue="${entity.ssgl}" tableName="res_glxx" />
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">纤芯数:</span>
					<span class="ui-form-value">${entity.xxs}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">长度:</span>
					<span class="ui-form-value">${entity.cd}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">敷设方式:</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.fsfs}"
							columntype="layingmethod"></baseinfo:dic></span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态:</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.sszt}"
							columntype="SSZT"></baseinfo:dic></span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">A端设备类型:</span>
					<span class="ui-form-value"><baseinfo:dic displayProperty="LABLE" codevalue="${entity.adsblx}" columntype="CSSBLX"></baseinfo:dic></span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">A端设备名称:</span>
					<span class="ui-form-value">
						<resinfo:resCommon keyValue="${entity.adsbmc}" resType="${entity.adsblx}"/>
					</span>	
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">Z端设备类型:</span>
					<span class="ui-form-value"><baseinfo:dic displayProperty="LABLE" codevalue="${entity.zdsblx}" columntype="CSSBLX"></baseinfo:dic></span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">Z端设备名称:</span>
					<span class="ui-form-value">
						<resinfo:resCommon keyValue="${entity.zdsbmc}" resType="${entity.zdsblx}"/>
					</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">生产厂家:</span>
					<span class="ui-form-value">${entity.sccj}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">纤芯类型:</span>
					<span class="ui-form-value">
						<baseinfo:dic displayProperty="LABLE" codevalue="${entity.qxlx}" columntype="XXLX"></baseinfo:dic>
					</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">工程名称:</span>
					<span class="ui-form-value">${entity.gcmc}</span>
				</div>
				
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">施工单位:</span>
					<span class="ui-form-value">${entity.sgdw}</span>
				</div>
					
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">使用单位:</span>
					<span class="ui-form-value">${entity.sydw}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<span class="ui-form-value"> <baseinfo:region
							displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				</div>
				 	<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质:</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.cqxz}"
							columntype="property_right"></baseinfo:dic></span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式:</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.whfs}"
							columntype="WHFS"></baseinfo:dic></span>
				</div>
				 
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">用途:</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.yt}"
							columntype="SSYT"></baseinfo:dic></span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所有权人:</span>
					<span class="ui-form-value">${entity.syqr}</span>
				</div>

				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">组织单位：</span>
				    <span class="ui-form-value">
						<baseinfo:org displayProperty="organizename" id="${entity.orgid}"></baseinfo:org>
					</span>
				 </div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/opticcablemgr/gldly!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>