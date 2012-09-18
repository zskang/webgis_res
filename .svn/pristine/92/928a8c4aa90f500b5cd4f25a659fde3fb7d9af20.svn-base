package com.cabletech.res.service.analyse;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.analyse.AnalyseEntity;
import com.cabletech.res.mapper.analyse.AnalyseMapper;

/**
 * 承载资源统计
 * 
 * @author 吕仁钊 2012-08-11
 * 
 */
@Service
public class AnalyseServiceImpl extends BaseServiceImpl implements
		AnalyseService {

	@Resource(name = "analyseMapper")
	private AnalyseMapper analyseMapper;

	/**
	 * 根据资源类型和统计类型获取分析实体类
	 * @param zylx 资源类型
	 * @param tjlx 统计类型
	 * @return 结果集
	 */
	public Map<String, Object> getAnalyse(String zylx, String tjlx) {
		Map<String,Object> queryParams = new HashMap<String, Object>();
		queryParams.put("zylx", zylx);
		queryParams.put("tjlx", tjlx);
		return analyseMapper.getAnalyse(queryParams);
	}
	
	/**
	 * 执行统计sql
	 * @param sql 语句
	 * @return 结果集
	 */
	public List<LinkedHashMap<String, Object>> executeSql(String sql){
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("sql", sql);
		return analyseMapper.executeSql(params);
	}
	
}
