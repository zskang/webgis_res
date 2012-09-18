package com.cabletech.core.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cabletech.core.mapper.ResCommonTagMapper;
/**
 * 标签显示 资源的 名称和 XTBH
 * @author zhanghaibo 2012-05-11
 *
 */
@Service
public class ResCommonTagServiceImpl extends BaseServiceImpl implements ResCommonTagService{
	@Resource(name="resCommonTagMapper")
	private ResCommonTagMapper mapper;
	
	/**
	 * 获取显示字段
	 * @param param 关键字段名称、关键字段值、表名称、待显示字段名称
	 * @return
	 */	
	public String getKeyColumnDisplayName(Map<String, Object> param){
		return mapper.getDisplayName(param);
	}

	@Override
	public List<Map<String, Object>> fetchMutiResourceData(Map<String, Object> map) {
		return mapper.fetchMutiResourceData(map);
	}

	@Override
	public List<Map<String, Object>> fetchResourceData(Map<String, Object> map) {
		return mapper.fetchResourceData(map);
	}

}
