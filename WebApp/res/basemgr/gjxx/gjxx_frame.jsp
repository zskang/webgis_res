<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
<!--
    In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
    In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
    In.add('commonjs', {path:'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
    In.add('resztree',{path:'${ctx}/js/resztree.js',type:'js',charset:'utf-8',rely:['commonjs']});
	In.ready('ztreejs','commonjs','resztree',function(){
		In.css('*{border:0;padding:0;margin:0} html,body{height:100%}');
		loadTree('tree','${ctx}/res/basemgr/gjxx!getTreeNodes.action?xtbh='+$("#xtbh").val());
		$('#rooturl').val('${ctx}/res/basemgr/gjxx!getTreeNodes.action?xtbh='+$("#xtbh").val());//设置资源树根链接地址
		$('#contentFrame').get(0).src = "${ctx}/res/basemgr/gjxx!view.action?xtbh="+$("#xtbh").val();
	});
//-->
</script>
	<body>
		<input type="hidden" value="${xtbh}" id="xtbh" name="xtbh"/>
		<input type="hidden" id="rooturl"/>
		<div style="float:left;width:30%;height:100%">
			<ul id="tree" class="ztree" style="width:220px;height:100%;border:0;margin:0;padding:0"></ul>
		</div>
		<div style="float:right;width:69%;height:100%;overflow:hidden">
			<iframe id="contentFrame" name="contentFrame" frameborder="0" width="100%" height="100%" src=""/>	 
		</div>
	</body>
</html>