package com.cabletech.contractor.service.search;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;

/**
 * 搜索服务层
 * 
 * @author cqp
 *
 */
public interface SearchService extends BaseService{

	/**
	 * 显示巡检的详细信息根据资源的编号
	 * @param id 资源编号
	 * @return
	 */
	public List<Map<String, Object>> getSearchRsList(
			String id);
	

}
