package com.cabletech.res.mapper.analyse;

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
public interface AnalyseMapper {
	public Map<String, Object> getAnalyse(Map<String,Object> params);	
	public List<LinkedHashMap<String, Object>> executeSql(Map<String,Object> params);	
}
