<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>地图</title>
    <style type="text/css">
    	button{width:50px;}
    </style>
	<script language="JavaScript" type="text/javascript" charset="utf-8">
		function loadUrl(url){
			window.showModalDialog(url, window, 'status:no;center:yes;dialogWidth:800px;dialogHeight:600px;');
		}
		function showSimpleMap(){
			var rid="0000003197";//资源编号
			var regionid = "340000";//区域编号
			var keycolumn = "xtbh";//sublineid 
			var url = "${ctx}/gisextend!draw.action?resourcetype=A30&keycolumn="+keycolumn+"&userid=zyhefei&rid="+rid+"&regionid="+regionid;
			loadUrl(url);
		}
		//传绘制图元类型 接受坐标串值文本域编号 当前用户编号
		function showSimpleMap1(){
			var url = "${ctx}/gisextend!drawReturn.action?graphictype="+$('#gtype').val()+"&eid=geoid&userid=zyhefei";
			loadUrl(url);
		}
		//传坐标串值 图元类型  当前用户编号
		function showSimpleMap4(){
			var url = "${ctx}/gisextend!drawXY.action?xy=519942.5236164787 3539530.4821588183,519942.5236164787 3539398.190227568,519942.5236164787 3539398.190227568,541770.6922728161 3526565.8728962666,517296.68499146815 3510955.425008704,519942.5236164787 3539530.4821588183&graphictype=3&marked=你吗&userid=zyhefei";
			loadUrl(url);
		}
		//传业务表名 主键名 主键值  当前用户编号
		function showSimpleMap5(){
			var url = "${ctx}/gisextend!drawTable.action?rid=0000095353&tablename=res_dgxx&keycolumn=xtbh&userid=zyhefei&marked=里三";
			loadUrl(url);
		}
		
		//计划漏检点 
		function showSimpleMap7(){
			var url = "${ctx}/gisextend!drawPoints.action?tablename=plan_statleakdad&pid=000000000053&userid=zyhefei";
			loadUrl(url);
		}
		
		//传业务类别 001 sim卡号 巡检人编号 业务类型 开始时间 结束时间 当前用户编号
		function showSimpleMap2(){
			var url = "${ctx}/gisextend!drawType.action?actiontype=001&simid=000001patrolid=000000&businesstype=C35&starttime=&endtime&userid=zyhefei";
			loadUrl(url);
		}
		
		//传业务类别 002 计划编号 任务编号 计划类型  当前用户编号
		function showSimpleMap3(){
			var url = "${ctx}/gisextend!drawType.action?actiontype=002&planid=000001&taskid=000000&plantype=C30&userid=zyhefei";
			loadUrl(url);
		}
		
		
		//油机搜索
		function showSimpleMap9(){
			var url = "${ctx}/gisextend!selectOeoilengines.action?id=000000035863&type=A24&eid=oilengine_id&userid=zyhefei";
			loadUrl(url);
		}	
		
		//油机发电记录轨迹
		function showSimpleMap11(){
			var url = "${ctx}/gisextend!oilenginePosition.action?id=000001000294&userid=zyhefei";
			loadUrl(url);
		}
		
		//现场处理呈现
		function showSimpleMap10(){
			var url = "${ctx}/gisextend!universalProcessLocus.action?id=000001000059&type=WTROUBLE_SENDTASK&userid=zyhefei";
			loadUrl(url);
		}
		
		//在线巡检人
		function showSimpleMap8(){
			var type = "";//regionid orgid groupid
			var url = "${ctx}/gisextend!drawOnlineMen.action?id=000000&type=regionisd&userid=zyhefei";
			loadUrl(url);
		}
		
		//传业务表名 主键名 标题字段名 备注字段名 图元类型  当前用户编号
		function showSimpleMap6(){
			var url = "${ctx}/gisextend!editTable.action?tablename=LP_WATCH_POLYGON&keycolumn=POLYGONID&titlecolumn=POLYGONNAME&remarkcolumn=REMARK&graphictype=3&userid=zyhefei";
			loadUrl(url);
		}					
											
	</script>
  </head>
  
  <body>
    <button onclick="showSimpleMap()">定位</button>
    <button onclick="showSimpleMap1()">绘制</button>
    <select id="gtype">
    	<option value="1">点</option>
    	<option value="2">线</option>
    	<option value="3">面</option>
    </select>
    <button onclick="showSimpleMap2()">轨迹播放</button>
    <button onclick="showSimpleMap3()">计划路由呈现</button>
    <button onclick="showSimpleMap4()">绘制点传xy</button>
    <button onclick="showSimpleMap5()">表、关键字绘制</button>
    <button onclick="showSimpleMap6()">表、关键字绘制并存储信息</button>
    <button onclick="showSimpleMap7()">计划漏检点 </button>
    <button onclick="showSimpleMap8()">在线巡检人 </button>
    <button onclick="showSimpleMap9()">油机搜索</button>
    <button onclick="showSimpleMap10()">处理过程 </button>
    <button onclick="showSimpleMap11()">油机发电记录轨迹 </button><br/>
    坐标：<input id="geoid" style="width:100%;border-color:blue;"/>
    油机编号：<input id="oilengine_id" style="width:100%;border-color:blue;"/>
  </body>
</html>
