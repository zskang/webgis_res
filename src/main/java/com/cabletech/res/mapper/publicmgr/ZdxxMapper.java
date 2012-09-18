package com.cabletech.res.mapper.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.common.Page;
import com.cabletech.res.entity.publicmgr.ZdxxEntity;

/**
 * 站点信息管理DaoMapper
 * 
 * @author 杨隽 2012-05-22 创建
 */
public interface ZdxxMapper {
	/**
	 * 保存站点信息
	 * 
	 * @param entity
	 *            ZdxxEntity 站点实体
	 */
	public void save(ZdxxEntity entity);

	/**
	 * 编辑站点信息
	 * 
	 * @param entity
	 *            ZdxxEntity 站点实体
	 */
	public void update(ZdxxEntity entity);

	/**
	 * 查看站点信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 * @return ZdxxEntity 站点实体
	 */
	public ZdxxEntity getbyid(String xtbh);

	/**
	 * 查询站点资源
	 * 
	 * @param map
	 *            Map<String, Object> 传入条件｛sim卡号、站点类型、产权性质、所属区域、名称｝
	 * @return List<Map<String, Object>> 站点资源列表
	 */
	public List<Map<String, Object>> queryZdxxList(Map<String, Object> map);

	/**
	 * 查询站点资源（无sim卡号）
	 * 
	 * @param map
	 *            Map<String, Object> 传入条件｛站点类型、产权性质、所属区域、名称｝
	 * @return List<Map<String, Object>> 站点资源列表
	 */
	public List<Map<String, Object>> queryZdxxListNoSimid(
			Map<String, Object> map);

	/**
	 * 逻辑删除站点信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 */
	public void delete(String xtbh);

	/**
	 * 根据站点编号获取相关机房
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getJfxxByZd(String xtbh);

	/**
	 * 根据站点编号获取相关地下接线室
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getDxjxsByZd(String xtbh);

	/**
	 * 根据站点编号获取相关光缆段路由
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByZd(String xtbh);

	/**
	 * 根据表名获取相关ODF,光分纤箱,光终端盒
	 * 
	 * @param map
	 *            获取条件集合
	 * @return
	 */
	public List<Map<String, Object>> getOdfByZd(Map<String, Object> map);

	/**
	 * 站点批量编辑
	 * 
	 * @param map
	 *            表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map) throws Exception;

	/**
	 * 获取列表信息
	 * 
	 * @param entity
	 * @return
	 * @author 周刚
	 */
	public List<Map<String, Object>> getZdList(Map<String, Object> map) throws Exception;
}
