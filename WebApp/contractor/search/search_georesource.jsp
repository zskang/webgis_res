<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link  href="http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css" rel="stylesheet" type="text/css">
		<title>搜索结果</title>
		<script type="text/javascript">
			In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
		    In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
		    In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
			In.ready('commonjs','ztreejs',function(){
				if(top.featureSet && top.featureSet.length && top.featureSet.length > 0){
					var json = $.fn.featuresToJson(top.featureSet);
					var setting = {
						data: {
							simpleData: {
								enable: true
							}
						},
						callback: {
							//onClick: onClick,
							onClick: onClick
						}
					};		
					if(json && json.length>0){
						$.fn.zTree.init($("#tree"), setting, json);
					}else{
						$('#tree')[0].style.display="none";
						$("#content").append("<div style='margin-left:10px;width:180px;margin-top:10px;'>没有检索到符合条件的数据.</div>");
					}
				}else{
					$('#tree')[0].style.display="none";
					$("#content").append("<div style='margin-left:10px;width:180px;margin-top:10px;'>没有检索到符合条件的数据。</div>");
				}
			});
			
			/**function onClick(event, treeId, treeNode, clickFlag) {
				if(treeNode.pId == "管道段"){
					parent.locate("AD601",treeNode.objectid);
				}else if(treeNode.pId == "杆路段"){
					parent.locate("AD602",treeNode.objectid);
				}else if(treeNode.pId == "直埋段"){
					parent.locate("AD603",treeNode.objectid);
				}else if(treeNode.pId == "标石段"){
					parent.locate("AD603",treeNode.objectid);
				}else if(treeNode.pId == "挂墙段"){
					parent.locate("AD604",treeNode.objectid);
				}else if(treeNode.pId == "光缆段"){
					parent.locate("A33",treeNode.objectid);
				}else if(treeNode.pId == "引上"){
					parent.locate("AD605",treeNode.objectid);
				}else if(treeNode.pId == "引上段"){
					parent.locate("AD605",treeNode.objectid);
				}
				else{
					top.cmap.centerWithPicurer(treeNode.lx,treeNode.ly);
				}
			}**/	
			function onClick(e, treeId, treeNode){
				if(treeNode.level == 1){
					var zylx = "";
					var packageName = "";

					if(treeNode.pId == "管井"){
						zylx = "gjxx";
						packageName="basemgr";
					}
					else if(treeNode.pId == "管道段"){
						zylx = "gdd";
						packageName="basemgr";
					}
					else if(treeNode.pId == "电杆"){
						zylx = "dgxx";
						packageName="basemgr";
					}
					else if(treeNode.pId == "杆路段"){
						zylx = "gld";
						packageName="basemgr";
					}
					else if(treeNode.pId == "标石"){
						zylx = "bsxx";
						packageName="basemgr";
					}
					else if(treeNode.pId == "直埋段"){
						zylx = "bsd";
						packageName="basemgr";
					}
					else if(treeNode.pId == "标石段"){
						zylx = "bsd";
						packageName="basemgr";
					}
					else if(treeNode.pId == "挂墙"){
						zylx = "gqxx";
						packageName="basemgr";
					}
					else if(treeNode.pId == "挂墙段"){
						zylx = "gqd";
						packageName="basemgr";
					}
					else if(treeNode.pId == "引上"){
						zylx = "ys";
						packageName="basemgr";
					}
					else if(treeNode.pId == "光交接箱"){
						zylx = "gjjx";
						packageName="cableequipmgr";
					}
					else if(treeNode.pId == "光分纤箱"){
						zylx = "gfxx";
						packageName="cableequipmgr";
					}
					else if(treeNode.pId == "光终端盒"){
						zylx = "gzdh";
						packageName="cableequipmgr";
					}
					else if(treeNode.pId == "光接头"){
						zylx = "gjt";
						packageName="cableequipmgr";
					}
					
					else if(treeNode.pId == "光缆段"){
						zylx = "gldly";
						packageName="opticcablemgr";
					}
					else if(treeNode.pId == "光缆盘留"){
						zylx = "glpl";
						packageName="opticcablemgr";
					}
					
					else if(treeNode.pId == "站点"){
						zylx = "zdxx";
						packageName="publicmgr";
					}

					else if(treeNode.pId == "集团客户"){
						zylx = "groupcustoms";
						packageName="groupcustomsmgr";
					}
					else if(treeNode.pId == "校园网"){
						zylx = "campus";
						packageName="groupcustomsmgr";
					}
					else if(treeNode.pId == "宽带小区"){
						zylx = "broadband";
						packageName="groupcustomsmgr";
					}
					else if(treeNode.pId == "营业厅"){
						zylx = "yyt";
						packageName="groupcustomsmgr";
					}
					
					var url = "${ctx}/res/"+packageName+"/"+zylx+"!view.action?xtbh="+treeNode.id+"&tipview=1";
					//top.openResourcetreediv('查看'+treeNode.pId,url)
					top.showinfowindow(treeNode.lx, treeNode.ly, treeNode.name, url, treeNode.id, treeNode.pId);
				}
			}
		</script>		
		
	</head>
	<body>
			<div id="content" style="width:100%;height:100%;">
				<ul id="tree" class="ztree" style="overflow-y:srcoll;overflow:auto;width:100%;background-color:white;height:100%;border:0;margin:0;padding:0"></ul>
			</div>
	</body>
</html>