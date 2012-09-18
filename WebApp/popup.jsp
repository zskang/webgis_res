<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<body style="font-size:12px;">
		<div style="width:100%;height:100%">
			<div style="width:100%;padding-bottom:6px;border-bottom:1px dashed gray;">
				<span style="font-weight:bold;">资源名称：</span>
				${entity.ZYMC}
			</div>
			<div style="width:100%;padding-bottom:6px;margin-top:8px;border-bottom:1px dashed gray;">
				<span style="font-weight:bold;">资源类型：</span>
				${entity.ZYLX}
			</div>
			<div style="width:100%;padding-bottom:6px;margin-top:8px;border-bottom:1px dashed gray;">
				<span style="font-weight:bold;">经度：</span>
				${entity.X}
			</div>
			<div style="width:100%;padding-bottom:6px;margin-top:8px;border-bottom:1px dashed gray;">
				<span style="font-weight:bold;">纬度：</span>
				${entity.Y}
			</div>
		</div>
	</body>
</html>