package com.cabletech.res.mapper.connectmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.connectmgr.PortEntity;

/**
 * 批量连接管理Mapper
 * 
 * @author 吕仁钊 2012-07-25 创建
 */
public interface PconnectMapper {
	public List<Map<String,Object>> getODMPorts(Map<String,Object> params);
	public List<Map<String,Object>> getGFXXPorts(Map<String,Object> params);
	public List<Map<String,Object>> getGZDHPorts(Map<String,Object> params);
}
