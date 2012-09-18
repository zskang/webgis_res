<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>挂墙段查询</title>
		<script type="text/javascript">
			In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
			In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
			In.add('autocompleteJs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompleteCss']});
	        In.add('autocompleteCss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
		    In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
	        In.add('wdatepickerjs',{path:'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',type:'js',charset:'utf-8'});
	        In.ready('ztreejs','wdatepickerjs','autocompleteJs',function(){
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
				getAutoCompleteValue(false,'qdgqinput','qdgqhidden','res_gqxx');
				getAutoCompleteValue(false,'zdgqinput','zdgqhidden','res_gqxx');
			});		
			var regionCallBackId = function(id){
				$('#regionid').val(id);
			}
		</script>		
	</head>
	<body>
		<div class="ui-form-container">
			<form name="form1" id="form1" method="post" action="${ctx}/res/basemgr/gqd!list.action">
				 <input type="hidden" id="serializeQueryCondition" name="serializeQueryCondition" />
	 			<div class="ui-form-input-box">
				    <span class="ui-form-input-title">挂墙段名称：</span>
				    <input type="text" class="required ui-form-input" name="zymc" id="zymc" value="${map.zymc}"/>
				 </div>
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">设施状态：</span>
					<baseinfo:dicselector keyValue="${map.sszt}" name="sszt" columntype="SSZT" type="select" cssClass="ui-form-input" isQuery="query"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector keyValue="${map.whfs}" name="whfs" columntype="WHFS" type="select"   cssClass="ui-form-input" isQuery="query"></baseinfo:dicselector>
				 </div>
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector keyValue="${map.cqxz}" name="cqxz" columntype="property_right" type="select"  cssClass="ui-form-input" isQuery="query"></baseinfo:dicselector>
				 </div>
				  <div class="ui-form-input-box">
				    <span class="ui-form-input-title">起端挂墙：</span>
					<input id="qdgqinput" name="qdgqinput"  class="ui-form-input"  type="text" onblur="judgeHiddenValue(this,'qdgqhidden')"  value='<resinfo:resCommon  keyValue="${map.qdgq}" tableName="res_gqxx"></resinfo:resCommon>'/>
					<input size="30" type="hidden" readonly name="qdgq" id="qdgqhidden" value="${map.qdgq}"/>				    
				 </div>
				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">终端挂墙：</span>
					<input id="zdgqinput" name="zdgqinput" class="ui-form-input"  type="text" onblur="judgeHiddenValue(this,'zdgqhidden')"  value='<resinfo:resCommon  keyValue="${map.zdgq}" tableName="res_gqxx"></resinfo:resCommon>'/>
					<input size="30" type="hidden" readonly name="zdgq" id="zdgqhidden" value="${map.zdgq}"/>				    
				 </div>	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">所属区域：</span>
					<baseinfo:regiontree widgetId="001" width="220" height="120" cls="ui-form-input" defaultValue="${map.regionid}" callBackId="regionCallBackId" regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid" value="${map.regionid}">
				 </div>
				 
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="查询" style="width:80px;">
				 </div>
			</form>
		</div>
	</body>
</html>