<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>  
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
In
		.add(
				'ctcss',
				{
					path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'
				});
In
		.ready(
				'ctcss',
				function() {
					In
							.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
					if ('${tipview}') {
						$('.ui-form-input-box:last').css('display', 'none');
					}
				});
</script>
	</head>
	<body>
		<div class="ui-form-container">
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">机房名称：</span>
				    <span class="ui-form-value">${entity.zymc}</span>
				 </div>		
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">机房编码：</span>
				    <span class="ui-form-value">${entity.jfbm}</span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">原名称：</span>
				    <span class="ui-form-value">${entity.ymc}</span>
				 </div>
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">缩写：</span>
				     <span class="ui-form-value">${entity.sx}</span>
				 </div>
				 
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">固定资产编号：</span>
				     <span class="ui-form-value">${entity.gdzcbh}</span>
				 </div>
				 
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属站点：</span>
				   <resinfo:resCommon keyValue="${entity.sszd}" tableName="res_zdxx"/>
				 </div>
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">机房类型：</span>
					 <span class="ui-form-value"><baseinfo:dic displayProperty="LABLE" codevalue="${entity.jflx}" columntype="JFLX"></baseinfo:dic></span>
				 </div>
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
				    <span class="ui-form-value">
						<baseinfo:region displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				 </div>
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所在建筑物：</span>
				    <span class="ui-form-value">${entity.szjzw}</span>
				 </div>	
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">楼层号：</span>
				    <span class="ui-form-value">${entity.lch}</span>
				 </div>	
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">房间号：</span>
				   <span class="ui-form-value">${entity.fjh}</span>
				 </div>	
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">长度：</span>
				    <span class="ui-form-value">${entity.cd}(米)</span>
				 </div>	
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">高度：</span>
				     <span class="ui-form-value">${entity.gd}(米)</span>
				 </div>	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">宽度：</span>
				    <span class="ui-form-value">${entity.kd}(米)</span>
				 </div>		 
				<div class="ui-form-input-box">
				    <span class="ui-form-input-title">产权性质：</span>
					<span class="ui-form-value"><baseinfo:dic displayProperty="LABLE" codevalue="${entity.cqxz}" columntype="property_right"></baseinfo:dic></span>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">业务级别：</span>
					<span class="ui-form-value"><baseinfo:dic displayProperty="LABLE" codevalue="${entity.ywjb}" columntype="CABLETYPE"></baseinfo:dic></span>
				 </div>
				 
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">维护方式：</span>
					<span class="ui-form-value"><baseinfo:dic displayProperty="LABLE" codevalue="${entity.whfs}" columntype="WHFS"></baseinfo:dic></span>
				 </div>
				 
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属管理区：</span>
					<span class="ui-form-value">${entity.precinct}</span>
				</div>
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<span class="ui-form-value">${entity.ewm}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注：</span>
					<span class="ui-form-value">${entity.bz}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/publicmgr/jfxx!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			 
		</div>
	</body>
</html>
