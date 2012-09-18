<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<%@ include file="/common/header.jsp"%>
	<script type="text/javascript">
	     In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	     In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	     In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	     In.ready('validatejs','ctcss','commonjs',function(){
	     	$("#formname").validate({
         		focusInvalid : false,
				submitHandler : function(form) {
					$('#serializeQueryCondition').val('');
					$('#serializeQueryCondition').val($(form).serialize());
					$.ajax({
						url:'${ctx}/gisextend!exeedittable.action?R='+Math.random(),
						dataType:'html',
						data: $('#serializeQueryCondition').val(),
						success:function(text){
							if(text == '编辑成功！'){
								$.fn.Alert(text,2);
								window.parent.close();
							}else{
								$.fn.Alert(text,3);
							}
						}
					});
				}	     	
	     	});
	     	
	     });
	</script>
	</head>
	<body style="overflow: hidden">
		<div class="ui-form-container">
			<form id="formname" action="" method="post">
				    <input type="hidden" id="geo" name="geo" value="${points}">
				    <input type="hidden" id="graphictype" name="graphictype" value="${graphictype}">
				    <input type="hidden" id="tablename" name="tablename" value="${tablename}">
				    <input type="hidden" id="keycolumn" name="keycolumn" value="${keycolumn}">
				    <input type="hidden" id="titlecolumn" name="titlecolumn" value="${titlecolumn}">
				    <input type="hidden" id="remarkcolumn" name="remarkcolumn" value="${remarkcolumn}">
				    <input type="hidden" id="userid" name="userid" value="${userid}">
				    <input type="hidden" id="serializeQueryCondition" name="serializeQueryCondition">				
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">标题：</span>
				    <input type="text" id="titlecolumnvalue" name="titlecolumnvalue" class="required ui-form-input">
				    <span class="ui-form-symbol-color">*</span>
				 </div>					 	
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">备注：</span>
				    <textarea rows="5" cols="19" id="remarkcolumnvalue" name="remarkcolumnvalue" class="required ui-form-input"></textarea>
				    <span class="ui-form-symbol-color">*</span>
				 </div>					
				 <div class="ui-form-input-box">
				    <span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="提交">				    
				 </div>
			</form>
		</div>
	</body>	
</html>