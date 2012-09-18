<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>公告查看</title>
		<style type="text/css">
			BODY{font-size:12px; font-family:宋体; margin-top:0px; text-align:center; }
			#global{width:95%; height:90%; margin-left:auto; margin-right:auto;}
			#centerContent{width:100%; height:380px; margin-top:10px; border:5px #f1f1f1 solid; }
			.downLine{width:92%; height:40px;margin-left:auto;margin-right:auto;}
			.leftDownLine{width:100%;height:100%;border-bottom:2px solid #92002d;float:left; }
			.leftDownLine SPAN{display:block; float:left; margin-top:20px; font-size:14px; font-weight:bold; color:#999999;}
			.sampleInfoBox{width:92%; height:100%; margin-top:10px; margin-left:auto;margin-right:auto; }
			.sampleInfoBox P{text-align:left;color:#999999;line-height:22px;}
		</style>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<!--全局Div-->
		<div id="global">
			<div id="centerContent">
				<div class="downLine">
					<div class="leftDownLine"><span>${entity.title }</span></div>
				</div>
				<div class="sampleInfoBox">
					<p>${entity.content }</p>
				</div>
			</div>
		</div>
	</body>	
</html>