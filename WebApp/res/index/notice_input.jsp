<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加公告</title>
		<script type="text/javascript">
	 		In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
			In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
			In.ready('validatejs','commonjs',function(){
	         	$(function(){
		         	$("#formname").validate({});
	         		if($('#actmsg').val()){
	         			$.fn.Alert($('#actmsg').val(), 4);
	         		}
	         	});	         	
		    });
		</script>
	</head>
	<body>
		<form id="formname" name="formname" action="${ctx}/res/notice!save.action">
			<input type="hidden" id="actmsg" name="actmsg" value="${actionMessage}" />
			<table style="width:100%;padding-top:10px;">
	    		<tr style="height:40px;">
	    			<td style="width:20%;height:30px;padding-left:20px;">公告标题：</td>
	    			<td style="width:79%">
		   		    	<input type="input" id="title" name="title" value="${entity.title}" style="width:90%;height:26px;" class="required" />
	    			</td>
	    		</tr>
	    		<tr style="height:40px;">
	    			<td style="width:20%;height:30px;padding-left:20px;">公告类型：</td>
	    			<td style="width:79%">
						<baseinfo:dicselector name="type" id="type" columntype="NOTICETYPE"
						style="width:90%;height:26px;" type="select"></baseinfo:dicselector>
	    			</td>
	    		</tr>
	    		<tr >
	    			<td style="width:20%;height:30px;padding-left:20px;">公告内容：</td>
	    			<td style="width:79%">
	    				<textarea id="content" name="content" rows="7" cols="58" value="${entity.content}" class="required"></textarea>
	    			</td>
	    		</tr>
	    		<tr style="height:40px;">
	    			<td style="width:20%;height:30px;padding-left:20px;">&nbsp;</td>
	    			<td style="width:79%">
	    				<input type="submit" value="确定"  style="width:80px;height:26px;margin-left:150px;" />
	    			</td>
	    		</tr>
	    	</table>
    	</form>
	</body>	
</html>