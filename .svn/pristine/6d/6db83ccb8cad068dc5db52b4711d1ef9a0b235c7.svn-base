<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>批量添加</title>
		<script type="text/javascript">
			In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
			In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
			In.add('giscss',{path:'${ctx}/css/jquery.ct.ui.gis.layout.css'});
			In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
			In.ready('validatejs','ctcss','giscss','commonjs',function(){
	         	jQuery("#formname").validate({
	         		focusInvalid : false,
					submitHandler : function(form) {
						$('#serializeQueryCondition').val('');
						$('#serializeQueryCondition').val($(form).serialize());
						$.ajax({
							url:'${ctx}/res/boardfibermgr/jxgxll!batchAdd.action',
							dataType:'html',
							data: $('#serializeQueryCondition').val(),
							success:function(text){
								if(text == '新增成功！'){
									$.fn.Alert(text,2);
									window.parent.refeshTopWindow();
									frameElement.api.close();
								}else{
									$.fn.Alert(text,3);
								}
							}
						});
					}	         		
	         	});
			});
			
			var refreshdz = function(sel){
			  if(!sel.value){
			  	$('#qssbdz').get(0).options.length = 0;
			  	$('#qssbdz').append("<option value=''>请选择</option>");
			  	return;
			  }
			  var url = "${ctx}/res/boardfibermgr/jxgxll!getdzlist.action?odmid="+sel.value+"&llzid=${llzentity.id}&R="+Math.random();
			  $.ajax({
					url: encodeURI(url),
					dataType: "html",
					type:'GET',
					cache:true,
					async:true,
					success : function(result){
						var d = eval(result);
						$('#qssbdz').get(0).options.length = 0;
						$('#qssbdz').append("<option value=''>请选择</option>");
						for(var i=0; i<d.length; i++){
							$('#qssbdz').append("<option value='"+d[i].ID+"'>"+d[i].NAME+"</option>");
						}
					},
					error : function() {
						$.fn.Alert("无法获取端子！",4);
					}
				});
			}
		</script>
	</head>
	<body style="overflow:hidden;">
	<form id="formname" name="formname" method="post" action="${ctx}/res/boardfibermgr/jxgxll!batchAdd.action">
		<div style="margin-top:5%;margin-left:20%;">
			<input type="hidden" name="serializeQueryCondition" id='serializeQueryCondition'>
			<input type="hidden" name="ssllz" value="${llzentity.id}">
			<input type="hidden" name="qssbid" value="${llzentity.qssbid}">
			<input type="hidden" name="qssblx" value="${llzentity.qssblx}">		
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">链路组名称：</span>
				${llzentity.llzmc}
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">起始设备名称：</span>
				<resinfo:resCommon keyValue="${llzentity.qssbid}" resType="${llzentity.qssblx}"/>
			</div>			
			<c:if test="${!empty showodm}">
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM：</span>
					<baseinfo:customselector name="qssbodm" style="width:150px;" cssClass="required ui-form-input" data="${odmdatamap}" keyValue="" isReversal="true" id="qssbodm" isQuery="select" onChange="refreshdz(this)"></baseinfo:customselector>
					<span class="ui-form-symbol-color">*</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">端子：</span>
					<select class="required ui-form-input" style="width:150px;" name="qssbdz" id="qssbdz">
						<option value="">请选择</option>
					</select>
					<span class="ui-form-symbol-color">*</span>
				</div>
			</c:if>
			<c:if test="${!empty showdz}">
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">端子：</span>
					<baseinfo:customselector name="qssbdz" style="width:150px;" cssClass="required ui-form-input" data="${dzdatamap}" keyValue="" isReversal="true" id="qssbdz" isQuery="select"></baseinfo:customselector>
					<span class="ui-form-symbol-color">*</span>
				</div>
			</c:if>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">端子数量：</span>
				<input id="lang" name="lang" style="width:150px;" class="number required ui-form-input">
				<span class="ui-form-symbol-color">*</span>
			</div>
			<div class="ui-form-input-box">
				<span class="ui-form-input-title">&nbsp;</span>
				<input type="submit" value="添加">
			</div>			
		</div>
	</form>		
	</body>
</html>