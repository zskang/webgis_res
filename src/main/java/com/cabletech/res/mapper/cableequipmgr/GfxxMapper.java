package com.cabletech.res.mapper.cableequipmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.cableequipmgr.GfxxEntity;

/**
 * 光分纤箱信息管理DaoMapper
 * 
 * @author 杨隽 2012-05-23 创建
 */
public interface GfxxMapper {
	/**
	 * 验证两个odf所属的站点是否相同
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>>  getZdByGfxx(String xtbh);
	
	/**
	 * 保存光分纤箱信息
	 * 
	 * @param entity GfxxEntity 光分纤箱实体
	 */
	public void save(GfxxEntity entity);

	/**
	 * 编辑光分纤箱信息
	 * 
	 * @param entity  GfxxEntity 光分纤箱实体
	 */
	public void update(GfxxEntity entity);

	/**
	 * 查看光分纤箱信息
	 *  
	 * @param xtbh
	 *            String 系统编号
	 * @return GfxxEntity 光分纤箱实体
	 */
	public GfxxEntity view(String xtbh);

	/**
	 * 查询光分纤箱资源
	 * 
	 * @param map
	 *            Map<String, Object> 传入条件｛sim卡号、产权性质、设施状态、所属区域、名称｝
	 * @return List<Map<String, Object>> 光分纤箱资源列表
	 */
	public List<Map<String, Object>> queryGfxxList(Map<String, Object> map);

	/**
	 * 查询光分纤箱资源（无sim卡号查询）
	 * 
	 * @param map
	 *            Map<String, Object> 传入条件｛产权性质、设施状态、所属区域、名称｝
	 * @return List<Map<String, Object>> 光分纤箱资源列表
	 */
	public List<Map<String, Object>> queryGfxxListNoSimid(
			Map<String, Object> map);

	/**
	 * 逻辑删除光分纤箱成端信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 */
	public void deleteGfxxConnByGfxxXtbh(String xtbh);
	
	/**
	 * 逻辑删除光分纤箱端子信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 */
	public void deleteGfxxDzByGfxxXtbh(String xtbh);
	
	/**
	 * 逻辑删除光分纤箱信息
	 * 
	 * @param xtbh
	 *            String 系统编号
	 */
	public void delete(String xtbh);	
	
	/**
	 * 光分纤箱批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
	
	/**
	 * 获取光分纤箱关联树中 光缆段
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByGfxx(String xtbh);
	
	/**
	 * 获取光分纤箱关联树中 机房
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>> getJfByGfxx(String xtbh);
	
	/**
	 * 获取资源树(连接管理模块需要，吕仁钊添加)
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String,Object>> getResTree(String xtbh);
}
