<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.cabletech.com.cn/baseinfo" prefix="baseinfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="ui-title-banner-bg">
    	<div class="ui-title-banner-text">
    		今日在线人员
    	</div>
</div>
<div class="ui-form-container">
	<div style="height:24px;background-color:#FFFAED;line-height:24px;">
	<font color="#E4760A"><strong>按区域分类</strong></font></div>
	<ul id="regions">
	<c:forEach items="${regions}" var="item">
		<li>${item.REGIONNAME}<a href='javascript:void(0);'>(<span id="${item.REGIONID}"><font color='red'>0</font></span>人)</a></li>
	</c:forEach>
    </ul>
    
</div>
<div class="ui-form-container">   
	<div style="height:24px;background-color:#FFFAED;line-height:24px;">
	<font color="#E4760A"><strong>按代维分类</strong></font></div>
	<ul id="contractors">
	<c:forEach items="${contractors}" var="item">
		<li><baseinfo:org displayProperty="organizename" id="${item.ID}"></baseinfo:org><a href='javascript:void(0);'>(<span id="${item.ID}"><font color='red'>0</font></span>人)</a></li>
	</c:forEach>
    </ul>
</div>
<div class="ui-form-container">   
    <div style="height:24px;background-color:#FFFAED;line-height:24px;">
	<font color="#E4760A"><strong>整点分布图</strong></font></div>
	<ul>
      <li>
		<div id="container" style="width:318px; height: 250px; margin: 0; padding: 0;"/>      	
      </li>
    </ul>
</div>
