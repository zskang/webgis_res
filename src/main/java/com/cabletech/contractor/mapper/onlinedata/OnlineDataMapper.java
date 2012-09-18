package com.cabletech.contractor.mapper.onlinedata;

import java.util.List;
import java.util.Map;

/**
 * 查询在线数据
 * 
 * @author chenqp
 * 
 */
public interface OnlineDataMapper {
	/**
	 * 查询今天在线人员
	 * 
	 * @param map 查询条件
	 * @return
	 */
	public List<Map<String, Object>> queryTodayOnlineMan(Map<String, Object> map);
	
	/**
	 * 按区域分类
	 * @param map 需要传递的参数：regionId,orgId
	 * @return
	 */
	public List<Map<String, Object>> getRegions(Map<String,Object> map);
	
	/**
	 * 按代维分类
	 * @param map 需要传递的参数：regionId,orgId
	 * @return
	 */
	public List<Map<String, Object>> getContractors(Map<String,Object> map);

	/**
	 * 获取整点在线人数量（当移动用户登录时）
	 * @param map 时间段、区域
	 * @return
	 */
	public List<Map<String, Object>> getTotalOnlineManCountLoginMobile(Map<String, Object> map);
	
	/**
	 * 获取整点在线人数量（当代维用户登录时）
	 * @param map 时间段、区域
	 * @return
	 */
	public List<Map<String, Object>> getTotalOnlineManCountLoginContractor(Map<String, Object> map);
	
	/**
	 * 获取整点在线车辆数量（当移动用户登录时）
	 * @param map 时间段、区域
	 * @return
	 */
	public String getTotalOnlineCarCountLoginMobile(Map<String, Object> map);
	
	/**
	 * 获取整点在线车辆数量（当代维用户登录时）
	 * @param map 时间段、区域
	 * @return
	 */
	public String getTotalOnlineCarCountLoginContractor(Map<String, Object> map);
	
	
	/**
	 * 巡检人轨迹
	 * @param map 巡检人编号、时间段
	 * @return
	 */
	public List<Map<String, Object>> getHistoryPositionsByPatrolmanid(Map<String, Object> map);
	
	/**
	 * 巡检车辆轨迹
	 * @param map SIM卡编号、时间段
	 * @return
	 */
	public List<Map<String, Object>> getHistoryPositionsBySimid(Map<String, Object> map);	
	
	
}
