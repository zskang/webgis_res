<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>今日巡检明细</title>
		<script>
			In.add('layout',{path:'${ctx}/css/jquery.ct.ui.gis.layout.css'});
			In.add('jqgridcss',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/css/ui.jqgrid.css'});
			In.add('uicss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css'});			
			In.add('jggridjs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/jquery.jqGrid.min.js',type:'js',charset:'utf-8',rely:['jqgridcss','uicss']});
			In.add('jggridlocalejs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/grid.locale-cn.js',type:'js',charset:'utf-8'});
			In.add('patrolmanjs',{path:'${ctx }/js/contractor/patrolmancurrenttask.js',type:'js',charset:'utf-8'});
			In.ready('layout','jggridjs','jggridlocalejs','patrolmanjs',function(){
				$('.section>DIV').css("height","220");//设置tab页高度
	    		initgrid(1); //载入数据
			});
		</script>
	</head>
	<body>
		<div class="section">
			<div class="box visible" style="padding:0px;border:0px;">
				<table id="grid"></table>
				<div id="grid_pager"></div>
			</div>
			<input id="id" type="hidden" value="<%=request.getParameter("id")%>"/>
	    </div>
	</body>
</html>