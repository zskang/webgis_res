package com.cabletech.contractor.service.onlinedata;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cabletech.baseinfo.business.Service.BaseInfoProvider;
import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.contractor.mapper.onlinedata.OnlineDataMapper;
import com.cabletech.core.service.BaseServiceImpl;

/**
 * 在线实时数据 Service 实现
 * 
 * @author cqp
 * 
 */
@Service
public class OnlineDataServiceImpl extends BaseServiceImpl implements
		OnlineDataService {

	@Resource(name = "onlineDataMapper")
	private OnlineDataMapper mapper;

	public String tdate = new SimpleDateFormat("yyyy/MM/dd")
			.format(new java.util.Date());

	// 整点时间
	public String[] times = { "8:00:00", "9:00:00", "10:00:00", "11:00:00",
			"12:00:00", "13:00:00", "14:00:00", "15:00:00", "16:00:00",
			"17:00:00", "18:00:00", "19:00:00", "20:00:00" };

	@Override
	public Map<String, Object> getOnlineDataCount(UserInfo user) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> condition = new HashMap<String, Object>();
		if (user.isMobile()) {
			condition.put("regionid", user.getRegionId());
		} else {
			condition.put("orgid", user.getOrgId());
		}
		map.put("onlineman",
				super.getRecordCounts("queryTodayOnlineMan", condition));
		map.put("onlinecar",
				super.getRecordCounts("queryTodayOnlineCar", condition));
		map.put("onlinealert",
				super.getRecordCounts("queryOnlineAlert", condition));
		return map;
	}

	/**
	 * 查询今日全部在线巡检员
	 * 
	 * @param map
	 *            查询条件
	 * @return list
	 */
	@Override
	public List<Map<String, Object>> queryTodayOnlineMan(Map<String, Object> map) {
		return mapper.queryTodayOnlineMan(map);
	}

	@Override
	public List<Map<String, Object>> getRegions(UserInfo user) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (user.isContractor()) {
			map.put("orgId", user.getOrgId());
		}
		map.put("regionId", user.getRegionId());
		List<Map<String, Object>> list = mapper.getRegions(map);
		// 增加当前登录用户的区域ID
		Map<String, Object> conmap = new HashMap<String, Object>();
		conmap.put("REGIONID", user.getRegionId());
		conmap.put("REGIONNAME", user.getRegionName());
		list.add(0, conmap);
		return list;
	}

	@Override
	public List<Map<String, Object>> getContractors(UserInfo user) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (user.isMobile()) {
			map.put("regionId", user.getRegionId());
		} else {
			map.put("orgId", user.getOrgId());
		}
		List<Map<String, Object>> list = mapper.getContractors(map);
		if (list.size() < 1 && user.isContractor()) {// 是代维单位，同时没有下级单位，则将自己的组织机构放入list
			Map<String, Object> conmap = new HashMap<String, Object>();
			conmap.put("ID", user.getOrgId());
			conmap.put("NAME", user.getOrgName());
			list.add(0, conmap);
		}
		return list;
	}


	/**
	 * 获取通用区域的MapId内容
	 * @param user 登录用户信息
	 * @param mapId 执行条件的MapId
	 * @return
	 */
	private List<Map<String, Object>>  getCommonRegionResult(UserInfo user,
			String mapId) {
		List<Map<String, Object>> returnregionlist = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		List<Map<String, Object>> regionList = this.getRegions(user);
		if (user.isContractor()) {
			param.put("orgid", user.getOrgId());
		}
		for (int i = 0; i < regionList.size(); i++) {
			Map<String, Object> element = new HashMap<String, Object>();
			param.put("regionid", regionList.get(i).get("REGIONID"));
			int cnt = super.getRecordCounts(mapId, param);
			element.put("REGIONID", regionList.get(i).get("REGIONID"));
			element.put("CNT", cnt);
			returnregionlist.add(element);
		}
		return returnregionlist;
	}

	/**
	 * 获取通用的组织机构结果页面
	 * @param user 登录用户信息
	 * @param mapId 执行条件的MapId
	 * @return
	 */
	private List<Map<String, Object>> getCommonOrgResult(UserInfo user,
			String mapId) {
		List<Map<String, Object>> returnorglist = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> orgList = this.getContractors(user);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("regionid", user.getRegionId());
		for (int k = 0; k < orgList.size(); k++) {
			Map<String, Object> element = new HashMap<String, Object>();
			param.put("orgid", orgList.get(k).get("ID"));
			int cnt = super.getRecordCounts(mapId, param);
			element.put("ORGID", orgList.get(k).get("ID"));
			element.put("CNT", cnt);
			returnorglist.add(element);
		}
		return returnorglist;
	}

	@Override
	public List<Map<String, Object>> getOnlinemanRealdataByRegion(UserInfo user) {
		return this.getCommonRegionResult(user, "queryTodayOnlineMan");
	}

	@Override
	public List<Map<String, Object>> getOnlinemanRealdataByOrg(UserInfo user) {
		return this.getCommonOrgResult(user, "queryTodayOnlineMan");
	}

	@Override
	public List<Map<String, Object>> getOnlinecarRealdataByRegion(UserInfo user) {
		return this.getCommonRegionResult(user, "queryTodayOnlineCar");
	}

	@Override
	public List<Map<String, Object>> getOnlinecarRealdataByOrg(UserInfo user) {
		return this.getCommonOrgResult(user, "queryTodayOnlineCar");
	}
 
	@Override
	public List<Map<String, Object>> getOnlineAlertRealdataByRegion(UserInfo user){
		return this.getCommonRegionResult(user, "queryOnlineAlert");
	}
	
	@Override
	public List<Map<String, Object>> getOnlineAlertRealdataByOrg(UserInfo user){	
		return this.getCommonOrgResult(user, "queryOnlineAlert");
	}

	/**
	 * 获取查询时间段参数
	 * 
	 * @param i
	 *            时间段索引
	 * @return
	 */
	public Map<String, Object> getDateParam(int i) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (i == 0) {
			param.put("begindate", tdate + " 00:00:00");
			param.put("enddate", tdate + " " + times[i]);
		} else {
			param.put("begindate", tdate + " " + times[i - 1]);
			param.put("enddate", tdate + " " + times[i]);
		}
		return param;
	}

	@Override
	public List<Map<String, Object>> getOnlineManCounts(UserInfo user) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < 13; i++) {
			int cnt = 0;
			Map<String, Object> element = new HashMap<String, Object>();
			Map<String, Object> param = getDateParam(i);
			List<Map<String, Object>> temp = null;
			if (user.isMobile()) {
				param.put("regionid", user.getRegionId());
				temp = mapper.getTotalOnlineManCountLoginMobile(param);
			} else {
				param.put("orgid", user.getOrgId());
				temp = mapper.getTotalOnlineManCountLoginContractor(param);
			}
			if (temp != null && temp.size() > 0) {
				for (Map<String, Object> m : temp) {
					cnt += Integer.parseInt(m.get("CNT").toString());
				}
			}
			element.put("timekey", times[i]);
			element.put("timecnt", cnt);
			list.add(element);
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> getOnlineCarCounts(UserInfo user) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < 13; i++) {
			int cnt = 0;
			Map<String, Object> element = new HashMap<String, Object>();
			Map<String, Object> param = getDateParam(i);
			String count = null;
			if (user.isMobile()) {
				param.put("regionid", user.getRegionId());
				count = mapper.getTotalOnlineCarCountLoginMobile(param);
			} else {
				param.put("orgid", user.getOrgId());
				count = mapper.getTotalOnlineCarCountLoginContractor(param);
			}
			if (count != null) {
				cnt = Integer.parseInt(count);
			}
			element.put("timekey", times[i]);
			element.put("timecnt", cnt);
			list.add(element);
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> getHistoryPositionsByPatrolmanid(
			Map<String, Object> param) {
		return mapper.getHistoryPositionsByPatrolmanid(param);
	}

	@Override
	public List<Map<String, Object>> getHistoryPositionsBySimid(
			Map<String, Object> param) {
		return mapper.getHistoryPositionsBySimid(param);
	}

}
