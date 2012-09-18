<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
       			top.refreshPoint('AD605');
       		}
       	});			
	});
</script>
	</head>
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post"
				action="${ctx}/res/basemgr/ys!input.action">
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">引上段名称：</span>
					<span class="ui-form-value">${entity.zymc}</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属引上系统：</span>
					<span class="ui-form-value">
					 <resinfo:resCommon displayName="zymc" keyColumn="xtbh" keyValue="${entity.ssysxt}" tableName="res_ys_xt"/></span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">起点类型：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.qdlx}"
							columntype="pointtype"></baseinfo:dic> </span>
							
				</div>

				<div class="ui-form-input-box" id="qdmcDG">
					<span class="ui-form-input-title">起点名称：</span>
					<span class="ui-form-value"> 
					<resinfo:resCommon keyValue="${entity.qdmc}" resType="${entity.qdlx}"/>
					</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">终点类型：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.zdlx}"
							columntype="pointtype"></baseinfo:dic> </span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">终点名称：</span>
					<span class="ui-form-value"> 
					<resinfo:resCommon keyValue="${entity.zdmc}"  resType="${entity.zdlx}"/>
					</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">长度：</span>
					<span class="ui-form-value">${entity.cd}(米)</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.cqxz}"
							columntype="property_right"></baseinfo:dic> </span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.sszt}"
							columntype="SSZT"></baseinfo:dic> </span>
				</div>				

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.whfs}"
							columntype="WHFS"></baseinfo:dic> </span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">用途：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.yt}"
							columntype="SSYT"></baseinfo:dic> </span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<span class="ui-form-value"> <baseinfo:region
							displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">使用单位：</span>
					<span class="ui-form-value">${entity.sydw} </span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所有权人：</span>
					<span class="ui-form-value">${entity.syqr} </span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<span class="ui-form-value">${entity.ewm} </span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">组织单位：</span>
					<span class="ui-form-value">
						<baseinfo:org displayProperty="organizename" id="${entity.orgid}"></baseinfo:org>
					</span>
				</div>				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/basemgr/ys!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>