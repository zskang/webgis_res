<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<script type="text/javascript">
	In
			.add(
					'jqueryuijs',
					{
						path : 'http://${config.webliburl}/cabletech/ui/js/jquery-ui-1.8.19.custom.min.js',
						type : 'js',
						charset : 'utf-8',
						rely : [ 'jqueryuicss' ]
					});
	In
			.add(
					'jqueryuicss',
					{
						path : 'http://${config.webliburl}/cabletech/ui/css/jquery-ui-1.8.19.custom.css'
					});
	In.add('gislayout', {
		path : '${ctx}/css/jquery.ct.ui.gis.layout.css'
	});
	In.ready('jqueryuijs', 'gislayout', function() {
		$("#accordion").accordion();
		$("#zdxxlistId").click(function() {
			alert("");
		});
	});
</script>
<div class="ui-gis-legend" style="width: 320px; height: 100%">
	<div id="accordion">
		<h3>
			<a href="#">承载设施</a>
		</h3>
		<div style="width:100%;height:100%;padding:0px">
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gj"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gjxx!list.action','查询管井');">管井</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gjxx!input.action?<%=Math.random() %>','新增管井');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gdd"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gdd!list.action','查询管道段');">管道段</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gdd!input.action?<%=Math.random() %>','新增管道段');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gddxt"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gddxt!list.action','查询管道系统');">管道系统</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gddxt!input.action?<%=Math.random() %>','新增管道系统');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-dg"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/dgxx!list.action','查询电杆');">电杆</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/dgxx!input.action?<%=Math.random() %>','新增电杆');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gld"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gld!list.action','查询杆路段');">杆路段</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gld!input.action?<%=Math.random() %>','新增杆路段');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-gldxt"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gldxt!list.action','查询杆路系统');">杆路系统</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gldxt!input.action?<%=Math.random() %>','新增杆路系统');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-bs"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/bsxx!list.action','查询标石');">标石</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/bsxx!input.action?<%=Math.random() %>','新增标石');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-zmd"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/bsd!list.action','查询直埋段');">直埋段</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/bsd!input.action?<%=Math.random() %>','新增直埋段');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-zmdxt"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/bsdxt!list.action','查询直埋系统');">直埋系统</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/bsdxt!input.action?<%=Math.random() %>','新增直埋系统');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-gq"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gqxx!list.action','查询挂墙');">挂墙</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gqxx!input.action?<%=Math.random() %>','新增挂墙');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gqd"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gqd!list.action','查询挂墙段');">挂墙段</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gqd!input.action?<%=Math.random() %>','新增挂墙段');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-gqdxt"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gqdxt!list.action','查询挂墙系统');">挂墙系统</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/gqdxt!input.action?<%=Math.random() %>','新增挂墙系统');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-ysd"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/ys!list.action','查询引上段');">引上段</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/ys!input.action?<%=Math.random() %>','新增引上段');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-ysdxt"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/ysxt!list.action','查询引上系统');">引上系统</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/basemgr/ysxt!input.action?<%=Math.random() %>','新增引上系统');">[新增]</a>
				</span>
			</div>
		</div>
		<h3>
			<a href="#">光交资源</a>
		</h3>
		<div style="width:100%;height:100%;padding:0px">
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gzdh"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/cableequipmgr/gzdh!list.action','查询光终端盒');">光终端盒</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/cableequipmgr/gzdh!input.action?<%=Math.random() %>','新增光终端盒');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gjjx"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/cableequipmgr/gjjx!list.action','查询光交接箱');">光交接箱</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/cableequipmgr/gjjx!input.action?<%=Math.random() %>','新增光交接箱');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gfqx"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/cableequipmgr/gfxx!list.action','查询光分纤箱');">光分纤箱</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/cableequipmgr/gfxx!input.action?<%=Math.random() %>','新增光分纤箱');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-gjt"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/cableequipmgr/gjt!list.action','查询光接头');">光接头</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/cableequipmgr/gjt!input.action?<%=Math.random() %>','新增光接头');">[新增]</a>
				</span>
			</div>
		</div>
		<h3>
			<a href="#">光缆</a>
		</h3>
		<div style="width:100%;height:100%;padding:0px">
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gld"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/opticcablemgr/gldly!list.action','查询光缆段');">光缆段</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/opticcablemgr/gldly!input.action?<%=Math.random() %>','新增光缆段');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-gl"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/opticcablemgr/glxx!list.action','查询光缆');">光缆</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/opticcablemgr/glxx!input.action?<%=Math.random() %>','新增光缆');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-gld"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/opticcablemgr/glpl!list.action','查询光缆盘留');">光缆盘留</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/opticcablemgr/glpl!input.action?<%=Math.random() %>','新增光缆盘留');">[新增]</a>
				</span>
			</div>

		</div>
		<h3>
			<a href="#">公共资源</a>
		</h3>
		<div style="width:100%;height:100%;padding:0px">
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-zd"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/zdxx!list.action','查询站点');">站点</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/zdxx!input.action?<%=Math.random() %>','新增站点');">[新增]</a></span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-jf"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/jfxx!list.action','查询机房');">机房</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/jfxx!input.action?<%=Math.random() %>','新增机房');">[新增]</a></span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-odf"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/odf!list.action','查询ODF');">ODF</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/odf!input.action?<%=Math.random() %>','新增ODF');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-odf"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/odm!list.action','查询ODM');">ODM</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/odm!input.action?<%=Math.random() %>','新增ODM');">[新增]</a>
				</span>
			</div>
			<!-- 周刚 测试  
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-odf"></div>
				<a herf="javascript:void(0)" style="cursor: pointer"
					onclick="javascript:window.parent.openResourcetreediv('查看站点','${ctx}/res/publicmgr/zdxx!listDwzh.action',1100,600)">
					站点</a><span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/zdxx!input.action?<%=Math.random() %>','新增站点');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-odf"></div>
				<a herf="javascript:void(0)" style="cursor: pointer"
					onclick="javascript:window.parent.openResourcetreediv('查看机房','${ctx}/res/publicmgr/jfxx!list.action',1100,600)">
					机房</a> <span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/publicmgr/jfxx!input.action?<%=Math.random() %>','新增机房');">[新增]</a>
				</span>
			</div>-->
		
		</div>
		<h3>
			<a href="#">集团客户</a>
		</h3>
		<div style="width:100%;height:100%;padding:0px">
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-jtkh"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/groupcustomsmgr/groupcustoms!list.action','查询集团客户');">集团客户</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/groupcustomsmgr/groupcustoms!input.action?<%=Math.random() %>','新增集团客户');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-xyw"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/groupcustomsmgr/campus!list.action','查询校园网');">校园网</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/groupcustomsmgr/campus!input.action?<%=Math.random() %>','新增校园网');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-kdxq"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/groupcustomsmgr/broadband!list.action','查询宽带小区');">宽带小区</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/groupcustomsmgr/broadband!input.action?<%=Math.random() %>','新增宽带小区');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-yyt"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/groupcustomsmgr/yyt!list.action','查询营业厅');">营业厅</a>
				<span><a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/groupcustomsmgr/yyt!input.action?<%=Math.random() %>','新增营业厅');">[新增]</a>
				</span>
			</div>
		</div>
		<h3>
			<a href="#">局向光纤</a>
		</h3>
		<div style="width:100%;height:100%;padding:0px">
			<div class="ui-gis-legend-left">
				<div class="ui-gis-legend-jtkh"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/boardfibermgr/jxgxllz!list.action','查询局向光纤链路组',700);">链路组</a>
				<span> <a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/boardfibermgr/jxgxllz!input.action?<%=Math.random() %>','新增局向光纤链路组');">[新增]</a>
				</span>
			</div>
			<div class="ui-gis-legend-right">
				<div class="ui-gis-legend-xyw"></div>
				<a href="javascript:void(0);"
					onclick="exchangeDiv('${ctx}/res/tracemgr/trace!input.action','Trace');">Trace</a>
			</div>
		</div> 	 
	</div>
	<!-- end accrodin -->
</div>