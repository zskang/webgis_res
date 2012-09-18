package com.cabletech.res.service.boardfibermgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.boardfibermgr.JxgxllzEntity;

/**
 * 链路组Service接口
 * @author Administrator
 *
 */
public interface JxgxllzService extends BaseService{
	
	/**
	 * 获取链路组实体
	 * @param id 链路组编号
	 * @return 实体
	 */
	public JxgxllzEntity getbyid(String id);
	
	/**
	 * 查询链路组
	 * @param map 查询条件｛链路组名称｝
	 * @return 符合条件的集合
	 */
	public List<Map<String, Object>> queryJxgxllzList(Map<String, Object> map);	
	
	/**
	 * 单条删除
	 * @param id 系统编号
	 * @return Boolean 删除成功或者失败
	 */
	public boolean delete(String id);
	
	/**
	 * 批量删除
	 * @param id 系统编号集合
	 * @return Boolean 删除成功或者失败
	 */	
	public boolean batchDelete(String id);
	
	/**
	 * 新增链路组｛增加路由｝
	 * @param entity 链路组实体
	 * @return 成功或失败
	 */
	public boolean saveorupdate(JxgxllzEntity entity);
}
