<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.cabletech.com.cn/baseinfo" prefix="baseinfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="ui-form-container">
	<div class="ui-title-banner-bg">
		<div class="ui-title-banner-text">
			故障列表<font color="E4760A">(总计：${map['total']})</font>
		</div>
	</div>
</div>
<input type="hidden" id="locatejson" value='${locatejson}'>
<input type="hidden" id="total" name="total" value="${map['total']}">
<c:forEach items="${map['rows']}" var="item">
	<div class="ui-div-list">
		<ul>
			<li>故障名称：${item.LABEL }</li>
			<li>故障点名称：${item.NAME }</li>
			<li>地址：${item.ADDRESS }</li>
			<li>发现时间：${item.TROUBLETIME }</li>
			<li>发现方式： <baseinfo:dic displayProperty="LABLE"
					codevalue="${item.FINDTYPE }" columntype="FIND_TYPE"></baseinfo:dic>
			</li>
			<li>故障级别： <baseinfo:dic displayProperty="LABLE"
					codevalue="${item.TROUBLELEVEL }" columntype="TROUBLE_LEVEL"></baseinfo:dic>
			</li>
		</ul>
		<ul>
			<li>
				<a href="#">派单</a>
			</li>
		</ul>
	</div>
</c:forEach>