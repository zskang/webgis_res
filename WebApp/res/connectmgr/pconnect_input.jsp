<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>批量连接管理</title>
		<script type="text/javascript">
			In.add('topocss',{path:'${ctx }/css/topo.css'});
			In.add('layout',{path:'${ctx}/css/jquery.ct.ui.gis.layout.css'});	  
	        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8',rely:['topocss','layout']});
			//Ready
			In.ready('commonjs',function(){});
			//提交
			function dosubmit(){
				var left_start = $('#sel_left_start').get(0).selectedIndex;
				var left_end = $('#sel_left_end').get(0).selectedIndex;
				var right_start = $('#sel_right_start').get(0).selectedIndex;
				var right_end = $('#sel_right_end').get(0).selectedIndex;
				if((left_end - left_start) == (right_end - right_start)){
					if((left_end - left_start) >0){
						var ifHasUsed = true;
						for(var i = left_start;i<=left_end;i++){
							var mc = $('#sel_left_start').get(0).options[i].text.split('(')[1];
							if(mc == "占用)"){
								ifHasUsed = false;
							}
						}
						for(var i = right_start;i<=right_end;i++){
							var mc = $('#sel_right_start').get(0).options[i].text.split('(')[1];
							if(mc == "占用)"){
								ifHasUsed = false;
							}
						}
						if(ifHasUsed){
							$.ajax({
								url: contextPath+'/res/connectmgr/pconnect!save.action?lid='+$('#lid').val()+'&ltype='+$('#ltype').val()+'&rid='+$('#rid').val()+'&rtype='+$('#rtype').val()+'&tid='+$('#tid').val()+'&ttype='+$('#ttype').val()+'&l_s='+$('#sel_left_start').val()+'&l_e='+$('#sel_left_end').val()+'&r_s='+$('#sel_right_start').val()+'&r_e='+$('#sel_right_end').val(),
								dataType: "json",
								type:'GET',
								success : function(result) {
									$.fn.Alert("批量新建成功!",2);
									frameElement.api.close();
								},
								error : function() {
									alert("");
								}
							});		
						}else{
							$.fn.Alert("选择的端子或线芯中存在被占用!",3);
						}
					}
					else{
						$.fn.Alert("请选择终止编号!");
					}
				}
				else{
					$.fn.Alert("左右两边设备端子或线芯数必须相等");
				}
			}
		</script>
	</head>
	<body>
		<div class="TLEFT" style="width:50%">
			<div class="TLTOP" style="height:100%">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">${left_zymc }</span>
	   		    </div>
	   		    <div style="width:100%;height:30px;margin-top:30px;">
	   		    	<span style="margin-left:20px;">起始编号:</span>
	   		    	<select style="width:150px;" id="sel_left_start" name="sel_left_start">
	   		    		<c:forEach items="${left_bh}" var="item">
	   		    			<option value="${item.ID}">${item.ID} (${item.STATE})</option>
	   		    		</c:forEach>
	   		    	</select>
	   		    </div>
	   		    <div style="width:100%;height:30px;margin-top:30px;">
	   		    	<span style="margin-left:20px;">终止编号:</span>
	   		    	<select style="width:150px;" id="sel_left_end" name="sel_left_end">
	   		    		<c:forEach items="${left_bh}" var="item">
	   		    			<option value="${item.ID}">${item.ID} (${item.STATE})</option>
	   		    		</c:forEach>
	   		    	</select>
	   		    </div>
			</div>
		</div>
		<div class="TRIGHT" style="width:50%">
			<div class="TLTOP" style="height:100%">
				<div class="ui-gis-right-title-bg">
					<span style="display:block;float:left;margin-top:9px;margin-left:10px;">${right_zymc }</span>
	   		    </div>
	   		    <div style="width:100%;height:30px;margin-top:30px;">
	   		    	<span style="margin-left:20px;">起始编号:</span>
	   		    	<select style="width:150px;" id="sel_right_start" name="sel_right_start">
	   		    		<c:forEach items="${right_bh}" var="item">
	   		    			<option value="${item.ID}">${item.ID} (${item.STATE})</option>
	   		    		</c:forEach>
	   		    	</select>
	   		    </div>
	   		    <div style="width:100%;height:30px;margin-top:30px;">
	   		    	<span style="margin-left:20px;">终止编号:</span>
	   		    	<select style="width:150px;" id="sel_right_end" name="sel_right_end">
	   		    		<c:forEach items="${right_bh}" var="item">
	   		    			<option value="${item.ID}">${item.ID} (${item.STATE})</option>
	   		    		</c:forEach>
	   		    	</select>
	   		    </div>
	   		    <div style="width:100%;height:30px;margin-top:30px;">
	   		    	<input type="button" value="保存" style="width:100px;height:26px;margin-left:20px" onclick="dosubmit()"/>
	   		    </div>
			</div>
		</div>
		<input type="hidden" id="lid" name="lid" value="${lid}" />
		<input type="hidden" id="ltype" name="ltype" value="${ltype}" />
		<input type="hidden" id="rid" name="rid" value="${rid}" />
		<input type="hidden" id="rtype" name="rtype" value="${rtype}" />
		<input type="hidden" id="tid" name="tid" value="${tid}" />
		<input type="hidden" id="ttype" name="ttype" value="${ttype}" />
	</body>
</html>