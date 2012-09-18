package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.basemgr.GddEntity;

/**
 * 承载--管道段管理 Mapper
 * 
 * @author zhanglei 2012/5/11
 */
public interface GddMapper {
	
	/**
	 * 查询管道段是否已存在
	 * @param map 传入条件
	 * @return
	 */
	public String getGddIsExist(Map<String, Object> map);	
	/**
	 * 根据id获取管道段信息
	 * @param xtbh 资源的xtbh
	 */
	public GddEntity getbyid(String xtbh);
	
	/**
	 * 管道段跟新
	 * @param entity 管道段实体
	 */
	public void update(GddEntity entity);
	
	/**
	 * 保存   新增
	 * @param entity 管道段实体
	 */
	public void save(GddEntity entity);
	
	/**
	 * 查询管道段
	 * @param map 传入条件
	 * @return
	 */
	public List<Map<String, Object>> queryGddList(Map<String, Object> map);	
	/**
	 * 逻辑删除
	 * @param xtbh 系统编号
	 */
	public void deleteGdd(String xtbh);
	
	/**
	 * 删除管井-删除管道段
	 * @param xtbh 系统编号
	 */
	public void deleteGddByGj(String xtbh);
	
	/**
	 * 删除管道段所属系统
	 * @param xtbh 系统编号
	 */
	public void deleteGddSsgdxt(String xtbh);
	
	/**
	 * 获取管道段相关的标石信息
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGddByGjxx(String xtbh);
	
	/**
	 *  获取管道段相关的光缆段路由信息
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByGdd(String xtbh);
	
	/**
	 * 管道段批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
}
