package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.basemgr.GddxtEntity;

/**
 * 承载--管道段系统管理 Mapper
 * 
 * @author 吕仁钊 2012/5/11
 */
public interface GddxtMapper {

	/**
	 * 查询管井数量
	 * @param map 传入条件
	 * @return
	 */
	public String getGjxxCountByGddxt(Map<String, Object> map);
	/**
	 * 根据xtbh获取管道段系统
	 * 
	 * @param xtbh 资源xtbh
	 */
	public GddxtEntity getbyid(String xtbh);

	/**
	 * 跟新管道端系统信息
	 * @param entity 管道端系统实体
	 */
	public void update(GddxtEntity entity);
	
	/**
	 * 查询管道段系统
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> queryGddxtList(Map<String, Object> map);
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void deleteGddxt(String xtbh);

	/**
	 * 管道段系统保存
	 * @param entity 管道段系统实体
	 */
	public void save(GddxtEntity entity);
	
	/**
	 * 获取管道段系统关联的管道段
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGddByGddxt(String xtbh);
	/**
	 * 获取管道段系统关联光缆段路由
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByGddxt(String xtbh);
	
	/**
	 * 管道段系统批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;	
}
