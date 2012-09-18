<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
	#datepop{width:155px;margin:0;padding:0;position:absolute;z-index:1000px;display: none;background-color:silver;border-style:outset}
	#datepop .closediv{position: absolute;z-index:1000px;top:-12px;left: 100%;margin:0;padding:0;float: left;}
	#datepop .closea{z-index:inherit;margin:0;padding:0;background-image:url('../css/images/close.gif');line-height:16px;width:16px;height:16px;text-decoration:none;display:block;float:left;cursor:hand;}
</style>
<div class="ui-form-container">
	<div class="ui-title-banner-bg">
    	<div class="ui-title-banner-text">
    		代维车辆搜索列表<font color="E4760A">(总计：${map['total']})</font>
    	</div>
	</div>
	
</div>
<div id="datepop">
	<div class='closediv'><a class='closea' href="javascript:void(0);" title="关闭" onclick="javascript:$('#datepop').hide('slow');">&nbsp;</a></div>
	从：<input class="inputtext" type="text" id="div_txt_begin" style="width: 145px;" maxlength="60" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><br>
	至：<input class="inputtext" type="text" id="div_txt_end" style="width: 145px;" maxlength="60" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><br>
	<font color="red">时间段须在24小时内</font>
	<input type='hidden' id='div_id'/>
	<input type='hidden' id='div_type'/>
	<input class="button" type="button" value="确定" onclick="checkpath(false, 1, '')">						
</div>
<input type="hidden" id="nowtime" value='<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd HH:mm:ss"/>'>
<input type="hidden" id="locatejson" value='${locatejson}'>
<input type="hidden" id="total" name="total" value="${map['total']}">
<c:forEach items="${map['rows']}" var="item">
	<div class="ui-div-list">
		<ul>
			<li>车牌号：<a href="javascript:void(0);" onclick="showinfowindow('${item.X}', '${item.Y}', '${item.LABEL}', 'car', '${item.ID}');">${item.LABEL}</a></li>
			<li>司机：${item.MENTOR }</li>
			<li>司机电话：${item.PHONE }</li>
			<li>组织机构：${item.ORGNAME }</li>
			<li>最后一次发送时间：${item.ACTIVETIME }</li>
		</ul>
		<ul>
			<li>
			<c:if test="${realtime=='1' }">
				<a href='javascript:void(0);' onclick="checkpath(true, 1, '${item.BUSINESSTYPE}')">今日轨迹</a>
				&nbsp;&nbsp;
				<a href="javascript:void(0);" onclick="show_datetime_div(event, '${item.SIMID}', '${item.BUSINESSTYPE}');">历史轨迹</a>
			</c:if>
			<c:if test="${realtime !='1' }">
				<a href="javascript:void(0);" onclick="show_datetime_div(event, '${item.SIMID}', '${item.BUSINESSTYPE}');">历史轨迹</a>
			</c:if>
			<!--  &nbsp;&nbsp;
			<a href='javascript:void(0);'>调度</a>
			-->
			</li>
		</ul>
	</div>
</c:forEach>
