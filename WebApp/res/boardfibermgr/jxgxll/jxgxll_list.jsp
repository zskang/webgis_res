<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>链路组查询</title>
		<script type="text/javascript">
			In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
			In.add('giscss',{path:'${ctx}/css/jquery.ct.ui.gis.layout.css'});
			In.add('dropdowncss',{path:'${ctx }/css/dropdown/dropdown.css',rely:['flickrcss']});
			In.add('flickrcss',{path:'${ctx }/css/dropdown/themes/flickr.com/default.css'});
			In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
			In.add('rightmenujs',{path:'${ctx}/js/rightmenu.js',type : 'js',charset : 'utf-8'});
			In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
			In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
			In.add('resztree',{path:'${ctx}/js/resztree.js',type:'js',charset:'utf-8'});
			
			In.css(".ztree li span.button.dz_icon_ico_docu{margin-right:2px; background: url('http://${config.webliburl}/cabletech/ui/css/img/diy/10.png') no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}");
			In.css('html,body{height:100%}');
			In.css('.ui-form-input {width:200px}');
			In.css('#datatable {width:100%; padding: 0;margin: 0;border-left:1px solid #C1DAD7}');
			In.css('#datatable th {font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;color: #4f6b72;border-right: 1px solid #C1DAD7;border-bottom: 1px solid #C1DAD7;border-top: 1px solid #C1DAD7;letter-spacing: 2px;text-transform: uppercase;text-align: left;padding: 6px 6px 6px 12px;background: #CAE8EA  no-repeat;}');
			In.css('#datatable td {border-right: 1px solid #C1DAD7;border-bottom: 1px solid #C1DAD7;background: #fff;font-size:11px;padding: 6px 6px 6px 12px;color: #4f6b72;}');
			
			In.css('#context-menu {font:400 12px/1.5 Arial;color:#333;display:none;position:absolute;padding:0 4px;width:120px;border:1px solid #B8CBCB;box-shadow:2px 2px 5px #666;background:#FFF;z-index:9;overflow:hidden;}');
			In.css('#context-menu li {float:left;margin-top:-1px;padding:4px 0;width:120px;height:25px;line-height:25px;border-top:1px solid #B8CBCB;list-style:none;}');
			In.css('#context-menu a, #context-menu a:visited {display:block;text-indent:10px;color:#333;text-decoration:none;}');
			In.css('#context-menu a:hover {color:#FFF;background-color:#348CCC;text-decoration:none;}');
			
			
			In.ready('ctcss','giscss','dropdowncss','commonjs','rightmenujs','ztreejs','resztree',function(){
				$.fn.setCondition2ParentPage('${condition}');
				//new rightMenu({obj:"#datatable tbody", menu:"#context-menu", offX:10, offY:5});
				//loadDzTree('tree','${jxgxllz.qssblx}','${ctx}/res/boardfibermgr/jxgxll!getTreeNodes.action?llzid=${jxgxllz.id}');
         		$(function(){
         			$('<div id="addjx-tool-tips" style="border:1px solid red;background-color:#eee;position:absolute;visibility:hidden;z-index:30001;"><div id="addjx-tool-text" style="font-size:13px;font-weight:bold;margin:0;text-align:center;padding:6px 6px 4px;"></div>').appendTo('body');
         			$('#addbtn').mouseover(function(){
						$(this).css({"cursor":"help"});
						$('#addjx-tool-tips').css('visibility','visible');
						$('#addjx-tool-text').html('此操作提示失败可能会有部分成功！'); 
					}).mousemove(function(e){
		               $('#addjx-tool-tips').css('top',e.pageY-10);
		               $('#addjx-tool-tips').css('left',e.pageX+15);
		            }).mouseout(function(){
		               $('#addjx-tool-tips').css('visibility','hidden');
		            });
         			$('<div id="locjx-tool-tips" style="border:1px solid red;background-color:#eee;position:absolute;visibility:hidden;z-index:30001;"><div id="locjx-tool-text" style="font-size:13px;font-weight:bold;margin:0;text-align:center;padding:6px 6px 4px;"></div>').appendTo('body');
         			$('#coordbtn').mouseover(function(){
						$(this).css({"cursor":"help"});
						$('#locjx-tool-tips').css('visibility','visible');
						$('#locjx-tool-text').html('此操作可能对应多条光缆段，请观察红色路由！'); 
					}).mousemove(function(e){
		               $('#locjx-tool-tips').css('top',e.pageY-10);
		               $('#locjx-tool-tips').css('left',e.pageX+15);
		            }).mouseout(function(){
		               $('#locjx-tool-tips').css('visibility','hidden');
		            });			            
         			$('#searchform').submit(function() {
						$('#serializeQueryCondition').val('');
						$('#serializeQueryCondition').val($(this).serialize());
			  			return true;
					});
         		});
			});
			
			function addJXLL(url){
				var zTree = $.fn.zTree.getZTreeObj("tree");
				var nodes = zTree.getCheckedNodes(true);
				var selectnodes = [];
				for(var i=0; i<nodes.length; i++){
					selectnodes.push(nodes[i].name);
				}
				if(nodes.length>0){
				  var odmid = nodes[0].pId;
				  if('${jxgxllz.qssblx}'=='AA004' || '${jxgxllz.qssblx}'=='AA006'){odmid = '';}
				  $.ajax({
						url: encodeURI(url+"&odmid="+odmid+"&portnames="+selectnodes.join(",")+"&R="+Math.random()),
						dataType: "html",
						type:'GET',
						cache:true,
						async:true,
						success : function(result){
							if(result == '新增成功！'){
								window.parent.exchangeDiv('${ctx}/res/boardfibermgr/jxgxll!getJxgxllByllzId.action?llzid=${jxgxllz.id}','查询局向光纤链路',700);
							}
							$.fn.Alert(result, 4);
						},
						error : function() {
							$.fn.Alert("无法新增局向光纤！",4);
						}
					});
				}else{
					$.fn.Alert("请选择一条！", 4);				
				}
			}
			
			var backtoPage=function(){
				if('${backurl}'){
					window.location.href='${ctx}/res/boardfibermgr/jxgxllz!list.action';					
				}else{
					parent.exchangeDiv('${ctx}/res/boardfibermgr/jxgxllz/jxgxllz_input.jsp','新增链路组',420);
				}
			}
			
			var openBatchAdd = function(url){
				parent.openResourcetreediv("批量添加", url, 400, 247);
			}
			
			//定位经过的路由段
			var locateLY = function(ssgldly){
				$.ajax({
					url: encodeURI("${ctx}/res/boardfibermgr/jxgxll!getObjectids.action?ssgldly="+ssgldly),
					dataType: "html",
					type:'GET',
					cache:true,
					async:true,
					success : function(result){
						parent.locate('A33', result);
					}				
				});
			}
		</script>
	</head>
	<body>
		<div class="ui-form-input-box">
			<input id="addbtn" style="display: none;" type="button" onclick="addJXLL('${ctx}/res/boardfibermgr/jxgxll!add.action?llzid=${jxgxllz.id}')" value="新增">
			<input id="btAddbtn" style="display: none;" type="button" onclick="openBatchAdd('${ctx}/res/boardfibermgr/jxgxll!tobatchAddPage.action?llzid=${jxgxllz.id}')" value="批量增加">
			<input type="button" value="返回" onclick="javascript:backtoPage();">
		</div>
		<div class="ui-form-input-box">
			 <fieldset>
			    <legend>局向光纤链路组信息</legend>
			    <div class="ui-div-list">
			    	<ul>
			    		<li>局向光纤链路组名称：${jxgxllz.llzmc}</li>
			    		<li>起端设备：<resinfo:resCommon keyValue="${jxgxllz.qssbid}" resType="${jxgxllz.qssblx}"/></li>
			    		<li>终端设备：<resinfo:resCommon keyValue="${jxgxllz.zzsbid}" resType="${jxgxllz.zzsblx}"/></li>
			    	</ul>
			    </div>
			 </fieldset>				
		</div>
		<div class="ui-form-input-box">
			 <fieldset>
			    <legend>
			    	详细信息
			    <c:if test="${map['total'] > 0}">
			    	（总记录数：</b><font color="red">${map['total']}</font>）
			    </c:if>
			    </legend>		
			<div style="display:none;float:left;width:25%;height:100%;">
				<ul id="tree" class="ztree" style="background-color:#FFF;width:200px;border:0;margin:0;padding:0"></ul>
			</div>
			<div style="float:right;width:100%;height:100%;overflow:hidden;">  
			    <c:choose>
				    <c:when test="${map['total'] > 0}">
						<table id="datatable" cellspacing="0">
							<thead>
							<tr>
								<th style="display:none;">
									<span style="float: left; padding-left: 5px">
										<ul class="dropdown dropdown-horizontal">
											<li>
												<span class="dir">选择</span>
												<ul>
													<li>
														<a href="javascript:void(0);" onclick="$.btnCheckAll({'flag':true})">全选</a>
													</li>
													<li>
														<a href="javascript:void(0);" onclick="$.btnCheckAll({'flag':false})">不选</a>
													</li>
													<li>
														<a href="javascript:void(0);" onclick=$('input[type=checkbox]').inverseAll();>反选</a>
													</li>
												</ul>
											</li>
										</ul>
									</span>								
									<span style="float: left;z-index:5px;">
										<ul class="dropdown dropdown-horizontal">
											<li>
												<span class="dir">操作</span>
												<ul style="width: 60px">
													<li>
														<a href="javascript:void(0);" onclick="$.batchDelete('${ctx}/res/boardfibermgr/jxgxll!delete.action')">删除</a>
													</li>
												</ul>
											</li>
										</ul>
									</span>									
								</th>							
								<th>起端ODM</th>
								<th>起端纤芯</th>
								<th>起端设备端口</th>
								<th>终端ODM</th>
								<th>终端纤芯</th>
								<th>终端设备端口</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${map['rows']}" var="item">
								<tr id="${item.ID}">
									<td style="display:none;">
										<input type="checkbox" value="${item.ID}">
									</td>
									<td><resinfo:resCommon resType="AD703" keyValue="${item.QSSBODM}"></resinfo:resCommon>&nbsp;</td>
									<td>${item.QSXXH}&nbsp;</td>
									<td>${item.QSSBDZ}&nbsp;</td>
									<td><resinfo:resCommon resType="AD703" keyValue="${item.ZZSBODM}"></resinfo:resCommon>&nbsp;</td>
									<td>${item.ZZXXH}&nbsp;</td>
									<td>${item.ZZSBDZ}&nbsp;</td>
									<td><a href="javascript:void(0);" style="text-decoration: none;" onclick="locateLY('${item.SSGLDLY}');">定位</a></td>									
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<c:if test="${map['total'] > 0}">
							<baseinfo:pagenation paginationCls="pagination" adjacents="1" records="${map['total']}" allowPageSelect="false" url="${ctx}/res/boardfibermgr/jxgxll!getJxgxllByllzId.action?llzid=${jxgxllz.id}${condition}"></baseinfo:pagenation>
						</c:if>	
					</c:when>
					<c:otherwise>
						<div style="margin:5px;text-align: center">抱歉！没有数据！</div>
					</c:otherwise>
				</c:choose>
			</div>
			</fieldset>
		</div>
		<ul id="context-menu">
			<li><a href="javascript:void(0)" onclick="deleteJX('${ctx}/res/boardfibermgr/jxgxll!delete.action');">删除局向光纤</a></li>
		</ul>		
	</body>
</html>