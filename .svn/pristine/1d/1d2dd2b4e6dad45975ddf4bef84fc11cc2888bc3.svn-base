<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>标石信息查询</title>
		<link  href="http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			.ui-form-container{height:100%;border:none; }
			.ui-form-input-title{width:80px; }
			INPUT{width:165px; }
		</style>
		<script type="text/javascript">
			In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
			In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
	        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
	        In.add('wdatepickerjs',{path:'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',type:'js',charset:'utf-8'});
	        In.ready('ztreejs','wdatepickerjs',function(){
	        		In('ctcss');
	        		In.css('.ui-form-input-box{width:100%} .ui-form-input {width:210px} .ui-form-input-title {width:100px}');
	         		$(function(){
	         		    //初始化RegionTree
	         		    initRegionTree_001();
	         			$('#form1').submit(function() {
							$('#serializeQueryCondition').val('');
							$('#serializeQueryCondition').val($(this).serialize());
				  			return true;
						});
	         		});
	        });	
			var regionCallBackId = function(id){
				$('#regionid').val(id);
			}
		</script>		
	</head>
	<body>
		<div class="ui-form-container">
			<form name="form1" id="form1" method="post" action="${ctx}/res/basemgr/bsxx!list.action">
				 <input type="hidden" id="serializeQueryCondition" name="serializeQueryCondition" />
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">标石名称：</span>
				    <input type="text" class="ui-form-input" name="zymc" id="zymc" value="${map.zymc}"/>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">原名称：</span>
				    <input type="text" class="required ui-form-input" name="ymc" id="ymc" value="${map.ymc}"/>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">SIM卡号：</span>
				    <input type="text" class="required ui-form-input" name="simid" id="simid" value="${map.simid}"/>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">道路名称：</span>
				    <input type="text" class="required ui-form-input" name="dlmc" id="dlmc" value="${map.dlmc}"/>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector name="sszt" columntype="SSZT" type="select"   keyValue="${map.sszt}" cssClass="ui-form-input" isQuery="query"></baseinfo:dicselector>
				 </div> 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"   type="select" keyValue="${map.cqxz}" cssClass="ui-form-input" isQuery="query"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree widgetId="001" cls="ui-form-input" width="220" height="120" defaultValue="${map.regionid}" callBackId="regionCallBackId" regionId="${user.regionId }"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid" value="${map.regionid }">
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属管理区：</span>
				    <input type="text" class="required ui-form-input" name="ssglq" id="ssglq" value="${map.ssglq}"/>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">开始时间：</span>
				    <input type="text" class="required ui-form-input" name="starttime" id="starttime" value="${map.begintime}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">结束时间：</span>
				    <input type="text" class="required ui-form-input" name="endtime" id="endtime" value="${map.endtime}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				 </div>
				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="查询" style="width:80px;">
				 </div>
			</form>
		</div>
	</body>
</html>