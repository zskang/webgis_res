package com.cabletech.res.mapper.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.publicmgr.PrepeaterEntity;

/**
 * 直放站信息管理DaoMapper
 * 
 * @author 周刚  2012 7-17
 */
public interface PrepeaterMapper {
	/**
	 * 保存站点信息
	 * 
	 * @param entity
	 *            PrepeaterEntity 站点实体
	 */
	public void saveEntity(PrepeaterEntity entity);

	/**
	 * 编辑站点信息
	 * 
	 * @param entity
	 *            PrepeaterEntity 站点实体
	 */
	public void updateEntity(PrepeaterEntity entity);
	
	public List<Map<String,Object>> getZdList4Pre();
	/**
	 * 查看站点信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 * @return ZdxxEntity 站点实体
	 */
	public PrepeaterEntity getbyid4pre(String prepeaterId);

	/**
	 * 查询站点资源
	 * 
	 * @param map
	 *            Map<String, Object> 
	 * @return List<Map<String, Object>> 列表
	 */
	public List<Map<String, Object>> queryPrepeaterList(Map<String, Object> map);

	/**
	 * 逻辑删除站点信息
	 * 
	 * @param id
	 *            String 系统编号
	 */
	public void deleteEntity(String prepeaterId);
}
