/**
 *在线巡检员搜索 
 *@author chenqp
 *@date 2012-8-1
 */

/**
 * 搜索在线巡检人员信息
 * 
 */
var searchOnlineManInfo = function(){
	var stime = $("#stime").val();
	var etime = $("#etime").val();
	if(stime!="" && etime==""){
		alert("请输入结束时间！");
		return false;
	}else if(stime=="" && etime!=""){
		alert("请输入开始时间！");
		return false;
	}
	var param = "parolname="+$("#patrolname").val() 
			  + "&stime="+$("#stime").val() 
			  +"&etime="+$("#etime").val() 
			  +"&orgid="+$("#orgid").val();
	var url = contextPath + "/contractor/search!searchPatrolman.action?"+param;
	commonPagination(url);
}
/**
 * 搜索车辆信息
 * 
 * @returns
 */
var searchCarInfo = function(){
	var stime = $("#stime").val();
	var etime = $("#etime").val();
	if(stime!="" && etime==""){
		alert("请输入结束时间！");
		return false;
	}else if(stime=="" && etime!=""){
		alert("请输入开始时间！");
		return false;
	}
	var param = "carno="+$("#carno").val()
				+"&mentor="+$("#mentor").val()
				+"&stime="+$("#stime").val()
				+"&etime="+$("#etime").val()
				+"&orgid="+$("#orgid").val();
	var url = contextPath + "/contractor/search!searchCar.action?"+param;
	commonPagination(url);
}

/**
 * 搜索通用查询分页
 * 
 * @param url
 * @returns
 */
var commonPagination = function(url){
	$("#searchresultcontent").html("");
	$("#searchjqpagination").html("");
	In.ready('paginagtionjs',function(){
		//设置选项
		var optInit = {num_display_entries:4,num_edge_entries:1,items_per_page:5,callback:function(pagenum){
			var urls = "";
			urls = url + '&page='+(pagenum+1)+'&rows='+optInit.items_per_page;
			//异步载入内容
			$.ajax({
				url: urls,
				success:function(data){
					$("#searchresultcontent").html(data);
					if($("#total").val() != null && $("#total").val() > 0){
						$("#searchjqpagination").draw($("#total").val());
					}
				}
			});
		}};
		$("#searchjqpagination").pagination(optInit);
	});
}




/**
 * 回调函数 
 * @param id 编号
 * @returns
 */
var searchonlinemancallBack = function(id){
	$("#orgid").val(id);
}
/**
 * 清空隐藏域
 * @returns
 */
var searchonlinecallBackClean = function(){
	$("#orgid").val("");	
	//console.log("----------------");
}