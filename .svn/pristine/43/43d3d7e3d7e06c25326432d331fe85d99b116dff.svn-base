package com.cabletech.contractor.service.carinfo;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cabletech.contractor.entity.carinfo.CarApplyDispatchEntity;
import com.cabletech.contractor.entity.carinfo.CarInfoEntity;
import com.cabletech.contractor.mapper.carinfo.CarApplyDispatchMapper;
import com.cabletech.contractor.mapper.carinfo.CarInfoMapper;
import com.cabletech.core.service.BaseServiceImpl;

/**
 * 车辆调度Service实现
 * @author Administrator
 *
 */
@Service
public class CarApplyDispatchServiceImpl  extends BaseServiceImpl implements CarApplyDispatchService{

	@Resource(name="carInfoMapper")
	private CarInfoMapper mapper;
	@Resource(name="carApplyDispatchMapper")
	private CarApplyDispatchMapper carApplyDispatchMapper;
	@Override
	public CarApplyDispatchEntity getCarApplyById(String id) {
		CarInfoEntity carInfoEntity=mapper.getbyid(id);
		return carApplyDispatchMapper.getCarApplyById(carInfoEntity.getCarno());
	}
	
	@Override
	public List<Map<String, Object>> getCarHistoryTaskList(String id) {
		return carApplyDispatchMapper.getCarHistoryTaskList(id);
	}

}
