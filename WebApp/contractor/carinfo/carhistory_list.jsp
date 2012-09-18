<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>车辆历史任务</title>
		<script>
			In.add('layout',{path:'${ctx}/css/jquery.ct.ui.gis.layout.css'});
			In.add('jqgridcss',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/css/ui.jqgrid.css'});
			In.add('uicss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css'});			
			In.add('jggridjs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/jquery.jqGrid.min.js',type:'js',charset:'utf-8',rely:['jqgridcss','uicss']});
			In.add('jggridlocalejs',{path:'http://${config.webliburl}/cabletech/ui/jqgrid/js/grid.locale-cn.js',type:'js',charset:'utf-8'});
			In.add('carhistorylistjs',{path:'${ctx }/js/contractor/carhistory_list.js',type:'js',charset:'utf-8'});
			In.ready('layout','jggridjs','jggridlocalejs','carhistorylistjs',function(){
				$('.section>DIV').css("height","220");//设置tab页高度
	    		init_p2p_grid(); //初始化跳纤grid
			});
		</script>
	</head>
	<body>
		<div class="section">
						<div class="box visible" style="padding:0px;">
							<table id="grid_p2p"></table>
							<div id="grid_p2p_pager"></div>
						</div>
						<input id="id" type="hidden"  value="<%=request.getParameter("id")%>"/>
	    </div>
	</body>
</html>