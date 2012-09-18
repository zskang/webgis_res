package com.cabletech.res.mapper.basemgr;

import java.util.List;
import java.util.Map;
import com.cabletech.res.entity.basemgr.GldEntity;


/**
 * 承载--杆路段管理 Mapper
 * 
 * @author zhb 2012/5/11
 */
public interface GldMapper {
	/**
	 * 查询杆路段是否已存在
	 * @param map 传入条件
	 * @return
	 */
	public String getGldIsExist(Map<String, Object> map); 
	
	/**
	 * 获取杆路段实体
	 * @param resId 资源编号
	 * @return entity
	 */	
	public GldEntity getbyid(String resId);
	
	/**
	 * 更新杆路段实体
	 * @param entity 杆路实体
	 */	
	public void update(GldEntity entity)throws Exception;
	
	/**
	 * 新增杆路段实体
	 * @param entity 杆路实体
	 */	
	public void insert(GldEntity entity)throws Exception;
	
	/**
	 * 查询电杆段资源
	 * @param map 传入条件｛起端电杆、终端电杆、设施状态、产权性质、所属区域、名称｝
	 * @return
	 */
	public List<Map<String, Object>> queryGldList(Map<String, Object> map);
	
	/**
	 * 逻辑删除杆路段
	 * @param xtbh 资源系统编号
	 */
	public void deleteGld(String xtbh)throws Exception;	
	
	/**
	 * 逻辑删除杆路段
	 * @param ssglxt 所属杆路段系统编号
	 */	
	public void deleteGldBySsglxt(String ssglxt)throws Exception;
	
	/**
	 * 逻辑删除杆路段
	 * @param dgxtbh 电杆系统编号
	 */	
	public void deleteGldByDgXtbh(String dgxtbh)throws Exception;	
	
	/**
	 * 获取杆路段关联的电杆信息
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getDgxxByGld(String xtbh);
	/**
	 * 获取杆路段关联的光缆段路由
	 * @param xtbh 系统编号
	 */
	public List<Map<String, Object>> getGldlyByGld(String xtbh);

	/**
	 * 杆路段批量编辑
	 * @param map 表单值
	 * @throws Exception
	 */
	public void batchEdit(Map<String, Object> map)throws Exception;		
}
