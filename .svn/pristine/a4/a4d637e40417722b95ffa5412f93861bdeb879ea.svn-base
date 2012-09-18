package com.cabletech.res.mapper.cableequipmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.cableequipmgr.GjjxEntity;

/**
 * 光交接箱信息管理DaoMapper
 * 
 * @author 杨隽 2012-05-23 创建
 */
public interface GjjxMapper {
	/**
	 * 保存光交接箱信息
	 * 
	 * @param entity
	 *            GjjxEntity 光交接箱实体
	 */
	public void save(GjjxEntity entity);

	/**
	 * 编辑光交接箱信息
	 * 
	 * @param entity
	 *            GjjxEntity 光交接箱实体
	 */
	public void update(GjjxEntity entity);

	/**
	 * 查看光交接箱信息
	 *  
	 * @param xtbh
	 *            String 系统编号
	 * @return GjjxEntity 光交接箱实体
	 */
	public GjjxEntity view(String xtbh);

	/**
	 * 查询光交接箱资源
	 * 
	 * @param map
	 *            Map<String, Object> 传入条件｛sim卡号、产权性质、设施状态、所属区域、名称｝
	 * @return List<Map<String, Object>> 光交接箱资源列表
	 */
	public List<Map<String, Object>> queryGjjxList(Map<String, Object> map);

	/**
	 * 查询光交接箱资源（无sim卡号）
	 * 
	 * @param map
	 *            Map<String, Object> 传入条件｛产权性质、设施状态、所属区域、名称｝
	 * @return List<Map<String, Object>> 光交接箱资源列表
	 */
	public List<Map<String, Object>> queryGjjxListNoSimid(
			Map<String, Object> map);

	/**
	 * 逻辑删除光交接箱成端信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 */
	public void deleteGjjxConnByGjjxXtbh(String xtbh);
	/**
	 * 逻辑删除光交接箱信息
	 * 
	 * @param xtbh 系统编号
	 */
	public void delete(String xtbh);	
	
	/**
	 * 光交接箱批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;	
	
	/**
	 * 获取光交接箱关联光缆段信息
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String,Object>> getGldlyByGjjx(String xtbh);
	
	/**
	 * 获取资源树(连接管理模块需要，吕仁钊添加)
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String,Object>> getResTree(String xtbh);
}
