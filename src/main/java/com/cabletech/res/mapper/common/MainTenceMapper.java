package com.cabletech.res.mapper.common;

import java.util.Map;

/**
 * 光分纤箱信息管理DaoMapper
 * 
 * @author 杨隽 2012-05-23 创建
 */
public interface MainTenceMapper {
	/**
	 * 添加
	 * 
	 * @param map
	 *            Map<String,Object>
	 */
	void save(Map<String, Object> map);

	/**
	 * 删除
	 * 
	 * @param map
	 *            Map<String,Object>
	 */
	void delete(Map<String, Object> map);

}
