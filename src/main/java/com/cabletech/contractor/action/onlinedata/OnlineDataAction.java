package com.cabletech.contractor.action.onlinedata;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.contractor.service.onlinedata.OnlineDataService;
import com.cabletech.core.action.BaseAction;

/**
 * 实时在线数据Action
 */
@Namespace("/contractor")
@Results({
		@Result(name = "onlineman", location = "/contractor/onlinedata/onlineman_list.jsp"),
		@Result(name = "onlinemanresult", location = "/contractor/onlinedata/onlineman_result.jsp"),
		@Result(name = "alertresult", location = "/contractor/onlinedata/onlinealert_result.jsp"),
		@Result(name = "onlinealert", location = "/contractor/onlinedata/onlinealert_list.jsp"),
		@Result(name = "onlinecar", location = "/contractor/onlinedata/onlinecar_list.jsp"),
		@Result(name = "onlinecarresult", location = "/contractor/onlinedata/onlinecar_result.jsp") })
@Action("onlinedata")
public class OnlineDataAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Resource(name = "onlineDataServiceImpl")
	private OnlineDataService onlineService;// 在线数据服务类

	@Override
	public String execute() {

		return "d";
	}

	/**
	 * 首页统计在线车辆、人员计数
	 * 
	 */
	public void todaycalcdata() {
		UserInfo user = ((UserInfo) request.getSession().getAttribute("user"));
		Map<String, Object> map = onlineService.getOnlineDataCount(user);
		super.convertmaptojson(map);
	}

	/**
	 * 按区域、代维统计
	 * 
	 * @return
	 */
	public String todayonlinecarresult() {
		UserInfo user = ((UserInfo) request.getSession().getAttribute("user"));
		List<Map<String, Object>> regions = onlineService.getRegions(user);
		List<Map<String, Object>> contractors = onlineService
				.getContractors(user);
		request.setAttribute("regions", regions);
		request.setAttribute("contractors", contractors);
		return "onlinecarresult";
	}

	/**
	 * 返回今日巡检人列表数据 <br />
	 * 
	 * 移动按区县、按代维划分。代维公司按维护中心划分
	 * 
	 * @return
	 */
	public String todayonlinemanresult() {
		UserInfo user = ((UserInfo) request.getSession().getAttribute("user"));
		List<Map<String, Object>> regions = onlineService.getRegions(user);
		List<Map<String, Object>> contractors = onlineService
				.getContractors(user);
		request.setAttribute("regions", regions);
		request.setAttribute("contractors", contractors);
		return "onlinemanresult";
	}

	/**
	 * 未处理故障结果页面
	 * 
	 * @return
	 */
	public String undoalertresult() {
		UserInfo user = ((UserInfo) request.getSession().getAttribute("user"));
		List<Map<String, Object>> regions = onlineService.getRegions(user);
		List<Map<String, Object>> contractors = onlineService
				.getContractors(user);
		request.setAttribute("regions", regions);
		request.setAttribute("contractors", contractors);
		return "alertresult";
	}

	/**
	 * 在线巡检人列表
	 */
	public String todayonlineman() {
		UserInfo ui = (UserInfo) request.getSession().getAttribute("user");
		String regionid = request.getParameter("regionid");
		String orgid = request.getParameter("orgid");
		Map<String, Object> conditionmap = new HashMap<String, Object>();
		if (StringUtils.isBlank(regionid) && StringUtils.isBlank(orgid)) {
			if (ui.isMobile()) {
				conditionmap.put("regionlist", baseInfoProvider
						.getRegionService().getRegionIdList(ui.getUserId()));
			} else {
				conditionmap.put("contractorlist", baseInfoProvider
						.getOrgService().getOrgIdList(ui.getUserId()));
			}
		}
		if (StringUtils.isNotBlank(super.getParameterValue("name"))) {// 获取快捷搜索的名称
			conditionmap.put("name",
					super.converstringtoutf8(super.getParameterValue("name")));
		}
		conditionmap.put("regionid", regionid);
		if (ui.isContractor() && StringUtils.isBlank(orgid)) {
			orgid = ui.getOrgId();
		}
		conditionmap.put("orgid", orgid);
		Map<String, Object> map = onlineService.queryPageMap(
				"queryTodayOnlineMan", conditionmap, super.getPage("page"),
				super.getLimit("rows"));
		request.setAttribute("locatejson", getLocateJson(map));
		request.setAttribute("map", map);
		return "onlineman";
	}

	/**
	 * 在线车辆列表
	 * 
	 * @return
	 */
	public String todayonlinecar() {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String regionid = request.getParameter("regionid");
		String orgid = request.getParameter("orgid");
		Map<String, Object> conditionmap = new HashMap<String, Object>();
		if (StringUtils.isBlank(regionid) && StringUtils.isBlank(orgid)) {
			if (user.isMobile()) {
				conditionmap.put("regionlist", baseInfoProvider
						.getRegionService().getRegionIdList(user.getUserId()));
			} else {
				conditionmap.put("contractorlist", baseInfoProvider
						.getOrgService().getOrgIdList(user.getUserId()));
			}
		}
		if (StringUtils.isNotBlank(super.getParameterValue("name"))) {// 获取快捷搜索的名称
			conditionmap.put("name",
					super.converstringtoutf8(super.getParameterValue("name")));
		}
		conditionmap.put("regionid", regionid);
		if (user.isContractor() && StringUtils.isBlank(orgid)) {
			orgid = user.getOrgId();
		}
		conditionmap.put("orgid", orgid);
		Map<String, Object> map = onlineService.queryPageMap(
				"queryTodayOnlineCar", conditionmap, super.getPage("page"),
				super.getLimit("rows"));
		request.setAttribute("locatejson", getLocateJson(map));
		request.setAttribute("map", map);
		return "onlinecar";
	}

	/**
	 * 列出全部未处理的故障列表
	 * 
	 * @return
	 */
	public String undoonlinealer() {
		UserInfo user = ((UserInfo) request.getSession().getAttribute("user"));
		String regionid = request.getParameter("regionid");
		String orgid = request.getParameter("orgid");
		Map<String, Object> conditionmap = new HashMap<String, Object>();
		conditionmap.put("regionid", regionid);
		if (user.isContractor() && StringUtils.isBlank(orgid)) {
			orgid = user.getOrgId();
		}
		conditionmap.put("orgid", orgid);
		Map<String, Object> map = onlineService.queryPageMap(
				"queryOnlineAlert", conditionmap, super.getPage("page"),
				super.getLimit("rows"));
		request.setAttribute("locatejson", getLocateJson(map));
		request.setAttribute("map", map);
		return "onlinealert";
	}

	/**
	 * 资源点搜索
	 * 
	 * @return
	 */
	public String pointresource() {
		super.outmessage("just test");
		return null;
	}

	/**
	 * 获取列表结果定位Json
	 * 
	 * @param map
	 *            结果集合
	 * @return
	 */
	public String getLocateJson(Map<String, Object> map) {
		StringBuffer datajson = new StringBuffer();
		String data = "";
		List<Map<String, Object>> datalist = (ArrayList<Map<String, Object>>) map
				.get("rows");
		if (datalist != null && datalist.size() > 0) {
			for (Map<String, Object> m : datalist) {
				datajson.append("{\"NAME\":\"" + m.get("LABEL").toString()
						+ "\",\"X\":\"" + m.get("X").toString() + "\",\"Y\":\""
						+ m.get("Y").toString()
						+ "\",\"IMGURL\":\"../legendIcons/"
						+ m.get("BUSINESSTYPE").toString() + ".png\"},");
			}
			if (StringUtils.isNotBlank(datajson.toString())) {
				data = datajson.toString().substring(0,
						datajson.toString().length() - 1);
			}
		}
		return data;
	}

	/**
	 * 巡检人轨迹数据
	 * 
	 */
	public void getHistoryPositionsByPatrolmanid() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("patrolmanid", request.getParameter("patrolmanid"));
		param.put("begindate", request.getParameter("begin"));
		param.put("enddate", request.getParameter("end"));
		List<Map<String, Object>> hp = onlineService
				.getHistoryPositionsByPatrolmanid(param);
		super.convertmaptojson(hp);
	}

	/**
	 * 巡检车辆轨迹数据
	 * 
	 */
	public void getHistoryPositionsBySimid() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("simid", request.getParameter("simid"));
		param.put("begindate", request.getParameter("begin"));
		param.put("enddate", request.getParameter("end"));
		List<Map<String, Object>> hp = onlineService
				.getHistoryPositionsBySimid(param);
		super.convertmaptojson(hp);
	}

	/**
	 * 统计故障列表信息
	 * 
	 */
	public void undorealonlinealerdata() {
		UserInfo user = ((UserInfo) request.getSession().getAttribute("user"));
		List<Map<String, Object>> regionsonline = onlineService
				.getOnlineAlertRealdataByRegion(user);
		List<Map<String, Object>> orgsonline = onlineService
				.getOnlineAlertRealdataByOrg(user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("regionsonline", regionsonline);
		map.put("orgsonline", orgsonline);
		super.convertmaptojson(map);
	}

	/**
	 * 统计在线人员数量
	 * 
	 */
	public void todayrealonlinemandata() {
		UserInfo user = ((UserInfo) request.getSession().getAttribute("user"));
		List<Map<String, Object>> regionsonlineman = onlineService
				.getOnlinemanRealdataByRegion(user);
		List<Map<String, Object>> orgsonlineman = onlineService
				.getOnlinemanRealdataByOrg(user);
		List<Map<String, Object>> onlinemancount = onlineService
				.getOnlineManCounts(user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("regionsonline", regionsonlineman);
		map.put("orgsonline", orgsonlineman);
		map.put("onlinecount", onlinemancount);
		super.convertmaptojson(map);
	}

	/**
	 * 统计在线车辆数量
	 * 
	 */
	public void todayrealonlinecardata() {
		UserInfo user = ((UserInfo) request.getSession().getAttribute("user"));
		List<Map<String, Object>> regionsonlinecar = onlineService
				.getOnlinecarRealdataByRegion(user);
		List<Map<String, Object>> orgsonlinecar = onlineService
				.getOnlinecarRealdataByOrg(user);
		List<Map<String, Object>> onlinecarcount = onlineService
				.getOnlineCarCounts(user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("regionsonline", regionsonlinecar);
		map.put("orgsonline", orgsonlinecar);
		map.put("onlinecount", onlinecarcount);
		super.convertmaptojson(map);
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	protected void prepareViewModel() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}
}