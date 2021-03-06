<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>校园网查询</title>
	<script type="text/javascript">
			In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
			In.add('giscss',{path:'${ctx}/css/jquery.ct.ui.gis.layout.css'});
			In.add('dropdowncss',{path:'${ctx }/css/dropdown/dropdown.css',rely:['flickrcss']});
			In.add('flickrcss',{path:'${ctx }/css/dropdown/themes/flickr.com/default.css'});
			In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
			In.add('qtipjs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.qtip.min.js',type:'js',charset:'utf-8',rely:['qtipcss']})
			In.add('qtipcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery.qtip.min.css'});	
			In.ready('ctcss','giscss','dropdowncss','commonjs','qtipjs',function(){
				In.css('.ui-div-list li {width:160px}');
				$.fn.setCondition2ParentPage('${condition}');
				
				$('.ui-div-list span:first-child a').each(function(){
					var xtbh = $(this).prev('input:checkbox')[0].defaultValue;
					var url = contextPath+'/res/groupcustomsmgr/campus!view.action?tipview=1&xtbh='+xtbh;
					$(this).qtip({
						hide:'unfocus',
						content:{
							text : 'Loading...',
							title : {
								text : '校园网详细信息',
								button : true
							},
							ajax:{
								url : url,
								type : 'GET'
							}
						},position:{
							at : 'bottom left',
							my : 'top left'
						},show:{
							event: 'mouseenter',
							solo: true
						},style:{
							classes: 'ui-tooltip-shadow ui-tooltip-blue'
						}
					});
				});					
			});
		</script>	
	</head>
	<body>
	<div class="ui-form-container">
			<div style="height:26px">
				<div class="ui-gis-fonter-bg">
					<span style="float:left;padding-left:5px">
					 <ul class="dropdown dropdown-horizontal">
						<li>
						<span class="dir">
						    选择
						</span>
							<ul>
								<li><a href="javascript:void(0);" onclick="$.btnCheckAll({'flag':true})">全选</a></li>
								<li><a href="javascript:void(0);" onclick="$.btnCheckAll({'flag':false})">不选</a></li>
								<li><a href="javascript:void(0);" onclick="$('input[type=checkbox]').inverseAll()">反选</a></li>
							</ul>
						</li>
					</ul>
				 </span>
				 <span style="float:left;padding-left:5px">
					 <ul class="dropdown dropdown-horizontal">
						<li>
						<span class="dir">
						操作
						</span>
							<ul  style="width:60px">
								<!-- <li><a href="javascript:void(0);">批量编辑</a></li> -->
								<li><a href="javascript:void(0);" onclick="$.batchDelete('${ctx}/res/groupcustomsmgr/campus!batchDelete.action', 'A34')">批量删除</a></li>
							</ul>
						</li>
					</ul>
				 </span>
					<span style="float:right;margin-right:10px">
					<a href="${ctx}/res/groupcustomsmgr/campus!query.action?${condition}" class="ui-gis-link"><<查询<<</a>
					  <b>总记录数：</b><font color="red">${map['total']}</font></span>
				</div>
		    </div>
		  <div>
				<c:forEach items="${map['rows']}" var="item">
					<div class="ui-div-list" style="width: 100%;">
						 <span>
						 <input type="checkbox" value="${item.XTBH }">
						 	<a herf="javascript:void(0)" style="cursor:pointer" onclick="javascript:window.parent.openResourcetreediv('查看校园网','${ctx}/res/groupcustomsmgr/campus.action?xtbh=${item.XTBH}')">${item.ZYMC }</a>
						 	<button onclick="javascript:window.parent.locate('A34',${item.OBJECTID});">定位</button>
						 </span>
						 <span class="dir">
							<a herf="javascript:void(0)" style="cursor:pointer;color:blue;display:none;" onclick="javascript:window.location.href='${ctx}/res/groupcustomsmgr/campus!input.action?xtbh=${item.XTBH}'">编辑</a>
						 </span>
						<ul>
							<li>
								接入方式：<baseinfo:dic displayProperty="LABLE" codevalue="${item.JRFS }" columntype="JRFS"></baseinfo:dic></li>
				        	<li>校园地址：${item.CAMADDR}</li>
				        	<li>所属县区：<baseinfo:region displayProperty="regionname" id="${item.REGIONID }"></baseinfo:region></li>
				        </ul>
				        <ul>
				        	<li>经度：${item.LON}</li>
				        	<li>纬度：${item.LAT}</li>
				        </ul>				        
					</div>
				</c:forEach>
				
				<c:if test="${map['total'] > 0}">
					<div style="padding-top:20px"></div>
					<baseinfo:pagenation paginationCls="pagination_fixed" adjacents="1" records="${map['total']}" allowPageSelect="false"
						url="${ctx}/res/groupcustomsmgr/campus!list.action?${condition}"></baseinfo:pagenation>
				</c:if>
				<c:if test="${map['total'] <= 0}">
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>     
				       &nbsp;&nbsp;&nbsp;没有搜索到数据，请继续努力哦:)
				</c:if>
			</div>
		</div>
	</body>
</html>