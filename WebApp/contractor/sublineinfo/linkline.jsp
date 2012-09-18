<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<%@ include file="/common/header.jsp"%>
	<script type="text/javascript">
	    In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	    In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
		In.add('notycss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery.noty.css'});
		In.add('mynotycss',{path:'http://${config.webliburl}/cabletech/ui/css/noty_theme_twitter.css'});
		In.add('noty',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.noty.js',type:'js',charset:'utf-8',rely:['notycss','mynotycss']});
	    In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8',rely:['noty']});	     
	    var preparedpoints = [];//存储该线段下所有点 
	     In.ready('commonjs','validatejs','ctcss',function(){
	     	$("#formname").validate({
         		focusInvalid : false,
				submitHandler : function(form) {
					linkline(true);
				}
	     	});
	     	
			//判断输入的一个数是不是正整数
			jQuery("#inumber").keyup(function(){
				var value = jQuery(this).val();
				if((/^(\+|-)?\d+$/.test( value ))|| value<0){
					return true;
				}else{
					$.fn.Alert("请输入正整数！",3);
					$(this).val("0");
					return false;
				}
			});	     	
	     	
	     });
	  	
		//预览或执行连线操作
     	function linkline(flag){
     		if(!$('#sublineobjectid').val()){
     			$.fn.Alert('请选择线段', 3);
     			return;
     		}
     		if(!$.trim($('#inumber').val())){
     			$.fn.Alert('请先填写线序！', 3);
     			return;
     		}
     		var sublineobjectid = $('#sublineobjectid').val();
     		var sublineid = $('#sublineid').val();
     		var pointobjectid = '${baseentity.objectid}';
     		var pointtype = $('#restype').val();
     		var pointid = $('#resxtbh').val();
			var inumber = $('#inumber').val();
			var projectx = $('#projectx').val();
			var projecty = $('#projecty').val();
			//返回坐标和对应资源点编号关系数组
     		window.parent.tb.preparedlinklineview(sublineid, sublineobjectid, pointid, pointtype, projectx, projecty, inumber, preparedpoints, flag);
     		
     	}     	

     	function getSubline2Points(subline){
     		$.ajax({
				url: '${ctx}/contractor/sublineinfo!getSubline2Points.action?sublineid='+subline.value+"&R="+Math.random(),
				dataType: 'json',
				success:function(json){
					jQuery.each(json, function(key, value){
						preparedpoints.push(value.POINTID);
					});
					$('#sublineobjectid').val(json[0].OBJECTID);
					$('#sublineid').val(json[0].SUBLINEID);
				}
     		});
     	}
	</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form id="formname" action="${ctx}/contractor/sublineinfo!linkline.action" method="post">
				<input type="hidden" id="restype" name="restype" value="${restype}">
				<input type="hidden" id="resxtbh" name="resxtbh" value="${baseentity.xtbh}">
				<input type="hidden" id="projectx" name="projectx" value="${baseentity.projectx}">
				<input type="hidden" id="projecty" name="projecty" value="${baseentity.projecty}">
				<input type="hidden" id="sublineobjectid">
				<input type="hidden" id="sublineid">
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">线段名称：</span>
				    <select name="sublineid" class="required ui-form-input" style="180px;" onchange="getSubline2Points(this)">
				    	<option value="">请选择</option>
				    	<c:forEach items="${sublinelist}" var="item">
				    		<option value="${item.SUBLINEID}">${item.SUBLINENAME}</option>
				    	</c:forEach>
				    </select>
				 </div>			
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">线序：</span>
				    <input type="text" class="required ui-form-input" id="inumber" name="inumber" style="180px;">
				 </div>					
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">&nbsp;</span>
					<input type="button" value="预览" onclick="linkline(false)">
					<input type="submit" value="提交">				    
				 </div>
			</form>
		</div>
	</body>	
</html>