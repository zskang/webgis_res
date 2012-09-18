/**
 * 显示今日在线统计结果列表
 * @param index 访问地址索引
 * @returns
 */
var showOnlineResult = function(index){
	var firsturls = [contextPath + '/contractor/onlinedata!todayonlinemanresult.action?R='+Math.random(),
	                 contextPath + '/contractor/onlinedata!todayonlinecarresult.action?R='+Math.random(),
	                 contextPath + '/contractor/onlinedata!undoalertresult.action?R='+Math.random()];
	var secondurls = [contextPath + '/contractor/onlinedata!todayrealonlinemandata.action?R='+Math.random(),
	                  contextPath + '/contractor/onlinedata!todayrealonlinecardata.action?R='+Math.random(),
	                  contextPath + '/contractor/onlinedata!undorealonlinealerdata.action?R='+Math.random()];
	$.ajax({
		url : firsturls[index],
		dataType:'html',
		beforeSend:function(){
			//增加第一次载入数据等待提示
			$('#loadtip').show();
		},
		success:function(html){
			mainlayout.open("east");
			$("#resultcontent").html(html);
			$(".jqpagination").html("");
			var regionids = [],orgids = [];
			jQuery.each($("#regions li").find("span"), function(key, value){
				regionids.push($(value).attr("id"));
			});
			jQuery.each($("#contractors li").find("span"), function(key, value){
				orgids.push($(value).attr("id"));
			});
			if(regionids.length==0 || orgids.length==0)return;
			//向服务器端回写请求真实在线数据
			$.ajax({
				url: secondurls[index]+"&regionids="+regionids.join(",")+"&orgids="+orgids.join(","),
				dataType:'json',
				beforeSend:function(){
					//第二次载入数据前隐藏第一次DOM结构
					$('#resultcontent').hide();
				},
				complete:function(){
					//第二次载入数据完毕后立即显示
					$('#loadtip').hide();
					$('#resultcontent').show();
				},				
				success:function(json){
					var regions = json['regionsonline'];
					var contractors = json['orgsonline'];
					jQuery.each(regions, function(key, value){
						if(value.cnt){
							$('#'+value.regionid).html(value.cnt);
							$('#'+value.regionid).parent().bind('click', function(){showOnlineByRegion(value.regionid, index);});
						}else{
							$('#'+value.regionid).parent().unbind('click').css({"text-decoration":"none"});
						}
					});
					jQuery.each(contractors, function(key, value){
						if(value.cnt){
							$('#'+value.orgid).html(value.cnt);
							$('#'+value.orgid).parent().bind('click', function(){showOnlineByOrg(value.orgid, index);});
						}else{
							$('#'+value.orgid).parent().unbind('click').css({"text-decoration":"none"});
						}
					});
					
					var onlinecount = json["onlinecount"];
					if(!onlinecount)return;//非人员、非车辆强制返回
					var timekey = [], timecnt = [];
					jQuery.each(onlinecount, function(key, value){
						timekey.push(value.timekey.substr(0,value.timekey.length-3));
						if(value.timecnt){
							timecnt.push(value.timecnt);
						}else{
							timecnt.push("");
						}
					});
					
					chart = new Highcharts.Chart({
						credits: {enabled: false},
						chart: {
							renderTo: 'container',
							defaultSeriesType: 'column'
						},
						title: {
							text: '整点分布图'
						},
						xAxis: {
							categories: timekey,
							labels: {rotation: -90,align: 'right',
								style: {
									font: 'normal 13px Verdana, sans-serif'
								}
							}							
						},
						yAxis: {
							min: 0,
							tickInterval: 100,
							title: {
								text: '数量'
							}
						},
						legend: {
							enabled: false
						},						
						tooltip: {
							formatter: function() {
								return this.y;
							}
						},
						labels: {
							items: [{
								style: {
									left: '0px',
									top: '0px',
									color: 'black'
								}
							}]
						},					
						series: [{
							data: timecnt,
							dataLabels: {
								enabled: true,
								align: 'right',								
								y: 1,
								formatter: function() {
									return this.y;
								},
								style: {
									font: 'normal 13px Verdana, sans-serif'
								}							
							}
						}]						
					});

				}
			});	
		
		}
	});
}

Date.prototype.dateDiff = function(objDate){
	return parseInt((this - objDate)/3600000);
}

/**
 * 轨迹数据
 * @param istoday 是否为当天时间段
 * @param index 访问地址索引
 * @param type 巡检专业类型
 * @returns
 */
function checkpath(istoday ,index, type){
	var str_begin = $('#div_txt_begin').val();
	var str_end = $('#div_txt_end').val();
	var paramid = $('#div_id').val();
	var paramtype = $('#div_type').val();
	if(istoday){//今天
		str_begin = $('#nowtime').val().substr(0, 11)+"00:00:00";
		str_end = $('#nowtime').val();
		paramtype = type;
	}
	if(str_begin && str_end){//时间不为空
		str_begin = str_begin.replace(/\-/g,"/");
		str_end = str_end.replace(/\-/g,"/");	
		var btime = new Date(str_begin);
		var etime = new Date(str_end);
		if(etime.dateDiff(btime)>24){
			$.fn.Alert('开始与结束时间段须在24小时内！',3);
		}else{
			var urls = [contextPath+'/contractor/onlinedata!getHistoryPositionsByPatrolmanid.action?patrolmanid='+paramid+'&begin='+str_begin+'&end='+str_end,
			contextPath+'/contractor/onlinedata!getHistoryPositionsBySimid.action?simid='+paramid+'&begin='+str_begin+'&end='+str_end];
			$.ajax({
				url: urls[index]+"&R="+Math.random(),
				dataType:'json',
				success:function(json){
					if(json!=null && json.length>0){
						var hp = cmap.historyposition;
						hp.drawPath(json, paramtype);
					}else{
						$.fn.Alert("没有查询到轨迹数据！",1);
					}
					
				}
			});	
		}
	}else{
		$.fn.Alert('请选择开始和结束时间！',3);
	}
}

/**
 * 打开时间段选择框
 * @param event 事件对象
 * @param id 编号
 * @param type 巡检专业类型
 * @returns
 */
function show_datetime_div(event, id, type){
	$('#div_txt_begin').val('');
	$('#div_txt_end').val('');
	$('#div_id').val('');
	var h = $("#searchcondition").height();
	var y = event.clientY - 30;
	var b = $("body").height();
	if(h){
		y = y - h + 30;
	}
	if(b-y < 220){y = y - h + 20;}
	$('#datepop').css({right: 20, top: y});
	$('#datepop').show("fast");
	$('#div_id').val(id);
	$('#div_type').val(type);
}
