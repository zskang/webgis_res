<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<%@ include file="/common/header.jsp"%>
	<script type="text/javascript">
	     In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	     In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	     In.ready('validatejs','ctcss',function(){
	     	console.log("用户先登录！");
	     });
	</script>
	</head>
	<body>
		<div class="ui-form-container">
			<div>请先登录！</div>
		</div>
	</body>	
</html>