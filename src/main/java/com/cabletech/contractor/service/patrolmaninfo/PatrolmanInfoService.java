package com.cabletech.contractor.service.patrolmaninfo;

import java.util.List;
import java.util.Map;
import com.cabletech.core.service.BaseService;

/**
 * 巡检人员信息Service
 * @author Administrator
 *
 */
public interface PatrolmanInfoService extends BaseService{
	
	/**
	 * 获取当前正在执行任务情况
	 * @param id 人员编号
	 * @return
	 */
	public List<Map<String, Object>> getCurrentTask(String id)throws Exception;
	
	/**
	 * 获取今日巡检明细
	 * @param id 人员编号
	 * @return
	 */
	public List<Map<String, Object>> getCurrentTaskDetail(String id)throws Exception;	
	
}
