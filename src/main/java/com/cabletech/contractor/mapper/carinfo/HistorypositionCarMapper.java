package com.cabletech.contractor.mapper.carinfo;

import java.util.Map;

/**
 * 车辆历史任务Mapper
 * @author Administrator
 *
 */
public interface HistorypositionCarMapper {
	/**
	 * 获取车辆实体
	 * @param simid 车辆编号
	 * @return
	 */
	public Map<String,Object> getSumDistanceBySimid(String simid);
}
