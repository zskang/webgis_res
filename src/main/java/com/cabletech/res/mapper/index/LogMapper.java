package com.cabletech.res.mapper.index;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.analyse.AnalyseEntity;
import com.cabletech.res.entity.basemgr.BsdEntity;

/**
 * 承载资源统计
 * @author 吕仁钊 2012-08-11
 *
 */
public interface LogMapper {
	
	/**
	 * 获取日志列表
	 * @param params 参数map
	 * @return 结果集
	 */
	public List<LinkedHashMap<String, Object>> getLogList(Map<String,Object> params);	
	
}
