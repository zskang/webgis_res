<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div style="width:250px;height:220px;">
		<div style="width:100%;height:25px;margin-top:10px;">
			<div style="width:30%;float:left;">姓名</div>
			<div style="width:69%;float:right;">${user.userName }</div>
		</div>
		<div style="width:100%;height:25px;margin-top:10px;margin-bottom:10px;">
			<div style="width:30%;float:left;">组织机构</div>
			<div style="width:69%;float:right;">${user.orgName }</div>
		</div>
		<div style="width:100%;">
			<div style="width:30%;float:left;">维护专业</div>
			<div style="width:69%;float:right;">
				<c:forEach items="${user.businessTypes }" var="item">
					${item.LABLE }<br />
				</c:forEach>
			</div>
		</div>
	</div>
