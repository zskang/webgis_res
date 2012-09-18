package com.cabletech.res.service.analyse;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.analyse.AnalyseEntity;

/**
 * 承载资源统计
 * @author 吕仁钊 2012-08-11
 *
 */
public interface AnalyseService  extends BaseService{
	
	/**
	 * 根据资源类型和统计类型获取分析实体类
	 * @param zylx 资源类型
	 * @param tjlx 统计类型
	 * @return 结果集
	 */
	public Map<String, Object> getAnalyse(String zylx,String tjlx);
	/**
	 * 执行统计sql
	 * @param sql 语句
	 * @return 结果集
	 */
	public List<LinkedHashMap<String, Object>> executeSql(String sql);
	
}
