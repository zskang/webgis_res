package com.cabletech.res.service.common;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.mapper.common.MainTenceMapper;

/**
 * 光分纤箱信息管理Service实现
 * 
 * @author 杨隽 2011-05-23 创建
 * 
 */
@Service
public class MainTenceServiceImpl extends BaseServiceImpl implements
		MainTenceService {
	@Resource(name = "mainTenceMapper")
	private MainTenceMapper mapper;

	@Override
	public void delete(String maintenceid, String type,
			String businessType) {
		HashMap map = new HashMap();
		map.put("maintenceid", maintenceid);
		map.put("type", type);
		map.put("businessType", businessType);
		mapper.delete(map);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Transactional
	@Override
	public void save(String maintenceid, String type, String businessType) {
		HashMap map = new HashMap();
		map.put("maintenceid", maintenceid);
		map.put("type", type);
		map.put("businessType", businessType);
		if (StringUtils.isNotBlank(maintenceid)) {
			mapper.delete(map);
		}
		mapper.save(map);
	}
}
