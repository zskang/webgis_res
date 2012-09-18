<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.cabletech.com.cn/baseinfo" prefix="baseinfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="ui-title-banner-bg">
	<div class="ui-title-banner-text">当前未处理故障</div>
</div>
<div class="ui-form-container">
	<div style="height:24px;background-color:#FFFAED;line-height:24px;">
		<font color="#E4760A"><strong>按区域分类</strong> </font>
	</div>
	<ul id="regions">
		<c:forEach items="${regions}" var="item">
			<li>${item.REGIONNAME}<a href='javascript:void(0);'>(<span
					id="${item.REGIONID}"><font color='red'>0</font> </span>处)</a></li>
		</c:forEach>
	</ul>
</div>
<div class="ui-form-container">
	<div style="height:24px;background-color:#FFFAED;line-height:24px;">
		<font color="#E4760A"><strong>按代维分类</strong> </font>
	</div>
	<ul id="contractors">
		<c:forEach items="${contractors}" var="item">
			<li><baseinfo:org displayProperty="organizename" id="${item.ID}"></baseinfo:org><a
				href='javascript:void(0);'>(<span id="${item.ID}"><font
						color='red'>0</font>
				</span>处)</a>
			</li>
		</c:forEach>
	</ul>
</div>
<!-- 
<div class="ui-form-container">
	<div class="ui-title-banner-bg">
		<div class="ui-title-banner-text">整点在线人数</div>
	</div>
	<ul>
		<li><img width="280px" border="1"
			src="${pageContext.request.contextPath}/css/images/pic1.png"></li>
	</ul>
</div>
 -->
