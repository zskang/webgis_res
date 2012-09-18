package com.cabletech.contractor.service.carinfo;

import java.util.List;
import java.util.Map;

import com.cabletech.contractor.entity.carinfo.CarApplyDispatchEntity;
import com.cabletech.core.service.BaseService;

/**
 * 车辆调度Service
 * @author Administrator
 *
 */
public interface CarApplyDispatchService extends BaseService{
	
	/**
	 * 根据编号查询车辆申请任务的详细信息
	 * @param id 车辆编号
	 * @return
	 */
	public CarApplyDispatchEntity getCarApplyById(String id);
	
	/**
	 * 查询当前车辆当天的任务信息列表
	 * @param id 车辆编号
	 * @return
	 */
	public List<Map<String,Object>> getCarHistoryTaskList(String id);
}
