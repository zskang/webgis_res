package com.cabletech.contractor.mapper.gisextend;

import java.util.List;
import java.util.Map;
/**
 * 油机 Mapper
 * @author Administrator
 *
 */
public interface OilengineMapper {
	/**
	 * 搜索油机
	 * @param map 传入条件｛组织机构编号、区域编号、油机状态、油机编号、功率｝
	 * @return
	 */
	public List<Map<String, Object>> searchOilengines(Map<String, Object> map);
	
	/**
	 * 获取油机信息
	 * @param id 油机编号
	 * @return
	 */
	public Map<String, Object> getOilengine(String id);
}
