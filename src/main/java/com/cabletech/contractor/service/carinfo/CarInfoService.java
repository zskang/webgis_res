package com.cabletech.contractor.service.carinfo;

import com.cabletech.contractor.entity.carinfo.CarInfoEntity;
import com.cabletech.core.service.BaseService;

/**
 * 车辆信息Service
 * @author Administrator
 *
 */
public interface CarInfoService extends BaseService {
	/**
	 * 获取车辆实体
	 * @param id 车辆编号
	 * @return
	 */
	public CarInfoEntity getbyid(String id);	
}
