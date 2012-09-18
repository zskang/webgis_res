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
			In.add('lhgdialogjs',{path:'http://${config.webliburl}/cabletech/ui/lhgdialog/lhgdialog.min.js?self=false&skin=iblue',type:'js',charset:'utf-8'})
			
			In.add('notycss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery.noty.css'});
			In.add('mynotycss',{path:'http://${config.webliburl}/cabletech/ui/css/noty_theme_twitter.css'});
			In.add('noty',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.noty.js',type:'js',charset:'utf-8',rely:['notycss','mynotycss']});			
			
			In.css('#searchinput {float:left;width:250px;height:19px;line-height:19px;padding:3px 5px;border:#A7A7A7 1px solid;background:white;color:#888;font-size:12px;-webkit-transition:.3s;-moz-transition:.3s;outline: none;}');
			In.css('#searchbtn {cursor:pointer;height:27px;font-size:12px;float:left;width:50px;margin-left:-1px;background:#eee;display:inline-block;padding:0 12px;vertical-align:middle;border:#A7A7A7 1px solid;color:#666;}');
			In.css('#searchbtn:hover {background:#ddd;}');
			In.css('.ui-form-input {width:200px}');
			In.css('#datatable {width:100%;padding: 0;margin: 0;border-left:1px solid #C1DAD7}');
			In.css('#datatable th {font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;color: #4f6b72;border-right: 1px solid #C1DAD7;border-bottom: 1px solid #C1DAD7;border-top: 1px solid #C1DAD7;letter-spacing: 2px;text-transform: uppercase;text-align: left;padding: 6px 6px 6px 12px;background: #CAE8EA  no-repeat;}');
			In.css('#datatable td {border-right: 1px solid #C1DAD7;border-bottom: 1px solid #C1DAD7;background: #fff;font-size:11px;padding: 6px 6px 6px 12px;color: #4f6b72;}');
			In.css('#datatable tr:hover{background-color: yellow;}');
			
			In.css('#context-menu {font:400 12px/1.5 Arial;color:#333;display:none;position:absolute;padding:0 4px;width:120px;border:1px solid #B8CBCB;box-shadow:2px 2px 5px #666;background:#FFF;z-index:9;overflow:hidden;}');
			In.css('#context-menu li {float:left;margin-top:-1px;padding:4px 0;width:120px;height:25px;line-height:25px;border-top:1px solid #B8CBCB;list-style:none;}');
			In.css('#context-menu a, #context-menu a:visited {display:block;text-indent:10px;color:#333;text-decoration:none;}');
			In.css('#context-menu a:hover {color:#FFF;background-color:#348CCC;text-decoration:none;}');			
				
			In.ready('ctcss','giscss','dropdowncss','commonjs','lhgdialogjs','noty','rightmenujs',function(){
				$.fn.setCondition2ParentPage('${condition}');
				new rightMenu({obj:"#datatable tbody", menu:"#context-menu", offX:10, offY:5});
         		$(function(){
         			$('#searchinput').focus();
         			$('#searchform').submit(function() {
						$('#serializeQueryCondition').val('');
						$('#serializeQueryCondition').val($(this).serialize());
			  			return true;
					});
         		});
			});
			
			var jumpJXLL = function(){
				var itemids = getSelectOne();
				if(itemids.length==1){
					window.parent.exchangeDiv('${ctx}/res/boardfibermgr/jxgxll!getJxgxllByllzId.action?&backurl=1&llzid='+itemids.join(','),'查询局向光纤链路',700);
				}else{
					$.fn.Alert("请选择一条！",4);
				}
			}
			
		var batchDeletellz = function(url){
			var ids=[];
			$('input[type=checkbox]').each(function(i) {
			   if($(this).attr("checked")){
			   	  ids.push($(this).get(0).defaultValue);
			   }
			});
			if(ids.length>0){
				$.dialog.confirm("确认删除吗？",function(){
					$.ajax({
						url:url,dataType:'html',data:"xtbhs="+ids,
						success:function(text){
							if(text == '删除成功！'){
								noty({layout:'topCenter',theme:'noty_theme_mitgux',type: 'success',text:text,timeout:1500});
								window.location.reload();
							}else{
								noty({layout:'topCenter',theme:'noty_theme_mitgux',type: 'error',text:text,timeout:1500});
							}
						}
					});
				});
			}else{
				$.fn.Alert("请选择！",4);
			}
		}			
		</script>
	</head>
	<body>
	<table style="border:0;width:100%">
		<tr style="border:0;width:100%">
			<td>
				<form name="searchform" id="searchform" method="post" action="${ctx}/res/boardfibermgr/jxgxllz!list.action">
					 <input type="hidden" id="serializeQueryCondition" name="serializeQueryCondition" />
					 <div class="ui-form-input-box">
					    <span style="display:inline;float:left;">局向光纤链路组名称：</span>
						<input id="searchinput" type="text" name="llzmc" value="${searchCondition.llzmc}" autocomplete="off" onkeydown="javascript:if(event.keyCode==13 && jQuery.trim(this.value)!=''){event.returnValue=false;event.cancel=true;searchform.searchbtn.click();}" title="回车即可搜索"> 
						<input id="searchbtn" type="submit" value="查询">			    
					 </div>
				</form>
			</td>
		</tr>
		<tr style="border:0;width:100%">
			<td>	
			 <fieldset>
			    <legend>
			    	查询结果
			    <c:if test="${map['total'] > 0}">
			    	（总记录数：</b><font color="red">${map['total']}</font>）
			    </c:if>
			    </legend>
			    <c:choose>
				    <c:when test="${map['total'] > 0}">
						<table id="datatable" cellspacing="0">
							<thead>
							<tr>
								<th width="20%">
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
									<span style="float: left; padding-left: 5px">
										<ul class="dropdown dropdown-horizontal">
											<li>
												<span class="dir"> 操作 </span>
												<ul style="width: 60px">
													<li>
														<a href="javascript:void(0);" onclick="javascript:batchDeletellz('${ctx}/res/boardfibermgr/jxgxllz!delete.action')">批量删除</a>
													</li>
												</ul>
											</li>
										</ul>
									</span>									
								</th>
								<th>名称</th>
								<th>起端设备名称</th>
								<th>起端设备类型</th>
								<th>终端设备名称</th>
								<th>终端设备类型</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${map['rows']}" var="item">
								<tr id="${item.ID}">
									<td>
										<input type="checkbox" value="${item.ID}">
									</td>
									<td>${item.LLZMC}&nbsp;</td>
									<td>
										<resinfo:resCommon keyValue="${item.QSSBID}" resType="${item.QSSBLX}"/>&nbsp;
									</td>
									<td>
										<baseinfo:dic displayProperty="LABLE" codevalue="${item.QSSBLX}" columntype="CSSBLX"/>&nbsp;
									</td>
									<td>
										<resinfo:resCommon keyValue="${item.ZZSBID}" resType="${item.ZZSBLX}"/>&nbsp;
									</td>
									<td>
										<baseinfo:dic displayProperty="LABLE" codevalue="${item.ZZSBLX}" columntype="CSSBLX"/>&nbsp;
									</td>
								</tr>	
							</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<div style="margin:5px;text-align: center">抱歉！没有搜索到数据！</div>
					</c:otherwise>
				</c:choose>
				<c:if test="${map['total'] > 0}">
					<baseinfo:pagenation paginationCls="pagination" adjacents="1" records="${map['total']}" allowPageSelect="false" url="${ctx}/res/boardfibermgr/jxgxllz!list.action?${condition}"></baseinfo:pagenation>
				</c:if>				
				</fieldset>
			</td>
		</tr>
	</table>
	<ul id="context-menu">
		<li><a href="javascript:void(0)" onclick="deleteJX('${ctx}/res/boardfibermgr/jxgxllz!delete.action');">删除链路组</a></li>
		<li><a href="javascript:void(0)" onclick="jumpJXLL();">局向光纤链路管理</a></li>
	</ul>
	</body>
</html>