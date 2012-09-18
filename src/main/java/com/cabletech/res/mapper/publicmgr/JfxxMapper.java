package com.cabletech.res.mapper.publicmgr;

import java.util.List;
import java.util.Map;

import com.cabletech.core.common.Page;
import com.cabletech.res.entity.publicmgr.JfxxEntity;

/**
 * 机房信息管理
 * 
 * @author wangt 2012-05-11
 */
public interface JfxxMapper {

	/**
	 * 保存
	 * 
	 * @param entity
	 *            机房实体
	 */
	public void save(JfxxEntity entity);

	/**
	 * 编辑
	 * 
	 * @param entity
	 *            机房实体
	 */
	public void update(JfxxEntity entity);

	/**
	 * 查看
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return 机房实体
	 */
	public JfxxEntity getbyid(String xtbh);

	/**
	 * 查询机房资源
	 * 
	 * @param map
	 *            传入条件｛产权性质、机房类型、所属区域、机房名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryJfxxList(Map<String, Object> map);

	/**
	 * 查询机房资源
	 * 
	 * @param map
	 *            传入条件｛产权性质、机房类型、所属区域、机房名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryJfxxListWithSimid(
			Map<String, Object> map);

	/**
	 * 逻辑删除
	 * 
	 * @param xtbh
	 *            系统编号
	 */
	public void delete(String xtbh);

	/**
	 * 逻辑删除机房根据站点编号
	 * 
	 * @param xtbh
	 *            站点系统编号
	 */
	public void deleteJFxxByZdxxXtbh(String xtbh);

	/**
	 * 根据机房编号获取相关机房剖面
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getOdfByJf(String xtbh);

	/**
	 * 根据机房编号获取相关机房剖面
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getZdxxByJf(String xtbh);

	/**
	 * 根据机房编号获取相关机房剖面
	 * 
	 * @param xtbh
	 *            系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByJf(String xtbh);

	/**
	 * 机房批量编辑
	 * 
	 * @param map
	 *            表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map) throws Exception;

	/**
	 * 获取资源树(连接管理模块需要，吕仁钊添加)
	 * 
	 * @param map
	 *            表单值
	 * @return
	 */
	public List<Map<String, Object>> getResTree(String xtbh);

	/**
	 * 获取列表
	 * 
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getJfList(Map<String, Object> map);
}
