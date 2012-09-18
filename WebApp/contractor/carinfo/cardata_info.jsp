<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息</title>
    <style type="text/css">
	#container { width: 490px; height:400px; padding: 0; margin: 0; background: #fff; }
	#navpoint { margin: 0; padding: 0 0 20px 0; border-bottom: 1px solid blue;}
	#navpoint li { margin: 0; padding: 0; display: inline; list-style-type: none; }
	#navpoint a:link, #navpoint a:visited { 
		float: left; font-size: 10px; line-height: 14px; 
		font-weight: bold; padding: 0 12px 6px 12px; 
		text-decoration: none; color: #ccc;
	}
	#navpoint a:link.active, #navpoint a:visited.active, #navpoint a:hover {
   		padding-bottom: 6px; color: blue;
   		background: url('${ctx}/css/images/guidetriangle.png') no-repeat bottom center;
	}
	.baseinfocss{
		background:url('${ctx}/css/images/gis_icon.png') no-repeat -212px -28px; width:15px; height:14px; float:left;
	}
	.nowtaskcss{
		background:url('${ctx}/css/images/gis_icon.png') no-repeat -232px -28px; width:15px; height:14px; float:left;
	}
	.nowtaskdetailcss{
		background:url('${ctx}/css/images/gis_icon.png') no-repeat -252px -28px; width:15px; height:14px; float:left;
	}
    </style>
    <script type="text/javascript">
    var url = ["${ctx}/contractor/carinfo!view.action?id=${id}","${ctx}/contractor/carapplydispatch!view.action?id=${id}","${ctx}/contractor/carinfo/carhistory_list.jsp?id=${id}"];
	In.ready(function() {
        $("#container li").click(function(){
            $(this).children().addClass("active").parent().siblings("li").children().removeClass();
            $("#container div:eq("+$(this).index()+")").html("<iframe frameborder='0' scrolling='no' style='width:100%;height:300px;' src='"+url[$(this).index()]+"'></iframe>").show().siblings("div").hide();
        });
        $("#container li:first").children().addClass("active");
        $("#container div:eq(0)").html("<iframe frameborder='0' scrolling='no' style='width:100%;height:300px;' src='"+url[0]+"'></iframe>");
        $("#container div:gt(0)").hide(); 
	});
    </script>
</head>

<body>
   <div id="container">
        <ul id="navpoint">
			<li><a href="#"><span class="baseinfocss"></span>基本信息</a></li>
			<li><a href="#"><span class="nowtaskcss"></span>当前任务</a></li>
			<li><a href="#"><span class="nowtaskdetailcss"></span>今日历史任务</a></li>
        </ul>
        <div></div>
        <div></div>
        <div></div>        
   </div>
</body>
</html>