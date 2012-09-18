<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	In.add('commonjs', {path:'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	In.ready('ctcss','commonjs',function(){
		In.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
		if('${tipview}'){
			$('.ui-form-input-box:last').css('display','none');
		}
       	jQuery(function(){
       		if($('#actmsg').val()){
       			$.fn.Alert($('#actmsg').val(), 4);
       			parent.loadTree('tree',$('#rooturl', parent.document).val());
       			parent.refreshPoint('AD706');
       		}
       	});			
	});
</script>
	</head>
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="">
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光缆盘留名称：</span>
					<span class="ui-form-value">${entity.zymc}</span>
				</div>
			
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属光缆段：</span>
					<span class="ui-form-value"><resinfo:resCommon keyValue="${entity.ssgld}" tableName="res_gld_ly"/></span>
				</div>				
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">盘留点序号：</span>
					<span class="ui-form-value">${entity.pldxh}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所在设施类型:</span>
					<span class="ui-form-value"> <baseinfo:dic displayProperty="LABLE" codevalue="${entity.szsslx}" columntype="pointtype"></baseinfo:dic> </span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所在设施名称：</span>
					<span class="ui-form-value"><resinfo:resCommon keyValue="${entity.szssmc}" resType="${entity.szsslx}"/></span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">盘留长度:</span>
						<span class="ui-form-value">${entity.plsj}</span>(米)
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<span class="ui-form-value"> <baseinfo:region
							displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<span class="ui-form-value">${entity.ewm} </span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/opticcablemgr/glpl!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>