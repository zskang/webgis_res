package com.cabletech.res.mapper.connectmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.connectmgr.PortEntity;

/**
 * 连接管理Mapper
 * 
 * @author 吕仁钊 2012-07-25 创建
 */
public interface ConnectMapper {
	public List<Map<String, Object>> getPortConnects(Map<String,Object> prams);
	public List<Map<String, Object>> getLineConnects(Map<String,Object> prams);
	public String ifHasPorts(Map<String,Object> prams);
	public String getDeviceWidth(Map<String,Object> prams);
	public List<Map<String,Object>> getNodes(Map<String,Object> prams);
	public void saveODFConn(PortEntity entity);
	public void saveGJJXConn(PortEntity entity);
	public void saveGFXXConn(PortEntity entity);
	public void saveGZDHConn(PortEntity entity);
	public String getMaxHeight(Map<String,Object> prams);
	public String getMaxWidth(Map<String,Object> prams);
	public List<String> getUsedLines(Map<String,Object> prams);
	public void insertLineConnect(Map<String,Object> prams);
	public void updateConnect(Map<String,Object> prams);
	public Map<String, Object> getConnect(Map<String,Object> prams);
	public void deleteLineConnect(String xtbh);
	public void deletePortConnect(Map<String,Object> prams);
	public Map<String, Object> getConnectZD(Map<String,Object> prams);
}
