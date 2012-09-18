package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.basemgr.DgxxEntity;


/**
 * 电杆信息管理
 * 
 * @author zhb 2012-05-11
 */
public interface DgxxMapper {
	  
	/**
	 * 获取电杆信息实体
	 * @param resId 资源编号
	 * @return entity
	 */
	public DgxxEntity getbyid(String resId);
	
	/**
	 * 更新电杆实体
	 * @param entity 电杆实体
	 */	
	public void update(DgxxEntity entity) throws Exception;
	
	/**
	 * 新增电杆实体
	 * @param entity 电杆实体
	 */	
	public void insert(DgxxEntity entity) throws Exception;
	
	/**
	 * 查询电杆资源
	 * @param map 传入条件｛道路名称、设施状态、产权性质、所属区域、所属管理区、名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryDgxxList(Map<String, Object> map);	
	
	/**
	 * 查询电杆资源
	 * @param map 传入条件｛sim卡号、道路名称、设施状态、产权性质、所属区域、所属管理区、名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryDgxxListWithSimid(Map<String, Object> map);
	
	/**
	 * 逻辑删除电杆
	 * @param xtbh 资源系统编号
	 */
	public void deleteDgxx(String xtbh);		
	
	/**
	 * 获取电杆关联的杆路段
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldByDgxx(String xtbh);
	/**
	 * 获取电杆关联的光缆段路由
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByDgxx(String xtbh);
	/**
	 * 获取电杆关联的引上
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getYsByDgxx(String xtbh);
	/**
	 * 获取电杆关联的光街头
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGjtByDgxx(String xtbh);
	
	/**
	 * 获取电杆关联的光缆盘留
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGlplByDgxx(String xtbh);	
	
	/**
	 * 电杆批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;	
	
	/**
	 * 获取光缆盘留关联的电杆
	 * @param xtbh 盘留系统编号
	 */
	public List<Map<String, Object>> getDgxxByglplbh(String xtbh);	
}
