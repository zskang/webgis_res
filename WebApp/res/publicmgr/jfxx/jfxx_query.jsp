<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>机房查询</title>
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
	var regionCallBackId = function(id) {
		$('#regionid').val(id);
	}
</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form name="form1" id="form1" method="post"
				action="${ctx}/res/publicmgr/jfxx!list.action">
				<input type="hidden" id="serializeQueryCondition"
					name="serializeQueryCondition" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">机房名称：</span>
					<input type="text" class="required ui-form-input" name="zymc"
						id="zymc" value="${searchCondition.zymc}" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">机房类型：</span>
					<baseinfo:dicselector name="jflx" columntype="JFLX"
						  type="select"
						keyValue="${searchCondition.jflx}" cssClass="ui-form-input"
						isQuery="query"></baseinfo:dicselector>
				</div>
				<div class="ui-form-input-box">
				    <span class="ui-form-input-title">SIM卡号：</span>
				    <input type="text" class="required ui-form-input" name="simid" id="simid" value="${searchCondition.simid}"/>
				 </div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"
						  type="select" keyValue="${searchCondition.cq}"
						cssClass="ui-form-input" isQuery="query"></baseinfo:dicselector>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree widgetId="001" width="220" height="120" defaultValue="${searchCondition.regionid}" cls="ui-form-input" callBackId="regionCallBackId" 
					 regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" class="required" id="regionid" name="regionid"
						value="${searchCondition.regionid}">
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">机房编码：</span>
					<input type="text" class="required ui-form-input" name="jfbm"
						id="jfbm" value="${searchCondition.jfbm}" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属管理区：</span>
					<input type="text" class="required ui-form-input" name="precinct"
						id="precinct" value="${searchCondition.precinct}" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">采集开始时间：</span>
					<input type="text" class="required ui-form-input Wdate" name="starttime"
						id="starttime" value="${searchCondition.starttime}"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">采集结束时间：</span>
					<input type="text" class="required ui-form-input Wdate" name="endtime"
						id="endtime" value="${searchCondition.endtime}"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="查询" style="width: 80px;">
				</div>
			</form>
		</div>
	</body>
</html>