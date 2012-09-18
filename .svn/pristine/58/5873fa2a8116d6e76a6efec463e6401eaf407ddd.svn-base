dojo.require("esri.map");
dojo.require("esri.utils");
dojo.require("com.cabletech.map.CMap");
dojo.require("dijit.layout.ContentPane");
dojo.require("com.cabletech.toolbar.ToolBar");
console.log('开始执行地图装载！');
var wgt,tb,cmap;
var identifyTask,identifyParams,featureSet;
dojo.ready(function() {
	var json = {};
	esri.request({
	    url:contextPath+"/res/index!getGisConfig.action",
	    handleAs: "json",
	    load: function(response, ioArgs){
			json = response;
			json.proxyurl = contextPath+"/proxy.jsp";
			json.property = contextPath+"/res/popup.action";
			json.legendconfig = contextPath+"/legend.json";
			json.printurl = contextPath+"/res/index!export.action";
			cmap = new com.cabletech.map.CMap("map", json);
			dojo.connect(cmap.map, "onMouseUp", dojo.hitch(this,function(evt){
		        var outSR = new esri.SpatialReference({ wkid: 4326});
				cmap.geometryService.project([evt.mapPoint], outSR, function(projectedPoints) {
					var mp = projectedPoints[0];
					dojo.byId("info").innerHTML = "<span style='display:block;float:left;margin-top:6px;margin-left:10px;'>经度：<span style='color:#7f001e;'>"+mp.x+"</span>&nbsp;&nbsp;&nbsp;&nbsp;纬度：<span style='color:#7f001e;'>"+mp.y+"</span></span>";	
				});
			}));
			tb = new com.cabletech.toolbar.ToolBar(cmap);
			dojo.publish("INIT_BUSINESS_LAYER");
			console.log('资源加载完毕了！');
		},
	    error: function(response, ioArgs){
	    	alert("地图配置加载失败!");
	    }
	});
});

//检查参数 规定：登录用户 loginUserId 请求类型 reqType 具体传入业务参数是否正确 isNotNullParams ©2012 CableTech
/**
请求类型说明:
drawreturn: 绘制图元并返回串值  {绘制类型【1、2、3】 graphictype， 接受文本域编号 eid（div）}
根据具体业务类型绘制图元，无返回串值： 
  drawtype001: （轨迹播放）{请求类型【001】 actiontype，SIM卡号 simid，巡检人编号 patrolid，巡检类型 businesstype，开始时间starttime，结束时间endtime}
  drawtype002: （计划路由呈现）{请求类型【001】 actiontype，计划编号 planid，任务编号 taskid，计划类型 plantype}
draw: 根据资源类型和资源编号绘制图元并无返回串值{资源类型 resourcetype，字段名称keycolumn，资源编号 rid，区域编号 regionid}
drawxy: 根据 x y 绘制{坐标串 xy，绘制类型 graphictype}
drawtable: 根据表名 关键字 绘制{业务表名 tablename， 主键名 keycolumn， 主键值 rid}
edittable: 向具体的业务表写入备注信息和空间信息 shape{业务表名 tablename，主键名 keycolumn，标题字段名 titlecolumn，备注字段名 remarkcolumn， 图元类型 graphictype}
drawpoints: 计划漏检点{计划业务表名【巡检表或者漏检表】 tablename，主键值 pid}
drawonlinemen: 绘制在线巡检人{主键值 id，请求类型【regionid、orgid、groupid】 type }
loadAllOeoilengines：默认显示所有的该用户所属组织机构的油机{站点编号 id,站点类型 type}
selectoeoilengines：油机选择{站点编号 id,站点类型 type}
universalProcessLocus：通用处理过程（轨迹）{單号 id,流程类型（表名） type}
oilenginePosition：油机发电记录轨迹（轨迹）{任务编号 id}
**/
String.prototype.trim = function(){return this.replace(/^\s+|\s+$/g,'');}
var detectWeb2GisRequest = {
	loginUserId: '',
	reqType: '',
	isNotNullParams: '',
	reqTypes: ['drawreturn','drawtype001','drawtype002','draw','drawxy','drawtable','edittable','drawpoints','drawonlinemen','loadAllOeoilengines','selectOeoilengines','universalProcessLocus','oilenginePosition'],
	//检查请求类型
	isExistReqType:function(){
		var flag = '0';
		for(var i=0; i<this.reqTypes.length; i++){
			if(this.reqType.trim() == this.reqTypes[i]){
				flag = '1';break;
			}
		}
		return flag=='0'?false:true;
	},
	//显示具体操作按钮
	showBtn:function(){
		$("#"+this.reqType+"Btn").css("display","inline");
	},
	//检测
	detectRq:function(){
		if(this.loginUserId.trim() == ''){
			alert('请先登录！');
			return false;
		}else if(this.reqType.trim() == ''){
			alert('请求非法！请检查！');
			return false;
		}else{
			if(!this.isExistReqType()){
				alert('传入请求类型不正确，请检查！');
				return false;
			}else if(this.isNotNullParams.trim() != ''){
				alert('传入参数无效！请检查！'+this.isNotNullParams);
				return false;
			}
			this.showBtn();
			return true;
		}
	},
	//检查
	checkRq:function(){
		if(this.loginUserId.trim() == ''){
			return false;
		}else if(this.reqType.trim() == ''){
			return false;
		}else{
			if(!this.isExistReqType()){
				return false;
			}else if(this.isNotNullParams.trim() != ''){
				return false;
			}
			return true;
		}
	},
	detect:function(loginUserId, reqType, isNotNullParams){
		detectWeb2GisRequest.loginUserId = loginUserId;
		detectWeb2GisRequest.reqType = reqType;
		detectWeb2GisRequest.isNotNullParams = isNotNullParams;
		return detectWeb2GisRequest.detectRq();
	},
	check:function(loginUserId, reqType, isNotNullParams){
		detectWeb2GisRequest.loginUserId = loginUserId;
		detectWeb2GisRequest.reqType = reqType;
		detectWeb2GisRequest.isNotNullParams = isNotNullParams;
		return detectWeb2GisRequest.checkRq();
	},
	//调用Gis
	draw:function(layerurl, queryWhere){
		
	}		
}