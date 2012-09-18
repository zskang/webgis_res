<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
In.add('wdatepickerjs',{path:'http://${config.webliburl}/cabletech/ui/wdatepicker/WdatePicker.js',type:'js',charset:'utf-8'});
In.add('paginagtionjs',{
						path : 'http://${config.webliburl}/cabletech/ui/jqpagination/jquery.pagination.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'paginagtioncss' ]
					});
In.add('paginagtioncss',{
						path : 'http://${config.webliburl}/cabletech/ui/jqpagination/pagination.css'
					});	
In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
In.add('layoutjs',{path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.ui.layout.js',type : 'js',charset : 'utf-8',rely : [ 'layoutcss' ]});
In.add('layoutcss',{path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
In.add('searchcontractorresource',{path : '${ctx}/js/contractor/searchcontractorresource.js',type : 'js',charset : 'utf-8'});
In.add('notycss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery.noty.css'});
In.add('mynotycss',{path:'http://${config.webliburl}/cabletech/ui/css/noty_theme_twitter.css'});
In.add('noty',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.noty.js',type:'js',charset:'utf-8',rely:['notycss','mynotycss']});
In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8',rely:['noty']});
In.add('contractorindexjs', {path : '${ctx}/js/contractor/contractorindex.js',type : 'js',charset : 'utf-8'});
In.ready('commonjs','ztreejs','layoutjs','searchcontractorresource','contractorindexjs','wdatepickerjs',function(){
		initOrgTree_01();
		//console.log($(".ui-form-search-container").css("height"));
		$("#searchresult").css("top",$(".ui-form-search-container").css("height"));
		$("#searchresult").css("width",$(".ui-form-search-container").css("width"));
		var h = $("body").height() - $(".ui-form-search-container").height()-23;
		$("#searchresult").height(h);
		$("#base_ui_single_tree_content_01").css({"z-index":"999"})
		//console.log();
		$(window).resize(function() {
		  	var h = $("body").height() - $(".ui-form-search-container").height()-23;
			$("#searchresult").height(h);
		});
	});
//-->
</script>
<div class="ui-form-search-container" id="searchcondition">
	<div class="ui-title-banner-bg">
    	<div class="ui-title-banner-text">代维车辆搜索</div>
	</div>
    <ul>
    	<li> 
    		<span class="ui-form-input-title"  style="width:60px">车牌号：</span> 
    		<input id="carno" name="mentor" class="ui-form-input" type="text" style="width:65px;">
    	</li>
    	<li> 
    		<span class="ui-form-input-title" style="width:40px">司机：</span> 
    		<input id="mentor" name="mentor" class="ui-form-input" type="text" style="width:85px;">
    	</li>
    </ul>
    <ul>
    	<li> 
    		<span class="ui-form-input-title" style="align:right;width:60px">时间从：</span> 
    		<input type="text" class="ui-form-input" name="stime" id="stime" style="width:210px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
    	</li>
    	<li> 
    		<span class="ui-form-input-title" style="align:right;width:60px">到：</span> 
    		<input type="text" class="ui-form-input" name="etime" id="etime" style="width:210px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
    	</li>
    </ul>
    <ul>
    	<li> 
    		<span class="ui-form-input-title" style="width:60px">组织机构：</span> 
    		<input type="hidden" id="orgid" name="orgid">
    		<baseinfo:orgtree widgetId="01" orgId="${orgId }"  regionId="${regionId }" width="200" height="300" cls="ui-form-input" callBackClean="searchonlinecallBackClean" callBackId="searchonlinemancallBack"></baseinfo:orgtree>
    	</li>
    </ul>
    <ul>
    	<li>
    		<span class="ui-form-input-title">&nbsp;</span> 
    		<input type="button" value="搜索" onclick="searchCarInfo()"/>
    	</li>
    </ul>
</div>
 <div id="searchresult" style="position:absolute;z-index:0">
		<div id="searchresultcontent" style="width:100%;height:100%;bottom:20px;overflow:auto"></div>
		<div id="searchjqpagination" style="bottom:0px;right:0px;" class="jqpagination"></div>
</div>
