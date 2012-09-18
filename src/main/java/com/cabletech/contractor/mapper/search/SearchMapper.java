package com.cabletech.contractor.mapper.search;

import java.util.List;
import java.util.Map;

/**
 * 搜索Mapper
 * 
 * @author cqp
 * 
 */
public interface SearchMapper {

	/**
	 * 显示巡检的详细信息根据资源的编号
	 * 
	 * @param id 资源编号 
	 * @return
	 */
	public List<Map<String, Object>> getSearchRsList(
			String id);
	
	/**
	 * 搜索巡检人
	 * 
	 * @param condition 搜索条件，包括巡检人姓名、巡检时间段、和组织机构ID
	 * @return
	 */
	public List<Map<String, Object>> searchPatrolMan(
			Map<String, String> condition);
	
	/**
	 * 搜索车辆
	 * 
	 * @param condition  搜索条件，包括巡检人姓名、巡检时间段、和组织机构ID
	 * @return
	 */
	public List<Map<String,Object>> searchCar(Map<String, String> condition);
}
