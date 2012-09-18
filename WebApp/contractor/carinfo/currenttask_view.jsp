<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<html>
	<head>
	<script type="text/javascript">
	In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	In.ready('ctcss','commonjs',function(){
		In.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
	});
</script>
	</head>
	<body style="width:100%;height:100%;">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="">
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">任务申请人：</span>
				    <resinfo:resCommon displayName="name" keyColumn="id" keyValue="${entity.applicant}" tableName="base_person"/>
				    
				 </div>	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">任务开始时间：</span>
				    <span class="ui-form-value">${entity.useStartDate }</span>
				 </div>		
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">任务描述：</span>
				    <span class="ui-form-value">${entity.useReason }</span>
				 </div>				 			 				 				 			 				 	 
			</form> 
		</div>
	</body>
</html>
