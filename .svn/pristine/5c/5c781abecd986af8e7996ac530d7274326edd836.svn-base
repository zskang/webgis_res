package com.cabletech.contractor.service.onlinedata;

import java.util.List;
import java.util.Map;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.service.BaseService;

/**
 * 在线实时数据 Service 接口
 * @author Administrator
 *
 */
public interface OnlineDataService extends BaseService {
	
	/**
	 * 首页获取统计数字
	 * @param user 当前登录用户
	 * @return
	 */
	public Map<String, Object> getOnlineDataCount(UserInfo user);
	
	/**
	 * 查询今天在线人员
	 * @param map 查询条件
	 * @return
	 */
	public List<Map<String, Object>> queryTodayOnlineMan(Map<String, Object> map);
	
	/**
	 * 统计各个区域下的故障数量
	 * @param user 当前登录用户
	 * @return
	 */
	public List<Map<String, Object>> getOnlineAlertRealdataByRegion(UserInfo user);
	
	/**
	 * 统计各个组织机构下的故障数量
	 * @param user 当前登录用户
	 * @return
	 */	
	public List<Map<String, Object>> getOnlineAlertRealdataByOrg(UserInfo user);	
	/**
	 * 按客户端回传的区域编号集合统计在线人员
	 * @param user 当前登录用户
	 * @return
	 */
	public List<Map<String, Object>> getOnlinemanRealdataByRegion(UserInfo user);
	
	/**
	 * 按客户端回传的组织机构编号集合统计在线人员
	 * @param user 当前登录用户
	 * @return
	 */	
	public List<Map<String, Object>> getOnlinemanRealdataByOrg(UserInfo user);	
	
	
	/**
	 * 根据当前登陆用户获取区域信息，移动登录，获取下级区域，代维登录， 获取维护合作区域
	 * 
	 * @param user 当前登录用户
	 * @return
	 */
	public List<Map<String, Object>> getRegions(UserInfo user);
	
	/**
	 * 根据当前登录用户获取代维单位信息，移动登录，获取同级区域下的全部代维单位，代维登录，获取下级代维单位
	 * 
	 * @param user 当前登录用户
	 * @return
	 */	
	public List<Map<String, Object>> getContractors(UserInfo user);
	
	/**
	 * 按客户端回传的区域编号集合统计在线车辆
	 * @param user 当前登录用户
	 * @return
	 */
	public List<Map<String, Object>> getOnlinecarRealdataByRegion(UserInfo user);	
	
	/**
	 * 按客户端回传的组织机构编号集合统计在线车辆
	 * @param user 当前登录用户
	 * @return
	 */	
	public List<Map<String, Object>> getOnlinecarRealdataByOrg(UserInfo user);	
	
	/**
	 * 计算今日整点在线人数
	 * @param user 当前登录用户
	 * @return
	 */
	public List<Map<String, Object>> getOnlineManCounts(UserInfo user);
	
	/**
	 * 计算今日整点在线车辆
	 * @param user 当前登录用户
	 * @return
	 */	
	public List<Map<String, Object>> getOnlineCarCounts(UserInfo user);
	
	/**
	 * 巡检人轨迹
	 * @param param 巡检人编号、时间段
	 * @return
	 */
	public List<Map<String, Object>> getHistoryPositionsByPatrolmanid(Map<String, Object> param);
	
	/**
	 * 巡检车辆轨迹
	 * @param param SIM卡编号、时间段
	 * @return
	 */
	public List<Map<String, Object>> getHistoryPositionsBySimid(Map<String, Object> param);
	
	
}
