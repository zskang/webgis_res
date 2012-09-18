package com.cabletech.res.mapper.opticcablemgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.opticcablemgr.GlxxEntity;

/**
 * 光缆信息管理
 * 
 * @author zhanglei 2012-05-11
 */
public interface GlxxMapper {
	
	/**
	 * 删除光缆段
	 * @param xtbh 系统编号
	 */
	public void deleteGldly(String xtbh);
	/**
	 * 编辑
	 * @param entity 光缆信息实体
	 */
	public void update(GlxxEntity entity);
	
	/**
	 * 保存
	 * @param entity 光缆信息实体
	 */
	public void save(GlxxEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 光缆信息实体
	 */
	public GlxxEntity getbyid(String xtbh);
	
	/**
	 * 查询光缆信息
	 * @param map 条件不包含SIMID
	 * @return 符合条件的List集合
	 */
	public List<Map<String, Object>> queryGlxx(Map<String, Object> map);	

	/**
	 * 逻辑删除光缆信息
	 * @param xtbh 系统编号
	 */
	public void deleteGlxx(String xtbh);
	
	/**
	 * 获取光缆信息关联树中 光缆段路由
	 * @param xtbh 系统编号
	 * @return
	 */
	public List<Map<String, Object>> getGldlyByGlxx(String xtbh);
	
	/**
	 * 光缆批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
}
