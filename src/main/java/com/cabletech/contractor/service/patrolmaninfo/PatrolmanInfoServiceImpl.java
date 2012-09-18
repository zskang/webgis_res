package com.cabletech.contractor.service.patrolmaninfo;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cabletech.contractor.mapper.patrolmaninfo.PatrolmanInfoMapper;
import com.cabletech.core.service.BaseServiceImpl;

/**
 * 巡检人员Service实现
 * @author Administrator
 *
 */
@Service
public class PatrolmanInfoServiceImpl extends BaseServiceImpl implements PatrolmanInfoService{

	@Resource(name="patrolmanInfoMapper")
	private PatrolmanInfoMapper mapper;
	
	@Override
	public List<Map<String, Object>> getCurrentTask(String id)throws Exception{
		return mapper.getCurrentTask(id);
	}
	
	@Override
	public List<Map<String, Object>> getCurrentTaskDetail(String id)throws Exception{
		return mapper.getCurrentTaskDetail(id);
	}	
	
}
